RSpec.describe UsersController, :type => :controller do

    describe "GET #index" do

    it "will be happy with a 200 code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "redirects after destruction to user page" do
      user =   jack = User.new(:first_name => "Jack", :last_name => "Bauer", :email => "bauer@ctu.gov")
      user.destroy
      expect(response).to render_template("/users")
    end
  end
end

end