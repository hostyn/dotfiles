# Antonio Sarosi
# https://youtube.com/c/antoniosarosi
# https://github.com/antoniosarosi/dotfiles

# Qtile workspaces

from libqtile.config import Key, Group
from libqtile.command import lazy
from .keys import mod, keys


# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)
# Icons: 
# nf-fa-firefox, 
# nf-fae-python, 
# nf-dev-terminal, 
# nf-fa-code, 
# nf-oct-git_merge, 
# nf-linux-docker,
# nf-mdi-image, 
# nf-mdi-layers

groups_with_keys = [
  ["   ", "e"],
  ["   ", "r"],
  [" ﬏  ", "t"],
  ["   ", "y"],
  ["    ", "u"],
  ["    ", "i"],
  ["   ", "o"],
  [" 阮  ", "p"],
]

groups = []

for group in groups_with_keys:
  groups.append(Group(group[0]))
  keys.extend([
    Key([mod], group[1], lazy.group[group[0]].toscreen()),
    Key([mod, "shift"], group[1], lazy.window.togroup(group[0]))
  ])

# groups = [Group(i) for i in [
#     "   ", "   ", "   ", "   ", "  ", "   ", "   ", "   ", "   ",
# ]]

# for i, group in enumerate(groups):
#     actual_key = str(i + 1)
#     keys.extend([
#         # Switch to workspace N
#         Key([mod], actual_key, lazy.group[group.name].toscreen()),
#         # Send window to workspace N
#         Key([mod, "shift"], actual_key, lazy.window.togroup(group.name))
#     ])
