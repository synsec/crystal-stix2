# crystal-stix2

![](https://github.com/synsec/crystal-stix2/workflows/Crystal%20CI/badge.svg?branch=release%2F0.1.1)
[![](https://img.shields.io/badge/cryatsl--stix2-docs-brightgreen)](https://synsec.github.io/crystal-stix2/)

crystal-stix2 is a STIX 2.1 implementation using Crystal language. This is a work in progress and API is likely to change.

[Read crystal-stix2 docs](https://synsec.github.io/crystal-stix2/)

Structured Threat Information Expression (STIX) is a language for expressing cyber threat and observable information. This document defines concepts that apply across all of STIX and defines the overall structure of the STIX language.

STIX 2.1 documentation is available at [http://docs.oasis-open.org/cti/stix/v2.1/stix-v2.1.html](http://docs.oasis-open.org/cti/stix/v2.1/stix-v2.1.html)

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     crystal-stix2:
       github: synsec/crystal-stix2.git
   ```

2. Run `shards install`

## Usage

```crystal
require "crystal-stix2"

bundle = STIX2::Bundle.new

indicator = STIX2::Indicator.new({
      indicator_types: [
        "compromised",
        "malicious-activity"
      ],
      pattern:         "[ ipv4-addr:value = '192.0.2.0' ]",
      pattern_type:    "stix",
      valid_from:      "2019-11-26T04:34:56.715000000Z",
    })
    
indicator.name = "SSH attacker"
indicator.labels = ["malicious-activity"]
indicator.labels << ["ip-watchlist"]

malware = STIX2::Malware.new({
      malware_types: ["ransomware"],
      is_family:     false,
    })

relationship = STIX2::Relationship.new({
      relationship_type: "indicates",
      source_ref:        indicator.id.to_s,
      target_ref:        malware.id.to_s,
    })

bundle.objects << [malware, indicator]
bundle.objects << relationship

```


## Features

Below is a list of features which have been implemented:

STIX Domain Objects
- [x] Attack Pattern
- [ ] Campaign
- [ ] Course of Action
- [ ] Grouping
- [x] Identity
- [x] Indicator
- [x] Infrastructure
- [ ] Intrusion Set
- [ ] Location
- [x] Malware
- [ ] Malware Analysis
- [ ] Note
- [ ] Observed Data
- [ ] Opinion
- [ ] Report
- [ ] Threat Actor
- [ ] Tool
- [ ] Vulnerability

STIX Relationship Objects
- [x] Relationship
- [ ] Sighting

STIX Cyber-observable Objects
- [ ] Artifact Object
- [ ] AS Object
- [ ] Directory Object
- [x] Domain Name Object
- [ ] ​Email Address Object
- [ ] ​Email Message Object
- [ ] ​File Object
- [x] ​IPv4 Address Object
- [ ] ​IPv6 Address Object
- [ ] ​MAC Address Object
- [ ] ​Mutex Object
- [ ] ​Network Traffic Object
- [ ] ​Process Object
- [ ] ​Software Object
- [x] ​URL Object
- [ ] ​User Account Object
- [ ] ​Windows Registry Key Object
- [ ] ​X.509 Certificate Object

Other STIX Objects
- [x] Bundle
- [ ] Language Content
- [ ] Marking Definition

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/synsec/crystal-stix2/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Oleksii Morozov](https://github.com/jaysneg) - creator and maintainer
