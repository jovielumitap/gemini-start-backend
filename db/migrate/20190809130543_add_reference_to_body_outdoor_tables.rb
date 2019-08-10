class AddReferenceToBodyOutdoorTables < ActiveRecord::Migration[5.1]
  def change
    add_reference :bodies, :building, {index: true, foreign_key: true}
    add_reference :outdoors, :body, {index: true, foreign_key: true}
  end
end
