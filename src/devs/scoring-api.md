
# Scorer API

## GET /registry/signing-message

<details>
  <summary>description</summary>
    Use this API to get a message to sign and a nonce to use when submitting your passport for scoring.
</details>

<details>
  <summary>parameters</summary>
    None
</details>

<details>
  <summary>responses</summary>

  <details>
    <summary>200 OK</summary>

  response type is `application/json`
  
  **Schema**
  
  ```sh
  SigningMessageResponse{
      message*    string
      nonce*  string
  }
  ```
  
  **Example value**
  
  ```sh
  {
  "message": "string",
  "nonce": "string"
  }
  ```
  </details>
  
  <details>
    <summary>400 Bad request</summary>
  
  response type is `application/json`
  
  **Schema**
  
  ```sh
  ErrorMessageResponse{
  detail*	string
  }
  ```
  
  **Example value**
  
  ```sh
  {
  "detail": "string"
  }
  ```
  </details>

  <details>
  <summary>401 Unauthorized</summary>
  
  response type is `application/json`
  
  **Schema**
  
  ```sh
  ErrorMessageResponse{
  detail* string
  }
  ```
  
  **Example value**
  
  ```sh
  {
  "detail": "string"
  }
  ```
  </details>
  </details>


## POST /registry/submit-passport

<details>
  <summary>description</summary>
Use this API to submit your passport for scoring.

This API will return a `DetailedScoreResponse` structure with status `PROCESSING` immediately while your passport is being pulled from storage and the scoring algorithm is run.

You need to check for the status of the operation by calling the `/score/{int:community_id}/{str:address}` API. The operation will have finished when the status returned is `DONE`.
  </details>

<details>
  <summary>parameters</summary>
  None
  </details>

<details>
  <summary>request body</summary>
  
  **Example value**

  ```sh
  {
    "address": "string",
    "community": "string",
    "signature": "",
    "nonce": ""
  }
  ```
  </details>

<details>
  <summary>responses</summary>

  <details>
    <summary>200 OK</summary>

   response type is `application/json`

   **Example value**
   ```sh
   {
   "address": "string",
   "score": "string",
   "status": "PROCESSING",
   "last_score_timestamp": "string",
   "evidence": {
       "type": "string",
       "success": true,
       "rawScore": 0,
       "threshold": 0
   },
   "error": "string"
   }
   ```
  </details>
  
<details>
  <summary>400 Bad request</summary>

   response type is `application/json`

   **Example value**
   ```sh
   {
   "detail": "string"
   }
   ```
  </details>

<details>
  <summary>401 Unauthorized OK</summary>

   response type is `application/json`
   
   **Example value**
   ```sh
   {
   "detail": "string"
   }
   ```
  </details>

<details>
  <summary>404 Not found OK</summary>

   response type is `application/json`
   
   **Example value**
   ```sh
   {
   "detail": "string"
   }
   ```

  </details>

</details>

 https://api.scorer.gitcoin.co/docs#/