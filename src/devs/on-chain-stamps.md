# On-chain Passport data

**On-chain stamps are not available yet, but they are coming soon!**

## Why would we want stamps to be on-chain?

Smart contracts are only aware of data that lives on-chain. Gitcoin Passport data currently lives off-chain and is therefore not available to smart contracts unless it is supplied by an oracle service or bundled into transaction data, both relying on some permissioned offchain operator. Take Gitcoin Grants as an example. They are migrating from being a centralized platform to a permissionless protocol that relies heavily on coordination via smart contracts. Gitcoin Passport is an excellent choice for filtering bots and other malicious participants out of the grant rounds. However, because stamps are currently created and stored offchain, the participant filtering has to happen off chain, adding a centralized operator back into the stack.

A better solution is to create Passport scores and stamps using onchain primitives. Fully on-chain Passport data would be available to smart contracts natively, making it easier and cheaper to execute logic based on stamp data. The benefit of this is transparency and forkability - if you don't like how Gitcoin manages their funding rounds then you can fork the smart contracts and still benefit from Passport's stamp and scoring tools. Don't like Passport's scoring algorithm? Fork the contract and deploy your own version. With on chain Passport infrastructure you can be confident that all the data and tooling you need is available on Ethereum and not locked away in a centralized database or dependant upon an opaque API.


## Today's stamps

Today's Gitcoin passport stamps are stored on the Ceramic network. One of the great features of Ceramic is a tight integration with Ethereum that enables Passport holders to sign events and grant permissions straight from their Ethereum account. However, Ceramic is not part of the Ethereum blockchain - it is a peer-to-peer network in its own right. This means that Ceramic data is not accessible to smart contracts on Ethereum unless:

a) stamp data is passed to Ethereum as transaction `CALLDATA` and used in smart contract function execution
b) some oracle system is established to bring stamp data onchain

However, option a) is very expensive, and option b) requires complex decentralized infrastructure to be established first. Both options would ultimately rely on an off-chain, likely centralized, operator to generate stamp and score data off-chain so it can be added to transactions or feed stamp data to an oracle service. 

## On-chain stamps

Instead, stamps can be created using onchain web3 primitives. This way, stamp data could live on chain and be instantly accessible to smart contracts. This would enable systems such as quadratic funding, voting and access control to exist entirely on-chain.

The Passport team is currently developing a method for optionally migrating a user's stamps on-chain using the Ethereum Attestation Service. Users will have the option to mint all their off-chain data on-chain in a signle click. It is likely this will deploy on Ethereum Mainnet and also a selection of Layer 2s so that gas costs are minimized.

## Timeline

The Passport team are currenty testing the necessary smart contracts on the Sepolia testnet. Watch this space for details about the Mainnet launch!


## Why isn't Passport on-chain by default?

On-chain stamps have not yet been rolled out, and when they are they will be opt-in. There are several reasons for this. First, it is expensive to migrate a stamp on Ethereum Mainnet, and deploying to a Layer 2 first requires decisions about which Layer 2(s) to prioritize, and how to ensure consistency across multiple chains. While on-chain stamps are in their infancy, the off-chain stamp is useful as a single source of truth that on-chain stamps can verify against. Today, as the migration on-chain is relatively nascent, it is helpful to be able to iterate quickly on design decisions using an off-chain model.


Regarding Ceramic
- this was the first (and only backend) we have used for a few seasons, until Ceramic was not able to take our load any more
- right now Ceramic is a secondary storage. I guess we are waiting to see if Ceramic will improve performance and reliability, and maybe we could switch back to this as being our primary storage in the future (but this depends on many factors).

Yes, the attestation could be the stamp. But:
- it costs ~44 USD to bring 1 stamp on-chain on mainnet (with the first version of our implementation. So it is expensive.
- also, given the number of chains in the ecosystem (mainnet, OP, ARB, etc ...) the off-chain stamp still plays the role of the "single source of truth" and that stamp can be ported on-chain wherever the user will want it (and on whatever network we'll support). 

The end-game: this depends on the users.
- if storing everything on-chain would be simple and cheap, then this would be the ideal outcome: just store them on-chain and have everybody interact with it
- but the ecosystem is kind of messy right now, with all the chains that there are out there. Even answering the question: to which chain to we want to bring our stamps is difficult, because different integrators would have different preferences. We'll need to support multiple chains, and keeping them in sync, will also be a challenge (and will cost gas).
- also given that most of the integrators have not really requested on-chain stamps, the easiest and fastest way to move forward and build stuff remains Web2 (and also cheapest for our users)





## notes

mint a soulbound token witht he passport score embedded

but what about changing the scoring mdoel?


we dont have privacy, censorsihp resistance etc
hve to trust gitcoin's a to have honestly minted stamps

if you are able to pay gas, you'll be able to use your passport
transparent rules for participation
forkable application logic
sep by step nabling smart contract developers to create accountable gated apps

eas - 

updating a contract means updating contrat state - pay gas

migrate stamps into eas then on chain
update stamps

not storing all vc data onchain, but subset of fields - dont need signatures, do need 
have to trust gitcoin as issuing entity


warning about coming update to composeDB
will coincide with updating json schema for stamp data


stampwise checking


tally.xyz and gc grants team want to use onchain stamps
tally do all their voting and execution on chain - they want to do this with onchain stamps
gc want to give option to work onchain fr gitcoin grants
optimism say they want it but not sure why except for filling blockspace

add an interest form and reach out to help build use-cases
certainly mainnet, maybe a rollup probably arbitrum but not sure
gas is difficult

