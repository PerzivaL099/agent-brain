# SOLID Principles: Deep Dive

This reference explains the five SOLID principles of object-oriented design with pseudocode examples.

## 1. Single Responsibility Principle (SRP)
**Definition:** A class should have one, and only one, reason to change.

**Violation:**
```python
class UserReport:
    def get_user_data(self, user_id):
        # connects to DB, fetches data
        pass
    def format_report(self, data):
        # formats data into HTML
        pass
    def print_report(self):
        # sends HTML to printer
        pass
```
*Reason to change: DB schema changes, HTML format changes, or printer API changes.*

**Fix:**
Create three separate classes: `UserRepository`, `ReportFormatter`, and `ReportPrinter`.

## 2. Open/Closed Principle (OCP)
**Definition:** Software entities should be open for extension, but closed for modification.

**Violation:**
```python
class DiscountCalculator:
    def calculate(self, customer_type, amount):
        if customer_type == "regular":
            return amount * 0.1
        elif customer_type == "vip":
            return amount * 0.2
        # Adding a new customer type requires modifying this existing method!
```

**Fix:** Use polymorphism.
```python
interface CustomerDiscount:
    def get_discount(amount)

class RegularDiscount(CustomerDiscount):
    def get_discount(amount): return amount * 0.1

class VIPDiscount(CustomerDiscount):
    def get_discount(amount): return amount * 0.2

class DiscountCalculator:
    def calculate(self, customer_discount: CustomerDiscount, amount):
        return customer_discount.get_discount(amount)
```

## 3. Liskov Substitution Principle (LSP)
**Definition:** Derived classes must be substitutable for their base classes without causing errors.

**Violation:**
```python
class Rectangle:
    def set_width(w): self.width = w
    def set_height(h): self.height = h

class Square(Rectangle):
    def set_width(w):
        self.width = w
        self.height = w # Violates expectations of a Rectangle!
```
*If a function expects a `Rectangle` and changes its width, it doesn't expect the height to change as well. `Square` is not a proper substitute for `Rectangle` here.*

**Fix:** Do not inherit `Square` from `Rectangle`. They might both implement a `Shape` interface with an `area()` method.

## 4. Interface Segregation Principle (ISP)
**Definition:** Clients should not be forced to depend upon interfaces that they do not use.

**Violation:**
```python
interface Worker:
    def work()
    def eat()

class Robot(Worker):
    def work(): # implements work
    def eat():
        throw Exception("Robots don't eat!") # Forced to implement
```

**Fix:**
```python
interface Workable:
    def work()

interface Eatable:
    def eat()

class Human(Workable, Eatable): ...
class Robot(Workable): ...
```

## 5. Dependency Inversion Principle (DIP)
**Definition:** High-level modules should not depend on low-level modules. Both should depend on abstractions.

**Violation:**
```python
class MySQLDatabase:
    def save(self, data): ...

class UserService: # High-level
    def __init__(self):
        self.db = MySQLDatabase() # Tightly coupled to low-level implementation

    def create_user(self, data):
        self.db.save(data)
```

**Fix:**
```python
interface Repository:
    def save(data)

class MySQLDatabase(Repository): ...

class UserService:
    def __init__(self, repo: Repository): # Depends on abstraction
        self.repo = repo
```
