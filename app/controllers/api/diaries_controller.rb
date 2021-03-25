# frozen_string_literal: true

module Api
  # diaries controller
  class DiariesController < ApplicationController
    def show
      render json: Diary.find(params[:id]), status: :ok
    end

    def index
      render json: Diary.all, status: :ok
    end

    def destroy
      diary = Diary.find(params[:id])
      diary.destroy
      render json: diary, status: :no_content
    end

    def update
      diary = Diary.find(params[:id])
      if diary.update(diary_p)
        render json: diary, status: :ok
      else
        render json: {errors: diary.errors}, status: :unprocessable_entity
      end
    end

    def create
      diary = Diary.new(diary_p)
      if diary.save
        render json: diary, status: :created
      else
        render json: {errors: diary.errors}, status: :unprocessable_entity
      end
    end

    private

    def diary_p
      params.require(:diary).permit(:title, :kind, :expiration)
    end
  end
end
