import app from "ags/gtk4/app";
import style from "./style.scss";
import Window from "./src/windows";

app.start({
  css: style,
  main() {
    app.get_monitors().map(Window);
  },
});
