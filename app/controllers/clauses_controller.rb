class ClausesController < ApplicationController
  before_action :set_clause, only: [:show, :edit, :update, :destroy]

  # GET /clauses
  # GET /clauses.json
  def index
    @clauses = Clause.all
  end

  # GET /clauses/1
  # GET /clauses/1.json
  def show
  end

  # GET /clauses/new
  def new
    @clause = Clause.new
  end

  # GET /clauses/1/edit
  def edit
  end

  # POST /clauses
  # POST /clauses.json
  def create
    @clause = Clause.new(clause_params)

    respond_to do |format|
      if @clause.save
        format.html { redirect_to @clause, notice: 'Clause was successfully created.' }
        format.json { render :show, status: :created, location: @clause }
      else
        format.html { render :new }
        format.json { render json: @clause.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clauses/1
  # PATCH/PUT /clauses/1.json
  def update
    respond_to do |format|
      if @clause.update(clause_params)
        format.html { redirect_to @clause, notice: 'Clause was successfully updated.' }
        format.json { render :show, status: :ok, location: @clause }
      else
        format.html { render :edit }
        format.json { render json: @clause.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clauses/1
  # DELETE /clauses/1.json
  def destroy
    @clause.destroy
    respond_to do |format|
      format.html { redirect_to clauses_url, notice: 'Clause was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clause
      @clause = Clause.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clause_params
      params.require(:clause).permit(:dispute_id, :clause_text, :clause_status)
    end
end
