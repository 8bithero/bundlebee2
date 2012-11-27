require 'spec_helper'

describe App do

  let(:user) { FactoryGirl.create(:user) }
  let(:developer) { user.add_role :developer }

  before do
    @app = user.app.build(name: "Angry Birds", bundle_id: "com.rovio.angry_birds", points: "2")
  end

  subject { @app }

  it { should respond_to(:name) }
  it { should respond_to(:developer_id) }
  it { should respond_to(:developer) }
  its(:developer) { should == user }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        App.new(developer_id: "1")
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "when developer_id is not present" do
    before { @app.developer_id = nil }
    it { should_not be_valid }
  end

  describe "with blank name" do
    before { @app.name = " " }
    it { should_not be_valid }
  end

  describe "with blank bundle_id" do
    before { @app.bundle_id = " " }
    it { should_not be_valid }
  end

  #describe "with name that is too long" do
  #  before { @app.name = "a" * 141 }
  #  it { should_not be_valid }
  #end
end