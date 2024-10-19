class Food < ApplicationRecord
  belongs_to :food_group

  validates :name, presence: true
  validates :protein, :lipid, :carbohydrate, numericality: { greater_than_or_equal_to: 0 }

  # Método para calcular calorias com base na quantidade passada
  def calculate_calories(quantity)
    protein_calories = protein ? protein * 4 : 0
    lipid_calories = lipid ? lipid * 9 : 0
    carbohydrate_calories = carbohydrate ? carbohydrate * 4 : 0
    total_calories_per_100g = protein_calories + lipid_calories + carbohydrate_calories
    
    total_calories_per_100g.positive? ? (total_calories_per_100g / 100.0) * quantity : 0
  end
end
