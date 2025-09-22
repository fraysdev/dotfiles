import { createComputed, createState } from "ags";
import { Gtk } from "ags/gtk4";
import GLib from "gi://GLib?version=2.0";
import { doubleLineLabel } from "../../utils/formatString";

const DATETIME_FORMAT = "%H:%M:%S|%a, %d/%m";

function Datetime() {
  const [datetime, setDatetime] = createState(
    GLib.DateTime.new_now_local().format(DATETIME_FORMAT) ?? ""
  );

  setInterval(() => {
    setDatetime(GLib.DateTime.new_now_local().format(DATETIME_FORMAT) ?? "");
  }, 100);

  const time = createComputed([datetime], (datetime) => {
    const [time, date] = datetime.split("|");
    return doubleLineLabel(time, date);
  });

  return (
    <menubutton>
      <box class="datetime">
        <label class="icon" label="" />
        <label class="content" label={time} useMarkup />
      </box>
      <popover>
        <Gtk.Calendar />
      </popover>
    </menubutton>
  );
}

export default Datetime;
