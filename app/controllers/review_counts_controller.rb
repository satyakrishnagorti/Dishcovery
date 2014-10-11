class ReviewCountsController < ApplicationController
  before_action :set_review_count, only: [:show, :edit, :update, :destroy]

  # GET /review_counts
  # GET /review_counts.json
  def index
    @review_counts = ReviewCount.all
  end

  # GET /review_counts/1
  # GET /review_counts/1.json
  def show
  end

  # GET /review_counts/new
  def new
    @review_count = ReviewCount.new
  end

  # GET /review_counts/1/edit
  def edit
  end

  # POST /review_counts
  # POST /review_counts.json
  def create
    @review_count = ReviewCount.new(review_count_params)

    respond_to do |format|
      if @review_count.save
        format.html { redirect_to @review_count, notice: 'Review count was successfully created.' }
        format.json { render :show, status: :created, location: @review_count }
      else
        format.html { render :new }
        format.json { render json: @review_count.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /review_counts/1
  # PATCH/PUT /review_counts/1.json
  def update
    respond_to do |format|
      if @review_count.update(review_count_params)
        format.html { redirect_to @review_count, notice: 'Review count was successfully updated.' }
        format.json { render :show, status: :ok, location: @review_count }
      else
        format.html { render :edit }
        format.json { render json: @review_count.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /review_counts/1
  # DELETE /review_counts/1.json
  def destroy
    @review_count.destroy
    respond_to do |format|
      format.html { redirect_to review_counts_url, notice: 'Review count was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review_count
      @review_count = ReviewCount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_count_params
      params.require(:review_count).permit(:rest_id, :rev_count)
    end
end
