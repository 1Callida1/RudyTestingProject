module Api
  class NotesController < ApplicationController
    def show
      render json: Note.find(params[:id]), status: :ok
    end

    def index
      render json: Note.all, status: :ok
    end

    def create
      note = Note.new(n_params)
      if note.save
        render json: note, status: :created
      else
        render json: {errors: note.errors}, status: :unprocessable_entity
      end
    end

    def update
      note = Note.find(params[:id])
      if note.update(n_params)
        render json: note, status: 200
      else
        render json: {errors: note.errors}, status: :unprocessable_entity
      end
    end

    def destroy
      note = Note.find(params[:id]).destroy
      render json: note, status: :no_content
    end
    private

    def find_diary diary_id
      Diary.find(diary_id)
    end

    def n_params
      params.require(:note).permit(:text, :diary_id)
    end
  end
end
