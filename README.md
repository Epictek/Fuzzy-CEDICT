# Fuzzy CEDICT

Basic English to Chinese Dictionary viewer for bash using the CC-CEDICT database with a choice of frontends.

Download CEDICT from https://www.mdbg.net/chinese/dictionary?page=cc-cedict

```
Usage: cedict-rofi.sh [OPTIONS] {INPUT}
-x,  --xclip          Take input from clipboard (requires xclip)
-c,  --cedit [path]   Path to cedict database (defaults to cedict_1_0_ts_utf-8_mdbg.txt)
-f,  --finder [client]  Fuzzy finder to use, options are fzf or rofi
-h,  --help           Print this help message
```
