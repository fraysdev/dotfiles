import { Accessor, createState } from "ags";
import GTop from "gi://GTop?version=2.0";

const [cpu, setCpu] = createState(0);

class CpuService {
  private _previousCpuData = new GTop.glibtop_cpu();
}
