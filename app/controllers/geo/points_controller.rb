class Geo::PointsController < ApplicationController
  respond_to :xml, :json

  def index
    q = Geo::Point.find_all_by_key params[:id]
    o = params[:count] ? q.count : q
    render :json => o.as_json
  end

  def create
    o = Geo::Point.new(:key => params[:key], :lat => params[:lat], :lng => params[:lng])
    if o.save
      render :json => o
    else
      head :error
    end
  end

  def show
    key = params[:id]
    q = if key =~ /\*/
          Geo::Point.find_all_by_key(key)
        else  
          Geo::Point.find_by_key(key)
        end
    o = params[:count] ? q.count : q
    render :json => o.as_json
  end

  def csq
    km = params[:km]
    o = Geo::Point.find_by_key params[:id]
    q = Geo::Point.find_all_by_csq(o.csq_code(km), params[:key])
    o = params[:count] ? q.count : q
    render :json => o.as_json
  end
  def count
    render :json => Geo::Point.count.as_json
  end

  def bootstrap
    Geo::Point.bootstrap!(params[:file])
    head :ok
  end
end
