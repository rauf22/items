class ItemsController < ApplicationController
	
	before_filter :find_item, 		only: [:show, :edit, :update, :destroy, :upvote]
	before_filter :check_if_admin,  only: [ :edit, :update, :new, :create, :destroy]
	def index
		@items = Item.all
		#@items = Item.all	
		#render text: @items.map { |i| "#{i.name}: #{i.price}"}.join("<br/>")
	end

	def welcome
		render "welcome"
	end

	def expensive
		@items = Item.where("price > 1000")
		render "index"
	end
	
	# /ites/1 GET
	def show
		unless @item
			#render "item/show"
			raise "exception test"
			render text: "Page not found", status: 404
		end
	end
	
	# /items/new GET
	def new
		@item = Item.new
	end

	# /items/1/edit GET
	def edit
	end

	# /items/ POST
	def create
		#item_params = params.require(:item).permit(:name, :description, :weight, :price, :real, :item_id, :cart_id, :quantity, :comentable_id, :body, :user_id)
@item = Item.create(item_params) 

		if @item.errors.empty?
			redirect_to item_path(@item)
		else
			render "new"
		end
		#@item = Item.create(params[:item])
		#p params
		#render text: "#{@item.id}: #{@item.name} #{@item.description}(#{!@item.new_record?})"	
	end

	# /items/1 PUT
	def update

		#item_params = params.require(:item).permit(:name, :description, :weight, :price, :real, :item_id, :cart_id, :quantity, :comentable_id, :body, :user_id)

		@item.update_attributes(item_params)

		if @item.errors.empty?
			flash[:success] = "Товар успешно обновлён."
			redirect_to item_path(@item)
		else
			flash.now[:error] = "Не верно заполнены поля! Надо исправить."
			render "edit"
		end
	end

	# /item/1 DELETE
	def destroy
	 
	@item.destroy
	redirect_to action: "index"	
	end

	def upvote
		@item.increment!(:votes_count)
		redirect_to action: :index
	end

	private

	def find_item
	@item = Item.where(id:params[:id]).first
	render_404 unless @item	
	end	

	def item_params
		params.require(:item).permit(:name, :description, :weight, :price, :real, :item_id, :cart_id, :quantity, :comentable_id, :body, :user_id)

	end

end

