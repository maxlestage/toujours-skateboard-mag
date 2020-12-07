class CalculatorController < ApplicationController
    def index
        @number_1 = params[:num1] 
        @number_2 = params[:num2]
    end
end