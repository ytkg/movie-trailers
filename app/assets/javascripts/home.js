// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var tag = document.createElement('script');
tag.src = 'https://www.youtube.com/iframe_api';
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

var video_index = 0;
var ytPlayer;
function onYouTubeIframeAPIReady() {
  ytPlayer = new YT.Player(
    'tailers_player',
    {
      videoId: video_ids[video_index],
      playerVars: {
        autoplay: 1,
        controls: 0,
        showinfo: 0,
        modestbranding: 1,
        iv_load_policy: 3,
        rel: 0
      },
      events: {
        'onStateChange': onPlayerStateChange,
        'onError': changeVideo
      }
    }
  );
}

function onPlayerStateChange(event) {
  var ytStatus = event.data;
  if (ytStatus == YT.PlayerState.ENDED) {
    changeVideo();
  } else if (ytStatus == YT.PlayerState.PLAYING) {
    document.getElementsByClassName('play_button')[0].style.display = 'none';
  }
}

function changeVideo() {
  video_index++;
  if (video_index >= video_ids.length) {
    video_index = 0;
  }
  var video_id = video_ids[video_index];
  ytPlayer.loadVideoById(video_id)
}
