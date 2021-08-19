class DiaryController < ApplicationController
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
        @entries = Entry.where(diary_date: date.in_time_zone('US/Pacific').midnight..date.in_time_zone('US/Pacific').end_of_day)
        @previous_date = (date - 1.day).strftime('%F')
        @date = date.strftime('%F')
        @next_date = (date + 1.day).strftime('%F')
    end
end
