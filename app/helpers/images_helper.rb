# frozen_string_literal: true

module ImagesHelper
  def self.placeholder_image_url(key:, width: 120, height: 120)
    "https://picsum.photos/seed/#{key}/#{width}/#{height}"
  end
end
