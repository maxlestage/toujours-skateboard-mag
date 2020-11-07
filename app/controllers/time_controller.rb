class TimeController < ApplicationController

    def index 
        @time = Time.now.utc
    end
end