import { Astal, Gtk } from "astal/gtk3"
import { AudioControl } from "../controls/AudioControl";
import { MicControl } from "../controls/MicControl";

const { TOP, RIGHT } = Astal.WindowAnchor;

const AudioMenuWindow = (
    <window 
        className="AudioMenu"
        anchor={TOP | RIGHT}
        widthRequest={200}
        heightRequest={200}
        visible={false}
    >
        <box orientation={Gtk.Orientation.VERTICAL}>
            <label>Audio Control</label>
            <Gtk.Separator visible/>
            <AudioControl/>
            <MicControl/>
        </box>
    </window>
);

export default AudioMenuWindow;