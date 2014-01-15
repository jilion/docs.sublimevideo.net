require 'fast_spec_helper'

require 'navigation'

describe Navigation do
  let(:stable_tree) do
    { "Getting Started"=>{"quickstart-guide"=>"Quickstart Guide"}, "How To"=>{"lightbox"=>"Floating lightbox"} }
  end

  before { described_class.unmemoize_all }

  describe '.section_from_permalink' do
      before { expect(described_class).to receive(:tree) { stable_tree } }

      it { expect(described_class.section_from_permalink('quickstart-guide')).to eq ['Getting Started'] }
      it { expect(described_class.section_from_permalink('foo-bar')).to be_nil }
  end

  describe '.page_title_from_permalink' do
    context 'page dont exist' do
      it 'fallbacks to humanize (with dashes replaced by spaces)' do
        expect(described_class).to receive(:tree) { stable_tree }

        expect(described_class.page_title_from_permalink('javascript-api/methods-foo')).to eq 'Methods foo'
      end
    end

    context 'page exists' do
      it 'uses the title found' do
        expect(described_class).to receive(:tree) { stable_tree }

        expect(described_class.page_title_from_permalink('quickstart-guide')).to eq 'Quickstart Guide'
      end
    end
  end

  describe '.sections' do
    it 'returns the list of sections' do
      expect(described_class).to receive(:tree) { stable_tree }

      expect(described_class.sections).to eq ['Getting Started', 'How To']
    end
  end

  describe '.pages' do
    it 'returns the list of pages' do
      expect(described_class).to receive(:tree) { stable_tree }

      expect(described_class.pages).to eq({ "quickstart-guide"=>"Quickstart Guide", "lightbox"=>"Floating lightbox" })
    end
  end

end
