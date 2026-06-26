# mod-playerbot-world-pvp

Lightweight autonomous Playerbot world-PvP hotspot simulator.

This is intentionally separate from DungeonSim. DungeonSim makes bot parties feel alive in dungeons; WorldPvP makes random Playerbots cause outdoor trouble, respond to enemy pressure, then leave after a short chaos window.

## Current design

- WORLD DB hotspots define rally and target points.
- Attackers teleport to the rally/outside-town point.
- Attackers then MovePoint toward the target so it looks less like a hard GM teleport.
- Defenders teleport near the target/defense point.
- Normal Playerbot/PvP behavior takes over.
- After the timer, surviving bots return to where they came from.
- Only random Playerbot accounts are eligible by default.

## Install SQL

```sql
USE azc_world_ashbringer;
SOURCE C:/Apps/WowServ/modules/mod-playerbot-world-pvp/data/sql/manual/world_playerbot_world_pvp.sql;
```

The SQL seeds Vanilla-only 20+ hotspots, including Lakeshire, Southshore/Tarren Mill, Ashenvale, Crossroads, Arathi, STV, Dustwallow, Desolace, Badlands, and disabled future 50+ templates for Blackrock/EPL.

Coordinates are starter seeds. Use the GM commands to fine-tune them in-game.

## Recommended current config

```ini
PlayerbotWorldPvp.Enable = 1
PlayerbotWorldPvp.GlobalMinLevel = 20
PlayerbotWorldPvp.EventChancePerTick = 20
PlayerbotWorldPvp.MaxActiveEvents = 2
PlayerbotWorldPvp.MinOnlineBotsRequired = 3
PlayerbotWorldPvp.MaxBotsPerSide = 8
PlayerbotWorldPvp.BotAccountPrefix = auto
```

## GM commands

```text
.wpvp help
.wpvp status
.wpvp scan [minLvl] [maxLvl]
.wpvp start <spot>
.wpvp stop <id|all>

.wpvp spot list
.wpvp spot create <name> <attacker> <defender> <minLvl> <maxLvl>
.wpvp spot rally <name>
.wpvp spot target <name>
.wpvp spot counts <name> <attMin> <attMax> <defMin> <defMax>
.wpvp spot duration <name> <minMinutes> <maxMinutes>
.wpvp spot enable <name> <0|1>
```

Useful first checks:

```text
.wpvp scan 20 40
.wpvp spot list
.wpvp start Lakeshire
.wpvp start Southshore
.wpvp start Crossroads
```

## Tuning a spot

1. Go to where attackers should appear outside town.
2. Run `.wpvp spot rally Lakeshire`.
3. Go to where defenders should gather / attackers should move toward.
4. Run `.wpvp spot target Lakeshire`.
5. Set counts low while your 20+ bot population is small:

```text
.wpvp spot counts Lakeshire 2 4 2 4
```

## Logs

Default log:

```text
./Logs/playerbot_world_pvp.log
```

Logs start/end, participants, movement, and returns.
