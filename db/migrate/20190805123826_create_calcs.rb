class CreateCalcs < ActiveRecord::Migration[5.2]
  def change
    create_table :calcs do |t|
      t.integer :initial_deposit
      t.integer :number_of_years
      t.integer :profitability_per_year
      t.integer :monthly_report
      t.integer :risk_level

      t.timestamps
    end
  end
end
