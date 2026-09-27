# Estimation Techniques Reference

Accurate estimation is crucial for predictable project delivery.

## 1. Story Points (Fibonacci Sequence)
Using numbers like 1, 2, 3, 5, 8, 13 to estimate work.
- **Concept:** Points do not strictly equal hours. They represent a combination of **Effort**, **Complexity**, and **Uncertainty**.
- **How to use:** Establish a baseline (e.g., a simple UI change = 2 points). Compare new tasks to the baseline.
- **Pros:** Prevents false precision of hourly estimates, accounts for risk, faster to agree upon.
- **Cons:** Hard for external stakeholders to map to calendar days.

## 2. Planning Poker
A consensus-based technique for teams using Story Points.
- **Process:**
  1. Product Owner reads a story.
  2. Developers privately select a point value.
  3. Everyone reveals simultaneously.
  4. Outliers (highest and lowest) explain their reasoning.
  5. Repeat until consensus is reached.
- **Pros:** Prevents anchoring bias, uncovers hidden technical complexities through discussion.

## 3. T-Shirt Sizing
Using sizes (XS, S, M, L, XL) to estimate high-level features or epics.
- **Concept:** Broad stroke categorization.
- **How to use:** Used during roadmap planning before requirements are detailed enough for story points.
- **Mapping (Optional):** XL might mean "multi-month project", S might mean "a few days".

## 4. Three-Point Estimation (PERT)
Using optimistic, pessimistic, and most likely estimates.
- **Formula:** `(Optimistic + (4 × Most Likely) + Pessimistic) / 6 = Expected Estimate`
- **When to use:** For high-risk, critical path tasks where precision is necessary and uncertainty is high.

## Common Estimation Pitfalls
- **Underestimating Testing/QA:** Forgetting that "code complete" is not "done".
- **Ignoring Meetings/Overhead:** Assuming 8 hours of coding per day (realistically, capacity is 5-6 hours).
- **The "Hero" Estimate:** Estimating based on how fast the most senior developer could do it, rather than the team average.
- **Anchoring:** Letting the first spoken estimate influence the rest of the team (why Planning Poker is useful).
