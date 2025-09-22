import { createBinding, createComputed, createState } from "ags";
import AstalBattery from "gi://AstalBattery?version=0.1";
import Progress from "../../widgets/progress";

function Battery() {
  const battery = AstalBattery.get_default();
  const percentage = createBinding(battery, "percentage");
  const isCharging = createBinding(battery, "charging");

  const batteryStatus = createComputed(
    [percentage, isCharging],
    (percentage, isCharging) =>
      [
        "battery",
        Math.round(percentage * 100) < 40 && !isCharging ? "critical" : "",
        isCharging ? "charging" : "",
      ].join(" ")
  );

  return (
    <box class={batteryStatus}>
      <button>
        <Progress
          value={percentage}
          icon={createComputed([isCharging], (isCharging) =>
            isCharging ? "󰂅" : "󰁹"
          )}
          display={createComputed(
            [percentage],
            (percentage) => `${Math.round(percentage * 100)}`
          )}
        />
      </button>
    </box>
  );
}

export default Battery;
