class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :purchased_item, only:[:edit, :update]

  def index
    @items = Item.includes(:user).order(created_at: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
    @user = User.find(@item.user_id)
    @purchase = Purchase.find_by(item_id: @item.id)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render action: :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy if item.user_id == current_user.id
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :payment_for_shipping_id, :prefecture_id, :number_of_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def ensure_correct_user
    @item = Item.find(params[:id])
    redirect_to root_path if @item.user_id != current_user.id
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def purchased_item
    redirect_to root_path if Purchase.find_by(item_id: params[:id])
  end
end
