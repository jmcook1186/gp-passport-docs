# Scorer

Scorer is the library in the Passport SDK that allows an integrated dApp to generate a score based on the verifiable credentials stored in a Gitcoin Passport according to their own criteria and the needs of their community. 

Once the Verifier package evaluates verifiable credentials in a Passport (to ensure that they were correctly issued) the Scorer decides which VC issuers it will consider (allowing for the filtering of unknown or untrusted VC issuing services) and allows the app to assign different weights to each of the VCs to generate a passport score that reflects the trustworthiness of the user’s identity. 

The weights placed on each VC can be adjusted, which allows each app that integrates the passport to choose the Stamps they place the most trust in, as well as the stamps that are necessary to participate in the app. 

Think of Scorer as the tool that allows your community to design its own customs process: one that ensures each potential participant meets the necessary requirements and follows the correct regulations before entering your dApp.

## Scoring Mechanisms for Assessing Unique Humanity in Web3 Applications

To evaluate the unique humanity of users in web3 applications, Gitcoin has devised two scoring mechanisms - Gradual Unique Humanity Verification and Boolean Unique Humanity Verification. These mechanisms consider multiple stamps connected to a Passport holder, such as verified Twitter and Google accounts, possession of GTC or Eth, and previous participation in Gitcoin Grants. Each stamp is assigned a weight based on its significance in assessing the unique humanity of the Passport holder. These weights are used as inputs to an algorithm that calculates a Passport score for the holder.

The approach for scoring is designed to focus on interactions across a wide range of technology platforms, where the global maxima for a Passport score is quite high, making it unrealistic for real humans to achieve a perfect score. Nevertheless, these scores can still be used to grant access to partial rights, features, and other benefits to Passport holders based on their score. For instance, developers may offer access to a web app to users with a score above a particular threshold, or provide special features to power users with scores above a certain level.

The Gradual Unique Humanity Verification mechanism allows developers to assign partial rights to users based on their unique humanity score. For example, a user with a score of 30/100 may receive 30% of a full testnet Eth faucet payment, while a user with a score of 45/100 may have their votes multiplied by 45/100. Developers can customize the gradual weights in various ways to tailor their application.

The Boolean Unique Humanity Verification mechanism is aimed at preventing bot/sybil attacks and safeguarding user privacy. It involves asking users to verify a particular set of stamps, each with a specific significance in assessing their unique humanity. Users are deemed unique humans if they meet or exceed the predetermined threshold of verified stamps that reach a combined score above a certain threshold.

The algorithm used to calculate Passport scores is transparent and easily auditable. The exact formula used to calculate the score is available in the Gitcoin Scorer code base, and the scoring weight of each stamp is determined by Gitcoin's data scientists based on the identities of users in previous Gitcoin Grants rounds and other Gitcoin Passport use cases. By using these scoring mechanisms, developers can ensure that only unique humans are able to participate in their applications while still preserving the privacy of users.
