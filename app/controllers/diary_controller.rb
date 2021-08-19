class DiaryController < ApplicationController
    def index
        @entries = Entry.all.group_by(&:day)
    end

    def day
        
    end
end
