import { bind, subprocess } from "astal";
import { Gtk } from "astal/gtk4";
import Wp from "gi://AstalWp"

const audio = Wp.get_default()!.audio;
const speaker = Wp.get_default()?.audio.defaultSpeaker!
const mic = Wp.get_default()?.audio.defaultMicrophone!

function AudioPopover() {
    return (
        <popover cssClasses={["AudioPopover"]}>
            <box vertical>
                <box>
                    <button
                        onClicked={() => subprocess("pactl set-sink-mute @DEFAULT_SINK@ toggle")}
                        cssClasses={["volumeButton"]}
                    >
                        <image iconName={bind(speaker, "volumeIcon")} />
                    </button>
                    <slider
                        hexpand
                        max={100}
                        min={0}
                        value={bind(speaker, "volume").as((volume) => volume * 100)}
                        onChangeValue={(slider) => speaker.set_volume(slider.value / 100)}
                    />
                </box>
                <box>
                    <button
                        onClicked={() => subprocess("pactl set-source-mute @DEFAULT_SOURCE@ toggle")}
                        cssClasses={["volumeButton"]}
                    >
                        <image iconName={bind(mic, "volumeIcon")} />
                    </button>
                    <slider
                        hexpand
                        max={100}
                        min={0}
                        value={bind(mic, "volume").as((volume) => volume * 100)}
                        onChangeValue={(slider) => mic.set_volume(slider.value / 100)}
                    />
                </box>
            </box>
        </popover>

    );
}

const AudioPart = ({ device }: { device: Wp.Endpoint }) => {
    return (
        <box spacing={4}>
            <image iconName={bind(device, "volumeIcon")} />
            <label label={bind(device, "volume").as((vol) => `${Math.round(vol * 100)}%`)} />
        </box>
    );
};

export function Audio() {
    return (
        <menubutton
            cssClasses={["Audio"]}
            popover={(<AudioPopover />) as Gtk.Popover}
        >
            <box spacing={8}>
                {bind(audio, "defaultSpeaker").as((speaker) => (
                    <AudioPart device={speaker} />
                ))}
                {bind(audio, "defaultMicrophone").as((microphone) => (
                    <AudioPart device={microphone} />
                ))}
            </box>
        </menubutton>
    )
} 