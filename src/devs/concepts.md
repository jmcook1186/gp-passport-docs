

## Passport Protocol

When we talk about the "Passport Protocol", we are talking about the infrastructure which enables project owners and developers to gate their project, and for web3 citizens to create their own Passport to build their decentralized identity and access Passport-gated projects.

There will be three ways for projects to integrate with the Protocol and gate their project:

- The Gitcoin Scorer API (Preferred method)
- The Passport SDK (Will be deprecated soon)
- On-chain scores (coming soon)

Web3 citizens interface with the Passport Protocol through the Passport holder dApp at [passport.gitcoin.co](passport.gitcoin.co).

## Passport-Gating

This is a shorthand for noting that a project has integrated the [Passport Protocol](devs/passport-protocol.md) (e.g. Gitcoin Scorer API) for the purpose of screening accounts to keep out bots, bad actors, or simply real people who don't meet a certain threshold of trustworthiness.

**Usage:**

- "I like how this project gated its community with Gitcoin Passport. I'm going to ask the project owner for their gating algorithm, so I can use it for inspiration."
- "Some examples of Passport-gated dApps include: Snapshot, Bankless Academy, and Gitcoin Grants."
- "Because this community is gated with Gitcoin Passport, it is able to ask for pieces of proof of not just identity via services like BrightID, but also reputation via services like POAP."

See the [Quick Start Guide](devs/quick-start.md) to learn how to gate your project.

## Stamps 

Stamps are the key identity verification mechanism of Gitcoin Passport. A stamp is a verifiable credential from an identity provider that is collected in a Passport. Stamps are provided by a variety of web2 and web3 identity authenticators including Google, Facebook, BrightID, ENS, and Proof of Humanity. Stamps given out by particular communities are a functionality that is under development. They do not store any personally identifiable information, only the verifiable credential issued by the identity authenticator.
Passport aggregates stamps and assigns each stamp a different weight according to the needs of a particular community. This weight is used to calculate the cost of forgery of an identity, a score which reflects the credibility of a potential participant’s online identity. For example, a community for developers could assign a greater weight to a Github stamp, resulting in higher scores for those who have Github stamps.

## Deduplication of Stamps

You may have noticed at this point that the passport itself does not require unique underlying account to issue a VC. This means that any number of wallets can create passports that link to the same underlying identity.

The choice here is twofold:

- 1) Binding a stamp to a wallet creates recoverability issues. What if you lose access to your wallet? The underlying stamp would be lost with it, and you wouldn't be able to link your identity providers to a new wallet

- 2) We have built Passport to support contextual identity, you may have a passport that you use within one community, and another you use elsewhere. 

Because multiple passports may use the same underlying service for generating a stamp we have added the hash field into our stamps. This hash is a unique identifier that is generated for all VCs issues by the Gitcoin IAM, and provides a unique identifier for the underlying account while preserving anonymity.

So when you're scoring, you will probably want to store the hashes and dedupe the stamps you are considering in your scoring process to avoid folks submitting the same stamp attached to multiple passports.

## Streams

Passport identity data is stored as a decentralized data stream on Ceramic. Streams are individual instances of state on the Ceramic network. They are mutable and can only be altered after receiving a transaction signed by the account that owns it. These data streams are what allow Passport data to be interoperable and portable across multiple chains and dApps.

## Reader

Reader is a library in the Passport SDK which allows an integrated dApp to read any Passport stream on Ceramic. A Passport stream contains all the identity data for a single user in a way that can be accessed across chains. Reader is how your dApp or community can view data on the verifiable credentials stored in a user’s Passport stamps without making personally identifiable information visible or accessible: it accesses the identity information stored on the Ceramic network and allows you to use it in your verification process.

## Verifier

Verifier is a library in the Passport SDK that confirms the contents of a given Passport and ensures that each verifiable credential was issued correctly. In the broader Passport evaluation process, Verifier comes before Scorer.

## Scorer

Scorer is the library in the Passport SDK that allows an integrated dApp to generate a score based on the verifiable credentials stored in a Gitcoin Passport according to their own criteria and the needs of their community. 

Once the Verifier package evaluates verifiable credentials in a Passport (to ensure that they were correctly issued) the Scorer decides which VC issuers it will consider (allowing for the filtering of unknown or untrusted VC issuing services) and allows the app to assign different weights to each of the VCs to generate a passport score that reflects the trustworthiness of the user’s identity. 

The weights placed on each VC can be adjusted, which allows each app that integrates the passport to choose the Stamps they place the most trust in, as well as the stamps that are necessary to participate in the app. 

Think of Scorer as the tool that allows your community to design its own customs process: one that ensures each potential participant meets the necessary requirements and follows the correct regulations before entering your dApp.

## Scoring Mechanisms

To evaluate the unique humanity of users in web3 applications, Gitcoin has devised two scoring mechanisms - Gradual Unique Humanity Verification and Boolean Unique Humanity Verification. These mechanisms consider multiple stamps connected to a Passport holder, such as verified Twitter and Google accounts, possession of GTC or ETH, and previous participation in Gitcoin Grants. Each stamp is assigned a weight based on its significance in assessing the unique humanity of the Passport holder. These weights are used as inputs to an algorithm that calculates a Passport score for the holder.

The approach for scoring is designed to focus on interactions across a wide range of technology platforms, where the global maxima for a Passport score is quite high, making it unrealistic for real humans to achieve a perfect score. Nevertheless, these scores can still be used to grant access to partial rights, features, and other benefits to Passport holders based on their score. For instance, developers may offer access to a web app to users with a score above a particular threshold, or provide special features to power users with scores above a certain level.

The Gradual Unique Humanity Verification mechanism allows developers to assign partial rights to users based on their unique humanity score. For example, a user with a score of 30/100 may receive 30% of a full testnet Eth faucet payment, while a user with a score of 45/100 may have their votes multiplied by 45/100. Developers can customize the gradual weights in various ways to tailor their application.

The Boolean Unique Humanity Verification mechanism is aimed at preventing bot/sybil attacks and safeguarding user privacy. It involves asking users to verify a particular set of stamps, each with a specific significance in assessing their unique humanity. Users are deemed unique humans if they meet or exceed the predetermined threshold of verified stamps that reach a combined score above a certain threshold.

The algorithm used to calculate Passport scores is transparent and easily auditable. The exact formula used to calculate the score is available in the Gitcoin Scorer code base, and the scoring weight of each stamp is determined by Gitcoin's data scientists based on the identities of users in previous Gitcoin Grants rounds and other Gitcoin Passport use cases. By using these scoring mechanisms, developers can ensure that only unique humans are able to participate in their applications while still preserving the privacy of users.

## Writer

Writer is the library in the Passport SDK that creates, reads, and updates a Gitcoin Passport. Writer allows you to create a front-end instance of Passport that is tailored to your community’s branding and onboarding or voting specifications. 

Writer essentially allows you to create a new data stream to store someone’s identity information in Ceramic without having to interact with Ceramic Network directly.

With Writer, you can issue your own verifiable credentials as well as retrieve someone’s DID from the Ceramic Network. This complements other libraries in the Passport SDK, such as Reader and Scorer, which focus specifically on assessing stamps.