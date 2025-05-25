import { exec, subprocess } from "astal/process"
import { bind } from "astal"
import Wp from "gi://AstalWp"

export function MicControl() {
    const mic = Wp.get_default()?.audio.defaultMicrophone!

    function toggleMute() {
        subprocess("pactl set-source-mute @DEFAULT_SOURCE@ toggle")
    }

    return <box name="MicControl" css="min-width: 200px">
        <button onClicked={toggleMute} name={"fullMuteMicButton"}>
            <icon icon={bind(mic, "volumeIcon")} />
        </button>
        <slider
            hexpand
            onDragged={({ value }) => mic.volume = value}
            value={bind(mic, "volume")}
            name={"micSlider"}
        />
    </box>
}