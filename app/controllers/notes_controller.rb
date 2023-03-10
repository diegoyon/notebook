class NotesController < ApplicationController
  before_action :set_note, only: %i[show edit update destroy]

  def index
    @notes = Note.all
    sort_notes
    filter_notes
    search_notes
  end

  def show; end

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

  def edit; end

  def update
    if @note.update(note_params)
      redirect_to @note
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @note.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :body, :topic_id)
  end

  def sort_notes
    if params[:sort_by].present?
      case params[:sort_by]
      when 'newest'
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

  def filter_notes
    return unless params[:topic_id].present?

    @notes = @notes.where(topic_id: params[:topic_id])
  end

  def search_notes
    return unless params[:query].present?

    @notes = @notes.where('lower(title) LIKE :query OR lower(body) LIKE :query',
                          query: "%#{params[:query].downcase}%")
  end
end
