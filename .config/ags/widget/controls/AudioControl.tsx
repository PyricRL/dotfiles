import { exec, subprocess } from "astal/process"
import { bind } from "astal"
import Wp from "gi://AstalWp"

export function AudioControl() {
    const speaker = Wp.get_default()?.audio.defaultSpeaker!

    function toggleMute() {
        subprocess("pactl set-sink-mute @DEFAULT_SINK@ toggle")
    }

    return <box className="AudioControl" css="min-width: 200px">
        <button onClicked={toggleMute}>
            <icon icon={bind(speaker, "volumeIcon")} />
        </button>
        <slider
            hexpand
            onDragged={({ value }) => speaker.volume = value}
            value={bind(speaker, "volume")}
        />
    </box>
}