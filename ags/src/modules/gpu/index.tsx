import { Accessor, For } from "ags";
import { createPoll } from "ags/time";
import Progress from "../../widgets/progress";
import { doubleLineLabel } from "../../utils/formatString";
import { parseGpuName } from "./parser";

function Gpu() {
  const rawGpu = createPoll("[]", 1000, "nvtop -s");
  const jsonGpu = rawGpu((g) => JSON.parse(g) as GpuNvtop);

  return (
    <box class="gpu">
      <For each={jsonGpu}>
        {(gpu, index: Accessor<number>) => (
          <box>
            <Progress
              value={parseInt(gpu.gpu_util.replace("%", ""))}
              minValue={0}
              maxValue={100}
              icon="󰢮"
              display={gpu.gpu_util.replace("%", "")}
            />
            <Progress
              value={parseInt(gpu.temp.replace("C", ""))}
              minValue={0}
              maxValue={100}
              icon=""
              display={gpu.temp.replace("C", "")}
            />
            <label
              class="device"
              label={parseGpuName(gpu.device_name)}
              useMarkup
            />
          </box>
        )}
      </For>
    </box>
  );
}

export default Gpu;
