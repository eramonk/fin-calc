class Calc < ApplicationRecord

    validates :initial_deposit, numericality: { only_integer: true }
    validates :number_of_years, numericality: { only_integer: true }
    validates :profitability_per_year, numericality: { only_integer: true }
    validates :monthly_report, numericality: { only_integer: true }
    validates :risk_level, numericality: { only_integer: true }

end
