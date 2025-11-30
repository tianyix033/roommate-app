class ReportsController < ApplicationController

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @report.reported_username = params[:report][:reported_username]
    
    if params[:report][:reporter_id].present?
      @report.reporter_id = params[:report][:reporter_id]
    elsif defined?(current_user) && current_user
      @report.reporter = current_user
    end

    if @report.save
      redirect_to new_report_path, notice: 'Your report has been submitted. Thank you.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def report_params
    params.require(:report).permit(:report_type, :description, :reporter_id)
  end
end