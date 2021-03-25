require 'rails_helper'

RSpec.describe 'Index note request' do
  describe 'GET note request' do
    it 'returns list of notes' do
      get('/index')
      json = JSON.parse(response.body)
      expect(json).to eq(Note.all)
    end
  end

  describe 'POST note request' do
    it 'POST new note' do
      d = Diary.create({title: "diary", expiration: DateTime.now, kind: rand(0..1)})
      post('/create_note', params: {note: {text: 'test text', diary_id: d.id}})
      expect(@response).to have_http_status(201)
    end
  end
end
