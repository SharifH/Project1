require 'spec_helper'

describe UsersController do
  before :each do
    sign_in
  end

  let(:user) {User.create(:username => "sunshine", :password => "Sharifsharif",
    :password_confirmation => "Sharifsharif")}

  describe 'index' do
    it "should gather all users in a users instance variable" do
      get :index
        expect { assigns(:users).to == []}
      end
    end


    describe 'update' do
      it "should gather params for user and update db record" do
        put edit_user_registration_path(user), :id => user.id, :user => {:username => "moonshine"}
          user.username should == "moonshine"
        end
      end
    end
