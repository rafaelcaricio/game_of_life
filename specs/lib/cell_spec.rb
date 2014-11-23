require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe Cell do
  subject { Cell.new(state: state) }

  context "when cell alive" do
    let(:state) { :alive }
    its(:state) { should eq(:alive) }
  end

  context "when cell dead" do
    let(:state) { :dead }
    its(:state) { should eq(:dead) }
  end
end
