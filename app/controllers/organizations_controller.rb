class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show]

  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = (can? :manage, Entity) ? Entity.organizations : Entity.organizations.published
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
    authorize! :read, @organization
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Entity.organizations.find_by_slug(params[:id])
    end
end