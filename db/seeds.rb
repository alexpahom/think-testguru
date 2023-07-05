
category_names = {
  movie: 'Кино',
  music: 'Музыка',
  science: 'Наука',
  technic: 'Техника'
}
test_names = {
  movie: 'Властелин колец',
  music: 'Инструменты',
  science: 'Программирование',
  technic: 'Авто'
}
surveys = {
  movie: [{
    question: 'Кто не был в братстве кольца',
    answers: [{ body: 'Пиппин' }, { body: 'Леголас' }, { body: 'Элронд', correct: true }, { body: 'Боромир' }]
  }],
  music: [{
    question: 'Какой из альбомов Metallica состоит из каверов',
    answers: [
      { body: 'St. Anger' }, { body: 'Garage Inc.', correct: true }, { body: 'Death Magnetic' }, { body: 'Load' }
    ]
  }]  ,
  science: [{
    question: 'Что в руби false из нижеперечисленного',
    answers: [{ body: 'nil', correct: true }, { body: '0' }, { body: '\'\'' }, { body: '!!true' }]
  }],
  technic: [{
    question: 'Что можно использовать без огнетущителя',
    answers: [
      { body: 'Мотоциклы без бокового прицепа' },
      { body: 'Мотоциклы', correct: true },
      { body: 'Мотоциклы и легковушки' }
    ]
  }]
}

categories = category_names.values.collect { |name| Category.create(title: name) }
user_ids = %w[Иван Борис Мишаня].collect { |user| User.create(name: user).id }

tests = test_names.collect do |type, value|
  Test.create(
    title: value,
    level: rand(1..3),
    author_id: user_ids.sample,
    category_id: categories.detect { |c| c.title == category_names[type] }&.id
  )
end

categories.each do |category|
  test_id = tests.detect { |t| t.category_id = category.id }.id
  type_key = category_names.detect { |_k, v| v == category.title }.first
  surveys[type_key].each do |survey|
    question = Question.create(
      body: survey[:question],
      test_id: test_id
    )
    survey[:answers].each do |answer|
      Answer.create(body: answer[:body], correct: !!answer[:correct], question_id: question.id)
    end
  end
end

# data = {
#   movie: {
#     category_title: 'Кино',
#     tests: [{
#               title: '',
#               level: rand(1..3),
#               author_id: rand(1..3),
#               category_id: nil,
#               questions: [{
#                             body: '',
#                             test_id: nil,
#                             answers: [{
#                                         body: '',
#                                         correct: false,
#                                         question_id: nil
#                                       }]
#                           }]
#             }]
#   }
# }
# data.values.each do |type|
#   category = Category.create(title: type[:category_title])
#   type[:tests].each do |tests_data|
#     test = Test.create(
#       title: tests_data[:title],
#       level: tests_data[:level],
#       category_id: category.id,
#       author_id: tests_data[:author_id]
#     )
#     tests_data[:questions].each do |question_data|
#       question = Question.create(
#         body: question_data[:body],
#         test_id: test.id
#       )
#       question_data[:answers].each do |answers_data|
#         Answer.create(
#           body: answers_data[:body],
#           correct: answers_data[:correct],
#           question_id: question.id
#         )
#       end
#     end
#   end
# end

