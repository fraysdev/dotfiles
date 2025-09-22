import AstalNetwork from "gi://AstalNetwork?version=0.1";
import { Accessor, createBinding } from "ags";
import { exec } from "ags/process";

import { doubleLineLabel } from "../../utils/formatString";

const network = AstalNetwork.get_default();
const primary = createBinding(network, "primary");
const networkIcon = primary((p) => {
  if (p === AstalNetwork.Primary.WIFI) return "󰤨";
  if (p === AstalNetwork.Primary.WIRED) return "󰲝";
  if (p === AstalNetwork.Primary.UNKNOWN) return "󰲛";
  return "󰛵";
});

const networkState = createBinding(network, "state");
const networkType = networkState((_) => getNetwork());

function Network() {
  return (
    <box class="network">
      <label class="icon" label={networkIcon} />
      <label
        class="content"
        visible={networkType((n) => !!n.name)}
        label={networkType((n) => doubleLineLabel(n.name, n.ip4))}
        useMarkup
      />
    </box>
  );
}

function getNetwork() {
  const property = {
    name: "",
    ip4: "",
  };

  const device = JSON.parse(
    exec(
      "busctl -j get-property \
      org.freedesktop.NetworkManager \
      /org/freedesktop/NetworkManager \
      org.freedesktop.NetworkManager \
      PrimaryConnection"
    )
  ).data;
  console.log(device);

  if (device === "/") return property;

  // get network name
  property.name = JSON.parse(
    exec(
      `busctl -j get-property \
      org.freedesktop.NetworkManager \
      ${device} \
      org.freedesktop.NetworkManager.Connection.Active \
      Id`
    )
  ).data;

  // get ip
  const ip4 = JSON.parse(
    exec(
      `busctl -j get-property \
      org.freedesktop.NetworkManager \
      ${device} \
      org.freedesktop.NetworkManager.Connection.Active \
      Ip4Config`
    )
  ).data;

  property.ip4 = JSON.parse(
    exec(
      `busctl -j get-property \
          org.freedesktop.NetworkManager \
          ${ip4} \
          org.freedesktop.NetworkManager.IP4Config \
          Gateway`
    )
  ).data;

  return property;
}

export default Network;
