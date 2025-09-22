import AstalHyprland from "gi://AstalHyprland?version=0.1";
import { createBinding, createComputed } from "ags";

const hyprland = AstalHyprland.get_default();
const activeWorkspaces = createBinding(hyprland, "workspaces");
const focusedWorkspace = createBinding(hyprland, "focusedWorkspace");

function Hyprland() {
  const workspaceStatus = (id: string) =>
    createComputed([activeWorkspaces, focusedWorkspace], (active, focus) =>
      [
        active.map((w) => w.name).includes(id) ? "" : "empty",
        focus.name === id ? "active" : "",
      ].join(" ")
    );

  return (
    <box class="hyprland">
      <box>
        {[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((id) => (
          <button
            class={workspaceStatus(id.toString())}
            onClicked={() => hyprland.dispatch("workspace", id.toString())}
          >
            <label label={id.toString()} />
          </button>
        ))}
      </box>
    </box>
  );
}

export default Hyprland;
