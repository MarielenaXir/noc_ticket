class GizmosController < ApplicationController
  # GET /gizmos
  # GET /gizmos.json
  def index
    @gizmos = Gizmo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gizmos }
    end
  end

  # GET /gizmos/1
  # GET /gizmos/1.json
  def show
    @gizmo = Gizmo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gizmo }
    end
  end

  # GET /gizmos/new
  # GET /gizmos/new.json
  def new
    @gizmo = Gizmo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gizmo }
    end
  end

  # GET /gizmos/1/edit
  def edit
    @gizmo = Gizmo.find(params[:id])
  end

  # POST /gizmos
  # POST /gizmos.json
  def create
    @gizmo = Gizmo.new(params[:gizmo])

    respond_to do |format|
      if @gizmo.save
        format.html { redirect_to @gizmo, notice: 'Gizmo was successfully created.' }
        format.json { render json: @gizmo, status: :created, location: @gizmo }
      else
        format.html { render action: "new" }
        format.json { render json: @gizmo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gizmos/1
  # PUT /gizmos/1.json
  def update
    @gizmo = Gizmo.find(params[:id])

    respond_to do |format|
      if @gizmo.update_attributes(params[:gizmo])
        format.html { redirect_to @gizmo, notice: 'Gizmo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gizmo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gizmos/1
  # DELETE /gizmos/1.json
  def destroy
    @gizmo = Gizmo.find(params[:id])
    @gizmo.destroy

    respond_to do |format|
      format.html { redirect_to gizmos_url }
      format.json { head :no_content }
    end
  end
end
