require "spec_helper"

describe DocsHelper do

  describe 'section_and_page_title_from_permalink' do
    it 'formats well with a simple section' do
      Navigation.should_receive(:section_from_permalink).with('beta', 'quickstart-guide') { ['Getting Started'] }
      Navigation.should_receive(:page_title_from_permalink).with('beta', 'quickstart-guide') { 'Quickstart guide' }

      helper.section_and_page_title_from_permalink('beta', 'quickstart-guide').should eq 'Getting Started: Quickstart guide'
    end

    it 'formats well with a complex section' do
      Navigation.should_receive(:section_from_permalink).with('beta', 'addons/real-time-stats/overview') { ['Add-ons', 'Real-time stats'] }
      Navigation.should_receive(:page_title_from_permalink).with('beta', 'addons/real-time-stats/overview') { 'Overview' }

      helper.section_and_page_title_from_permalink('beta', 'addons/real-time-stats/overview').should eq 'Add-ons: Real-time stats > Overview'
    end

    it 'returns an empty string if section cannot be found' do
      Navigation.should_receive(:section_from_permalink).with('beta', 'foo/bar') { nil }

      helper.section_and_page_title_from_permalink('beta', 'foo/bar').should eq ''
    end
  end

end
