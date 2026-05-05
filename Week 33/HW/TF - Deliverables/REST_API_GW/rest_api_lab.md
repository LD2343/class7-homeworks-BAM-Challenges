Okay.... let's do this the painful way.---> “REST API is verbose on purpose. It forces you to understand the plumbing.”

Client → Resource → Method → Integration → Lambda → Logs

What REST API Forces You To Understand

Unlike HTTP API, REST API makes you define:

    Resource → path (/python)
    Method → HTTP verb (GET)
    Integration → backend (Lambda)
    Deployment → publish changes

Task 1 — Create REST API

    📍 Navigation
    AWS Console → API Gateway
    Click Create API ---> REST API (NOT HTTP API)
    Endpoint Type: Regional
    Name: chewbacca-rest-api

Task 2 — Create Resources (Paths)

    Create /python
        Click Actions → Create Resource
        Resource Name: python
        Resource Path: /python
    Create /node
    Same process:
        Resource Name: node
        Path: /node

Task 3 — Create Methods

For /python
    Select /python
    Click Actions → Create Method
    Choose: GET

  Integration
    Integration type: Lambda Function
    Select: chewbacca-python-lambda
    Click Save

Repeat for /node
Connect to: chewbacca-node-lambda

Task 4 — Lambda Permissions

    “Add permission to Lambda?”
    Click: OK
    Remember: API Gateway must be allowed to invoke Lambda

Task 5 — Deploy API (MOST COMMON POINT of Frustration)

    “If you don’t deploy, your API does not exist.”
    Click: Actions → Deploy API
    Configure:
        Deployment stage: New Stage
        Stage name: prod

Task 6 — Get Invoke URL

    You’ll get: https://<api-id>.execute-api.<region>.amazonaws.com/prod

Task 7 — Test API

Chewbacca Python: curl "https://<api-id>.execute-api.<region>.amazonaws.com/prod/python?name=Chewbacca"
Chewbacca Node:  curl "https://<api-id>.execute-api.<region>.amazonaws.com/prod/node?name=Malgus"

Task 8 — Verify Logs
Go to CloudWatch
Find:
    /aws/lambda/chewbacca-python-lambda
    /aws/lambda/chewbacca-node-lambda