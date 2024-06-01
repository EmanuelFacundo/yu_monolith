# frozen_string_literal: true

require 'shrine'
require 'shrine/storage/file_system'
require 'image_processing/vips'

if Rails.env.development?
  Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'), # temporary
    store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/store') # permanent
  }
elsif Rails.env.test?
  require 'shrine/storage/memory'

  Shrine.storages = {
    cache: Shrine::Storage::Memory.new,
    store: Shrine::Storage::Memory.new
  }
end
Shrine.plugin :derivatives
Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data # For forms. For retaining the cached file acroos form redisplays
Shrine.plugin :restore_cached_data # re-extract metadata when attaching a cached file
Shrine.plugin :remove_invalid # remove and delete files that are invalid
Shrine.plugin :validation_helpers, default_messages: {
  max_size: ->(max)  { I18n.t('errors.file.max_size', max: "#{max / 1024 / 1024}MB") },
  min_size: ->(min)  { I18n.t('errors.file.min_size', min: "#{min / 1024 / 1024}MB") },
  max_width: ->(max)  { I18n.t('errors.file.max_width', max: "#{max / 1024 / 1024}MB") },
  min_width: ->(min)  { I18n.t('errors.file.min_width', min: "#{min / 1024 / 1024}MB") },
  max_height: ->(max)  { I18n.t('errors.file.max_height', max: "#{max / 1024 / 1024}MB") },
  min_height: ->(min)  { I18n.t('errors.file.min_height', min: "#{min / 1024 / 1024}MB") },
  max_dimensions: ->(dims) { I18n.t('errors.file.max_dimensions', dims: dims.join(', ')) },
  min_dimensions: ->(dims) { I18n.t('errors.file.min_dimensions', dims: dims.join(', ')) },
  mime_type_inclusion: ->(list) { I18n.t('errors.file.mime_type_inclusion', list: list.join(', ')) },
  mime_type_exclusion: ->(list) { I18n.t('errors.file.mime_type_exclusion', list: list.join(', ')) },
  extension_inclusion: ->(list) { I18n.t('errors.file.extension_inclusion', list: list.join(', ')) },
  extension_exclusion: ->(list) { I18n.t('errors.file.extension_exclusion', list: list.join(', ')) }
}
