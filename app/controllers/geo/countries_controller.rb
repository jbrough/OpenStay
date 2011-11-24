class Geo::CountriesController < ApplicationController
  # GET /geo/countries
  # GET /geo/countries.xml
  def index
    @geo_countries = Geo::Country.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @geo_countries }
    end
  end

  # GET /geo/countries/1
  # GET /geo/countries/1.xml
  def show
    @geo_country = Geo::Country.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @geo_country }
    end
  end

  # GET /geo/countries/new
  # GET /geo/countries/new.xml
  def new
    @geo_country = Geo::Country.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @geo_country }
    end
  end

  # GET /geo/countries/1/edit
  def edit
    @geo_country = Geo::Country.find(params[:id])
  end

  # POST /geo/countries
  # POST /geo/countries.xml
  def create
    @geo_country = Geo::Country.new(params[:geo_country])

    respond_to do |format|
      if @geo_country.save
        format.html { redirect_to(@geo_country, :notice => 'Country was successfully created.') }
        format.xml  { render :xml => @geo_country, :status => :created, :location => @geo_country }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @geo_country.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /geo/countries/1
  # PUT /geo/countries/1.xml
  def update
    @geo_country = Geo::Country.find(params[:id])

    respond_to do |format|
      if @geo_country.update_attributes(params[:geo_country])
        format.html { redirect_to(@geo_country, :notice => 'Country was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @geo_country.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /geo/countries/1
  # DELETE /geo/countries/1.xml
  def destroy
    @geo_country = Geo::Country.find(params[:id])
    @geo_country.destroy

    respond_to do |format|
      format.html { redirect_to(geo_countries_url) }
      format.xml  { head :ok }
    end
  end

  def bootstrap
    Geo::Country.bootstrap!
    head :ok
  end
end
