---
layout: post
title: Improving NFTs and ERCs
date: 2022-10-25
categories: [NFT, ERC, EIP, Ethereum, Thoughts]
---
## 🔍 Overview
NFTs which are defined in [ERC-721](https://eips.ethereum.org/EIPS/eip-721) have been around since the start of 2018. It was largely built off [ERC-20](https://eips.ethereum.org/EIPS/eip-20), but allows for each token to be non-fungible. Since each token is unique they can contain metadata to describe them. Another NFT type is [ERC-1155](https://eips.ethereum.org/EIPS/eip-1155) which allows both fungible (ERC-20) and non-fungible (ERC-721) tokens to exist within a single contract.

ERC-721 and ERC-1155 are great core concepts and specifications, however as the NFT ecosystem grows and seeks to entangle with external systems there leaves something to be desired. It has been almost 5 years since ERC-721 was introduced and in that time many things have changed, but the standard for NFTs has not. 

Just as with any technology we need to improve so it may reach it's full potential. As much as I love the commodore 64, I'm happy I have the computer I have today.


## 💢 Metadata Extensibility
One of the important aspects of NFTs is the ability for tokens to have additional data. This includes: images, videos, music, code, and text. It allows for them to be completely unique and customized for any need. The way this data is included into a NFT is through metadata. Metadata is described and defined in both the ERC-721 and ERC-1155 specification.

The ERC-721 metadata JSON Schema:
```json
{
    "title": "Asset Metadata",
    "type": "object",
    "properties": {
        "name": {
            "type": "string",
            "description": "Identifies the asset to which this NFT represents"
        },
        "description": {
            "type": "string",
            "description": "Describes the asset to which this NFT represents"
        },
        "image": {
            "type": "string",
            "description": "A URI pointing to a resource with mime type image/* representing the asset to which this NFT represents. Consider making any images at a width between 320 and 1080 pixels and aspect ratio between 1.91:1 and 4:5 inclusive."
        }
    }
}
```
The ERC-1155 metadata JSON Schema:
```json
{
    "title": "Token Metadata",
    "type": "object",
    "properties": {
        "name": {
            "type": "string",
            "description": "Identifies the asset to which this token represents"
        },
        "decimals": {
            "type": "integer",
            "description": "The number of decimal places that the token amount should display - e.g. 18, means to divide the token amount by 1000000000000000000 to get its user representation."
        },
        "description": {
            "type": "string",
            "description": "Describes the asset to which this token represents"
        },
        "image": {
            "type": "string",
            "description": "A URI pointing to a resource with mime type image/* representing the asset to which this token represents. Consider making any images at a width between 320 and 1080 pixels and aspect ratio between 1.91:1 and 4:5 inclusive."
        },
        "properties": {
            "type": "object",
            "description": "Arbitrary properties. Values may be strings, numbers, object or arrays."
        }
    }
}
```
**There is also support for metadata localization within the ERC-1155 spec*

These are a great as a base specification, but they do not allow for extensibility in the future. This leads to the systems that utlize them (i.e marketplaces, games, galleries, etc.) to create their own specifications outside of the standard. As more systems are created with different needs and requirements, the more system specific specifications are created. This leads to a lack of consensus about the metadata standard and what is expected across web3.

One example of system specific NFT metadata can be found on OpenSea, which includes additional fields only utilized by their system and are not included in the JSON Schema of the ERC-721 or ERC-1155 standard.
![OpenSeaMetadata](/assets/images/os-metadata.png)
These additions were added into OpenSea early into the their inception and they were one of the few marketplaces in existence at the time. Now there are many other marketplaces and systems that rely on these properties even though they do not officially exist within the standards. As more systems are created and create their own properties, the further away from the ERC specification we get and the harder it is to implement client specific schemas.

✨**Solution Idea**✨

If we want NFT metadata to be easily extended into the web3 ecosystem there needs to be a way of communicating system specific properties that are extended past the core specification. The "JSON Schema" specification includes a `$id` property to be used as a unique identifier for each schema such as:

`{ "$id": "http://yourdomain.com/schemas/myschema.json" }`

By including this into the core specification or as a system specific specification, a system can define their own schema while allowing other systems to read and create NFTs that conform to their specifications.

## 💢 ERC Obsoletion
An EIP (Ethereum Improvement Proposal) is a way to request for changes to Ethereum. An ERC (Ethereum Request for Comments) is a sub category of EIPs for application-level changes that have been approved and have reach finality.
We can see the different stages of an EIP below: 
![EIPLifeCycle](/assets/images/EIP-lifecycle.jpg)

ERC-721 & ERC-1155 are both in the final stage which is defined as:
>Final - This EIP represents the final standard. A Final EIP exists in a state of finality and should only be updated to correct errata and add non-normative clarifications.

This is great because we know that these specifications will never change, but its also detrimental that they can not include improvements. Many of the protocols and systems we use today rely on improvements (like Ethereum 2.0, Web3, and solidity) to future-proof itself from becoming obsolete. In the case of EIPs however we cannot introduce any additive changes that allow improvements or malleability for future ecosystems. As great as NFTs are within smaller communities, its ability to scale is hindered by the restrictions of its core directives and inability to update and adapt.

Any improvements that wish to be made are either done on the applications themselves (i.e metadata) or through endless extensions that may or may not be supported across different applications. One example of this is "[EIP-2981](https://eips.ethereum.org/EIPS/eip-2981): NFT Royalty Standard" which can be defined as:
> This standard allows contracts, such as NFTs that support ERC-721 and ERC-1155 interfaces, to signal a royalty amount to be paid to the NFT creator or rights holder every time the NFT is sold or re-sold.

Although it is not part of the core specification, it is optionally used by many systems. There is also many other extensions like this which can be found in extensions directory of [OpenZeppelins Github](https://github.com/OpenZeppelin/openzeppelin-contracts/tree/master/contracts/token/ERC721/extensions). As more extension EIPs are introduced, the more disconnected external systems become as they try to keep track of the optional functionality that is not inheirtly found in the core specification. 

✨ **Solution Idea** ✨

Semantic Versioning of ERCs. If ERCs were upgradable it would allow for incremental improvements that improve usability amongst future applications. SemVer which is is expressed like `1.32.54` is read as follows.
```json
<valid semver> ::= <version core>
                 | <version core> "-" <pre-release>
                 | <version core> "+" <build>
                 | <version core> "-" <pre-release> "+" <build>

<version core> ::= <major> "." <minor> "." <patch>
```
>- MAJOR version when you make incompatible API changes
>- MINOR version when you add functionality in a backwards compatible manner
>- PATCH version when you make backwards compatible bug fixes

One caveat is when it comes to major versions, as we want all changes to an ERC to be backwards compatible. To mitigate this issue, major versions should be introduced as a new EIP.

An example of this using ERC-721 and extensions could be:

```
ERC-721.1.0 - Standard ERC-721
ERC-721.2.0 - Added in royalty standard
ERC-721.3.0 - Added in burning ability
ERC-721.3.1 - Make royalities optional
---
ERC-9234.1.0 - ERC-721 with removed approvals
```

## Final Thoughts
ERC-721 is a great foundation and has opened the doors to many new possibilities with blockchain technology, digitial collectables, marketplaces, and communities. However, it is not perfect and like all technology it must improve upon itself to avoid becoming obsolete. Instead of ignoring these issues and saying GM hoping bags will go up, actual changes need to be made to expand usability and drive more value into the ecosystem.
