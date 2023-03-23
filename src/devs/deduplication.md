# Deduplication of Stamps

You may have noticed at this point that the passport itself does not require unique underlying account to issue a VC. This means that any number of wallets can create passports that link to the same underlying identity.

The choice here is twofold:

- 1) Binding a stamp to a wallet creates recoverability issues. What if you lose access to your wallet? The underlying stamp would be lost with it, and you wouldn't be able to link your identity providers to a new wallet

- 2) We have built Passport to support contextual identity, you may have a passport that you use within one community, and another you use elsewhere. 

Because multiple passports may use the same underlying service for generating a stamp we have added the hash field into our stamps. This hash is a unique identifier that is generated for all VCs issues by the Gitcoin IAM, and provides a unique identifier for the underlying account while preserving anonymity.

So when you're scoring, you will probably want to store the hashes and dedupe the stamps you are considering in your scoring process to avoid folks submitting the same stamp attached to multiple passports.