# Demo

Demonstrates the use of internal routes. The demo uses NGINX to proxy requests to a backend app. The flow of the demo is:

1. Run sample app on an external route
2. Map internal route, unmap external route
3. Deploy nginx on external route with no filtering
4. Add network policy

Therefore, you talk track would be:

1. Show the app on an external route in a browser
2. Show available domains including `apps.internal`. Describe moving it to an internal route. Show it is no longer accessible.
3. Deploy nginx as the "frontend". Show it is now yet accessible b/c of a lack of policy (502 error).
4. Add a network policy and show it can now access the backend app.


## Prerequisites

The demo is scripted with demo-magic to make it easy and repeatable. To ensure no complication with licenses, clone the following repos locally:

- Demo Magic: https://github.com/paxtonhare/demo-magic.git
- Sample App: https://github.com/cloudfoundry-tutorials/sample-app.git

## Configuration

Configuration is provided via the `demo.cfg` file in this directory. Review and update the config to ensure it matches your environment.

## Running the demo

The demo will set itself up by deploying the sample app to save time. Before you are ready to demo:

1. Login and target an org/space
2. Run `demo.sh`. The demo script will first deploy the sample app on an external route. The script will run a `clear` when the demo is ready (hiding the push output).