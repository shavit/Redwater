class AccountsController < ApplicationController
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.json { render :show, status: :created, location: @account }
      else
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def activate_account
    @account = Account.find_by_phone params[:phone]

    if @account.presence? && @account.activate
      format.json { render json: @account, status: :ok}
    else
      format.json { render json: "", status: 404 }
    end
  end

  private

    def set_account
      @account = Account.find(params[:id])
    end

    def account_params
      params.require(:account).permit(:phone)
    end
end
