require 'spec_helper'

describe SafeTargetBlank do
  before { include ActionView::Helpers::UrlHelper }
  it { expect(SafeTargetBlank::VERSION).not_to be nil }
end
