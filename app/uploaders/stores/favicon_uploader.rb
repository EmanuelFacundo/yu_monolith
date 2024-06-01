# frozen_string_literal: true

module Stores
  class FaviconUploader < Shrine
    plugin :validation_helpers
    plugin :derivatives
    plugin :determine_mime_type, analyzer: :marcel
    plugin :store_dimensions
    plugin :remove_attachment

    Attacher.validate do
      validate_mime_type %w[image/png image/ico]
      validate_extension %w[png ico]
      validate_max_size 1 * 1024 * 1024 # 1 MB
      if validate_mime_type %w[image/png image/ico]
        validate_max_width 192
        validate_min_width 32
        validate_max_height 192
        validate_min_height 32
      end
    end

    Attacher.derivatives do |original|
      image_vip = ImageProcessing::Vips.source(original)

      {
        iphone: image_vip.resize_to_limit!(180, 180),
        ipad: image_vip.resize_to_limit!(152, 152),
        web: image_vip.resize_to_limit!(32, 32),
        android: image_vip.resize_to_limit!(192, 192)
      }
    end
  end
end
