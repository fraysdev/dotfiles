import AstalWp from "gi://AstalWp?version=0.1";
import { createBinding, createComputed } from "ags";
import Progress from "../../widgets/progress";

const wp = AstalWp.get_default();
const speaker = wp.audio.defaultSpeaker;

function Speaker() {
  const volume = createBinding(speaker, "volume");
  const isMuted = createBinding(speaker, "mute");

  const toggleMute = () => (speaker.mute = !speaker.mute);

  return (
    <button class="progress" onClicked={toggleMute}>
      <Progress
        value={volume}
        icon={createComputed([isMuted], (isMuted) => (isMuted ? "󰖁" : "󰕾"))}
        display={createComputed(
          [volume],
          (volume) => `${Math.round(volume * 100)}`
        )}
      />
    </button>
  );
}

export default Speaker;
