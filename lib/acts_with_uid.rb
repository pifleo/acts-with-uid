require "acts_with_uid/version"

require "active_record"

module ActsWithUid
  ## Exception Handling
  class ForbiddenUidSetter < StandardError; end

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def acts_with_uid(options = {})
      # 4. validates
      validates_presence_of :uid
      validates_uniqueness_of :uid

      # 5. callbacks
      after_initialize :generate_uid

      class_eval <<-EOV
        include ActsWithUid::InstanceMethods
      EOV
    end
  end

  module InstanceMethods
    # getter attribut :uid
    def uid
      read_attribute(:uid)
    end

    # setter attribut :uid
    def uid=(value)
      raise ForbiddenUidSetter
    end

    private
    # In case of problem with uid uniqueness, check: http://stackoverflow.com/a/13340334
    def generate_uid
      write_attribute(:uid, SecureRandom.uuid) if read_attribute(:uid).nil?
    end
  end
end

if defined?(ActiveRecord::Base)
  # ActiveRecord::Base.class_eval { include ActsWithUid }
  ActiveRecord::Base.send :include, ActsWithUid
end
