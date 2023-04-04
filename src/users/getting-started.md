
# Getting started for developers

Gitcoin passport is a decentralized record of identity linked to your Ethereum address. It is used to store stamps. Stamps are evidence that you are a real, individual human being. Stamps are added to the passport when a user proves they have some specific credential from across web2 or web3. Examples include a Twitter account, Google account, Discord, ENS domain name, Proof-of-humanity and staked GTC token.

The Gitcoin Passport is a piece of JSON data that includes a `stamps` array containing objects specific to each stamp. This data is saved to a Decentralized Identifier (DID) in the DiD datastore on the Ceramic network. It can be retrieved by querying your Ethereum address in Ceramic's DID datastore.

```json
{
    "issuanceDate": "2023-04-12T12:30:28.636Z",
    "expiryDate": "2024-04-12T12:30:28.636Z",
    "stamps": [
        {
            "provider": "Ens"
        }
    ]
}
```

## The stack

Gitcoin passport app (oss)
storage layer (ceramic)
data standards (did and vc)
gitcoin passport authority server (iam) (oss)
gitcoin scoring service (coming soon)


the passport is a piece of json data that includes a `stamps` array that contains objects specific to each stamp. this data is linked to a specific ethereum address.

applications can load passports using an ethereum address and query the stamps inside. This


ceramic is a decentralized storage network. It includes a DiD datastore


- what are the basic prerequisites? 
- what are the relevant packages/backends?
- what is the passport-sdk?
- what is in the reader-sdk?