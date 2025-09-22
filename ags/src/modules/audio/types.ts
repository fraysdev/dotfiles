import { Gtk } from "ags/gtk4";
import AstalIO from "gi://AstalIO?version=0.1";

export type PopupSet = {
  isFirstTime: boolean;
  isShowing: boolean;
  popupRoot?: Gtk.Window;
  timeoutFn?: AstalIO.Time;
  disposeFn?: () => void;
};
