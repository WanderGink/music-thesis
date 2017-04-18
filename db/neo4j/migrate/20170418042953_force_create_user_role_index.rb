class ForceCreateUserRoleIndex < Neo4j::Migrations::Base
  def up
    add_index :User, :role, force: true
  end

  def down
    drop_index :User, :role
  end
end
