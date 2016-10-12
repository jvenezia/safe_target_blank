require 'spec_helper'

describe SafeTargetBlank do
  it { expect(SafeTargetBlank::VERSION).not_to be nil }

  describe 'link_to' do
    it { expect(link_to 'Safe', 'safe.io').to eq "<a href=\"safe.io\">Safe</a>" }
    it { expect(link_to 'Safe', 'safe.io', target: :_self).to eq "<a target=\"_self\" href=\"safe.io\">Safe</a>" }

    it { expect(link_to 'Safe', 'safe.io', target: '_blank').to eq "<a target=\"_blank\" rel=\"noopener noreferrer\" href=\"safe.io\">Safe</a>" }
    it { expect(link_to 'Safe', 'safe.io', target: :_blank).to eq "<a target=\"_blank\" rel=\"noopener noreferrer\" href=\"safe.io\">Safe</a>" }

    it { expect(link_to 'Safe', 'safe.io', target: :_blank, rel: :noopener).to eq "<a target=\"_blank\" rel=\"noopener noreferrer\" href=\"safe.io\">Safe</a>" }
    it { expect(link_to 'Safe', 'safe.io', target: :_blank, rel: :nofollow).to eq "<a target=\"_blank\" rel=\"nofollow noopener noreferrer\" href=\"safe.io\">Safe</a>" }
    it { expect(link_to 'Safe', 'safe.io', target: :_blank, rel: [:nofollow, :author]).to eq "<a target=\"_blank\" rel=\"nofollow author noopener noreferrer\" href=\"safe.io\">Safe</a>" }
    it { expect(link_to 'Safe', 'safe.io', target: :_blank, rel: %w(nofollow author)).to eq "<a target=\"_blank\" rel=\"nofollow author noopener noreferrer\" href=\"safe.io\">Safe</a>" }

    it { expect(link_to 'Safe', 'safe.io', target: :_blank, opener: true).to eq "<a target=\"_blank\" rel=\"noreferrer\" href=\"safe.io\">Safe</a>" }
    it { expect(link_to 'Safe', 'safe.io', target: :_blank, referrer: true).to eq "<a target=\"_blank\" rel=\"noopener\" href=\"safe.io\">Safe</a>" }
    it { expect(link_to 'Safe', 'safe.io', target: :_blank, opener: true, referrer: true).to eq "<a target=\"_blank\" href=\"safe.io\">Safe</a>" }
  end
end
