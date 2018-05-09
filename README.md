# README

## Project setup for development
1. Clone the repo `git clone git@github.com:biiishal/rails-json-api-example.git`
2. `cd rails-json-api-example`
3. Run bundle `bundle`
4. Add lines for `jsonapi-resources` gem
  ```
    config.eager_load = true
    config.consider_all_requests_local = false
  ```
5. `rails db:setup`
6. `rails s`

## API Endpoints

#### 1. Get All `parsed_content`
- **URL**
  /api/v1/parsed-content

- **Method:**
  `GET`

#### 2. Create `parsed_content`
- **URL**
  /api/v1/parsed-content

- **Method:**
  `POST`

- **Content-type**
  `application/vnd.api+json`

- **Data Params**

  **Required**
  `email=[string]`
  `url=[string]`

___

### Sample Call:

#### 1. Get all
```
curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X GET http://localhost:3000/api/v1/parsed-content
```

***Response***
```
HTTP/1.1 200 OK
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
ETag: W/"63fa56a318e29e58f1301bf236426c41"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4f7b764d-fb0c-41d8-9d57-a193c5babf78
X-Runtime: 0.007152
Transfer-Encoding: chunked
```
#### 2. Create
```
curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST -d '{"data": {"type":"parsed-contents", "attributes":{"email":"test@test.test", "url": "https://twitter.com"}}}' http://localhost:3000/api/v1/parsed-content
```
***Response***
```
HTTP/1.1 201 Created
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
Location: http://localhost:3000/api/v1/parsed-contents/44
ETag: W/"fcd18be2881b920704eba61ea362a486"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 49d29bc5-0440-42ad-bdcb-a570248d72cc
X-Runtime: 1.399454
Transfer-Encoding: chunked
```
---

### Example App:
Example app is up in heroku for testing at `https://rails-json-api-example.herokuapp.com/`

#### Sample Calls:
**1. Get all**
```
curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X GET https://rails-json-api-example.herokuapp.com/api/v1/parsed-content

```
**2. Create**
```
curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST -d '{"data": {"type":"parsed-contents", "attributes":{"email":"test@test.test", "url": "https://twitter.com"}}}' https://rails-json-api-example.herokuapp.com/api/v1/parsed-content
```