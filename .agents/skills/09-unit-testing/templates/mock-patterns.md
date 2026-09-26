# Mock Pattern Catalog

This catalog outlines common scenarios for mocking external dependencies across various testing frameworks.

## 1. Mocking HTTP Clients
**Scenario:** A service makes API calls using `fetch`, `axios`, or a similar HTTP client.
**Pattern:**
- Intercept the HTTP call.
- Return a resolved Promise with dummy JSON data.
- Verify the HTTP client was called with the correct URL, method, and payload.

**Pseudocode:**
```javascript
// Arrange
httpClient.get.mockResolvedValue({ data: { id: 1, name: 'Mocked User' } });

// Act
const result = await userService.getUser(1);

// Assert
expect(httpClient.get).toHaveBeenCalledWith('/users/1');
expect(result.name).toBe('Mocked User');
```

## 2. Mocking Databases
**Scenario:** A repository layer interacts with a database (SQL or NoSQL).
**Pattern:**
- Mock the ORM, Query Builder, or DB Driver methods (e.g., `find`, `save`, `query`).
- Use Fakes (like an in-memory SQLite database) for more complex querying logic if simple stubs aren't enough.

**Pseudocode:**
```javascript
// Arrange
userRepository.find.mockReturnValue([{ id: 1, name: 'Test' }]);

// Act
const users = await userService.getAllUsers();

// Assert
expect(userRepository.find).toHaveBeenCalled();
expect(users.length).toBe(1);
```

## 3. Mocking File Systems
**Scenario:** A utility reads from or writes to the local disk.
**Pattern:**
- Mock the file system module (e.g., `fs` in Node.js).
- Avoid actual disk I/O to maintain test speed and determinism.

**Pseudocode:**
```javascript
// Arrange
fileSystem.readFile.mockResolvedValue('dummy file content');

// Act
const content = await fileReader.read('path/to/file.txt');

// Assert
expect(content).toBe('dummy file content');
```

## 4. Mocking Timers and Dates
**Scenario:** Code relies on `setTimeout`, `setInterval`, or the current `Date`.
**Pattern:**
- Use framework utilities to freeze time or advance it synchronously.
- Mock the `Date` object to always return a fixed timestamp.

**Pseudocode:**
```javascript
// Arrange
testFramework.useFakeTimers();
testFramework.setSystemTime(new Date('2023-01-01'));

// Act
const result = generateReport();

// Assert
expect(result.date).toBe('2023-01-01');
```
