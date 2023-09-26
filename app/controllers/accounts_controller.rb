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
    @account.account_clients.build 
    @account.subscription_accounts.build 
    @clients = Client.all 
    @subscriptions = Subscription.all 
  end

  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
    @account.account_clients.build
    @account.subscription_accounts.build
    @clients = Client.all
    @subscriptions = Subscription.all
  end

  # POST /accounts or /accounts.json
  def create
    @clients = Client.all
    @subscriptions = Subscription.all 

    @account = Account.new(account_params)
    
    respond_to do |format|
      ActiveRecord::Base.transaction do
        @account = Account.new(account_params)
        if @account.save
            @account.account_clients.create(client_id: params[:account][:account_client][:client_id])
            @account.subscription_accounts.create(subscription_id: params[:account][:subscription_account][:subscription_id])
            
            format.html { redirect_to account_url(@account), notice: "Account was successfully created." }
            format.json { render :show, status: :created, location: @account }
        else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @account.errors, status: :unprocessable_entity }
            raise ActiveRecord::Rollback # Rollback the transaction if there's an error
        end
      end
    end
  end

  # PATCH/PUT /accounts/1 or /accounts/1.json
  def update
    @clients = Client.all
    @subscriptions = Subscription.all
    
    respond_to do |format|
     ActiveRecord::Base.transaction do
        if @account.update(account_params)
            @account.account_clients.destroy_all # Remove existing associations
            @account.account_clients.create(client_id: params[:account][:account_client][:client_id])

            @account.subscription_accounts.destroy_all # Remove existing associations
            @account.subscription_accounts.create(subscription_id: params[:account][:subscription_account][:client_id])
            
            format.html { redirect_to account_url(@account), notice: "Account was successfully updated." }
            format.json { render :show, status: :created, location: @account }
        else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @account.errors, status: :unprocessable_entity }
            raise ActiveRecord::Rollback # Rollback the transaction if there's an error
        end
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
        account_clients_attributes: [:id, :client_id],
        subscription_accounts_attributes: [:id, :subscription_id])
    end
end
