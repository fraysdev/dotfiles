import { createComputed, With } from "ags";
import { createPoll } from "ags/time";
import Progress from "../../widgets/progress";
import GTop from "gi://GTop?version=2.0";

function Cpu() {
  let prevCpuData = new GTop.glibtop_cpu();
  GTop.glibtop_get_cpu(prevCpuData);

  const cpu = createPoll(0, 1000, (prev) => {
    const currentCpuData = new GTop.glibtop_cpu();
    GTop.glibtop_get_cpu(currentCpuData);

    const total = currentCpuData.total - prevCpuData.total;
    const idle = currentCpuData.idle - prevCpuData.idle;

    const usage = total > 0 ? Math.floor(((total - idle) / total) * 100) : 0;
    prevCpuData = currentCpuData;

    return usage;
  });

  return (
    <box class="cpu">
      <button>
        <Progress
          value={cpu}
          minValue={0}
          maxValue={100}
          icon="󰍛"
          display={createComputed([cpu], (c) => `${c}`)}
        />
      </button>
    </box>
  );
}

export default Cpu;
