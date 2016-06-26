class AddHashToComments < ActiveRecord::Migration
  def change
    add_column :comments, :hash, :string
  end
end
