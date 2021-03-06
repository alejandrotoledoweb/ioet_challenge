class WorksController < ApplicationController

  def create
    @work = Work.create!(work_params)
  end

  def index
    @works = Work.all
    render json: { works: @works }, status: :ok
  end

  def pairs
    # @users = User.all.includes(:works)
    # .map { |u| {
    #   id: u.id,
    #   works: u.works
    # }}.flatten

    @all_works = []
    @works = Work.all
      subtotal_pairs = []
      pairs = {}
    @works.each do |w1|
      @works.each do |w2|
        if w1.user_id != w2.user_id && w1.date == w2.date && w2.start_time < w1.end_time && w2.start_time >= w1.start_time && w2.end_time > w1.start_time && w2.end_time <= w1.end_time
          a = w1.user[:name]
          b = w2.user[:name]
          c = a + '-' + b
          c1 = b + '-' + a
          if pairs[c] && pairs[c1]
            pairs[c] = 0
          else
            pairs[c] ? pairs[c] += 1 : pairs[c] = 1
          end

        end
      end
    end

    @total = pairs.reject! {|key, value| value < 1 }

    # for i in 0..@works.length do
    #   for j in i+1..@works.length do
    #     if @works[i].user_id != @works[j].user_id && @works[i].date == @works[j].date && @works[j].start_time < @works[i].end_time && @works[j].start_time >= @works[i].start_time && @works[j].end_time > @works[i].start_time && @works[j].end_time <= @works[i].end_time
    #       a = @works[i].user[:name]
    #       b = @works[j].user[:name]
    #       c = a + '-' + b
    #       pairs[c] ? pairs[c] += 1 : pairs[c] = 1
    #     end
    #   end
    # end

    result = @total

    render json: result, status: :ok
  end

  private

  def work_params
    params.permit(:user_id, :date, :start_time, :end_time)
  end
end
