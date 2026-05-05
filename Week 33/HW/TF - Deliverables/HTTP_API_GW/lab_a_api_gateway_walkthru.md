🌐 Task Flow — API Gateway (ClickOps)
🎯 Objective

Expose two Lambda functions through HTTP endpoints using API Gateway:

/python → Python Lambda

🧠 Concept Before Clicking

“Lambda does nothing until something calls it. API Gateway is how the outside world talks to your function.”

Mental model: Client → API Gateway → Lambda → Logs → Response

Key ideas:

  API Gateway = front door
  Lambda = execution engine
  Routes = decision logic

⚙️ Task 1 — Create API Gateway
📍 Navigation
AWS Console → API Gateway
Click: Create API

Choose👉 Rest API 

Click: Build (REST API)

🔗 Task 2 — Add Integrations

You’ll connect Lambda functions.

  ➤ Integration 1 (Python)
  Click Add integration
      Select: Lambda 
      Choose: chewbacca-python-lambda
      Sorry.... no Lizzo lambda... AWS Cloud isn't big enough for that.
  
  ➤ Integration 2 (Node.js)
  Click Add integration
  Select: Lambda
  Choose: chewbacca-node-lambda


🛣️ Task 3 — Configure Routes

Now define paths.

    ➤ Route 1 (Python)
    Method: GET
    Resource path: /python
    Integration: chewbacca-python-lambda

    ➤ Route 2 (Node)
    Method: GET
    Resource path: /node
    Integration: chewbacca-node-lambda

NOTE: “Routes are just pattern matching. API Gateway is deciding which Lambda to call.”

🚀 Task 4 — Deploy API
Click Next
Stage name: prod
Click Create

🌐 Task 5 — Get API Endpoint

You’ll see something like: https://abc123_yomomma_black.execute-api.us-east-1.amazonaws.com

This is your base URL.  Until you add WAF, Keisha and you momma will trouble you.

▶️ Task 6 — Test Endpoints

Python: curl "https://<api-id>.execute-api.<region>.amazonaws.com/python?name=Chewbacca"

Node: curl "https://<api-id>.execute-api.<region>.amazonaws.com/node?name=Malgus"

✅ Expected Results
Python

    {
      "message": "Hello Chewbacca from Python!",
      "timestamp": "..."
    }

Node

    {
      "message": "HELLO MALGUS FROM NODE!"
    }

🔍 Task 7 — Verify Logs (Critical)

Now we reinforce the operator mindset.

Student must:
1. Go to CloudWatch Logs
2. Check BOTH Lambdas:
    /aws/lambda/chewbacca-python-lambda
    /aws/lambda/chewbacca-node-lambda

3. Confirm:
  API Gateway triggered Lambda
  Event contains:
      query parameters
      headers
      request context

TEST: “What changed between test invocation and API invocation?”
1. What does API Gateway do?
2. What determines which Lambda is called?
3. What is the base URL vs route?
4. What happens if route is wrong?
5. What changed in the event?

End Note:

“API Gateway is not magic. It’s routing.”

“If you don’t understand the event payload, you don’t understand your system.”

“Logs tell you what actually happened, not what you think happened.”

🏁 Exit Criteria

Student passes this section when:

✔ API Gateway created
✔ Both routes working
✔ Curl/Postman requests succeed
✔ Logs confirm invocation
✔ Student explains request flow
✔ Student identifies event structure differences









