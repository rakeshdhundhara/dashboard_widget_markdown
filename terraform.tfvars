dashboard = {
  "dash-1" = {
    name        = "Dashboard_Markdown-01"
    permissions = "public_read_only"
    pagename    = "Page 1"
    "widget_markdown" = {
      "0" = {
        title            = "Markdown Widget 01"
        row              = 1
        column           = 1
        width            = 6
        height           = 4
        markdown_content = "Data represent a snopshot every 60s, not an average of that duration\n\n90th percentile of 10 minutes, eliminates the highest value in that period\n\nDoes System vs User Percentage matter? Servers holding the tag CT_spc_MID_SQL are excluded\n\n---\n\n# Configuration according to Alert Policies:\n\nWindows:\n\n- WARN: >75% for 30 minutes (#fcff42, yellow line)\n- CRIT: >95% for 60 minutes (#ff4242, red line)\n\nLinux:\n\n- WARN: >75% for 20 minutes\n- CRIT: >95% for 60 minutes"
      },
      "1" = {
        title            = "Markdown Widget 02"
        row              = 1
        column           = 7
        width            = 6
        height           = 4
        markdown_content = "1.Customer enters the details and proceeds to pay.\n\n2.New Checkout makes a call to the Payment Service via the endpoint. Each payment method has its own gateway and it is per storename. `Initpayment-Initialize`.\n\n3.If the payment gateway successfully authorizes the payment, a response is sent back to the Payment Service saying success:true. This happens in real-time and might via a callback. Options are Accepted, Not Accepted, Manual Review.\n\n4.If Accepted or in Review, Payment Service makes a request to MESH Platform via Internal API and asks MESH to create the order with the correct Status (Paid, In Review, etc.).\n\n5.MESH Platform creates the order and also writes it to RabbitMQ which sits on the Kubernetes. RabbitMQ is written to so that data can be sent to various systems such as MESH Metrics and Elasticsearch (used by MESH Control).\n\n6.MESH Platform then responds back to the Payment Service via Internal API to confirm that the order has been created.\n\n7.Payment Service then tells the new Checkout that the order has been created and the customer will be shown the Order Confirmation Page.\n\n8.If it was in review in step 3, once review is completed, Adyen will send a callback to Kubernetes endpoint and NOT the payment service. This message then goes to the SCS queue and those messages will be sent to the notifications endpoint on the Payment Service to be processed. That will then.\n\n---\n\n# Note: Desktop and Mobile sites talk to the Payment Service via the internal API. Apps go through the same process but talk to Payment Service directly via the hostname https://paymentservice.eks.jdgroupmesh.cloud which is public\n\n---\n\n# At point 6, the payment sites and the new checkout only wait for 25 seconds for a response from MESH Platform. Any longer than this and the customer will see a 'Redirection Error' error message and point 7 will never happen.\n\n---\n\n**Other points to note**\n\n- No genuine requests to endpoints should be blocked. This endpoint is used by the Payment Ingestor Service (SCS Queue) which can be seen here to notify the Payment of any Adyen and MdPay/Razerpay callbacks. If these are blocked or error (IE: non-200), it could lead to orders not processing. Requests point to this AKOOL SVC exists in Creaunce called Payment service it will mean no requests to be blocked."

      }
    }
  }
}
