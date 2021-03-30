#!/bin/bash
tmux new-session -d -s Terraria '/home/ubuntu/.steam/steamapps/common/Terraria/TerrariaServer -config /home/ubuntu/terraria/Terraria.config' >/dev/null 2>&1;
tmux new-session -d -s tModLoader '/home/ubuntu/.steam/steamapps/common/tModLoader/tModLoaderServer -config /home/ubuntu/tmodloader/tModLoader.config' >/dev/null 2>&1;
tmux new-session -d -s Valheim /home/ubuntu/valheim/RunValheim.sh >/dev/null 2>&1;
tmux list-sessions;
