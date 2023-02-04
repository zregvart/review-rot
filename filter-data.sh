#!/bin/bash
set -euo pipefail

authors='[
  "cuipinghuo",
  "joejstuart",
  "lcarva",
  "robnester-rh",
  "simonbaird",
  "zregvart",
  "ec-automation[bot]"
]'

# Assumes data from stdin!
jq --argjson authors "${authors}" -r '[
    .[] | select(
        ([.user] | inside($authors)) or
        (.url | contains("/hacbs-contract/")) or
        (.title | test("enterprise.contract"; "i"))
    )
]'
