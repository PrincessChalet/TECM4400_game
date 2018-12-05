class MembershipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_membership, only: [:show, :edit, :update, :destroy]
  
  # GET /memberships
  # GET /memberships.json
  def index
    @memberships = Membership.all
    
  end

  # GET /memberships/1
  # GET /memberships/1.json
  def show
  end

  # GET /memberships/new
  def new
    @group = Group.find params[:group_id]
    @membership = Membership.new({group: group})
  end

  # GET /memberships/1/edit
  def edit
  end

  # POST /memberships
  # POST /memberships.json
  def create
    @group = Group.find params[:group_id]
    @membership = Membership.new(membership_params)
    #@membership = Membership.new(membership_params)
    #@membership = current_user.memberships.build(:group_id => params[:group_id])
    #respond_to do |format|
     # if @membership.save
      #  format.html { redirect_to @membership, notice: 'Membership was successfully created.' }
      #  format.json { render :show, status: :created, location: @membership }
      #else
      #  format.html { render :new }
      #  format.json { render json: @membership.errors, status: :unprocessable_entity }
      #end
    #end
  end

  # PATCH/PUT /memberships/1
  # PATCH/PUT /memberships/1.json
  def update
    respond_to do |format|
      if @membership.update(membership_params)
        format.html { redirect_to @membership, notice: 'Membership was successfully updated.' }
        format.json { render :show, status: :ok, location: @membership }
      else
        format.html { render :edit }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memberships/1
  # DELETE /memberships/1.json
  def destroy
    @membership = current_user.memberships.find(params[:id])
    #@membership.destroy
    respond_to do |format|
      format.html { redirect_to memberships_url, notice: 'Membership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_membership
      @membership = Membership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def membership_params
      #params.require(:membership).permit(:user_id, :group_id)
      params.require(:membership).merge(group_id: params[:group_id], user_id: current_user.id)
    end
end
