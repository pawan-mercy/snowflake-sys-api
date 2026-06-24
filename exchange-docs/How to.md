## How to Use the Template

1. Download or import the template from Exchange.
2. Rename the project using the naming standard.
3. Update the following:

    - `artifactId` in pom.xml
    - API name
    - RAML or YAML files
    - configuration properties

4. Add business logic in:src/main/mule/implementation/
5. Keep the base structure and shared components unchanged.

## Update the following for new app

**Step 1**: Review API Documentation
To get started, go to the Developer Portal and review the information.

**Step 2**: Request API Access for an Application
The first step is to register your applications with the API. At the top of the page click the “Request API access” button.

Either:
1. Select one of your existing applications (if you have already requested access for other APIs)
or
2. Add a “new application”.
Please refer the [How to Request Access?](https://docs.mulesoft.com/anypoint-exchange/to-request-access) page for more details.

**Step 3**: Access Approval
Your access request will be assessed and once approved, you will receive an email containing a link to a page in the Developer Portal that will provide a client ID and client secret that you can use to access the API.