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

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data # For forms. For retaining the cached file acroos form redisplays
Shrine.plugin :restore_cached_data # re-extract metadata when attaching a cached file
Shrine.plugin :remove_invalid # remove and delete files that are invalid
