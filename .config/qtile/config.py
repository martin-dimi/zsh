import os
import subprocess
from typing import List

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.log_utils import logger

mod = "mod4"
terminal = "alacritty"

focus_on_window_activation = "smart"
follow_mouse_focus = False
auto_fullscreen = True
dgroups_key_binder = None
dgroups_app_rules = []
bring_front_click = False
cursor_warp = False
main = None  # WARNING: this is deprecated and will be removed soon


def playpause(qtile):
    qtile.cmd_spawn(
        'dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause')


def nextSong(qtile):
    qtile.cmd_spawn(
        'dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next')


def prevSong(qtile):
    qtile.cmd_spawn(
        'dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous')


keys = [
    # The essentials.
    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod, "shift"], "Return", lazy.spawn(
        "dmenu_run -p 'RUN: '"), desc="Run launcher"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Audio controls.
    Key([], 'XF86AudioLowerVolume', lazy.spawn('amixer -c 1 sset Master 1%-')),
    Key([], 'XF86AudioRaiseVolume', lazy.spawn('amixer -c 1 sset Master 1%+')),
    Key([], 'XF86AudioMute', lazy.spawn('amixer -c 1 sset Master 100%-')),
    Key([], 'XF86AudioPlay', lazy.function(playpause)),
    Key([], 'XF86AudioStop', lazy.function(playpause)),
    Key([], 'XF86AudioNext', lazy.function(nextSong)),
    Key([], 'XF86AudioPrev', lazy.function(prevSong)),
]

####################################################
# Groups
group_names = [
    ("WWW", {'layout': 'monadtall'}),
    ("DEV", {'layout': 'monadtall'}),
    ("MUS", {'layout': 'monadtall'}),
    ("MSC", {'layout': 'monadtall'}),
]

groups = [Group(name, **kwargs) for name, kwargs in group_names]
for i, (name, kwargs) in enumerate(group_names, 1):
    # Switch to another group
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))
    # Send current window to another group
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name)))

####################################################
# Layout
layout_theme = {
    "border_width": 3,
    "margin": 8,
    "border_focus": "#82aaff",
    "border_normal": "1D2330",
}

layouts = [
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    layout.Stack(num_stacks=2),
    layout.Floating(**layout_theme),
]

colors = [
    ["#282c34", "#282c34"],  # panel background
    ["#3d3f4b", "#434758"],  # background for current screen tab
    ["#ffffff", "#ffffff"],  # font color for group names
    ["#ff5555", "#ff5555"],  # border line color for current tab
    # border line color for 'other tabs' and color for 'odd widgets'
    ["#74438f", "#74438f"],
    ["#4f76c7", "#4f76c7"],  # color for the 'even widgets'
    ["#82aaff", "#82aaff"],  # window name
    ["#82aaff", "#82aaff"],  # backbround for inactive screens
]
#prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

widget_defaults = dict(
    font="Ubuntu Mono",
    fontsize=12,
    padding=2,
    background=colors[0],
)
extension_defaults = widget_defaults.copy()

default_widget_list = [
    widget.CurrentLayout(),
    widget.GroupBox(),
    widget.Prompt(),
    widget.WindowName(),
    widget.Chord(
        chords_colors={
            'launch': ("#ff0000", "#ffffff"),
        },
        name_transform=lambda name: name.upper(),
    ),
    widget.TextBox("default config", name="default"),
    widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
    widget.Systray(),
    widget.Clock(format='%Y-%m-%d %a %I:%M %p'),
    widget.Volume(),
    widget.QuickExit(),
]

widget_list = [
    widget.Sep(
        linewidth=0,
        padding=6,
    ),
    widget.GroupBox(
        font="Ubuntu Bold",
        fontsize=9,
        margin_y=3,
        margin_x=0,
        padding_y=5,
        padding_x=3,
        borderwidth=3,
        active=colors[2],
        inactive=colors[7],
        rounded=False,
        highlight_color=colors[1],
        highlight_method="line",
        this_current_screen_border=colors[6],
        this_screen_border=colors[4],
        other_current_screen_border=colors[6],
        other_screen_border=colors[4],
    ),
    widget.Sep(
        linewidth=0,
        padding=15,
    ),
    widget.WindowName(
        foreground=colors[6],
    ),
    widget.Systray(
        padding=5,
        background=colors[4],
    ),
    widget.Sep(
        linewidth=0,
        padding=6,
    ),
    widget.TextBox(
        text=" 🖬",
        padding=6,
        fontsize=14,
    ),
    widget.Memory(
        mouse_callbacks={
            'Button1': lambda: qtile.cmd_spawn(myTerm + ' -e htop')},
        padding=4,
    ),
    widget.Sep(
        linewidth=2,
        padding=6,
    ),
    widget.TextBox(
        text=" Vol:",
        padding=0
    ),
    widget.Volume(
        padding=5
    ),
    widget.Sep(
        linewidth=2,
        padding=6,
    ),
    widget.CurrentLayout(
        padding=5,
    ),
    widget.Sep(
        linewidth=2,
        padding=6,
    ),
    widget.Clock(
        format="%A, %B %d - %H:%M ",
        padding=5,
    ),
]

screens = [
    Screen(
        top=bar.Bar(
            widget_list,
            24,
        ),
    ),
]


# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
    Match(wm_class='spotify'),
    Match(wm_class='android'),
])


@hook.subscribe.startup
def start_once():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
