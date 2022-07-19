class Admin::ItemsController < ApplicationController
  before_action :require_admin
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  require "will_paginate/array"

  def show
  end

  def new
    @item = Item.new
    @categories = Category.pluck(:name, :id)
  end

  def create
    @item = Item.new(item_params)
    @categories = Category.pluck(:name, :id)
    @item.category_id = params[:category_id]

    if @item.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit
    @categories = Category.pluck(:name, :id)
  end

  def update
    @item.category_id = params[:item][:category_id]
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render "edit"
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category, :price, :image)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def require_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end
end
