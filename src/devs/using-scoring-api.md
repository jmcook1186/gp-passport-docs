## Scorer API

The Gitcoin Scorer API uses scoring mechanisms to evaluate the identities of Passport holders based on their Stamps (Verifiable Credentials issued by identity providers). Different communities may have different identity and membership policies for a variety of reasons, including the size and composition of the community, its history and culture, and its goals and values.

For example, a small, homogenous community may have simple and inclusive membership policies, while a large and diverse community may have more complex and restrictive policies. A community with a strong cultural identity may emphasize maintaining traditional membership criteria, while a newer or more progressive community may be more open to changes in membership policies.

The specific identity and membership policies of a community are determined by the needs and goals of the community itself. These policies are designed to help the community maintain cohesion and achieve its objectives while providing members with a sense of belonging and inclusion.

The Gitcoin Scorer API allows developers to integrate identity verification functionality into their applications. The API provides a simple way to read and score the identities of Gitcoin Passport holders by applying scoring mechanisms to verifiable credentials.

Social organizations have a difficult time ensuring that each participant is unique: that they are in fact human (not a bot) and also a unique participant (not double counting). The Gitcoin Passport provides a solution that is decentralized and recognizes the intersectional and social nature of identity.

The Gitcoin Scorer API  is a centralized service provided by Gitcoin to make it easier to read and work with Passport scores. It is the recommended way of integrating with Gitcoin Passport. 

## API Access
This document outlines the steps required to obtain an API key and Community ID to access the Gitcoin scorer API.

The Scorer API provides programmatic access to a wallet's Passport score. Once you have your API key, you need to include it with each request you make to the API. This allows Gitcoin to identify your app and verify that you are authorized to access the API.

### Getting Your API Key
- Log in to : Go to  and log in to your account by connecting your wallet.
- Navigate to the API Keys section: After logging in, go to the "API Keys" section.
- Generate an API key: Click on the "+ Create a Key" button to generate a unique API key for your account.
- Store your X-API key securely: Store your X-API key in a secure place, as it will be used to access the scorer API.

### Communities

A community is an individual object with a unique ID that is associated with your account. If you are using the Gitcoin Scorer API in multiple applications, you can set up separate communities for each one. This allows you to customize the scoring rules for each application and deduplicate any identical Passport VCs that are submitted to the same application.

By using communities, you can manage specific parameter settings and log traffic for your Passport-enabled applications. This can help you ensure that the identity verification functionality is working correctly and meets the needs of your stakeholders.

### Getting your Community ID

- Go to [scorer.gitcoin.co](scorer.gitcoin.co) and log in to your account by connecting your wallet.
- Navigate to the Communities section: After logging in, go to the "Communities" section
- Create a Community: Click on the "+ Create a Community" button and input a community name and description.
- Click on the newly created community and you will see the community ID in the page URL i.e {community id}

### Using Your X-API Key

To access the Gitcoin Scorer API, include your X-API key in the "Authorization" header of each API request. The header should have the following format:
```sh
"X-API-KEY": "<API_key>"
```
*(Replace "<API_key>" with your actual API key.)*

For example, in a cURL request, the header would look like this:

```sh
curl -H "X-API-KEY: {API-KEY}" ​
curl -H "X-API-KEY: {API_KEY}" https://api.scorer.gitcoin.co/endpoint
```


## Status and error codes

Our API returns standard HTTP success or error status codes. For errors, we will also include extra information about what went wrong encoded in the response as JSON.

