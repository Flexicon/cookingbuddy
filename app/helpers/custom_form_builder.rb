# frozen_string_literal: true

class CustomFormBuilder < ActionView::Helpers::FormBuilder
  # Overrides `collection_select` to apply the standard Rails error class (`field_with_errors`)
  # when the associated object has validation errors.
  #
  # This is useful for `_id` fields (e.g. `product_id`) where validation is defined on the
  # association itself (e.g. `validates :product, presence: true`), ensuring the select
  # field is styled appropriately when errors exist on the association.
  def collection_select(method, collection, value_method, text_method, options = {}, html_options = {}) # rubocop:disable Metrics/ParameterLists
    if method.to_s.end_with?("_id")
      association = method.to_s.sub(/_id$/, "").to_sym
      has_error = @object.errors[method].any? || @object.errors[association].any?

      html_options[:class] = Array(html_options[:class])
      html_options[:class] << "field_with_errors" if has_error
    end

    super
  end
end
