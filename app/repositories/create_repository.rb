class CreateRepository
  class << self
    %w( create create! ).each do |sym|
      define_method sym do |*args|
        new.send(sym, *args)
      end
    end
  end

  def klass
    self.class.name.gsub(/^Create/, '').constantize
  end

  %w( create create! ).each do |sym|
    define_method sym do |hash|
      sanitize_attributes!(hash)

      klass.send(sym, hash).tap do |obj|
        after_create(obj) if obj.persisted?
      end
    end
  end

  def after_create(obj)
    after_create_hooks.each do |klass|
      klass.new(obj).perform
    end
  end

  def sanitize_attributes!(hash)
  end

  def after_create_hooks
    []
  end

end
