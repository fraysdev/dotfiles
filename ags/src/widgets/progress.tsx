import { Accessor } from "ags";
import { Gtk } from "ags/gtk4";

type ProgressProps = {
  value: number | Accessor<number>;
  maxValue?: number | Accessor<number>;
  minValue?: number | Accessor<number>;
  icon?: string | Accessor<string>;
  display?: string | Accessor<string>;
};

function Progress(props: ProgressProps) {
  return (
    <overlay class="progress">
      <levelbar
        orientation={Gtk.Orientation.VERTICAL}
        minValue={props.minValue ?? 0}
        maxValue={props.maxValue ?? 1}
        inverted
        value={props.value}
      />
      <label
        $type="overlay"
        class="icon"
        justify={Gtk.Justification.LEFT}
        // halign={Gtk.Align.START}
        // valign={Gtk.Align.START}
        label={props.icon}
      />
      <label
        $type="overlay"
        class="number"
        justify={Gtk.Justification.RIGHT}
        halign={Gtk.Align.END}
        valign={Gtk.Align.END}
        label={props.display}
      />
    </overlay>
  );
}

export default Progress;
