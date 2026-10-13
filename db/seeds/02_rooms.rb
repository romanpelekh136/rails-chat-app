puts "Seeding Rooms..."

max  = User.find_by!(email: "admin@example.com")
alex = User.find_by!(email: "alex@example.com")
maya = User.find_by!(email: "maya@example.com")
leo  = User.find_by!(email: "leo@example.com")

rooms_data = [
  { name: "Film & Cameras",    creator: maya },
  { name: "Music & Gigs",      creator: max },
  { name: "Late Night Gaming", creator: leo },
  { name: "Board Games Night", creator: alex },
  { name: "General Hangout",   creator: max }
]

rooms_data.each do |room_attrs|
  Room.find_or_create_by!(name: room_attrs[:name]) do |r|
    r.user = room_attrs[:creator]
  end
end

puts "Seeded #{Room.count} Rooms."
