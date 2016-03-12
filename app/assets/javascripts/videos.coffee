Video =
  playButtonSelector: '#play-master-video'
  pauseButtonSelector: '#pause-master-video'
  startClipButtonSelector: '#start-clip-master-video'
  playing: false
  player: null
  startTime: 0
  pauseTime: 0
  duration: 0
  videoReadyInterval: null

  init: ->
    console.log "Initialize the video"
    @player = $('#master_video')[0]
    @pollForVideoReady()

    @setupVideoHandler()
    @registerButtonHandlers()
    @listenForEvents()
    return

  setupVideoHandler: ->
    # videojs("master_video").ready ->
    #   console.log "The video is ready"
    #   myPlayer = @

  registerButtonHandlers: ->
    $(@playButtonSelector).click =>
      console.log "Play"
      @play()

    $(@pauseButtonSelector).click =>
      console.log "Pause"
      @pause()

    $(@startClipButtonSelector).click =>
      console.log "Clip"
      if @playing
        @pause()
      else
        @play()

  listenForEvents: ->
    _this = @

    $(@player).on 'play', ->
      _this.playing = true
      _this.startTime = @currentTime
      console.log "Video is playing #{_this.startTime}"

    $(@player).on 'pause', ->
      _this.playing = false
      _this.pauseTime = @currentTime
      console.log "Video is paused #{_this.pauseTime}"

  play: ->
    console.log "Play Video"
    @player.play()

  pause: ->
    console.log "Pause Video"
    @player.pause()

  pollForVideoReady: ->
    @videoReadyInterval = window.setInterval ( =>
      if _this.player.readyState > 0
        @duration = Math.round(@player.duration)
        console.log "Video Ready #{@duration}"
        @stopPollingForVideoReady()
    ), 500

  stopPollingForVideoReady: ->
    clearInterval(@videoReadyInterval)

$(document).on "page:change", ->
  Video.init()
  $(".clickable-row").click ->
    console.log "Click"
    window.document.location = $(this).data("href")

