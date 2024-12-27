class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def attrs_without_timestamps
    attributes.reject { |key, value| key.in? %w(created_at updated_at) }
  end

  def wrapped_attributes
    { "#{model_name.param_key}": attributes }.as_json
  end
end
