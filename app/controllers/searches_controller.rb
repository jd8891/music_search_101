class SearchesController < ApplicationController
  def index
    @searches = Search.all

    render("search_templates/index.html.erb")
  end

  def show
    @search = Search.find(params.fetch("id_to_display"))

    render("search_templates/show.html.erb")
  end

  def new_form
    @search = Search.new

    render("search_templates/new_form.html.erb")
  end

  def create_row
    @search = Search.new

    @search.text = params.fetch("text")
    @search.song_saved = params.fetch("song_saved")
    @search.user_id = params.fetch("user_id")

    if @search.valid?
      @search.save

      redirect_back(:fallback_location => "/searches", :notice => "Search created successfully.")
    else
      render("search_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @search = Search.find(params.fetch("prefill_with_id"))

    render("search_templates/edit_form.html.erb")
  end

  def update_row
    @search = Search.find(params.fetch("id_to_modify"))

    @search.text = params.fetch("text")
    @search.song_saved = params.fetch("song_saved")
    

    if @search.valid?
      @search.save

      redirect_to("/searches/#{@search.id}", :notice => "Search updated successfully.")
    else
      render("search_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @search = Search.find(params.fetch("id_to_remove"))

    @search.destroy

    redirect_to("/users/#{@search.user_id}", notice: "Search deleted successfully.")
  end

  def destroy_row
    @search = Search.find(params.fetch("id_to_remove"))

    @search.destroy

    redirect_to("/searches", :notice => "Search deleted successfully.")
  end
end
