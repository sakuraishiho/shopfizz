# app/controllers/error/errors_controller.rb
module Error
  class ErrorsController < ApplicationController
    def test_render500
      raise 'This is a test error to trigger a 500 Internal Server Error'
    end
  end
end
