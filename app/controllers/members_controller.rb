class MembersController < ApplicationController
  # GET /members
  # GET /members.xml

  # Location, Latitude, Longitude
  LOCATIONS = [
    ["Pagosa Springs", 37.26945, -107.0097617],
    ["Durango", 37.27528, -107.8800667],
    ["Cortez", 37.355967684576406, -108.60260009765625],
    ["Farmington", 36.74108512094412, -108.1658935546875],
    ["Denver", 39.7391536, -104.9847034],
    ["Boulder", 40.000267972646796, -105.28472900390625],
    ["Fort Collins", 40.58058466412761, -105.15838623046875],
    ["Cheyenne", 41.15797827873605, -104.8480224609375],
    ["Grand Island", 40.925964939514294, -98.3660888671875],
    ["Lincoln", 40.80965166748853, -96.6851806640625],
    ["Omaha", 41.253032440653186, -95.9051513671875],
    ["Des Moines", 41.56203190200195, -93.504638671875],
    ["Cedar Rapids", 41.96765920367816, -91.77978515625],
    ["Milwaukee", 43.04480541304368, -87.923583984375],
    ["Mineapolis", 44.98811302615805, -93.251953125],
    ["South Fork", 37.67512527892127, -106.6497802734375],
    ["Creede", 37.8553385894982, -106.9354248046875],
    ["Bayfield", 37.234701971668144, -107.60147094726562],
    ["Arboles", 37.03763967977139, -107.42156982421875],
    ["Dulce", 36.94111143010769, -106.99859619140625],
    ["Chama", 36.910372213522535, -106.58111572265625],
    ["Salt Lake City", 40.70562793820592, -111.566162109375],
    ["Reno", 39.54641191968671, -119.8388671875],
    ["Santa Fe", 35.7019167328534, -105.963134765625],
    ["Albuquerque", 35.092945313732635, -106.666259765625],
    ["Philadelphia", 39.9602803542957, -75.16845703125],
    ["New York City", 40.730608477796636, -74.036865234375],
    ["Ocala", 29.209713225868185, -82.15576171875],
    ["Miami", 25.809781975840405, -80.255126953125],
    ["San Diego", 32.74108223150125, -117.169189453125],
    ["San Francisco", 37.69251435532741, -122.508544921875]
  ]

  LOCATION_OPTIONS = [
    ["Pagosa Springs", 0],
    ["Durango", 1],
    ["Cortez", 2],
    ["Farmington", 3],
    ["Denver", 4],
    ["Boulder", 5],
    ["Fort Collins", 6],
    ["Cheyenne", 7],
    ["Grand Island", 8],
    ["Lincoln", 9],
    ["Omaha", 10],
    ["Des Moines", 11],
    ["Cedar Rapids", 12],
    ["Milwaukee", 13],
    ["Mineapolis", 14],
    ["South Fork", 15],
    ["Creede", 16],
    ["Bayfield", 17],
    ["Arboles", 18],
    ["Dulce", 19],
    ["Chama", 20],
    ["Salt Lake City", 21],
    ["Reno", 22],
    ["Santa Fe", 23],
    ["Albuquerque", 24],
    ["Philadelphia", 25],
    ["New York City", 26],
    ["Ocala", 27],
    ["Miami", 28],
    ["San Diego", 29],
    ["San Francisco", 30]
  ]

  DISTANCE_OPTIONS = [ ["1", 1], ["5", 5], ["10", 10], ["20", 20], ]

  def index
    if (params[:location].nil?)
      @location = 0
    else
      @location = params[:location].to_i
    end
    if (params[:distance].nil?)
      @distance = 1
    else
      @distance = params[:distance].to_i
    end

    @loc = LOCATIONS[@location]
    @location_options = LOCATION_OPTIONS
    @distance_options = DISTANCE_OPTIONS
    #@membersWithCity = Member.where(:city.ne => nil);
    @members = Member.where(:location.near => [@loc[1], @loc[2], @distance]).paginate(:per_page => 50, :page => params[:page])
    #@members = Member.paginate(:per_page => 100, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @members }
    end
  end

  # GET /members/1
  # GET /members/1.xml
  def show
    @member = Member.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @member }
    end
  end

  # GET /members/new
  # GET /members/new.xml
  def new
    @member = Member.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @member }
    end
  end

  # GET /members/1/edit
  def edit
    @member = Member.find(params[:id])
  end

  # POST /members
  # POST /members.xml
  def create
    @member = Member.new(params[:member])

    respond_to do |format|
      if @member.save
        format.html { redirect_to(@member, :notice => 'Member was successfully created.') }
        format.xml  { render :xml => @member, :status => :created, :location => @member }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /members/1
  # PUT /members/1.xml
  def update
    @member = Member.find(params[:id])

    respond_to do |format|
      if @member.update_attributes(params[:member])
        format.html { redirect_to(@member, :notice => 'Member was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.xml
  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to(members_url) }
      format.xml  { head :ok }
    end
  end
end
