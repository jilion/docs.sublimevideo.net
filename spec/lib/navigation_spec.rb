require 'fast_spec_helper'

require 'navigation'

describe Navigation do
  let(:stable_tree) do
    { "Getting Started"=>{"quickstart-guide"=>"Quickstart Guide"}, "How To"=>{"lightbox"=>"Floating lightbox"} }
  end

  before { described_class.unmemoize_all }

  describe '.section_from_permalink' do
      before { described_class.should_receive(:tree) { stable_tree } }

      it { described_class.section_from_permalink('quickstart-guide').should eq ['Getting Started'] }
      it { described_class.section_from_permalink('foo-bar').should eq nil }
  end

  describe '.page_title_from_permalink' do
    context 'page dont exist' do
      it 'fallbacks to humanize (with dashes replaced by spaces)' do
        described_class.should_receive(:tree) { stable_tree }

        described_class.page_title_from_permalink('javascript-api/methods-foo').should eq 'Methods foo'
      end
    end

    context 'page exists' do
      it 'uses the title found' do
        described_class.should_receive(:tree) { stable_tree }

        described_class.page_title_from_permalink('quickstart-guide').should eq 'Quickstart Guide'
      end
    end
  end

  describe '.sections' do
    it 'returns the list of sections' do
      described_class.should_receive(:tree) { stable_tree }

      described_class.sections.should eq ['Getting Started', 'How To']
    end
  end

  describe '.pages' do
    it 'returns the list of pages' do
      described_class.should_receive(:tree) { stable_tree }

      described_class.pages.should == { "quickstart-guide"=>"Quickstart Guide", "lightbox"=>"Floating lightbox" }
    end
  end

end
