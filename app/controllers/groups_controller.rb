class GroupsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    @group.user = current_user
    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    if @group.user == current_user
      respond_to do |format|
        if @group.update(group_params)
          format.html { redirect_to @group, notice: 'Group was successfully updated.' }
          format.json { render :show, status: :ok, location: @group }
        else
          format.html { render :edit }
          format.json { render json: @group.errors, status: :unprocessable_entity }
        end
      end
    else
      wrong_user_error
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    if @recipe.user == current_user
      @group.destroy
      respond_to do |format|
        format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      wrong_user_error
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:remove_image, :image, :name, :experience_level, :user_id, :event_id, :game_id, :create_date, :description)
    end

    def wrong_user_error
      respond_to do |format|
        format.html{redirect_to pages_my_groups_path, notice: "You can't edit this group!"}
        format.json { head :no_content }
      end
    end
end