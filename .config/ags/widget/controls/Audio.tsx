import { bind, subprocess, Variable } from "astal";
import { Gtk } from "astal/gtk4";
import Wp from "gi://AstalWp"

const audio = Wp.get_default()!.audio;
const speaker = Wp.get_default()?.audio.defaultSpeaker!
const mic = Wp.get_default()?.audio.defaultMicrophone!

const speakerVolume = Variable("").poll(10, ["bash", "-c", "wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2,$3}'"])
const micVolume = Variable("").poll(10, ["bash", "-c", "wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | awk '{print $2,$3}'"])

function AudioPopover() {
    return (
        <popover cssClasses={["AudioPopover"]}>
            <box vertical>
                <box>
                    <button
                        onClicked={() => subprocess("pactl set-sink-mute @DEFAULT_SINK@ toggle")}
                        cssClasses={["volumeButton"]}
                    >
                        {/* <image iconName={bind(speaker, "volumeIcon")} /> */}
                        <label
                            cssClasses={["googleIcon"]}
                            label={bind(speakerVolume).as((s) => {
                                const det = s.split(" ")

                                if (det.length === 2) {
                                    return "volume_off"
                                }

                                const t = parseFloat(det[0]) * 100

                                if (t > 70) {
                                    return "volume_up";
                                } else if (t > 40) {
                                    return "volume_down";
                                } else if (t > 0) {
                                    return "volume_mute";
                                } else {
                                    return "volume_off";
                                }
                            })}
                        />
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
                        {/* <image iconName={bind(mic, "volumeIcon")} /> */}
                        <label
                            cssClasses={["googleIcon"]}
                            label={bind(micVolume).as((s) => {
                                const det = s.split(" ")

                                if (det.length === 2) {
                                    return "mic_off"
                                }

                                const t = parseFloat(det[0]) * 100

                                if (t > 0) {
                                    return "mic";
                                } else {
                                    return "mic_off";
                                }
                            })}
                        />
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

export function Audio() {
    return (
        <menubutton
            cssClasses={["Audio"]}
            popover={(<AudioPopover />) as Gtk.Popover}
        >
            <box spacing={8}>
                {bind(audio, "defaultSpeaker").as((speaker) => (
                    <box spacing={4}>
                        <label
                            cssClasses={["googleIcon"]}
                            label={bind(speakerVolume).as((s) => {
                                const det = s.split(" ")

                                if (det.length === 2) {
                                    return "volume_off"
                                }

                                const t = parseFloat(det[0]) * 100

                                if (t > 70) {
                                    return "volume_up";
                                } else if (t > 40) {
                                    return "volume_down";
                                } else if (t > 0) {
                                    return "volume_mute";
                                } else {
                                    return "volume_off";
                                }
                            })}
                        />
                        <label label={bind(speaker, "volume").as((vol) => `${Math.round(vol * 100)}%`)} />
                    </box>
                ))}
                {bind(audio, "defaultMicrophone").as((microphone) => (
                    <box spacing={4}>
                        <label
                            cssClasses={["googleIcon"]}
                            label={bind(micVolume).as((s) => {
                                const det = s.split(" ")

                                if (det.length === 2) {
                                    return "mic_off"
                                }

                                const t = parseFloat(det[0]) * 100

                                if (t > 0) {
                                    return "mic";
                                } else {
                                    return "mic_off";
                                }
                            })}
                        />
                        <label label={bind(mic, "volume").as((vol) => `${Math.round(vol * 100)}%`)} />
                    </box>
                ))}
            </box>
        </menubutton>
    )
} 