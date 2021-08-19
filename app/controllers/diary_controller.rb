class DiaryController < ApplicationController
    def index
        unless params[:date]
            date = DateTime.now
            @nice_date = DateTime.now.to_s(:nice_date)
        else
            date = Date.parse(Time.parse(params[:date]).utc.to_s)
            @nice_date = date.strftime('%B %d, %Y')
        end
        @entries = Entry.where(created_at: date.in_time_zone('US/Pacific').midnight..date.in_time_zone('US/Pacific').end_of_day)
        @yesterday = (date - 1.day).strftime('%F')
        @tomorrow = (date + 1.day).strftime('%F')
    end
end