More detailed information about the API endpoints and errror and status codes can be found at the OpenAPI documentation for the [Scorer API](https://api.scorer.gitcoin.co.docs).

### HTTP Status codes

| Code | Title                 | Description                    |
| ---- | --------------------- | ------------------------------ |
| 200  | Ok                    | request was successful         |
| 400  | Bad request           | Bad request                    |
| 401  | Unauthorized          | Your API key is invalid        |
| 404  | Not found             | The resource does not exist    |
| 429  | Too many requests     | The rate limit was exceeded    |
| 500  | Internal server error | An error occurred with our API |


### Error types

All errors are returned in the form of JSON with a detail explaining the error

Example error response:

```sh
  {
    "detail": "string"
  }
```
 

| Error detail                              | Description                                                                      |
| ----------------------------------------- | -------------------------------------------------------------------------------- |
| Invalid nonce                             | The nonce used in the passport API request could not be verified                 |
| Address does not match signature          | The signer could not be verified                                                 |
| Invalid limit                             | The page limit of the Get Scores API request is greater than 100                 |
| Unable to get score for provided comunity | Unable to validate that the community belongs to the account holding the API key |
| Unauthorized                              | X-API-Key was nto specified in the header or an invalid X-API-KEY was provided   |
| Internal server error                     | Something went wrong on our end (rare)                                           |

More detailed information about the API endpoints and errror and status codes can be found at the OpenAPI documentation for the [Scorer API](https://api.scorer.gitcoin.co/docs).


## Scorer API endpoints

To use the Gitcoin Scorer API to score an Ethereum address, you need to have an account set up, a community configured, and your API keys.

This section will walk you through interacting with the specific endpoints you'll need to integrate with the Scorer API. But the API does more! For more details, check out the [API reference docs](devs/scoring-api.md).

### Getting a Wallet's Passport Score

To submit an Ethereum wallet address for scoring, follow these steps:

- Retrieve a challenge message from the scorer.
- Have the user sign the challenge.
- Submit the Ethereum address and the signed challenge to the scorer.

## Signing Message

```
GET /registry/signing-message
```

This endpoint returns a message verifying the agreement to submit your wallet address in order to score the passport and a nonce that will be used to verify the authenticity of the signed message. This endpoint is necessary if you want to require a signature while scoring.

```sh
curl --location \
    --request GET 'https://api.scorer.gitcoin.co/registry/signing-message' \
    --header 'X-API-KEY: {API KEY}' \
    --header 'Accept: application/json'
```
Example respopnse (200 OK):

```sh
{
    "message": "I hereby agree to submit my address in order to score my associated Gitcoin Passport from Ceramic.\n\nNonce: {Nonce}\n",
    "nonce": "{Nonce}"
}
```

### Submit Passport

To submit an ETH address for scoring, developers need to make an API call to the following endpoint
`POST /registry/submit-passport`

#### Payload
|---|----|--------|-----------|
|Name |Type |Required |Description|
|address|Text|True|The wallet address|
|community|Text|True|The community ID|
|signature|Text|False|Signature received from the wallet|
|nonce|Text|False|Nonce generated in the signing message. This is needed for requiring a signature before scoring|

```sh
curl --request POST 'https://api.scorer.gitcoin.co/registry/submit-passport' \
  --header 'X-API-KEY: {API KEY}' \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/json' \
  --data-raw '{
    "address": "{Wallet address}",
    "community": "{Community ID}",
    "signature": "",
    "nonce": "{Nonce}"
  }'
```
Example resposne (200 OK):

```sh
{
    "address": "{address}",
    "score": null,
    "status": "PROCESSING",
    "last_score_timestamp": "2023-02-03T12:08:21.735838+00:00",
    "evidence": null,
    "error": null
}
```

### Get Scores

Used to retrieve the score for an ETH address that has already been submitted or for addresses for a community.
To request the score of a single address:

`/registry/score/{community_id}/{address}  -  to retrieve the score for a specific address`

```sh
curl --request GET 'https://api.scorer.gitcoin.co/registry/score/{community_id}/{address}' \
    --header 'X-API-KEY: {API KEY}' \
    --header 'Accept: application/json' \
    --header 'Content-Type: application/json'
```
Example response (200 OK):
```sh
{
    "address": "{address}",
    "score": "{score}",
    "status": "DONE",
    "last_score_timestamp": "2023-02-03T12:08:21.735838+00:00",
    "evidence": null,
    "error": null
}
```
To request the scores for a community of addresses:

`/registry/score/{community_id}  -  to retrieve the score for a list of addresses in the community`

```sh
curl --location --request GET 'https://api.scorer.gitcoin.co/registry/score/{community_id}' \
--header 'X-API-KEY: {API KEY}' \
--header 'Accept: application/json' \
--header 'Content-Type: application/json'
```
Example response (200 OK)
```sh
{
    "items": [
        {
            "address": "{wallet}",
            "score": "{score}",
            "status": "DONE",
            "last_score_timestamp": "{timestamp}",
            "evidence": null,
            "error": null
        }
    ],
    "count": 1
}
```