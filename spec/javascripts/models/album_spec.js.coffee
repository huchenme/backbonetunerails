describe "Album", ->
  beforeEach ->
    @album = new Backbonetunerails.Models.Album(albumData[0])

  it "creates from data", ->
    expect(@album.get("tracks").length).toEqual 2

  it "indentifies correct first track", ->
    expect(@album.isFirstTrack(0)).toBeTruthy()

  it "indentifies the last track", ->
    expect(@album.isLastTrack(1)).toBeTruthy()

  it "returns the URL for a track", ->
    expect(@album.trackUrlAtIndex(0)).toEqual "/music/Album A Track A.mp3"