namespace :import do

  task units: :environment do
    filename = 'public/or_inventory.csv' # TAB delimited file, each row ending with Control-M
    records = SmarterCSV.process(filename, {:col_sep => ","})  # no block given
    records.each do |item|
      if item[:on_hand].present?
        item[:on_hand].times do
          InventoryItem.find_by(name: item[:name]).inventory_item_units.create(checked_in: Date.today)
        end
      end
    end
  end

end
