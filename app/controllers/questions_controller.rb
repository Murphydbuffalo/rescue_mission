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
	  @question = Question.create(question_params)
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
	  @question = Question.find(params[:id]).update(question_params)
	  if @question
	  	redirect_to "/questions/#{params[:id]}"
	  else
	  	flash[:notice] = "We'll eventually put specific error messages here!"
	    render :edit
	  end
	end

	def destroy
	  question = Question.find(params[:id]).destroy
	  #must assign to variable for the verification below to work
	  #b/c you can't .find a destroyed object
	  if question.destroyed?
	    redirect_to '/'
	  else
	  	flash[:notice] = "We'll eventually put specific error messages here!"
	    render :index
	  end
	end


	private

	def question_params
	  params.require(:question).permit(:title, :body, :user_id)
	end

end