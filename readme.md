# Content Element generator for startpilot

## Usage:

Be sure u use a "starpilot" Provider extension that contains the folowing changes:  
[Startpilot commit #716682418a205a4691e076043026c70fa74cd273](https://github.com/misterboe/startpilot/commit/716682418a205a4691e076043026c70fa74cd273)

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

## Requirements

### JQ
> jq is a lightweight and flexible command-line JSON processor.

`brew install jq`

https://stedolan.github.io/jq/download/

