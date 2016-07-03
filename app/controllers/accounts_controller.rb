class AccountsController < ApplicationController

  def show; end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to accounts_path, notice: "Account Created!"
    else
      redirect_to :back, notice: "Sorry. There was an error. "
    end
  end

  def edit
  end

  private

  def account_params
    params.require(:account).permit(:email)
  end

end