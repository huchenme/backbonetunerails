describe "Playlist", ->
  beforeEach ->
    @playlist = new Backbonetunerails.Collections.Playlist()
    @playlist.add albumData[0]

  it "identifies first album as first", ->
    expect(@playlist.isFirstAlbum(0)).toBeTruthy()

  it "rejects non-first album as first", ->
    expect(@playlist.isFirstAlbum(1)).toBeFalsy()

  it "identifies last album as last", ->
    @playlist.add albumData[1]
    expect(@playlist.isLastAlbum(1)).toBeTruthy()

  it "rejects non-last album as last", ->
    @playlist.add albumData[1]
    expect(@playlist.isLastAlbum(0)).toBeFalsy()