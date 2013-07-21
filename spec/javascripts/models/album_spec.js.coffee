describe "Backbonetunerails.Models.Album", ->
  it "should be defined", ->
    expect(Backbonetunerails.Models.Album).toBeDefined()

  it "can be instantiated", ->
    album = new Backbonetunerails.Models.Album()
    expect(album).not.toBeNull()

# describe "Album", ->
#   beforeEach ->
#     @album = new AlbumModel(albumData[0])

#   it "creates from data", ->
#     expect(@album.get("tracks").length).toEqual 2

#   describe "first track", ->
#     it "indentifies correct first track", ->
#       expect(@album.isFirstTrack(0)).toBeTruthy()

#   describe "last track", ->
#     it "indentifies the last track", ->
#       expect(@album.isLastTrack(1)).toBeTruthy()

#   it "returns the URL for a track", ->
#     expect(@album.trackUrlAtIndex(0)).toEqual "/music/Album A Track A.mp3"