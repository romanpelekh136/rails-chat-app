puts "Seeding Users..."

# Log in with admin@example.com / password123 to take screenshots
admin = User.find_or_create_by!(email: "admin@example.com") do |u|
  u.username = "max"
  u.password = "password123"
  u.role = :admin
end
admin.update!(username: "max", role: :admin)

friends = [
  { username: "alex",  email: "alex@example.com" },
  { username: "maya",  email: "maya@example.com" },
  { username: "leo",   email: "leo@example.com" },
  { username: "kate",  email: "kate@example.com" }
]

friends.each do |attrs|
  User.find_or_create_by!(email: attrs[:email]) do |u|
    u.username = attrs[:username]
    u.password = "password123"
    u.role = :user
  end
end

puts "Seeded #{User.count} Users."
