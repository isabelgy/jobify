json.questions do
  json.array! @questions do |question|
    json.extract! question, :id, :title, :first_trait, :second_trait, :first_value, :second_value
  end
end
