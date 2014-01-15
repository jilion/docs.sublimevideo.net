require "spec_helper"

describe DocsHelper do

  describe 'section_and_page_title_from_permalink' do
    it 'formats well with a simple section' do
      expect(Navigation).to receive(:section_from_permalink).with('quickstart-guide') { ['Getting Started'] }
      expect(Navigation).to receive(:page_title_from_permalink).with('quickstart-guide') { 'Quickstart guide' }

      expect(helper.section_and_page_title_from_permalink('quickstart-guide')).to eq 'Getting Started: Quickstart guide'
    end

    it 'formats well with a complex section' do
      expect(Navigation).to receive(:section_from_permalink).with('addons/real-time-stats/overview') { ['Add-ons', 'Real-time stats'] }
      expect(Navigation).to receive(:page_title_from_permalink).with('addons/real-time-stats/overview') { 'Overview' }

      expect(helper.section_and_page_title_from_permalink('addons/real-time-stats/overview')).to eq 'Add-ons: Real-time stats > Overview'
    end

    it 'returns an empty string if section cannot be found' do
      expect(Navigation).to receive(:section_from_permalink).with('foo/bar') { nil }

      expect(helper.section_and_page_title_from_permalink('foo/bar')).to eq ''
    end
  end

end
