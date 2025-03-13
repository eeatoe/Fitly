=begin
ResultService — это класс, предназначенный для инкапсуляции результатов выполнения бизнес-логики в сервисах.
Он центролизует обработку результатов и дает единый интерфейс для обработки результатов в контроллерах.

Класс предоставляет:
 -> `success?` — метод для проверки успешности выполнения операции.
 -> `failure?` — метод для проверки, если операция не удалась.
 -> `self.success(data = nil)` — удобный метод для создания успешного результата с передаваемыми данными.
 -> `self.failure(errors)` — метод для создания объекта с ошибками, если операция не удалась.
=end

class ResultService
  attr_reader :success, :data, :errors

  def initialize(success:, data: nil, errors: [])
    @success = success
    @data = data
    @errors = errors
  end

  def success?
    success
  end

  def failure?
    !success
  end

  def self.success(data = nil)
    new(success: true, data: data)
  end

  def self.failure(errors = [])
    new(success: false, errors: errors)
  end
end