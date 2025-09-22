import OS from "../../modules/os";
import Battery from "../../modules/battery";
import Datetime from "../../modules/datetime";
import Audio from "../../modules/audio";
import Player from "../../modules/player";
import LockKeys from "../../modules/lockkeys";
import Network from "../../modules/network";
import Brightness from "../../modules/brightness";
import Hyprland from "../../modules/hyprland";
// import Cpu from "../../modules/cpu";
// import Ram from "../../modules/ram";
// import Gpu from "../../modules/gpu";

export default function Bar() {
  return (
    <centerbox cssName="centerbox">
      <box $type="start" spacing={2} class="left">
        <OS />
        <Hyprland />
        <Player />
      </box>
      <box $type="center" spacing={2} class="center"></box>
      <box $type="end" spacing={2} class="right">
        {/* <Cpu />
        <Ram />
        <Gpu /> */}
        <LockKeys />
        <Network />
        <Audio />
        <Brightness />
        <Battery />
        <Datetime />
      </box>
    </centerbox>
  );
}
