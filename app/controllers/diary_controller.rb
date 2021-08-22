class DiaryController < ApplicationController
    before_action :authenticate_user!

    def index
        unless params[:date] || params[:search_date]
            date = DateTime.now
            @nice_date = DateTime.now.to_s(:nice_date)
        else
            if params[:date].present?
                date = Date.parse(Time.parse(params[:date]).utc.to_s)
                @nice_date = date.strftime('%B %d, %Y')
            elsif params[:search_date].present?
                date = Date.parse(Time.parse(params[:search_date]).utc.to_s)
                @nice_date = date.strftime('%B %d, %Y')
            end 
        end
        @count = 0
        @calories = 0
        @proteins = 0
        @carbohydrates = 0
        @fats = 0
        user_entries = Entry.where(user_id: current_user.id)
        @entries = user_entries.where(diary_date: date.in_time_zone('US/Pacific').midnight..date.in_time_zone('US/Pacific').end_of_day)
        @entries.each do |entry|
            @count += entry.foods.count
            @calories += entry.foods.pluck(:calories).sum
            @proteins += entry.foods.pluck(:proteins).sum
            @carbohydrates += entry.foods.pluck(:carbohydrates).sum
            @fats += entry.foods.pluck(:fats).sum
        end
        @previous_date = (date - 1.day).strftime('%F')
        @date = date.strftime('%F')
        @next_date = (date + 1.day).strftime('%F')
    end
end
