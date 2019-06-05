class SavedSongsController < ApplicationController
  def index
    @saved_songs = SavedSong.all

    render("saved_song_templates/index.html.erb")
  end

  def show
    @saved_song = SavedSong.find(params.fetch("id_to_display"))

    render("saved_song_templates/show.html.erb")
  end

  def new_form
    @saved_song = SavedSong.new

    render("saved_song_templates/new_form.html.erb")
  end

  def create_row
    @saved_song = SavedSong.new

    @saved_song.search_id = params.fetch("search_id")

    if @saved_song.valid?
      @saved_song.save

      redirect_back(:fallback_location => "/saved_songs", :notice => "Saved song created successfully.")
    else
      render("saved_song_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @saved_song = SavedSong.find(params.fetch("prefill_with_id"))

    render("saved_song_templates/edit_form.html.erb")
  end

  def update_row
    @saved_song = SavedSong.find(params.fetch("id_to_modify"))

    @saved_song.search_id = params.fetch("search_id")

    if @saved_song.valid?
      @saved_song.save

      redirect_to("/saved_songs/#{@saved_song.id}", :notice => "Saved song updated successfully.")
    else
      render("saved_song_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @saved_song = SavedSong.find(params.fetch("id_to_remove"))

    @saved_song.destroy

    redirect_to("/saved_songs", :notice => "Saved song deleted successfully.")
  end
end
