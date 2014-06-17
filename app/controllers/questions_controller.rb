class QuestionsController < ApplicationController

	def index
	  @questions = Question.all
	end

	def show
	  @question = Question.find(params[:id])
	end

	def new
	  @question = Question.new
	end

	def create
	  @question = Question.create(question_params)
	  if @question.save
	  	redirect_to '/'
	  else
	  	flash[:notice] = "We'll eventually put specific error messages here!"
	    render :new
	  end
	end

	def edit
	  @question = Question.new
	end

	def update
	  @question = Question.find(params[:id]).update(question_params)
	  redirect_to "/questions/#{params[:id]}"
	end

	def destroy
	  Question.find(params[:id]).destroy
	  redirect_to '/'
	end


	private

	def question_params
	  params.require(:question).permit(:title, :body, :user_id)
	end

end