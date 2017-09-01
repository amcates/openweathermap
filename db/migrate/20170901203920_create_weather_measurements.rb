class CreateWeatherMeasurements < ActiveRecord::Migration[5.1]
  def change
    create_table :weather_measurements do |t|
      t.string :zip_code
      t.string :conditions
      t.float :pressure
      t.float :temp
      t.float :wind_speed
      t.float :wind_degrees
      t.float :humidity
      t.string :data_collected_at

      t.timestamps
    end
  end
end
