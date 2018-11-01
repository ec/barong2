# frozen_string_literal: true

require 'spec_helper'

module UserApi
  module V1
    class Mount
    end
  end
end

describe 'Api::V1::Mount' do
  let(:do_request) { get '/api/v1/non/exist' }

  context 'handle exception on request routing' do
    it 'should render json error message' do
      do_request
      expect_status_to_eq(404)
      expect_body.to eq(error: 'Route is not found')
    end
  end
end