class SocialsController < ApplicationController
  before_action :set_profile
  before_action :set_social, only: [:show, :edit, :update, :destroy]

  # GET profiles/1/socials
  def index
    @socials = @profile.socials
  end

  # GET profiles/1/socials/1
  def show
  end

  # GET profiles/1/socials/new
  def new
    @social = @profile.socials.build
  end

  # GET profiles/1/socials/1/edit
  def edit
  end

  # POST profiles/1/socials
  def create
    @social = @profile.socials.build(social_params)

    if @social.save
      redirect_to(@social.profile)
    else
      render action: 'new'
    end
  end

  # PUT profiles/1/socials/1
  def update
    if @social.update_attributes(social_params)
      redirect_to([@social.profile, @social], notice: 'Social was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE profiles/1/socials/1
  def destroy
    @social.destroy

    redirect_to profile_socials_url(@profile)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:profile_id])
    end

    def set_social
      @social = @profile.socials.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def social_params
      params.require(:social).permit(:name, :username)
    end
end
