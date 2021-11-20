# Install ldid Github Action

Installs `ldid` from the Github Releases.

Designed to load binaries from the [`ProcursusTeam/ldid`](https://github.com/ProcursusTeam/ldid) repo, but you can use a different one.
See `action.yml`.

## Usage

```yaml
on: [push]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: MOZGIII/install-ldid-action@<action-version>
        with:
          tag: v2.1.5-procursus2
      - run: ldid
```

Replace the `v2.1.5-procursus2` with the `ldid` version you'd like to pin.
