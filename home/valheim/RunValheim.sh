export templdpath=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH
export SteamAppId=892970

pushd "/home/ubuntu/.steam/steamapps/common/Valheim dedicated server/";

valheim="./valheim_server.x86_64";
valheimArgs=(
    -name "Olmarch"
    -port 2456
    -world "Dedicated"
    -password "PL4YERS"
);

echo "Starting server PRESS CTRL-C to exit";

# NOTE: Minimum password length is 5 characters & Password cant be in the server name.
# NOTE: You need to make sure the ports 2456-2458 is being forwarded to your server through your local router & firewall.

"$valheim" "${valheimArgs[@]}";

popd;

export LD_LIBRARY_PATH=$templdpath

