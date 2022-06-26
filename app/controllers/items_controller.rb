class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  require 'will_paginate/array'

  def index

    if params[:category].blank?
       @items = Item.all.paginate(page: params[:page], per_page: 6).order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @items = Item.where(:category_id => @category_id).order("created_at DESC")
    end
    @search = Item.ransack(params[:q])
    @items = @search.result.paginate(page: params[:page],  per_page: 6)
    if params[:q].present?
      @search = Item.ransack(params[:q])
      @items = @search.result.paginate(page: params[:page],  per_page: 6)
    end
  end

  def home
    @items = Item.first(6)

  end

  def search
    @search = Item.ransack(params[:q])
    @items = @search.result.paginate(page: params[:page],  per_page: 6)
  end

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
      render 'new'
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
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category, :price, :item_img)
  end

  def find_item
    @item = Item.find(params[:id])
  end

end
