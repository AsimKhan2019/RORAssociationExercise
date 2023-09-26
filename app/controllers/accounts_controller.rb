class AccountsController < ApplicationController
  before_action :set_account, only: %i[ show edit update destroy ]

  # GET /accounts or /accounts.json
  def index
    @accounts = Account.all
    @clients = Client.all 
    @subscriptions = Subscription.all 
  end

  # GET /accounts/1 or /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
    @clients = Client.all 
    @subscriptions = Subscription.all 
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts or /accounts.json
  def create
    @clients = Client.all
    @subscriptions = Subscription.all 

    @account = Account.new(account_params)
    
    #@account_client = AccountClient.new(account_id: @account.id, client_id: params[:client_id])
    #@subscription_account = SubscriptionAccount.new(account_id: @account.id, subscription_id: params[:subscription_id])

    #Account.transaction do
    #    @account.save!
    #    @account_client.save!
    #    @subscription_account.save!
    #end

    #redirect_to account_url(@account)
    
    respond_to do |format|
      if @account.save
        format.html { redirect_to account_url(@account), notice: "Account was successfully created." }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1 or /accounts/1.json
  def update
    @clients = Client.all
    @subscriptions = Subscription.all

    #@account_client = AccountClient.new(account_id: @account.id, client_id: params[:client_id])
    #@subscription_account = SubscriptionAccount.new(account_id: @account.id, subscription_id: params[:subscription_id])

    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to account_url(@account), notice: "Account was successfully updated." }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1 or /accounts/1.json
  def destroy
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url, notice: "Account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:name, :date, 
      account_clients_attributes: [:id, :client_id, :account_id, :_destroy],
      subscription_accounts_attributes: [:id, :subscription_id, :account_id, :_destroy])
    end
end
