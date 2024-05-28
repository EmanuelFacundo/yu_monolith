# frozen_string_literal: true

module Stores
  class FaviconUploader < Shrine
    plugin :validation_helpers
    plugin :derivatives
    plugin :determine_mime_type, analyzer: :marcel
    plugin :store_dimensions

    Attacher.validate do
      validate_mime_type %w[image/png image/ico]
      validate_extension %w[png ico]
      validate_max_size 1 * 1024 * 1024 # 1 MB
      validate_width 32..192
      validate_height 32..192
      errors << 'width and height must be equal' if width != height
    end

    Attacher.derivatives do |original|
      vip = ImageProcessing::Vips.source(original)

      {
        iphone: vip.resize_to_limit!(180, 180).convert('ico'),
        ipad: vip.resize_to_limit!(152, 152).convert('ico'),
        web: vip.resize_to_limit!(32, 32).convert('ico'),
        android: vip.resize_to_limit!(192, 192).convert('ico')
      }
    end
  end
end
