require 'fast_spec_helper'
require File.expand_path('app/models/release')
require 'active_support/core_ext/string'
require 'RedCloth'

describe Release do
  before do
    Rails.stub(:root) { Pathname.new(File.expand_path("spec/fixtures")) }
  end

  let(:releases) { described_class.all }

  describe "all" do
    subject { releases }

    it { should have(2).releases }
  end

  describe "first release" do
    subject { releases.first }

    its(:datetime)   { should eq DateTime.parse('2010-12-20-13:30') }
    its(:updated_at) { should eq DateTime.parse('2010-12-20-13:30') }
    its(:cache_key)  { should eq 'release-2010-12-20T13:30:00+00:00' }
  end

  describe "#atom_content" do
    subject { releases.first }

    it "should replace span and upcased label" do
      expect(subject.atom_content).to include("[IMPROVED]")
      expect(subject.atom_content).to include("[FIXED]")
    end
  end
end
