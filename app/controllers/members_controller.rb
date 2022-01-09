class MembersController < ApplicationController
  before_action :fetch_member, only: [:show, :edit, :update, :destroy]
  
  def index
    @members = Member.all.order(:name)
  end

  def show
    @rank_details = @member.rank_details
  end

  def new
    @member = Member.new
  end

  def edit
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to members_path
    else
      render :new
    end
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
