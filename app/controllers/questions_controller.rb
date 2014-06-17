class QuestionsController < ApplicationController

	def index
	  @questions = Question.all.order('created_at DESC')
	end

	def show
	  @question = Question.find(params[:id])
	end

	def new
	  @question = Question.new
	end

	def create
	  @question = Question.new(question_params)

	  if @question.save
	  	redirect_to '/'
	  else
	  	flash[:notice] = "We'll eventually put specific error messages here!"
	    render :new
	  end
	end

	def edit
	  @question = Question.find(params[:id])
	  #Cannot say Question.new here, you're not creating, you're updating!
	end

	def update
	  @question = Question.find(params[:id])

	  if @question.update(question_params)
	  	redirect_to question_path(@question)
	  else
	  	flash[:notice] = "We'll eventually put specific error messages here!"
	    render :edit
	  end
	end

	def destroy
	  @question = Question.find(params[:id])

	  if @question.destroy
	    redirect_to root_path
	  else
	  	flash[:notice] = "We'll eventually put specific error messages here!"
	    render :show
	  end
	end


	private

	def question_params
	  params.require(:question).permit(:title, :body, :user_id)
	end

end