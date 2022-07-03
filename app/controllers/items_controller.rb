class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  require 'will_paginate/array'

  def index
    if params[:category].blank?
       @items = Item.all.paginate(page: params[:page], per_page: 6).order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @items = Item.where(:category_id => @category_id).paginate(page: params[:page],
      	per_page: 6).order("created_at DESC")
    end

    if params[:q].present?
      @search = Item.ransack(params[:q])
      @items = @search.result.paginate(page: params[:page],  per_page: 6)
    end
    @order_item = current_order.order_items.new
  end

  def search
    @search = Item.ransack(params[:q])
    @items = @search.result.paginate(page: params[:page],  per_page: 6)
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category, :price, :item_img)
  end

  def find_item
    @item = Item.find(params[:id])
  end

end
