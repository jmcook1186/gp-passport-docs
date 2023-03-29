
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
  
  You need to check for the status of the operation by calling the `/score/{int:community_id}/{str:address}` API. The operation will have finished  when the status returned is `DONE`.
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


## GET /registry/score/{community-id}/{address}

<details>
  <summary>description</summary>

  Use this endpoint to fetch the score for a specific address that is associated with a community
  This endpoint will return a `DetailedScoreResponse`. This endpoint will also return the status of the asynchronous operation that was initiated with a request to the `/submit-passport API`.
</details>

<details>
  <summary>parameters</summary>
  
  ## address
  
  required

  ```sh
  address string
  ```

  ## community_id
  
  required
  
  ```sh
  community_id int
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
  <summary>400 Bad Request</summary>

   response type is `application/json`
   
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
   
   **Example value**
  ```sh
  {
    "detail": "string"
  }
  ```
  </details>

</details>


## GET /registry/score/{community-id}

<details>
  <summary>description</summary>

  Use this endpoint to fetch the scores for all addresses that are associated with a community
  
  This API will return a list of `DetailedScoreResponse` objects. The endpoint supports pagination and will return a maximum of 1000 scores per request.
  
  Pass a limit and offset query parameter to paginate the results. For example: `/score/1?limit=100&offset=100` will return the second page of 100 scores.
</details>

<details>
  <summary>parameters</summary>
  
  ## community_id
  
  required
  
  ```sh
  community_id int
  ```


  ## address
  
  optional

  ```sh
  address string
  ```

  ## limit

  optional

  ```sh
  limit int
  ```

  ## offset

  optional

  ```sh
  offset int
  ```
</details>

<details>
  <summary>responses</summary>
  
  <summary>200 OK</summary>

   response type is `application/json`
   
   **Example value**
  ```sh
  {
    "items": [],
    "count": 0
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
  <summary>401 Unauthorized</summary>

   response type is `application/json`
   
   **Example value**
  ```sh
  {
    "detail": "string"
  }
  ```
  </details>

  <details>
  <summary>404 Not found</summary>

   response type is `application/json`
   
   **Example value**
  ```sh
  {
    "detail": "string"
  }
  ```
  </details>

</details>
