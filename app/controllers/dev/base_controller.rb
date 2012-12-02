class Dev::BaseController < ApplicationController
  protected

    def current_ability
      @current_ability ||= ::Ability.new(current_user, :dev)
    end
end