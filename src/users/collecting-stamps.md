# Collecting stamps

Once connected you'll have a variety of stamps available to you that you can collect and add to your passport. 

Each Stamp flow is unique, but the underlying flow is similar: 

- The Passport app will guide you through connecting to the various identity providers (i.e. OAUTH with Google). In each flow, you will be asked to grant the Passport app access to some of your account data. 

- Once connected, the Passport app will communicate with our IAM server to issue a signed Verifiable Credential. This credential represents your ownership of that connected account, and allows others to know that your passport is the unique owner of the account you connected with. Your account details are encrypted and are not made available to those accessing your passport - only the information that you connected an account is shared - no DOXXing yourself! 

- The Verifiable Credential will be saved into your Passport and will be available to any 3rd party app where you present your passport.

Good to know: Some Identity providers have their own verification process that can take some time to complete. But once you're verified there, collecting the Stamp for that service should be quick.

If you have questions about the privacy of your data, check out our FAQ.