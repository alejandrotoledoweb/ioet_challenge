class WorksController < ApplicationController

  def create
    @work = Work.create!(work_params)
  end

  private

  def work_params
    params.permit(:user_id, :date, :start_time, :end_time)
  end
end
