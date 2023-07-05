[Attempt, Answer, Question, Test, Category, User].each(&:delete_all)
user_ids = %w[Иван Борис Мишаня].collect { |user| User.create(name: user).id }

lord_questions = [{
                    body: 'Кто не был в братстве кольца',
                    answers: [{ body: 'Пиппин' }, { body: 'Леголас' }, { body: 'Элронд', correct: true }, { body: 'Боромир' }]
                  }, {
                    body: 'Почему Фродо не отправили на орле в самом начале',
                    answers: [{ body: 'На одной книге бы закончили', correct: true }, { body: 'хз' }, { body: 'Не подумали' }]
                  }, {
                    body: 'Сколько Арагорну лет во время действия ВК',
                    answers: [{ body: '30-40' }, { body: '80-90', correct: true }, { body: '120-130' }]
                  }]
potter_questions = [{
                      body: 'Где бабушки\дедушки Поттера?',
                      answers: [
                        { body: 'Погибли до времени действия сюжета', correct: true },
                        { body: 'Косяк сюжета' },
                        { body: 'Отсутствуют ввиду непорочного зачания' }]
                    }, {
                      body: 'Откуда у родителей Поттера столько денег',
                      answers: [{ body: 'Заработали' }, { body: 'Украли' }, { body: 'Наследство', correct: true }]
                    }]
metallica_questions = [{
                         body: 'Какой из альбомов Metallica состоит из каверов',
                         answers: [
                           { body: 'St. Anger' },
                           { body: 'Garage Inc.', correct: true },
                           { body: 'Death Magnetic' },
                           { body: 'Load' }
                         ]
                       }]
data = {
  movie: {
    category_title: 'Кино',
    tests: [{
              title: 'Властелин Колец',
              level: rand(1..3),
              author_id: user_ids.sample,
              questions: lord_questions
            }, {
              title: 'Гарри Поттер',
              level: rand(1..3),
              author_id: user_ids.sample,
              questions: potter_questions
            }]
  },
  music: {
    category_title: 'Музыка',
    tests: [{
              title: 'Metallica',
              level: rand(1..3),
              author_id: user_ids.sample,
              questions: metallica_questions
            }]
  }
}
data.values.each do |type|
  category = Category.create(title: type[:category_title])
  type[:tests].each do |tests_data|
    test = Test.create(
      title: tests_data[:title],
      level: tests_data[:level],
      category_id: category.id,
      author_id: tests_data[:author_id]
    )
    tests_data[:questions].each do |question_data|
      question = Question.create(body: question_data[:body], test_id: test.id)
      question_data[:answers].each do |answers_data|
        Answer.create(body: answers_data[:body], correct: !!answers_data[:correct], question_id: question.id)
      end
    end
  end
end

users = User.all
tests = Test.all
10.times do
  start_timestamp = DateTime.now - rand(0..10).hours
  Attempt.create(
    user_id: users.sample.id,
    test_id: tests.sample.id,
    started_at: start_timestamp,
    completed_at: start_timestamp + 2.hours
  )
end
