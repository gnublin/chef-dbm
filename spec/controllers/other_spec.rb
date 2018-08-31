# MIT License
# Copyright (c) 2018 Gauthier FRANCOIS

require 'spec_helper'
require 'chef_dbwm'
require 'rack/test'

describe 'Other' do
  include Rack::Test::Methods
  let(:app) { ChefDBWM }

  describe 'Error' do
    describe '::404' do
      before { get '/toto' }
      it('returns 404') { expect(last_response.status).to eq(404) }
    end
  end

  describe 'Root' do
    before { get '/' }
    describe 'Root' do
      it('returns 200 OK') { expect(last_response).to be_ok }
      it('contain "Databags" ') { expect(last_response.body).to include('Databags') }
    end
  end
end