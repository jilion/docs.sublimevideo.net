require 'spec_helper'

describe Page do

  describe 'title' do
    context 'MENU_PAGE_TITLES is empty' do
      before do
        stub_const 'Page::MENU_PAGE_TITLES', {}
      end

      it 'fallbacks to humanize (with dashes replaced by spaces) if title is not found in the MENU_PAGE_TITLES hash' do
        Page.title('javascript-api/methods-foo').should eq 'Methods foo'
      end
    end

    context 'MENU_PAGE_TITLES is not empty' do
      before do
        stub_const 'Page::MENU_PAGE_TITLES', { 'foo-bar' => 'Foo is Bar'}
      end

      it 'uses the title found in MENU_PAGE_TITLES hash' do
        Page.title('foo-bar').should eq 'Foo is Bar'
      end
    end
  end

end
