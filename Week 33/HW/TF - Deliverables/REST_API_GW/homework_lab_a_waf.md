🛡️ WAF Lab — Protecting API Gateway (ClickOps)

“We are binding protection directly to the front door.”

🎯 Objective

Attach a Web Application Firewall (WAF) to your API so that:

Malicious or suspicious requests are blocked before Lambda
Students see real security controls in action
Logs + behavior reinforce “edge-first security”

🧠 Concept First: “Right now your API trusts everyone. WAF is your first line of defense.”

🔁 Updated Request Flow: Client → WAF → API Gateway → Lambda → Logs
👉 Critical insight: If WAF blocks → API Gateway and Lambda are NEVER reached

🧱 What We’re Building
    WAF Web ACL
    Rules:
        Block obvious bad patterns
        Rate limiting (optional but powerful)
    Attach WAF to API Gateway

⚙️ Task 1 — Create Web ACL
📍 Navigation
AWS Console → WAF & Shield
Click Create Web ACL

🛠️ Configuration

        Name: chewbacca-api-waf
        Resource Type:: Regional resources
        Region: 👉 Same region as your API Gateway

Associated Resource:
Select: API Gateway
Choose your API

⚙️ Task 2 — Add Rules

We keep this simple but meaningful.

🧩 Rule 1 — AWS Managed Rule Group
Add rule → Add managed rule groups

Select: AWSManagedRulesCommonRuleSet

This blocks common attacks like:

    SQL injection patterns
    bad headers
    known malicious inputs

🧩 Rule 2 — Rate Limiting (VERY IMPORTANT)
Add rule → Rate-based rule

Configuration:

    Limit: 100 requests per 5 minutes
    Action: Block

⚙️ Task 3 — Set Default Action

    Default: Allow

Only bad traffic is blocked, everything else flows through

🚀 Task 4 — Create Web ACL

Click Create

🔍 Task 5 — Validate Behavior

Now we test like operators.

✅ Normal Request: curl "https://<api-id>/python?name=Chewbacca"

💥 Task 6 — Trigger WAF Block
Method 1 — Suspicious Input: curl "https://<api-id>/python?name=<script>alert(1)</script>"

👉 Expected: 403 Forbidden (or blocked)

Method 2 — Rate Limit (if you want drama)

Run loop: for i in {1..150}; do curl -s "https://<api-id>/python"; done

👉 Expected: Eventually blocked

🔍 Task 7 — Verify WAF Logs / Metrics
Go to: WAF → Your Web ACL → Overview

Look at:
        Allowed requests
        Blocked requests

Test:

1. Where does WAF sit?
2. What happens if WAF blocks?
3. Why is this important?
4. What kind of attacks does WAF stop?

“WAF is your bouncer. Lambda is your bartender.”

“If bad traffic reaches Lambda, you already paid for the mistake.”

“Good systems reject early and cheaply.”

🏁 Exit Criteria

Student passes when:

✔ WAF created
✔ Attached to API Gateway
✔ Managed rules active
✔ Rate limit configured
✔ Can trigger a block
✔ Can explain flow






