# frozen_string_literal:true

class ListItemsController < ProtectedController
  before_action :set_list_item, only: [:show, :destroy]

  # GET /list_items
  def index
    @list_items = ListItem.all

    render json: @list_items
  end

  # GET /list_items/1
  def show
    render json: @list_item
  end

  # POST /list_items
  def create
    @list_item = ListItem.new(list_item_params)
    print 'list item is'
    print @list_item

    if @list_item.save
      render json: @list_item, status: :created, location: @list_item
    else
      render json: @list_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /list_items/1
  def destroy
    @list_item.destroy
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_list_item
    @list_item = ListItem.find(params[:id])
  end
  private :set_list_item

  # Only allow a trusted parameter "white list" through.
  def list_item_params
    params.require(:list_item).permit(:stamp_id, :order_id)
  end
  private :list_item_params
end
