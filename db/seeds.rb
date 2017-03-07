require 'csv'

csv_text = File.read(Rails.root.join("lib", "seeds", "seed_markets_FULL.csv"))
csv = CSV.parse(csv_text, headers: :first_row, col_sep: ';')
csv.each do |row|
t = Market.new
  t.address = row['address']
  t.weekday = row['weekday']
  t.inscription = row['inscription']
  t.name = row['name']
  t.save
end
