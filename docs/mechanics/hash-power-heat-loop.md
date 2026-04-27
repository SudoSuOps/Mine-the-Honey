# Hash Power Heat Loop

This is the core gameplay loop of Mine the Honey.

Players do not simply buy more miners. They balance hash, power, and heat.

## Core Triangle

| Axis | Meaning | Player Question |
|---|---|---|
| Hash | How fast Nectar Nodes generate Pollen | How much can I earn? |
| Power | How much electricity the Hive can support | Can my Hive run this? |
| Heat | How much thermal pressure the Hive creates | Can I keep it stable? |

## Basic Rule

More hash creates more money, but usually requires more power and creates more heat.

If the player ignores heat, Nectar Nodes throttle or enter Propolis.

If the player ignores power, the Hive overloads and nodes shut down.

## Player Decisions

Players should constantly decide:

- Add another Nectar Node or upgrade cooling first?
- Overclock a node or keep it stable?
- Buy a high-hash Bombus node or a low-heat Osmia node?
- Upgrade power or expand rack space?
- Repair Propolis or salvage it for Wax?
- Chase short-term HoneyCoin or long-term Tribunal grade?

## States

| State | Trigger | Effect |
|---|---|---|
| Stable | Good cooling and power | 100% hash output |
| Warm | Heat rising | Warning state |
| Hot | Heat pressure high | Reduced hash |
| Throttled | Heat near danger | Major hash penalty |
| Propolis | Critical failure | 0% hash until repaired/salvaged |
| Power Limited | Not enough power | Node disabled or reduced output |

## Design Goal

The player should feel like a real Hive operator.

The fun is not just owning more hardware.

The fun is making the Swarm run clean.
