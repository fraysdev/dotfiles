import AstalHyprland from "gi://AstalHyprland?version=0.1";

export type HyprlandInfo = {
  workspace: AstalHyprland.Workspace;
  client: AstalHyprland.Client;
};

export type HyprlandClientProp = {
  client: AstalHyprland.Client;
};

export type HyprlandWorkspaceProp = {
  workspace: AstalHyprland.Workspace;
};
