import AstalWp from "gi://AstalWp?version=0.1";
import { createBinding, createComputed } from "ags";
import Progress from "../../widgets/progress";

const wp = AstalWp.get_default();
const microphone = wp.audio.defaultMicrophone;

function Microphone() {
  const volume = createBinding(microphone, "volume");
  const isMuted = createBinding(microphone, "mute");

  const volumeInt = createComputed([volume], (v) => Math.round(v * 100));
  const toggleMute = () => (microphone.mute = !microphone.mute);

  return (
    <button onClicked={toggleMute}>
      <Progress
        value={createComputed([volume], (v) => Math.round(v * 100))}
        maxValue={100}
        icon={createComputed([isMuted], (isMuted) => (isMuted ? "󰍭" : "󰍬"))}
        display={createComputed(
          [volume],
          (volume) => `${Math.round(volume * 100)}`
        )}
      />
    </button>
  );
}

export default Microphone;
