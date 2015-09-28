require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  login_user

  describe '#index' do
    context 'render only index' do
      it 'renders index page on get request' do
        get :index
        expect(response.status).to eq(200)
      end
    end

    context 'search transaction between date range' do
      it 'displays the fetched transactions within the date range' do
      end
    end
  end
end
