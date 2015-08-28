class Task < ActiveRecord::Base
  #  Flush cache after create, update or destroy
  after_commit :flush_cache

  scope :completed, -> { where(:complete => true) }

  # CACHE
  def self.cached_size
    Rails.cache.fetch('total_tasks') { count }
  end

  def self.cached_find(id)
    #  In order to unique identify model object cache we use name and id
    Rails.cache.fetch([name, id]) { find(id) }
  end

  def flush_cache
    Rails.cache.delete('total_tasks')
    Rails.cache.delete([self.class.name, id])
  end

  def self.cached_completed
    Rails.cache.fetch([name, 'completed'], expires_in: 5.minutes) do
      completed.to_a
    end
  end
end
