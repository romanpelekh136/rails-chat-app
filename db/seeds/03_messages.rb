puts "Seeding Messages..."

max  = User.find_by!(email: "admin@example.com")
alex = User.find_by!(email: "alex@example.com")
maya = User.find_by!(email: "maya@example.com")
leo  = User.find_by!(email: "leo@example.com")
kate = User.find_by!(email: "kate@example.com")

conversations = {
  "General Hangout" => [
    { user: maya, body: "hey, is anyone still on campus or did everyone go home already?" },
    { user: max,  body: "still near the library, was just about to grab a coffee" },
    { user: leo,  body: "wait for me! my lecture literally just ended" },
    { user: max,  body: "cool, let's meet at the place around the corner in 10 mins" },
    { user: kate, body: "save a seat for me too, i'm 5 minutes away" },
    { user: maya, body: "on my way!" }
  ],
  "Board Games Night" => [
    { user: alex, body: "are we still on for Friday evening?" },
    { user: max,  body: "yep, 7pm at my place works" },
    { user: kate, body: "nice, should i bring Catan or something shorter?" },
    { user: leo,  body: "please anything except Catan, alex still holds a grudge from last week haha" },
    { user: alex, body: "hey, blocking my longest road was personal and you know it" },
    { user: max,  body: "haha bring Carcassonne and Ticket to Ride, we can play both" },
    { user: kate, body: "deal, i'll grab some snacks on the way too" }
  ],
  "Late Night Gaming" => [
    { user: leo,  body: "anyone around for a couple of matches tonight?" },
    { user: max,  body: "i can hop on around 9:30 after i finish this assignment" },
    { user: alex, body: "count me in, we need a full lobby" },
    { user: leo,  body: "sweet, ping me in voice when you're ready" }
  ],
  "Music & Gigs" => [
    { user: max,  body: "just spent an hour dialing in a clean guitar tone instead of studying" },
    { user: maya, body: "productive evening tbh. what song are you learning?" },
    { user: max,  body: "Coffee & TV by Blur, the rhythm part is super fun to play" },
    { user: alex, body: "classic track. 90s britpop guitar parts are undefeated" }
  ],
  "Film & Cameras" => [
    { user: maya, body: "finally got my latest roll of 35mm film developed today" },
    { user: kate, body: "how did the shots turn out?" },
    { user: maya, body: "surprisingly sharp! only two frames were slightly overexposed" },
    { user: max,  body: "drop the scans later, want to see how the colors came out" }
  ]
}

conversations.each do |room_name, messages|
  room = Room.find_by(name: room_name)
  next unless room

  next if room.messages.exists?

  messages.each_with_index do |msg_attrs, index|
    Message.create!(
      room: room,
      user: msg_attrs[:user],
      body: msg_attrs[:body],
      created_at: (messages.size - index).minutes.ago
    )
  end
end

puts "Seeded #{Message.count} Messages."
