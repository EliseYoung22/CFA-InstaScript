require "administrate/base_dashboard"

class MedicationDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    sales: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    manufacturer: Field::String,
    description: Field::Text,
    price: Field::Number,
    availability: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    image_file_name: Field::String,
    image_content_type: Field::String,
    image_file_size: Field::Number,
    image_updated_at: Field::DateTime,
    resource_file_name: Field::String,
    resource_content_type: Field::String,
    resource_file_size: Field::Number,
    resource_updated_at: Field::DateTime,
    slug: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :sales,
    :id,
    :name,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :sales,
    :id,
    :name,
    :manufacturer,
    :description,
    :price,
    :availability,
    :created_at,
    :updated_at,
    :image_file_name,
    :image_content_type,
    :image_file_size,
    :image_updated_at,
    :resource_file_name,
    :resource_content_type,
    :resource_file_size,
    :resource_updated_at,
    :slug,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :sales,
    :name,
    :manufacturer,
    :description,
    :price,
    :availability,
    :image_file_name,
    :image_content_type,
    :image_file_size,
    :image_updated_at,
    :resource_file_name,
    :resource_content_type,
    :resource_file_size,
    :resource_updated_at,
    :slug,
  ].freeze

  # Overwrite this method to customize how medications are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(medication)
  #   "Medication ##{medication.id}"
  # end
end
