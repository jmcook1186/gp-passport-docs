
# Gitcoin passport docs

## Basic style guide

Sketch basic principle for docs styling. Granular style guide to follow.

- active voice
- action-oriented docs ("how to make an omelette" (action-oriented) as opposed to "using eggs"(feature-oriented))
- second person narrative ("*you* can integrate passport...", "connect *your* DiD...")
- serve 3 primary user personas: beginners (what's GP?), users (familiar with web3, new to GP), devs (web3 natives, web2 -> web3)
- use [conscious language](https://github.com/conscious-lang/conscious-lang-docs)
- generally aim to conform to modular documentation specs, as defined by [RedHat](https://redhat-documentation.github.io/modular-docs/)


## Assemblies and modules

Modular documentation is organized as follows:

-Assembly (top level divider corresponding to a single *user story* that envelopes several *modules*)
    - Module - can be a *concept*, *procedure* or *reference* module


## Tasks

1) identify top level user stories relevant to our users
2) identify *concept*, *procedure* and *reference* modules relevant to each story (assembly)
3) draft content
4) identify assets required to decorate text


## User stories/assemblies

The collection of assemblies in the docs should cover the user-product lifecycle. A typical lifecycle might include:

- **Plan**
What information should be gathered and what decisions should be made (for example, design/deployment) before the customer can start installing the product?

- **Install**
How does the customer install the product on each of the supported platforms?

- **Configure and verify**
After the product is installed, what does the customer need to do to configure it to work in their environment? How do they test or verify that it is ready to put into production?

- **Develop and test**
Does the customer need to develop any custom applications to connect the product to any of their existing infrastructure?

- **Manage**
Once the product is in production, how does the customer customize and change it on a day-to-day basis?

- **Monitor and tune**
Once the product is in production, how does the customer monitor its performance in order to know when changes are needed?

- **Upgrade and migrate**
How does the customer upgrade to newer versions of the product?

- **Troubleshoot**
How does the customer fix common problems they may encounter?



## Example

For documentation on how to passport-gate an app, you could create these modules:

### Assembly: Creating a passport

- Concept modules:

    - How does a passport work?
    - Why is a passport useful?

- Procedure modules:

    - How to get a passport
    - How to collect stamps
    - How to connect your wallet to an app


- Reference modules:
  
    - tbc


### Assembly: Passport Gating

- Concept modules:

    - What are Sybils
    - What is passport gating

- Procedure modules:

    - How to integrate passport into an app
    - How to get an API key
    - How to create stamps
    - How to calculate a passport score
    - How to define a score threshold
    - How to improve user scores
    - How to handle disputes

- Reference modules:
  
    - sdk commands
    - walkthrough video?


### Assembly: Scoring integration

- Concept modules:
  
    - what is the scoring api
    - what is the scoring mechanism

- Procedure modules

    - how to use the default scorer(s)
    - how to create a custom scorer
    - how to deduplicate stamps in the scoring api

- Reference modules
    - tbc


