module Rails::Boost
  module ActiveStorage
    module Blob
      module SensibleKey
        class << self
          # rubocop:disable Style/MethodCallWithArgsParentheses
          def prepended(klass)
            klass.instance_eval do
              has_one :attachment
              delegate :record, to: :attachment

              before_create :set_sensible_key
            end
          end
          # rubocop:enable Style/MethodCallWithArgsParentheses
        end

        private

        def set_sensible_key
          if attachment && (tokenized = attachment.record_type.constantize.active_storage_keys[attachment.name])
            write_attribute(:key, substitute_tokens(tokenized))
          end
        end

        def substitute_tokens(tokenized)
          tokenized.gsub(%r{:([^/]*)}) { record.public_send(Regexp.last_match(1)) }
        end
      end
    end
  end
end

