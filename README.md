# NRI MuleSoft Standard API Template

Valid Anypoint Studio / Mule Maven project.

## Naming Convention
`<domain>-<capability>-(sys|proc|exp)-api`

Examples:
- `dayforce-sys-api`
- `payroll-proc-api`
- `mobile-exp-api`

## Structure
```text
src/main/mule/
  global.xml
  global-error.xml
  template-sys-api.xml
  implementation/
  logging/
  error/

src/main/resources/
  api/
  properties/
  secure-properties/
  log4j2.xml

src/test/munit/
```

## Included
- API YAML and RAML examples
- API fragments for errors, traits, security
- Standard correlationId / traceId logging
- Global error mapping aligned to API spec
- Secure property example
- MUnit baseline test
