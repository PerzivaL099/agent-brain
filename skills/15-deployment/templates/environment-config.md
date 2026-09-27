# Environment Configuration

| Variable Name | Description | Development | Staging | Production | Secret? |
|---|---|---|---|---|---|
| `PORT` | Application listener port | `3000` | `8080` | `8080` | No |
| `NODE_ENV` | Runtime environment | `development` | `production` | `production` | No |
| `DATABASE_URL` | Connection string | `localhost:5432` | `[STG_DB]` | `[PROD_DB]` | Yes |
| `API_KEY` | Third-party service key | `mock_key` | `[STG_KEY]` | `[PROD_KEY]` | Yes |

## Feature Flags
| Flag Name | Description | Staging Status | Prod Status |
|---|---|---|---|
| `ENABLE_NEW_CHECKOUT` | Uses v2 checkout flow | ON | OFF |

*Note: Do not put actual secret values in this document. Reference the vault path or secret name.*
