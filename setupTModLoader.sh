#!/bin/bash

modDir="/home/ubuntu/.local/share/Terraria/ModLoader/Mods";

calamity="https://mirror.sgkoi.dev/tModLoader/download.php?Down=mods/CalamityMod.tmod";
calamityMusic="https://mirror.sgkoi.dev/tModLoader/download.php?Down=mods/CalamityModMusic.tmod";
fargoMutants="https://mirror.sgkoi.dev/tModLoader/download.php?Down=mods/Fargowiltas.tmod";

mkdir $modDir >/dev/null 2>&1;

curl -L $calamity >"$modDir/CalamityMod.tmod";
curl -L $calamityMusic >"$modDir/CalamityModMusic.tmod";
curl -L $fargoMutants >"$modDir/Fargowiltas.tmod";

cp tModLoaderEnabled.json "$modDir/enabled.json";
