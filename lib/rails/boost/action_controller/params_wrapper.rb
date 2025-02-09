require "active_support/concern"

module Rails::Boost
  module ActionController
    module ParamsWrapper
      module Options
        def model
          self[:model]
        end

        def include
          self[:include]
        end
      end

      class << self
        def included(mod)
          mod.const_get(:Options).instance_eval { prepend(Options) }
        end
      end
    end
  end
end

