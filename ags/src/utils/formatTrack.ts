export function formatTime(time: number) {
  if (time === -1) return "??:??";

  const hour = Math.floor(time / 3600);
  const min = Math.floor((time % 3600) / 60)
    .toString()
    .padStart(2, "0");
  const sec = Math.floor(time % 60)
    .toString()
    .padStart(2, "0");

  return `${
    hour > 0 ? hour.toString().padStart(2, "0") + ":" : ""
  }${min}:${sec}`;
}
