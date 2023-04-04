# Reading a passport

The passport-sdk includes a `Reader` package that you can use to easily read data from a user's passport. 


## import sdk-reader
```tsx
import {PassportReader} from '@gitcoinco.passport-sdk-reader'

const reader = new PassportReader("https://ceramic.passport-iam.gitcoin.co", "1")

useEffect(() => {
    async function getData() {
    const passport = await reader.getpassport(data.address)
    console.log(passport)
  }
  getData()
}, [data])

```