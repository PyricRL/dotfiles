#!/bin/bash

# Get the ID of the active workspace
active_workspace_id=$(hyprctl activeworkspace -j | jq '.id')

# Function to map workspace ID to a custom name
get_workspace_name() {
    local ws_id="$1"
    local custom_name=""

    case "$ws_id" in
        1) custom_name="Comfort";;
        2) custom_name="Sport";;
        3) custom_name="EcoPro";;
        4) custom_name="Adaptive";;
        *) custom_name="Custom $ws_id";;
    esac
    echo "$custom_name"
}

# Check if we successfully got the active workspace ID
if [[ -n "$active_workspace_id" ]]; then
    prev_workspace_id=$((active_workspace_id - 1))
    foll_workspace_id=$((active_workspace_id + 1))
    # Get the custom name based on the active workspace ID
    prev_workspace_name=$(get_workspace_name "$prev_workspace_id")
    workspace_name=$(get_workspace_name "$active_workspace_id")
    foll_workspace_name=$(get_workspace_name "$foll_workspace_id")

    echo "$prev_workspace_name"
    echo "$workspace_name"
    echo "$foll_workspace_name"
else
    echo ""
fi