class Ota::CodeList::CodesController < ApplicationController
  respond_to :xml, :json, :html

  def index
    list_id = params[:list_id]
    @ota_code_list_codes = list_id ? Ota::CodeList::List.find(list_id).codes : Ota::CodeList::Code.all
    respond_with @ota_code_list_codes
  end

  # GET /ota/code_list/codes/1
  # GET /ota/code_list/codes/1.xml
  def show
    @ota_code_list_code = Ota::CodeList::Code.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ota_code_list_code }
    end
  end

  # GET /ota/code_list/codes/new
  # GET /ota/code_list/codes/new.xml
  def new
    @ota_code_list_code = Ota::CodeList::Code.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ota_code_list_code }
    end
  end

  # GET /ota/code_list/codes/1/edit
  def edit
    @ota_code_list_code = Ota::CodeList::Code.find(params[:id])
  end

  # POST /ota/code_list/codes
  # POST /ota/code_list/codes.xml
  def create
    @ota_code_list_code = Ota::CodeList::Code.new(params[:ota_code_list_code])

    respond_to do |format|
      if @ota_code_list_code.save
        format.html { redirect_to(@ota_code_list_code, :notice => 'Code was successfully created.') }
        format.xml  { render :xml => @ota_code_list_code, :status => :created, :location => @ota_code_list_code }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ota_code_list_code.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ota/code_list/codes/1
  # PUT /ota/code_list/codes/1.xml
  def update
    @ota_code_list_code = Ota::CodeList::Code.find(params[:id])

    respond_to do |format|
      if @ota_code_list_code.update_attributes(params[:ota_code_list_code])
        format.html { redirect_to(@ota_code_list_code, :notice => 'Code was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ota_code_list_code.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ota/code_list/codes/1
  # DELETE /ota/code_list/codes/1.xml
  def destroy
    @ota_code_list_code = Ota::CodeList::Code.find(params[:id])
    @ota_code_list_code.destroy

    respond_to do |format|
      format.html { redirect_to(ota_code_list_codes_url) }
      format.xml  { head :ok }
    end
  end
end
