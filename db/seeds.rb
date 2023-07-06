# frozen_string_literal: true

[Attempt, Answer, Question, Test, Category, User].each(&:delete_all)
user_ids = %w[Иван Борис Мишаня].collect { |user| User.create!(name: user).id }
%w[Кино Музыка].each_with_index.collect do |category, index|
  Category.create!(id: index + 1, title: category)
end

tests = [{
  id: 1,
  category_id: 1,
  title: 'Властелин Колец',
  level: rand(1..3),
  author_id: user_ids.sample
}, {
  id: 2,
  category_id: 1,
  title: 'Гарри Поттер',
  level: rand(1..3),
  author_id: user_ids.sample
}, {
  id: 3,
  category_id: 2,
  title: 'Metallica',
  level: rand(1..3),
  author_id: user_ids.sample
}]

questions = [{
  id: 1,
  test_id: 1,
  body: 'Кто не был в братстве кольца',
}, {
  id: 2,
  test_id: 1,
  body: 'Почему Фродо не отправили на орле в самом начале',
}, {
  id: 3,
  test_id: 1,
  body: 'Сколько Арагорну лет во время действия ВК',
}, {
  id: 4,
  test_id: 2,
  body: 'Где бабушки\дедушки Поттера?',
}, {
  id: 5,
  test_id: 2,
  body: 'Откуда у родителей Поттера столько денег',
}, {
  id: 6,
  test_id: 3,
  body: 'Какой из альбомов Metallica состоит из каверов',
}]
answers_data = [
  {
    question_id: 1,
    answers: [{ body: 'Пиппин' }, { body: 'Леголас' }, { body: 'Элронд', correct: true }, { body: 'Боромир' }]
  }, {
    question_id: 2,
    answers: [{ body: 'На одной книге бы закончили', correct: true }, { body: 'хз' }, { body: 'Не подумали' }]
  }, {
    question_id: 3,
    answers: [{ body: '30-40' }, { body: '80-90', correct: true }, { body: '120-130' }]
  }, {
    question_id: 4,
    answers: [
      { body: 'Погибли до времени действия сюжета', correct: true },
      { body: 'Косяк сюжета' }, { body: 'Отсутствуют ввиду непорочного зачания' }
    ]
  }, {
    question_id: 5,
    answers: [{ body: 'Заработали' }, { body: 'Украли' }, { body: 'Наследство', correct: true }]
  }, {
    question_id: 6,
    answers: [
      { body: 'St. Anger' }, { body: 'Garage Inc.', correct: true }, { body: 'Death Magnetic' }, { body: 'Load' }
    ]
  }
]

tests.each do |test|
  Test.create!(
    id: test[:id],
    title: test[:title],
    level: test[:level],
    author_id: test[:author_id],
    category_id: test[:category_id]
  )
end

questions.each do |question|
  Question.create!(
    id: question[:id],
    body: question[:body],
    test_id: question[:test_id]
  )
end

answers_data.each do |answer_data|
  answer_data[:answers].each do |answer|
    Answer.create!(
      body: answer[:body],
      correct: !answer[:correct].nil?,
      question_id: answer_data[:question_id]
    )
  end
end

users = User.all
tests = Test.all
10.times do
  Attempt.create!(
    user_id: users.sample.id,
    test_id: tests.sample.id,
    created_at: DateTime.now - rand(0..10).hours,
  )
end
