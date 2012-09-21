require 'spec_helper'

describe Navigation do
  let(:stable_tree) do
    { "Getting Started"=>{"quickstart-guide"=>"Quickstart Guide"}, "How To"=>{"lightbox"=>"Floating lightbox"} }
  end
  let(:beta_tree) do
    {
      "Getting Started 2"=>{"quickstart-guide"=>"Quickstart Guide 2"},
      "How To 2"=>{"lightbox"=>"Floating lightbox 2"},
      "Add-ons"=>{"Real-time stats"=>{"real-time-stats/overview"=>"Overview","real-time-stats/usage"=>"Usage"}}
    }
  end

  before { described_class.unmemoize_all }

  describe '.page_title_from_permalink' do
    context 'page dont exist' do
      it 'fallbacks to humanize (with dashes replaced by spaces)' do
        described_class.should_receive(:tree).with('stable') { stable_tree }

        described_class.page_title_from_permalink('stable', 'javascript-api/methods-foo').should eq 'Methods foo'
      end
    end

    context 'page exists' do
      it 'uses the title found' do
        described_class.should_receive(:tree).with('stable') { stable_tree }

        described_class.page_title_from_permalink('stable', 'quickstart-guide').should eq 'Quickstart Guide'
      end
    end
  end

  describe '.sections' do
    it 'returns the list of stable sections' do
      described_class.should_receive(:tree).with('stable') { stable_tree }

      described_class.sections('stable').should eq ['Getting Started', 'How To']
    end

    it 'returns the list of beta sections' do
      described_class.should_receive(:tree).with('beta') { beta_tree }

      described_class.sections('beta').should eq ['Getting Started 2', 'How To 2', 'Add-ons']
    end
  end

  describe '.pages' do
    it 'returns the list of stable pages' do
      described_class.should_receive(:tree).with('stable') { stable_tree }

      described_class.pages('stable').should == { "quickstart-guide"=>"Quickstart Guide", "lightbox"=>"Floating lightbox" }
    end

    it 'returns the list of beta pages' do
      described_class.should_receive(:tree).with('beta') { beta_tree }

      described_class.pages('beta').should == { "quickstart-guide"=>"Quickstart Guide 2", "lightbox"=>"Floating lightbox 2", "Real-time stats"=>{"real-time-stats/overview"=>"Overview","real-time-stats/usage"=>"Usage"} }
    end
  end

  describe '.section_for_page' do
    context 'stable' do
      before { described_class.should_receive(:tree).with('stable') { stable_tree } }

      it { described_class.section_for_page('stable', 'quickstart-guide').should eq 'Getting Started' }
      it { described_class.section_for_page('stable', 'foo-bar').should eq '' }
    end

    context 'beta' do
      before { described_class.should_receive(:tree).with('beta') { beta_tree } }

      it { described_class.section_for_page('beta', 'quickstart-guide').should eq 'Getting Started 2' }
      it { described_class.section_for_page('beta', 'real-time-stats/overview').should eq 'Add-ons: Real-time stats >' }
    end
  end

end
