class ParceFilesController < ApplicationController
  before_action :find_parce, only: [:show]
  def index
    @parces = ParceFile.all
  end

  def show
  end

  def new
  end

  def create
  end
end

private

def find_parce
  @parce = ParceFile.find(params[:id])
end