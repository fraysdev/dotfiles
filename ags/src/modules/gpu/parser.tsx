import { doubleLineLabel } from "../../utils/formatString";

export function parseGpuName(name: string) {
  if (name.includes("NVIDIA GeForce"))
    return doubleLineLabel(
      name.slice(15).replace("Laptop GPU", "LGPU"),
      "NVIDIA GeForce",
      true
    );
  if (name.includes("AMD Radeon"))
    return doubleLineLabel(name.slice(11), "AMD Radeon", true);

  return name;
}
