# Clean Code Principles: Deep Dive

This reference provides practical examples of clean code principles using generic pseudocode.

## 1. Naming

**Intention-Revealing Names:**
- ❌ Bad: `int d; // elapsed time in days`
- ✅ Good: `int elapsedTimeInDays;`

**Pronounceable & Searchable Names:**
- ❌ Bad: `class DtaRcrd102 { private string genymdhms; }`
- ✅ Good: `class Customer { private Date generationTimestamp; }`

**Avoid Disinformation:**
- Don't call a group of accounts `accountList` unless it's actually a List data structure. Use `accounts` or `accountGroup`.

## 2. Functions

**Small and Do One Thing:**
Functions should hardly ever be 20 lines long.
- ❌ Bad: A single function `processOrder()` that validates input, charges the credit card, updates the database, and sends an email.
- ✅ Good: `processOrder()` calls `validate(order)`, `charge(order)`, `save(order)`, and `notifyCustomer(order)`.

**Command Query Separation:**
Functions should either do something (modify state) OR answer something (return data), but not both.
- ❌ Bad: `if (set("username", "unclebob")) ...` (Sets the value AND returns true/false if successful).
- ✅ Good:
  ```
  setAttribute("username", "unclebob");
  if (attributeExists("username")) ...
  ```

## 3. Comments

**Explain *Why*, Not *What*:**
Code should explain what it does. Comments should explain why it does it (the business reason or a bizarre constraint).
- ❌ Bad: `// Check if employee is eligible for full benefits` followed by `if ((employee.flags & HOURLY_FLAG) && (employee.age > 65))`
- ✅ Good: Refactor the code to `if (employee.isEligibleForFullBenefits())`. No comment needed.
- ✅ Good Comment: `// Using a linear search here because N is guaranteed to be < 10, making it faster than setting up a hash map.`

**Remove Commented-Out Code:**
Source control remembers history. Do not leave commented-out blocks of code. Delete them.

## 4. Formatting and Structure

- **Vertical Density:** Related concepts should be kept close to each other vertically. Variables should be declared as close to their usage as possible.
- **Dependent Functions:** If one function calls another, they should be vertically close, and the caller should be above the callee.

## 5. Objects vs. Data Structures

- **Objects** hide their data behind abstractions and expose functions that operate on that data.
- **Data Structures** expose their data and have no meaningful functions.
- Know when to use which. Don't create hybrids (objects with getters/setters for every private variable, turning them into mere data structures).
