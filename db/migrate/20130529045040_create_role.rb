class CreateRole < ActiveRecord::Migration
  def migrate(direction)
    super
    # Create a default role
    if direction == :up
      Role.create(name: "admin")
      Role.create(name: "moderator")
      Role.create(name: "normal_user")
    end
  end

  def change
    create_table :roles do |t|
      t.string :name
      t.timestamps
    end
  end
end