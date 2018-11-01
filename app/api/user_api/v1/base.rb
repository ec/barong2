# frozen_string_literal: true

module UserApi
  module V1
    class Base < Grape::API
      version 'v1', using: :path
  
      cascade false
  
      format         :json
      content_type   :json, 'application/json'
      default_format :json
  
      helpers V1::Helpers
  
      do_not_route_options!
  
      rescue_from(ActiveRecord::RecordNotFound) { |_e| error!('Record is not found', 404) }
  
      rescue_from(Grape::Exceptions::ValidationErrors) do |error|
        error!(error.message, 400)
      end
  
      rescue_from(:all) do |error|
        Rails.logger.error "#{error.class}: #{error.message}"
        error!('Something went wrong', 500)
      end

      mount UserApi::V1::Tools
  
      route :any, '*path' do
        error! 'Route is not found', 404
      end
    end
  end
end
