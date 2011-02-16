class HorsesController < ApplicationController
  # GET /horses
  # GET /horses.xml
  def index
    @horses = Horse.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @horses }
    end
  end

  # GET /horses/1
  # GET /horses/1.xml
  def show
    @horse = Horse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @horse }
    end
  end

  # GET /horses/new
  # GET /horses/new.xml
  def new
    @horse = Horse.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @horse }
    end
  end

  # GET /horses/1/edit
  def edit
    @horse = Horse.find(params[:id])
  end

  # POST /horses
  # POST /horses.xml
  def create
    @horse = Horse.new(params[:horse])

    respond_to do |format|
      if @horse.save
        format.html { redirect_to(@horse, :notice => 'Horse was successfully created.') }
        format.xml  { render :xml => @horse, :status => :created, :location => @horse }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @horse.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /horses/1
  # PUT /horses/1.xml
  def update
    @horse = Horse.find(params[:id])

    respond_to do |format|
      if @horse.update_attributes(params[:horse])
        format.html { redirect_to(@horse, :notice => 'Horse was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @horse.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /horses/1
  # DELETE /horses/1.xml
  def destroy
    @horse = Horse.find(params[:id])
    @horse.destroy

    respond_to do |format|
      format.html { redirect_to(horses_url) }
      format.xml  { head :ok }
    end
  end
end
