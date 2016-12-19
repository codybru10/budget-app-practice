class CreateLocationTable < ActiveRecord::Migration[5.0]
  def change
    create_table(:locations) do |l|
      l.column(:name, :string)
      l.column(:date, :timestamp)

      l.timestamps()
    end
  end
end
