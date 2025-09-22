import { createBinding, createComputed } from "ags";
import AstalMpris from "gi://AstalMpris?version=0.1";
import { formatTime } from "../../utils/formatTrack";
import { limitString } from "../../utils/formatString";
// import AstalCava from "gi://AstalCava?version=0.1";

const mpris = AstalMpris.Mpris.get_default();
const playerctl = AstalMpris.Player.new("playerctld");

function Player() {
  const title = createBinding(playerctl, "title");
  const artist = createBinding(playerctl, "artist");
  const display = createComputed(
    [title, artist],
    (t, a) =>
      `<span size="85%" line_height="0.8">${
        t !== null && t.length > 0
          ? limitString(t.replaceAll("&", "&amp;"))
          : "Unknown Title"
      }</span>\n<span size="65%" line_height="0.8" weight="400">${
        a !== null && a.length > 0
          ? limitString(a.replaceAll("&", "&amp;"))
          : "Unknown Artist"
      }</span>`
  );

  const trackStatus = createBinding(playerctl, "playbackStatus");
  const statusIcon = trackStatus((s) => {
    if (s === AstalMpris.PlaybackStatus.PAUSED) return "";
    if (s === AstalMpris.PlaybackStatus.PLAYING) return "";
    if (s === AstalMpris.PlaybackStatus.STOPPED) return "";
    return "";
  });

  const trackPosition = createBinding(playerctl, "position");
  const trackLength = createBinding(playerctl, "length");
  const trackDuration = createComputed(
    [trackLength, trackPosition],
    (len, pos) =>
      `<span size="85%" line_height="0.8">${formatTime(
        pos
      )}</span>\n<span size="65%" line_height="0.8" weight="400">${formatTime(
        len
      )}</span>`
  );

  return (
    <box class="mpris">
      <label class="icon" label="󰎇" />
      <box visible={createComputed([title], (t) => !!t)}>
        <button
          class={title(() => (playerctl.canGoPrevious ? "" : "disable"))}
          onClicked={() => playerctl.previous()}
          visible={createComputed([title], (t) => !!t)}
        >
          <label class="icon" label="" />
        </button>
        <button
          onClicked={() => playerctl.play_pause()}
          visible={createComputed([title], (t) => !!t)}
        >
          <label class="icon" label={statusIcon} />
        </button>
        <button
          class={title(() => (playerctl.canGoNext ? "" : "disable"))}
          onClicked={() => playerctl.next()}
          visible={createComputed([title], (t) => !!t)}
        >
          <label class="icon" label="" />
        </button>
        <label class="duration" label={trackDuration} useMarkup />
      </box>
      <button
        class="content"
        onClicked={() => playerctl.raise()}
        visible={createComputed([title], (t) => !!t)}
      >
        <label
          label={display}
          maxWidthChars={30}
          tooltipText={createComputed([title, artist], (t, a) => `${t}\n${a}`)}
          useMarkup
        />
      </button>
    </box>
  );
}

export default Player;
