json.extract! food, :id, :name, :protein, :lipid, :carbohydrate, :food_group_id, :created_at, :updated_at
json.url food_url(food, format: :json)
