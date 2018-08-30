
class HistoriesController < ApplicationController
  def index
    @histories = History.all.order(created_at: :desc).page(params[:page]).per(25)
  end
end
