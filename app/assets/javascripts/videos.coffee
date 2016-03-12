Video =
  init: ->
    console.log "Initialze the video"
    @setupVideoHandler()

  setupVideoHandler: ->
    # videojs("master_video").ready ->
    #   console.log "The video is ready"
    #   myPlayer = @

$(document).on "page:change", ->
  Video.init()
  $(".clickable-row").click ->
    console.log "Click"
    window.document.location = $(this).data("href")

