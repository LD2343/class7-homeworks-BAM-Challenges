import json
from datetime import datetime

def lambda_handler(event, context):
    print("Incoming event:", json.dumps(event))

    name = event.get("queryStringParameters", {}).get("name", "Unknown")

    response = {
        "message": f"Hello {name} from Python!",
        "timestamp": datetime.utcnow().isoformat()
    }

    print("Response:", json.dumps(response))
    print("hello")
    return {
        "statusCode": 200,
        "headers": {"Content-Type": "application/json"},
        "body": json.dumps(response)
    }