class MembershipsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def index
        memberships = Membership.all
        render json: memberships
    end

    def create
        membership = Membership.create!(membership_params)
        render json: membership
    end


    private

    def membership_params
        params.permit(:charge, :gym_id, :client_id)
    end

    def render_unprocessable_entity(e)
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end

end
