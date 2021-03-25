require 'rails_helper'

RSpec.describe 'Index diaries request' do
  describe 'GET diaries request' do
    it 'returns list of diaries' do
      get('/index')
      json = JSON.parse(response.body)
      expect(json).to eq(Diary.all)
    end
  end

  describe 'POST diaries request' do
    it 'POST new diary' do
      post('/create', params: {diary: {title: 'test diary', expiration: DateTime.now, kind: Diary.kinds[0]}})
      expect(@response).to have_http_status(201)
    end
  end
end
