# frozen_string_literal: true

class FormErrorsComponent < ViewComponent::Base
  def initialize(model:, title: nil)
    @model = model
    @title = title
  end

  private

  attr_reader :model, :title

  def errors?
    @model.errors.any?
  end

  def model_name
    @model.model_name.human
  end

  def error_messages
    @model.errors.full_messages
  end
end
