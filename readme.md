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

Use the `.t3.cegen.yaml` file to configure the ce-gen. It's placed in the project root after you run ce-gen the first time. 

```
extension:
  name: startpilot
  path: public/typo3conf/ext/startpilot
```
