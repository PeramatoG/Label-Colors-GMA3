# Label Colors for grandMA3

Label Colors is a grandMA3 Lua plugin that reads RGB values from Color Preset Pool (4), finds the nearest color name from a selectable table (HTML, Basic, filters or extended lists) and labels each preset with that name.

> **Tested scope:** the plugin has been tested with Universal Color presets stored as RGB in Pool 4. Other color modes (CMY/HSV/CT) or non‑Universal presets may need adjustments to the extractor.

## Features

- Choose **First** and **Last** preset by index (numbers only, without the `4.` prefix).
- Select which **Color table** to use:
  - HTML colors (CSS named colors).
  - Basic color set (compact palette).
  - Optional Rosco and LEE filter lists.
  - Optional extended **30k** color list for very fine‑grained naming.
- Finds the nearest color name using a squared‑distance metric in **linear sRGB**.
- Auto‑labels each non‑empty preset with the chosen name: `Label Preset 4.X "Name"`.
- Reads preset content via `GetPresetData` only (does not touch the Programmer).

## Requirements

- grandMA3 console or onPC with Lua and `GetPresetData` available.
- Color presets stored in Color Preset Pool (4) as **Universal** RGB presets.

## Installation

You can either embed the plugin code into the showfile or reference external `.lua` files.

### Option A — All code stored inside the showfile

1. Open the **Plugin Pool**.
2. Edit an empty plugin slot.
3. Add a Lua component and paste the contents of `LabelColors.lua`.
4. (Optional) Add extra Lua components in the same plugin for:
   - `LabelColors_HTML.lua`
   - `LabelColors_ROSCO.lua`
   - `LabelColors_LEE.lua`
   - `LabelColors_30K.lua`
5. Store the plugin and give it a name (for example `Label Colors`).
6. Store the showfile.

### Option B — Import `.lua` from USB / library

1. Copy `LabelColors.lua` (and any optional `LabelColors_*.lua` files) onto a USB drive under `gma3_library/datapools/plugins/`.
2. In the Plugin Pool, edit an empty slot and use **Import** to bring in `LabelColors.lua`.
3. (Optional) Import additional components for the ROSCO/LEE/30k tables.
4. Store the plugin and the showfile.

### Option C — Reference an external `.lua` file

1. Place `LabelColors.lua` on an internal drive or USB under `gma3_library/datapools/plugins/`.
2. Edit a plugin in the Plugin Pool and set **FileName** to `LabelColors.lua`.
3. Keep any optional `LabelColors_*.lua` files in the same folder and reference them as additional components.
4. When you update the external file, run `ReloadAllPlugins` to reload the code.

## Optional color tables

The repository includes several optional tables that can be added as extra components in the plugin:

- `LabelColors_HTML.lua` – CSS/HTML named colors table (also used as the default named‑color set).
- `LabelColors_ROSCO.lua` – Rosco filter list.
- `LabelColors_LEE.lua` – LEE filter list.
- `LabelColors_30K.lua` – extended list with around **30,000** color names.

> **30k performance note:** The 30k list is significantly heavier than the others. Using it on large preset ranges will take more time to finish, especially on a console. Prefer using it either onPC or on smaller ranges if you are in a hurry.

Import any of these as separate Lua components in the same plugin to expose new palette choices in the **Color table** selector.

## Usage

1. Run the **Label Colors** plugin from the Plugin Pool.
2. In the dialog:
   - Enter **First Preset** and **Last Preset** (examples: `1` and `50`). Do **not** include the `4.` prefix.
   - Choose the **Color table** (HTML, Basic, ROSCO, LEE, or 30k, depending on what you have installed).
3. Confirm with **Ok**.
4. The plugin:
   - Iterates through the requested preset range in Pool 4.
   - Reads RGB values via `GetPresetData`.
   - Computes the nearest color name in the selected table.
   - Prints the match in the System Monitor and renames each non‑empty preset.

If a preset is empty or does not contain valid RGB data, the plugin prints a message and skips it.

## How it works (short overview)

- Retrieves each preset handle from `DataPool().PresetPools[4][i]`.
- Calls `GetPresetData(handle)` to obtain a nested Lua table with feature data.
- Locates `ColorRGB_R`, `ColorRGB_G`, `ColorRGB_B` `absolute` values (0..100), converts them to 0..255.
- Converts RGB values to linear sRGB and computes squared distance to each entry in the selected color table.
- Picks the name with the smallest distance and applies `Label Preset 4.X "Name"`.

## Notes & limitations

- Designed and tested for **Universal Color** presets in Pool 4, stored as RGB.
- Other color modes (CMY/HSV/CT) or non‑Universal presets may require extending the extractor.
- Named colors (HTML, Basic, filters and 30k list) are descriptive and may not match the naming conventions of your show.
- When using the 30k table, expect longer processing times on large preset ranges.

## Customization ideas

- Adjust the Basic palette to create a small, predictable set of names.
- Add a distance threshold to skip renaming when the best match is too far from the original color.
- Add a mode switch (e.g. via a selector) to choose between:
  - Only printing matches.
  - Printing and renaming presets.

## Versioning

- **2.0.0**
  - Optional ROSCO, LEE and extended 30k tables as separate components.
  - Updated documentation and installation options.
  - Performance notes and warnings for the 30k palette.
- **1.0.0**
  - Initial public release of Label Colors for grandMA3.

See `RELEASE_NOTES_v2.0.0.txt` for a detailed changelog.

## License & credits

- Copyright © 2025.
- Licensed under the MIT License (see `LICENSE`).
- Developed by **Peramato** (Label Colors for grandMA3).
