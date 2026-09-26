# E2E Test Scenario Template

**Scenario Name:** [Action being tested, e.g., User successfully completes checkout]
**User Persona:** [e.g., Registered Customer]

## Preconditions
1. [e.g., Test environment is up and running]
2. [e.g., A registered user exists in the database]
3. [e.g., The user has items in their cart]

## Steps
| Step # | Action | Expected State / Assertion |
| :--- | :--- | :--- |
| 1 | Navigate to `/login` | Login page is displayed. |
| 2 | Enter credentials and click 'Login' | Redirected to `/dashboard`. Welcome message visible. |
| 3 | Click 'Cart' icon | Cart page displays correct items. |
| 4 | Click 'Checkout', enter payment info, click 'Submit' | 'Order Successful' page appears. Order ID is displayed. |

## Assertions (Key Checkpoints)
- [e.g., Ensure Order Confirmation email is triggered (verified via API)]
- [e.g., Ensure database reflects the new order status]

## Test Data Required
- **Setup Method:** [e.g., API Factory script to generate user and cart items]
- **Specifics:** Needs 1 valid user credentials, 1 mock credit card number.

## Cleanup
- [e.g., API call to delete the user and associated orders created during this test]
