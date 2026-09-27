# Prioritization Frameworks Reference

Deep-dive into frameworks for prioritizing requirements and features.

## 1. MoSCoW Prioritization
Categorizes requirements into four buckets based on necessity.
- **Must Have**: Critical to current delivery timebox. Without these, the product is unviable.
- **Should Have**: Important but not vital. May be painful to leave out, but the product is still viable.
- **Could Have**: Desirable but not necessary. Only included if time and resources permit.
- **Won't Have**: Agreed to not be included in the current timebox.
- **When to use**: Excellent for time-boxed projects (Agile sprints) and defining MVPs.

## 2. RICE Scoring
A quantitative framework scoring features on four factors.
- **Reach**: How many users will this affect in a given period? (e.g., users/month).
- **Impact**: How much will this increase a key metric? (3=massive, 2=high, 1=medium, 0.5=low, 0.25=minimal).
- **Confidence**: How confident are you in your estimates? (100% = high, 80% = medium, 50% = low).
- **Effort**: How much time will this take? (measured in person-months).
- **Formula**: `(Reach × Impact × Confidence) / Effort = RICE Score`
- **When to use**: Best for mature products needing objective, data-driven prioritization of a large backlog.

## 3. Kano Model
Plots features based on user satisfaction vs. investment/functionality.
- **Basic Needs (Must-be)**: Unspoken requirements. If absent, users are dissatisfied. (e.g., secure login).
- **Performance (One-dimensional)**: Satisfaction correlates linearly with functionality. (e.g., faster load times, more storage).
- **Delighters (Attractive)**: Unexpected features that cause high satisfaction but no dissatisfaction if absent.
- **When to use**: Great for consumer-facing products aiming to balance functional parity with competitive differentiation.

## 4. Value vs. Effort Matrix
A simple 2x2 grid mapping business/user value against implementation effort.
- **Quick Wins (High Value, Low Effort)**: Do these first.
- **Major Projects (High Value, High Effort)**: Plan these carefully; they are strategic investments.
- **Fill-ins (Low Value, Low Effort)**: Do these when there is spare capacity.
- **Time Wasters (Low Value, High Effort)**: Avoid these entirely.
- **When to use**: Quick alignment sessions with stakeholders to weed out bad ideas and find low-hanging fruit.
