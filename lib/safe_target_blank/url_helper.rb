module ActionView
  module Helpers
    module UrlHelper
      alias original_convert_options_to_data_attributes convert_options_to_data_attributes

      def link_to_target_blank?(html_options)
        html_options['target'] && html_options['target'].to_s.include?('_blank')
      end

      def link_to_rel_from_html_options(html_options)
        html_options['rel'].is_a?(Array) ? html_options['rel'].map(&:to_s) : html_options['rel'].to_s.split(' ')
      end

      def link_to_option_enabled?(html_options, option)
        html_options.is_a?(Hash) && (html_options.delete(option.to_s) || html_options.delete(option.to_sym))
      end

      def link_to_target_blank_default_rel(html_options)
        rel = link_to_rel_from_html_options(html_options)
        rel.push('noopener') if !SafeTargetBlank.opener && !link_to_option_enabled?(html_options, 'opener')
        rel.push('noreferrer') if !SafeTargetBlank.referrer && !link_to_option_enabled?(html_options, 'referrer')
        rel.map(&:presence).compact.uniq.join(' ')
      end

      def convert_options_to_data_attributes(options, html_options)
        if html_options
          html_options = html_options.stringify_keys
          if link_to_target_blank?(html_options)
            rel = link_to_target_blank_default_rel(html_options).presence
            html_options['rel'] = rel if rel
          end
        end

        original_convert_options_to_data_attributes(options, html_options)
      end
    end
  end
end
