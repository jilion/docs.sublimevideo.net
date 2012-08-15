require 'spec_helper'

describe Navigation do
  before do
    described_class.stub(:tree) { {"Getting Started"=>{"quickstart-guide"=>"Quickstart Guide" }, "How To"=>{"lightbox"=>"Floating lightbox"} } }
  end

  describe '.menu_title' do
    context 'page dont exist' do
      it 'fallbacks to humanize (with dashes replaced by spaces)' do
        described_class.menu_title('javascript-api/methods-foo').should eq 'Methods foo'
      end
    end

    context 'page exists' do
      it 'uses the title found' do
        described_class.menu_title('quickstart-guide').should eq 'Quickstart Guide'
      end
    end
  end

  describe '.sections' do
    it { described_class.sections.should eq ['Getting Started', 'How To'] }
  end

  describe '.pages' do
    it { described_class.pages.should == { "quickstart-guide"=>"Quickstart Guide", "lightbox"=>"Floating lightbox" } }
  end

  describe '.section_for_page' do
    it { described_class.section_for_page('quickstart-guide').should eq 'Getting Started' }
    it { described_class.section_for_page('foo-bar').should eq '' }
  end

end
