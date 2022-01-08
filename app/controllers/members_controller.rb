class MembersController < ApplicationController
  before_action :fetch_member, only: [:show, :edit, :update, :destroy]
  
  def index
    @members = Member.all
  end

  def show
  end

  def new
    @member = Member.new
  end

  def edit
  end

  def create
    @member = Member.new(member_params)
  end

  def update
    if @member.update(member_params)
      redirect_to members_path
    else
      render :edit
    end
  end

  def destroy
    @member.destroy
    redirect_to members_path
  end

  private

  def fetch_member
    @member = Member.find_by_id(params[:id])
  end

  def member_params
    params.require(:member).permit(:name, :email, :contact)
  end

end
