class AnswersController < ApplicationController

	def index

	end

	def show

	end

	def new

	end

	def create

	end

	def edit

	end

	def update

	end

	def destroy

	end

	private

	def answer_params
	  params.require(:answer).permit(:title, :body, :user_id, :question_id)
	end

end