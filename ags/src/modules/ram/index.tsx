import { Accessor, For } from "ags";
import { createPoll } from "ags/time";
import Progress from "../../widgets/progress";

function Ram() {
  const rawRam = createPoll(
    "1 0",
    1000,
    `bash -c "free -b | grep 'Mem' | awk '{print $2, $3}'"`
  );

  const parseRam = rawRam((ram) => {
    let splitRam = ram.split(" ").filter((v) => v);
    let totalRam = parseInt(splitRam[0]);
    let usedRam = parseInt(splitRam[1]);
    return usedRam / totalRam;
  });

  return (
    <box class="ram">
      <Progress
        value={parseRam}
        icon=""
        display={parseRam((r) => "" + Math.round(r * 100))}
      />
    </box>
  );
}

export default Ram;
