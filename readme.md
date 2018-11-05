# Content Element generator for startpilot

## Usage:

The "startpilot" extension is required to run this script!
Alwas run the script from your project root (depending on your composer.json bin-dir)

If your config looks like this: 

```
  "config": {
    "bin-dir": "."
  }
```
use: `sh ce-gen.sh` 

If you haven't set the bin-dir (default):

use: `sh vendor/bin/ce-gen.sh`

**!! do not cd into vendor/bin/ and run it there !!**

## Dependencies

gettext
```
brew install gettext
brew link --force gettext
```
