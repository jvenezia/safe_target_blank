require 'safe_target_blank/version'
require 'action_view'
include ActionView::Helpers::UrlHelper

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
        rel.push('noopener') unless link_to_option_enabled?(html_options, 'opener')
        rel.push('noreferrer') unless link_to_option_enabled?(html_options, 'referrer')
        rel.empty? ? nil : rel.uniq
      end

      def convert_options_to_data_attributes(options, html_options)
        if html_options
          html_options = html_options.stringify_keys
          html_options['rel'] = link_to_target_blank_default_rel(html_options) if link_to_target_blank?(html_options)
        end

        original_convert_options_to_data_attributes(options, html_options)
      end
    end
  end
end