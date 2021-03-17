## Tech Talk: Internal Routes

cloud.gov provides flexibility for controlling how traffic moves between applications. In [this tech talk](https://www.eventbrite.com/e/tech-talk-internal-routes-tickets-144475338627), you will learn how to use [internal routes](https://docs.cloudfoundry.org/devguide/deploy-apps/routes-domains.html#internal-routes) for secure, direct, container-to-container communication between applications running on cloud.gov. 

We will highlight common use cases for internal routes (including links to samples) as well as discuss the considerations you need to account for. We will demonstrate how you can improve the security posture of your applications, without changing application code, using internal routes with the [nginx buildpack](https://github.com/cloudfoundry/nginx-buildpack).

Tech talk presentation in [PDF format](presentation.pdf).

### Resources

A sample CF application used to demonstrate how internal routes work. This app can run on a public `*.app.cloud.gov` route, or on an internal `*.apps.internal` route.

A simple nginx application that can be used on a public `*.app.cloud.gov` route to proxy traffic to an app running on an internal route.

### Additional resources

* Understanding [container-to-container networking](https://docs.cloudfoundry.org/concepts/understand-cf-networking.html) in Cloud Foundry
* Creating and managing [network policies in Cloud Foundry](https://docs.cloudfoundry.org/devguide/deploy-apps/cf-networking.html#create-policies)
* Documentation for the [Cloud Foundry nginx buildpack](https://docs.cloudfoundry.org/buildpacks/nginx/index.html)