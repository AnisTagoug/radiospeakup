live = input.http("http://localhost:8000/live") # écoute source live

playlist = playlist("/home/icecast/playlist.txt")

radio = fallback(track_sensitive=false, [live, playlist, blank()])

output.icecast(
  %mp3,
  host="localhost",
  port=8000,
  password="speakup",
  mount="/auto",
  name="Radio AutoDJ + Live",
  genre="Mix",
  description="Radio avec live et autodj",
  radio
)
