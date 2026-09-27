# API Contract: [Endpoint Name]

**Endpoint:** `/api/v1/[resource]`
**Method:** `[GET / POST / PUT / PATCH / DELETE]`
**Description:** [What this endpoint does]

## Request

### Headers
| Header | Required | Type | Description |
|--------|----------|------|-------------|
| Authorization | Yes | String | Bearer token |

### Path Parameters
| Parameter | Type | Description |
|-----------|------|-------------|
| `id` | UUID | The unique identifier of the resource |

### Query Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `limit` | Integer | No | Max items to return (default: 20) |

### Body Schema (if applicable)
```json
{
  "fieldName": "string",
  "isRequired": true
}
```

## Response

### Success (e.g., 200 OK / 201 Created)
```json
{
  "data": {
    "id": "uuid-string",
    "fieldName": "string"
  }
}
```

### Errors
- **400 Bad Request:** Invalid input data.
- **401 Unauthorized:** Missing or invalid token.
- **403 Forbidden:** Valid token, but insufficient permissions.
- **404 Not Found:** Resource does not exist.

## Authentication & Rate Limits
- **Auth required:** [Yes/No]
- **Rate Limit:** [e.g., 100 requests per minute per IP]
