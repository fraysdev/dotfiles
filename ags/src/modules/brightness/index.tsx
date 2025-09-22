import { createComputed, With } from "ags";
import { createPoll } from "ags/time";
import Progress from "../../widgets/progress";

const brightness = createPoll(",,,100", 100, "brightnessctl -m");
const percentage = createComputed([brightness], (b) =>
  parseInt(b.split(",")[3].replace("%", ""))
);

function Brightness() {
  return (
    <box class="brightness">
      <button>
        <Progress
          value={percentage}
          minValue={0}
          maxValue={100}
          icon="󰃠"
          display={createComputed([percentage], (p) => `${p}`)}
        />
      </button>
    </box>
  );
}

export default Brightness;
