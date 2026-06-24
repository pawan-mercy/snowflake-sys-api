# NRI MuleSoft System API Template

Reusable MuleSoft System API template for NRI-standard Mule 4 API development.

This template provides a governed starting point for developers so new APIs are created with consistent structure, logging, error handling, API fragments, secure properties, and MUnit baseline tests.

---

## 1. Purpose

This template must be used when creating a new MuleSoft System API.

It avoids developers creating blank Mule projects and ensures every API starts with the approved NRI baseline.

Valid Anypoint Studio / Mule Maven project.

## 2. Naming Convention
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

## 3. Included
- API YAML and RAML examples
- API fragments for errors, traits, security
- Standard correlationId / traceId logging
- Global error mapping aligned to API spec
- Secure property example
- MUnit baseline test
