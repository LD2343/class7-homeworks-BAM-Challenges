Lab Explanation

This lab introduces students to a basic serverless API pattern in AWS using API Gateway, Lambda, and CloudWatch Logs. The goal is to show that a client can send an HTTP request to an API endpoint, API Gateway can route that request to a Lambda function, and the Lambda function can process the request and return a response without the student managing any servers.

The lab uses two Lambda functions written in different languages so students understand that AWS Lambda is not “a Python thing.” It is a runtime-based execution model that supports multiple languages and lets teams choose the right tool for the job. This helps break the common beginner assumption that cloud automation and serverless work are tied to a single programming language.

The use case is intentionally simple and easy to remember: a request is sent with a name, and each Lambda responds in its own way. One may return a greeting with a timestamp, and the other may return a transformed version of the input. This keeps the cognitive load low so students can focus on the architecture, request flow, and operational visibility.

The lab also introduces logging as a first-class operational skill. Students will not just see that the API works; they will learn to verify what happened by checking CloudWatch logs. This is important because real cloud work is not just writing code. It is being able to observe behavior, troubleshoot errors, and explain system flow.

In short, this lab teaches a foundational pattern:

Client → API Gateway → Lambda → CloudWatch Logs

That pattern appears again and again in real environments, even when the business logic becomes much more advanced.

Purpose of the Lab

The purpose of this lab is to help students understand the core mechanics of event-driven serverless architecture in AWS. More specifically, the lab is designed to help students:

1. Learn how API Gateway exposes an HTTP endpoint to users or applications.
2. Learn how Lambda executes code in response to API requests.
3. Understand that multiple programming languages can be used for serverless functions.
4. Practice reading and interpreting CloudWatch logs.
5. Build confidence with a simple but real cloud integration pattern.

This lab is not about building a large application. It is about helping students build a correct mental model of how requests move through AWS managed services.

Your Benefit

1. You learn a real AWS pattern early

This is not a toy concept. API Gateway and Lambda are used constantly in production for:

    internal tools
    lightweight APIs
    webhook handlers
    automation endpoints
    microservices
    security and compliance workflows

So even though the lab is simple, the pattern is very real.

2. You stop thinking cloud means “just VMs”

A lot of beginners assume cloud work is mainly about launching EC2 instances. This lab shows them another model:

    no server provisioning
    no OS patching
    no daemon management
    no capacity planning at the beginning

That helps widen their architectural thinking.

3. You see that programming language is not a single dependency

Using two different Lambda runtimes teaches a very valuable lesson:

    In cloud engineering, the important thing is often the integration pattern, permissions, events, logging, and operational behavior — not loyalty to one language.

This helps students become more flexible and less intimidated if they are not strong in Python.

4. You begin building troubleshooting instincts

A student who only sees “it worked” learns very little. A student who checks the logs learns how operators think.

This lab helps students begin asking:

    Did the request reach the function?
    What did the event look like?
    What did the function return?
    If it failed, where do I look first?

That is the beginning of real platform and cloud operations judgment.

5. This develops your SpeachOps

After this lab, a student can honestly say something like:

    “I built a serverless API in AWS using API Gateway and Lambda, used multiple runtimes, and validated request flow and function behavior through CloudWatch logging.”

That is a real, respectable early-career talking point.

