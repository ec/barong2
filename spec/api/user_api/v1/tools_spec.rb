# frozen_string_literal: true

require 'spec_helper'

describe UserApi::V1::Tools do
  describe 'GET /api/v1/timestamp' do
    let(:do_request) { get '/api/v1/timestamp' }

    it 'returns a current UNIX time' do
      do_request
      expect_status_to_eq(200)
      expect(response.body.to_i).to eq(Time.now.to_i)
    end
  end
end