import { createComputed, createState, With } from "ags";
import { readFile } from "ags/file";
import { interval } from "ags/time";

// const CAPSLOCK_ICON = ["󰯫", "󰬈"];
// const SCROLLLOCK_ICON = ["󰜰", "󰛀"];
// const NUMLOCK_ICON = ["󰎣", "󰎡"];

function LockKeys() {
  const [keylock, setKeylock] = createState({
    capsLock: false,
    scrollLock: false,
    numLock: false,
  });

  interval(100, () => {
    setKeylock({
      capsLock: !!parseInt(
        readFile("/sys/class/leds/input3::capslock/brightness")
      ),
      scrollLock: !!parseInt(
        readFile("/sys/class/leds/input3::scrolllock/brightness")
      ),
      numLock: !!parseInt(
        readFile("/sys/class/leds/input3::numlock/brightness")
      ),
    });
  });

  return (
    <box class="keylock">
      <label
        label="󰯫"
        class={createComputed([keylock], (k) => (k.capsLock ? "on" : "off"))}
      />
      <label
        label="󰜰"
        class={createComputed([keylock], (k) => (k.scrollLock ? "on" : "off"))}
      />
      <label
        label="󰎣"
        class={createComputed([keylock], (k) => (k.numLock ? "on" : "off"))}
      />
    </box>
  );
}

export default LockKeys;
