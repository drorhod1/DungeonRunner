# Dungeon runner - PoC Edition

**`THIS IS A PROOF OF CONCEPT`**

**`REQUIRES ORBWALKER CLEAR TOGGLED ON AND BLOCK ORBWALKER MOVEMENT ENABLED`**

## Overview

Dungeon runner is a Lua-based script designed to automate the infernal hordes. This guide provides a high-level overview of the directory structure, core components, and the task manager's role. It also lists the `shouldExecute` functions for each task in the `/tasks` directory to help new developers understand and contribute to the project.

Current Features
- **`Can only run Dead Man's Dredge at the moment as Proof of Concept`**
- **`Go into the dungeon and then enable it`**
- **`Will stop moving after killing dungeon boss`**

## To-Do

- **`Add more dungeons and more logic`**

## Known issues

- Can get stuck from random treasure chest
- Explorer can ended up walking backwards and become funny
- Approximately 90% chance of completing the dungeon