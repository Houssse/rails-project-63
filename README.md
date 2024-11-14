
### Hexlet tests and linter status:

![Test Status](https://github.com/Houssse/rails-project-63/actions/workflows/test.yml/badge.svg?branch=main&event=push)

![Linter Status](https://github.com/Houssse/rails-project-63/actions/workflows/lint.yml/badge.svg?branch=main&event=push)

[![Actions Status](https://github.com/Houssse/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/Houssse/rails-project-63/actions)

# HexletCode

HexletCode — это библиотека для генерации HTML-форм. Она позволяет легко создавать формы с кастомизацией различных полей, таких как текстовые поля, текстовые области, а также проверку на наличие соответствующих атрибутов в переданных объектах.

## Installation

Чтобы установить гем, выполните следующую команду:

    $ gem install hexlet_code

Или добавьте его в ваш Gemfile:

    gem 'hexlet_code'

Затем выполните команду:

    $ bundle install

## Usage

### Пример использования

Для создания формы, основанной на объекте `User`, с полями имени и работы:

```ruby
# Создаем объект пользователя
user = User.new(name: 'rob', job: 'hexlet', gender: 'm')

# Генерация формы
HexletCode.form_for user do |f|
  f.input :name           # Поле для ввода имени
  f.input :job, as: :text # Поле для ввода работы с типом textarea
end
```

Результатом будет следующая форма:

```html
<form action="#" method="post">
  <input name="name" type="text" value="rob">
  <textarea name="job" cols="20" rows="40">hexlet</textarea>
</form>
```

Для добавления кастомных атрибутов, например, CSS-классов:

```ruby
# Генерация формы с кастомными аттрибутами
HexletCode.form_for user, url: '#' do |f|
  f.input :name, class: 'user-input' # Поле с CSS классом
  f.input :job                       # Поле работы
end
```

Результат:

```html
<form action="#" method="post">
  <input name="name" type="text" value="rob" class="user-input">
  <input name="job" type="text" value="hexlet">
</form>
```

Для указания дефолтных значений для текстовых полей можно использовать опции:

```ruby
# Поле для работы с большими размерами
HexletCode.form_for user do |f|
  f.input :job, as: :text, rows: 50, cols: 50
end
```

Результат:

```html
<form action="#" method="post">
  <textarea name="job" cols="50" rows="50">hexlet</textarea>
</form>
```

## Development

После клонирования репозитория, выполните:

    $ bin/setup

Для запуска тестов:

    $ rake test

Для установки гема на вашу локальную машину, используйте:

    $ bundle exec rake install

Чтобы выпустить новую версию, обновите номер версии в `version.rb`, затем выполните:

    $ bundle exec rake release

## License

Гем доступен под лицензией [MIT License](https://opensource.org/licenses/MIT).
