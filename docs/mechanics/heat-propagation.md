# Heat Propagation

Heat is the core systems mechanic.

Mine the Honey should not use one global heat meter. Heat should move across rack slots, so placement matters.

## Player-Facing Rules

- Green = stable
- Yellow = warm
- Orange = throttled
- Red = danger
- Purple/black = Propolis quarantine

## Design Goal

Players should think spatially:

- Where should hot miners go?
- Which racks need cooling?
- Should a Hydro Node cool a cluster?
- Should a Bombus miner be isolated?
- Should an old S9 be salvaged or repaired?

## Miner States

| State | Effect |
|---|---|
| Stable | 100% hash |
| Hot | 75% hash |
| Throttled | 45% hash |
| Propolis | 0% hash until repaired/salvaged |
