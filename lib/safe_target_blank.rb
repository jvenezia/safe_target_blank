require 'action_view'
include ActionView::Helpers::UrlHelper

require 'safe_target_blank/version'
require 'safe_target_blank/url_helper'

module SafeTargetBlank
  def self.opener
    @opener
  end

  def self.opener=(opener)
    @opener = opener
  end

  def self.referrer
    @referrer
  end

  def self.referrer=(referrer)
    @referrer = referrer
  end
end