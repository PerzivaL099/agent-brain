# API Documentation

## Overview
**Base URL**: `https://api.example.com/v1`
**Authentication**: Bearer Token (JWT). Send via header `Authorization: Bearer <token>`.
**Rate Limits**: 100 requests / minute per IP.

---

## Endpoints

### 1. Get User Profile
Retrieves the profile of the authenticated user.

- **Method**: `GET`
- **Path**: `/users/me`

#### Request Parameters
*None*

#### Responses
**200 OK**
```json
{
  "id": "usr_123",
  "email": "user@example.com",
  "name": "Jane Doe",
  "created_at": "2023-10-01T12:00:00Z"
}
```

**401 Unauthorized**
```json
{
  "error": "invalid_token",
  "message": "The access token provided is invalid or expired."
}
```

---

### 2. Create Item
Creates a new item in the system.

- **Method**: `POST`
- **Path**: `/items`

#### Request Body (JSON)
| Field | Type | Required | Description |
|---|---|---|---|
| `name` | string | Yes | Name of the item (max 100 chars). |
| `price` | number | Yes | Price in USD. Must be > 0. |

```json
{
  "name": "Mechanical Keyboard",
  "price": 149.99
}
```

#### Responses
**201 Created**
Returns the created item object with its generated ID.
