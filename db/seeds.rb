# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Tenant.count < 1
  
  t = TenantFactory.new({name: 'Oranization'}).create

  if Sequence.count < 1
    a = '0123456789ABCDEFGHJKLMNPQRSTUVWXYZ'
    s = Sequence.create([
                         {prefix: 'A', descriptor: 'Assembly', tenant: t, width: 3, delimiter: '-', alphabet: a},
                         {prefix: 'B', descriptor: 'Part', tenant: t, width: 3, delimiter: '-', alphabet: a},
                         {prefix: 'C', descriptor: 'Cable Assembly', tenant: t, width: 3, delimiter: '-', alphabet: a},
                        ])
  end
end

if User.count < 1
  u = User.create([
                   {email: 'user@org', password: 'password1', tenant: Tenant.first}
                  ])
end



