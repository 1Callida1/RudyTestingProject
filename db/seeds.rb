Diary.destroy_all
Note.destroy_all
4.times do |i|
  if i < 2
    diary = Diary.create({title: "diary #{i}", expiration: DateTime.now + 10.minutes, kind: rand(0..1)})
  else
    diary = Diary.create({title: "diary #{i}", expiration: DateTime.now, kind: rand(0..1)})
  end

  3.times do |j|
    diary.notes.create({text: "text number #{i} #{j}"})
  end
end
