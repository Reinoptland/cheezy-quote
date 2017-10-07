require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe QuotesController, type: :controller do
  include Devise::Test::ControllerHelpers


  # This should return the minimal set of attributes required to create a valid
  # Quote. As you add validations to Quote, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      source: "Academician Prokhor Zakharov",
      content: "Begin with a function of arbitrary complexity. Feed it values, \"sense data\". Then,
        take your result, square it, and feed it back into your original function, adding a new set of
        sense data. Continue to feed your results back into the original function ad infinitum. What
        do you have? The fundamental principle of human consciousness"
    }
  }

  let(:new_attributes) {
    {
      source: "Professor Prokhor Zakharov",
      content: "I am very smart"
    }
  }

  let(:invalid_attributes) {
    {
      source: nil,
      content: nil,
    }
  }

  context "Unauthenticated actions" do
    describe "GET #index" do
      it "returns a success response" do
        Quote.create! valid_attributes
        get :index, params: {}
        expect(response).to be_success
      end
    end

    describe "GET #show" do
      it "returns a success response" do
        quote = Quote.create! valid_attributes
        get :show, params: {id: quote.to_param}
        expect(response).to be_success
      end
    end

    describe "GET #random" do
      it "it renders a show template and returns a success response" do
        create :quote
        get :random
        assert_template 'quotes/show'
        expect(response).to be_success
      end
    end
  end

  context "Authenticated routes without authentication" do
    describe "GET #new" do
      it "returns a failure response" do
        get :new, params: {}
        expect(response).to redirect_to("/")
      end
    end

    describe "GET #edit" do
      it "returns a failure response" do
        quote = Quote.create! valid_attributes
        get :edit, params: {id: quote.to_param}
        expect(response).to redirect_to("/")
      end
    end

    describe "POST #create" do
      it "returns a failure response" do
        post :create, params: {quote: valid_attributes}
        expect(response).to redirect_to("/")
      end
    end

    describe "PUT #update" do
      it "returns a failure response" do
        quote = Quote.create! valid_attributes
        put :update, params: {id: quote.to_param, quote: new_attributes}
        expect(response).to redirect_to("/")
      end
    end

    describe "DELETE #destroy" do
      it "redirects to the quotes list" do
        quote = Quote.create! valid_attributes
        delete :destroy, params: {id: quote.to_param}
        expect(response).to redirect_to("/")
      end
    end
  end

  context "Authenticated routes with authentication" do
    login_admin

    describe "GET #new" do
      it "returns a success response" do
        get :new, params: {}
        expect(response).to be_success
      end
    end

    describe "GET #edit" do
      it "returns a success response" do
        quote = Quote.create! valid_attributes
        get :edit, params: {id: quote.to_param}
        expect(response).to be_success
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Quote" do
          create(:cheesy_scale)
          expect {
            post :create, params: {quote: valid_attributes}
          }.to change(Quote, :count).by(1)
        end

        it "redirects to the created quote" do
          create(:cheesy_scale)
          post :create, params: {quote: valid_attributes}
          expect(response).to redirect_to(Quote.last)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: {quote: invalid_attributes}
          expect(response).to be_success
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do

        it "updates the requested quote" do
          quote = Quote.create! valid_attributes
          put :update, params: {id: quote.to_param, quote: new_attributes}
          quote.reload
          expect(quote.source).to eq("Professor Prokhor Zakharov")
          expect(quote.content).to eq("I am very smart")
        end

        it "redirects to the quote" do
          quote = Quote.create! valid_attributes
          put :update, params: {id: quote.to_param, quote: valid_attributes}
          expect(response).to redirect_to(quote)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          quote = Quote.create! valid_attributes
          put :update, params: {id: quote.to_param, quote: invalid_attributes}
          expect(response).to be_success
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested quote" do
        quote = Quote.create! valid_attributes
        expect {
          delete :destroy, params: {id: quote.to_param}
        }.to change(Quote, :count).by(-1)
      end

      it "redirects to the quotes list" do
        quote = Quote.create! valid_attributes
        delete :destroy, params: {id: quote.to_param}
        expect(response).to redirect_to(quotes_url)
      end
    end
  end

end
