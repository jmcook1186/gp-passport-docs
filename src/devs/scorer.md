# Scorer

Scorer is the library in the Passport SDK that allows an integrated dApp to generate a score based on the verifiable credentials stored in a Gitcoin Passport according to their own criteria and the needs of their community. 

Once the Verifier package evaluates verifiable credentials in a Passport (to ensure that they were correctly issued) the Scorer decides which VC issuers it will consider (allowing for the filtering of unknown or untrusted VC issuing services) and allows the app to assign different weights to each of the VCs to generate a passport score that reflects the trustworthiness of the user’s identity. 

The weights placed on each VC can be adjusted, which allows each app that integrates the passport to choose the Stamps they place the most trust in, as well as the stamps that are necessary to participate in the app. 

Think of Scorer as the tool that allows your community to design its own customs process: one that ensures each potential participant meets the necessary requirements and follows the correct regulations before entering your dApp.