class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[show edit update destroy]

  # GET /fundings or /fundings.json
  def index
    @category = Category.find(params[:category_id])
    @transactions = @category.transactions.order(created_at: :desc)
    @total_money = @transactions.sum(:amount)
  end

  # GET /fundings/1 or /fundings/1.json
  def show; end

  # GET /fundings/new
  def new
    # @funding = Funding.new
    @user = current_user
    @category = Category.find(params[:category_id])
    @transaction = Transaction.new
  end

  # GET /fundings/1/edit
  def edit; end

  # POST /fundings or /fundings.json

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user_id = current_user.id
    @transaction.category_id = Category.find_by_id(params[:category_id]).id
    respond_to do |format|
      if @transaction.save
        format.html do
          redirect_to category_transactions_path(@transaction.category_id), notice: 'Transaction successfully created.'
        end
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:user_id, :name, :category_id, :amount)
  end
end
