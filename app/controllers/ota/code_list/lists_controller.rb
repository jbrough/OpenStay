class Ota::CodeList::ListsController < ApplicationController
  # GET /ota/code_list/lists
  # GET /ota/code_list/lists.xml
  def index
    @ota_code_list_lists = Ota::CodeList::List.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ota_code_list_lists }
    end
  end

  # GET /ota/code_list/lists/1
  # GET /ota/code_list/lists/1.xml
  def show
    @ota_code_list_list = Ota::CodeList::List.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ota_code_list_list }
    end
  end

  # GET /ota/code_list/lists/new
  # GET /ota/code_list/lists/new.xml
  def new
    @ota_code_list_list = Ota::CodeList::List.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ota_code_list_list }
    end
  end

  # GET /ota/code_list/lists/1/edit
  def edit
    @ota_code_list_list = Ota::CodeList::List.find(params[:id])
  end

  # POST /ota/code_list/lists
  # POST /ota/code_list/lists.xml
  def create
    @ota_code_list_list = Ota::CodeList::List.new(params[:ota_code_list_list])

    respond_to do |format|
      if @ota_code_list_list.save
        format.html { redirect_to(@ota_code_list_list, :notice => 'List was successfully created.') }
        format.xml  { render :xml => @ota_code_list_list, :status => :created, :location => @ota_code_list_list }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ota_code_list_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ota/code_list/lists/1
  # PUT /ota/code_list/lists/1.xml
  def update
    @ota_code_list_list = Ota::CodeList::List.find(params[:id])

    respond_to do |format|
      if @ota_code_list_list.update_attributes(params[:ota_code_list_list])
        format.html { redirect_to(@ota_code_list_list, :notice => 'List was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ota_code_list_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ota/code_list/lists/1
  # DELETE /ota/code_list/lists/1.xml
  def destroy
    @ota_code_list_list = Ota::CodeList::List.find(params[:id])
    @ota_code_list_list.destroy

    respond_to do |format|
      format.html { redirect_to(ota_code_list_lists_url) }
      format.xml  { head :ok }
    end
  end
  
  def bootstrap
    Ota::CodeList.bootstrap!
    head :ok
  end

end
