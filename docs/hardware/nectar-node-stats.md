# Nectar Node Stats

Nectar Nodes are the core mining hardware units in Mine the Honey.

Each node is defined by a small set of readable stats that players can understand quickly.

## Core Stats

| Stat | Meaning |
|---|---|
| Hashrate | How fast the node creates Pollen |
| Power Draw | How much power the node uses |
| Heat Output | How much heat the node creates |
| Efficiency | How much hash the player gets per unit of power |
| Reliability | How likely the node is to avoid failure |
| Cooling Need | How much cooling the node requires |
| Propolis Risk | Chance of failure under stress |
| Trade Status | Whether the node can be traded |
| Family | Bee family identity |
| Rarity | Collection tier |

## Player-Facing Stat Labels

Use simple UI words:

| Internal Stat | UI Label |
|---|---|
| hashrate | Hash |
| powerDraw | Power |
| heatOutput | Heat |
| efficiency | Efficiency |
| reliability | Reliability |
| coolingNeed | Cooling |
| propolisRisk | Risk |

## Design Rule

Every Nectar Node should have a tradeoff.

No miner should be best at everything.

Examples:

- Bombus nodes have high hash but high heat.
- Osmia nodes have low power and low heat but lower top-end hash.
- Apis nodes are balanced.
- Megachile nodes improve repair/crafting outcomes.
- Halictus nodes have lucky block bonuses but unstable output.

## Miner State Effects

| State | Hash Output | Notes |
|---|---:|---|
| Stable | 100% | Normal operation |
| Warm | 90% | Warning state |
| Hot | 75% | Player should improve cooling |
| Throttled | 45% | Severe heat penalty |
| Propolis | 0% | Broken/quarantined until repaired or salvaged |

## Example Stat Block

```json
{
  "id": "vintage_nectar_s9",
  "name": "Vintage Nectar S9",
  "family": "Apis",
  "rarity": "Uncommon",
  "hashrate": 95,
  "powerDraw": 82,
  "heatOutput": 78,
  "efficiency": 52,
  "reliability": 64,
  "coolingNeed": 70,
  "propolisRisk": 18,
  "tradeable": true
}

## 2. Create `nectar-node-catalog-v1.md`

```bash
cat > docs/hardware/nectar-node-catalog-v1.md <<'EOF'
# Nectar Node Catalog V1

This is the first collectible hardware catalog for Mine the Honey.

The catalog should create player desire, trading value, and clear progression.

## Starter Nodes

| Name | Family | Rarity | Identity |
|---|---|---|---|
| Dusty Nectar S1 | Apis | Starter | First garage miner |
| BuzzBox Mini | Apis | Common | Tiny early miner |
| WaxPlug Node | Osmia | Common | Low power beginner node |
| Garage Comb S3 | Apis | Common | Cheap second miner |

## Classic Nodes

| Name | Family | Rarity | Identity |
|---|---|---|---|
| Vintage Nectar S9 | Apis | Uncommon | Cheap, loud, hot, nostalgic |
| Old Comb S9 | Bombus | Uncommon | High heat, better hash |
| Nectar S9-Pro | Apis | Rare | Balanced classic upgrade |
| Scarred S9 | Halictus | Rare | Can appear after Propolis recovery |

## Pro Nodes

| Name | Family | Rarity | Identity |
|---|---|---|---|
| Nectar S19 | Apis | Rare | Strong midgame workhorse |
| Nectar S19J-Pro | Apis | Epic | Reliable high-output node |
| Bombus HeatCore | Bombus | Epic | High hash, high heat |
| Osmia LowVolt | Osmia | Epic | Efficient low-power node |

## Hydro Nodes

| Name | Family | Rarity | Identity |
|---|---|---|---|
| Nectar Hydro | Osmia | Epic | Lower heat, strong uptime |
| S23 Hydro | Xylocopa | Legendary | Industrial cooling monster |
| Royal Hydro Node | Melipona | Legendary | Elite efficiency |
| Arctic Comb Hydro | Osmia | Legendary | Built for heatwave events |

## Specialist Nodes

| Name | Family | Rarity | Identity |
|---|---|---|---|
| Megachile Repair Rig | Megachile | Rare | Better repair outcomes |
| Halictus Lucky Node | Halictus | Epic | Chance for lucky block bonus |
| Trigona Swarm Node | Trigona | Epic | Bonus when many are grouped |
| Euglossa Prism Node | Euglossa | Legendary | Cosmetic/skin flex node |

## Mythic Nodes

| Name | Family | Rarity | Identity |
|---|---|---|---|
| BlackComb Titan | Xylocopa | Mythic | Elite industrial node |
| QueenCore Node | Melipona | Mythic | Boosts Queen feeding |
| Royal Jelly Engine | Melipona | Mythic | Converts high-grade Pollen better |
| Genesis Node | Genesis | Genesis | Earn-only origin miner |

## Earn-Only Rule

The Genesis Node cannot be bought.

It must be earned through:

- Tribunal proof
- Queen progression
- rare block discovery
- Halving survival
- Genesis questline completion

## Trading Rule

Most nodes can be traded.

Some nodes are account-bound:

- Starter tutorial nodes
- Genesis Node
- certain event proof rewards
- Tribunal badge variants

## Player Desire Rule

Every rarity tier needs at least one node players want to flex visually.

Examples:

- Scarred S9
- Royal Hydro Node
- Euglossa Prism Node
- BlackComb Titan
- Genesis Node
