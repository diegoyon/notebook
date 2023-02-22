class NotesController < ApplicationController
  def index
    @notes = Note.all
    if params[:sort_by]
      case params[:sort_by]
        when 'recent'
          @notes = @notes.order(created_at: :desc)
        when 'oldest'
          @notes = @notes.order(created_at: :asc)
        when 'title_asc'
          @notes = @notes.order(title: :asc)
        when 'title_desc'
          @notes = @notes.order(title: :desc)
      end
    else
      @notes = @notes.order(created_at: :desc)
    end
    
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to @note
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])

    if @note.update(note_params)
      redirect_to @note
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def note_params
    params.require(:note).permit(:title, :body)
  end
end
