# app/controllers/reports_controller.rb
class ReportsController < ApplicationController
  before_action :authorize!

  def index
    render json: MonthlyReport.all
  end
end
