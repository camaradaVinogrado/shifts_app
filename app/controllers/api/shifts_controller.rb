# frozen_string_literal: true

class Api::ShiftsController < ApplicationController
  def create
    Shift.transaction do
      Shift.create!(create_params)
    end
    render json: { status: :ok, message: 'Shifts have been created' }
  rescue ActiveRecord::RecordInvalid => e
    render json: { status: :unprocessable_entity, message: e }
  end

  private

  def create_params
    params_to_store = params.permit(shifts: %i[start finish]).require(:shifts)
    params_to_store.each do |shift|
      shift.merge!(user_id: user.id)
    end
    params_to_store
  end

  def user
    User.find(params[:user_id])
  end
end
