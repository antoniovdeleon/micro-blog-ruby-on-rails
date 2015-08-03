class PostsController < ApplicationController

	def index # this method is basically teling us to render this text on the page.
		@posts = Post.all
		render :index
	end

	def new #this method renders the new.html.erb page
		@post = Post.new
		render :new
	end

	def create
		# new post data from form
		post_params = params.require(:post).permit(:subject, :text)
		# create new post in db
		post = Post.create(post_params)
		# redirect to posts' show page
		redirect_to "/posts/#{post.id}"

	end

	# GET /posts/:id
	def show 
		# set id from url params
		post_id = params[:id]
		# find post in db by its id
		@post = Post.find(post_id)
		# render the show view
		render :show
  end

  # GET /planes/:id/edit
  def edit
    # set id from url params
    post_id = params[:id]
    # find plane in db by its id
    @post = Post.find(post_id)
    # render edit view
    render :edit
  end

  	# PUT /posts/:id
  def update
  	# set id from url params
  	post_id = params[:id]
  	# find post in db by its id
  	post = Post.find(post_id)
  	# updated post data from form 
  	post_params = params.require(:post).permit(:subject, :text)
  	# update the post in db
  	post.update_attributes(post_params)
  	# redirect to post's show page
  	redirect_to "/posts/#{post.id}"
  end

	def destroy
		post_id = params[:id]
		post = Post.find(post_id)
		post.destroy
		redirect_to "/posts"

	end



end