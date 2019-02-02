// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var tag = document.createElement('script');
tag.src = 'https://www.youtube.com/iframe_api';
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

var ytPlayer;
function onYouTubeIframeAPIReady() {
  ytPlayer = new YT.Player(
    'tailers_player',
    {
      videoId: video_ids[0],
      playerVars: {
        autoplay: 1,
        controls: 0,
        showinfo: 0,
        modestbranding: 1,
        iv_load_policy: 3,
        rel: 0
      },
      events: {
        'onStateChange': onPlayerStateChange
      }
    }
  );
}

function onPlayerStateChange(event) {
  var ytStatus = event.data;
  if (ytStatus == YT.PlayerState.ENDED) {
    var video_id = video_ids[Math.floor(Math.random() * video_ids.length)]
    ytPlayer.loadVideoById(video_id)
  }
}
