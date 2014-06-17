require 'pry'

class AnswersController < ApplicationController

	def index
		#With nested routes you need to specify the parent id
		@question = @answers.first.question
	end

	def show
		@answer = Answer.find(params[:id])
	end

	def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
    #Must specify which :id when at the nested level (eg, /questions/:question_id/answers/new)
	end

	def create
    @answer = Answer.new(answer_params)
    #Don't use .create, it will make the if @answer.save pass automatically (b/c it already saves)
    if @answer.save
	  	redirect_to question_path(@answer.question)
	  else
	  	flash[:notice] = "We'll eventually put specific error messages here!"
	    render :new
	  end
	end

	def edit
    @answer = Answer.find(params[:id])
	end

	def update
    @answer = Answer.find(params[:id])

    if @answer.update(answer_params)
	  	redirect_to question_path(@answer.question)
	  else
	  	flash[:notice] = "We'll eventually put specific error messages here!"
	    render :edit
	  end
	end

	def destroy
    @answer = Answer.find(params[:id])

    if @answer.destroy
	  	redirect_to question_path(@answer.question)
	  else
	  	flash[:notice] = "We'll eventually put specific error messages here!"
	    render :show
	  end
	end

	private

	def answer_params
	  params.require(:answer).permit(:title, :body, :user_id, :question_id)
	end

end