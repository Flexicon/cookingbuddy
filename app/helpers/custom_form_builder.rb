# frozen_string_literal: true

class CustomFormBuilder < ActionView::Helpers::FormBuilder
  def collection_select(method, collection, value_method, text_method, options = {}, html_options = {})
    if method.to_s.end_with?("_id")
      association = method.to_s.sub(/_id$/, "").to_sym
      has_error = @object.errors[method].any? || @object.errors[association].any?

      html_options[:class] = Array(html_options[:class])
      html_options[:class] << "field_with_errors" if has_error
    end

    super
  end
end
