# describe "Player", ->
#   describe "with no items", ->
#     beforeEach ->
#       @player = new Player()

#     it "starts with album 0", ->
#       expect(@player.get("currentAlbumIndex")).toEqual 0

#     it "starts with track 0", ->
#       expect(@player.get("currentTrackIndex")).toEqual 0

#   describe "with added album", ->
#     beforeEach ->
#       @player = new Player()
#       @player.playlist.add albumData[0]

#     it "is in 'stop state", ->
#       expect(@player.get("state")).toEqual "stop"

#     it "is stopped", ->
#       expect(@player.isStopped()).toBeTruthy()

#     describe "while playing", ->
#       beforeEach ->
#         @player.play()

#       it "sets to 'play' state", ->
#         expect(@player.get("state")).toEqual "play"

#       it "is playing", ->
#         expect(@player.isPlaying()).toBeTruthy()

#       it "has a current album", ->
#         expect(@player.currentAlbum().get("title")).toEqual "Album A"

#       it "has a currentTrackUrl", ->
#         expect(@player.currentTrackUrl()).toEqual "/music/Album A Track A.mp3"

#       it "pauses", ->
#         @player.pause()
#         expect(@player.get("state")).toEqual "pause"

#       describe "next track", ->
#         beforeEach ->
#           # Add extra album to test 'next'
#           @player.playlist.add albumData[1]

#         it "increments within an album", ->
#           @player.nextTrack()
#           expect(@player.get("currentAlbumIndex")).toEqual 0
#           expect(@player.get("currentTrackIndex")).toEqual 1

#         it "goes to the next album", ->
#           @player.set currentTrackIndex: 1 # Last track
#           @player.nextTrack()
#           expect(@player.get("currentAlbumIndex")).toEqual 1
#           expect(@player.get("currentTrackIndex")).toEqual 0

#         it "wraps around to the first album if at end", ->
#           @player.set currentAlbumIndex: 1 # Last album
#           @player.set currentTrackIndex: 1 # Last track
#           @player.nextTrack()
#           expect(@player.get("currentAlbumIndex")).toEqual 0
#           expect(@player.get("currentTrackIndex")).toEqual 0

#       describe "previous track", ->
#         beforeEach ->
#           # Add extra album to test 'prev'
#           @player.playlist.add albumData[1]

#         it "goes to the previous track in an album", ->
#           @player.set currentTrackIndex: 1
#           @player.prevTrack()
#           expect(@player.get("currentAlbumIndex")).toEqual 0
#           expect(@player.get("currentTrackIndex")).toEqual 0

#         it "goes to the last track of previous album", ->
#           @player.set currentAlbumIndex: 1
#           @player.set currentTrackIndex: 0
#           @player.prevTrack()
#           expect(@player.get("currentAlbumIndex")).toEqual 0
#           expect(@player.get("currentTrackIndex")).toEqual 1

#         it "wraps around if at the very beginning", ->
#           @player.set currentAlbumIndex: 0
#           @player.set currentTrackIndex: 0
#           @player.prevTrack()
#           expect(@player.get("currentAlbumIndex")).toEqual 1
#           expect(@player.get("currentTrackIndex")).toEqual 1