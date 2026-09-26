# E2E Frameworks Comparison

| Feature | Playwright | Cypress | Selenium |
| :--- | :--- | :--- | :--- |
| **Architecture** | Out-of-process (CDP / WebSockets) | In-browser execution | Out-of-process (WebDriver) |
| **Browser Support**| Chromium, WebKit, Firefox | Chrome, Firefox, Edge | All major browsers |
| **Language Support**| TS/JS, Python, C#, Java | TS/JS only | Java, Python, C#, JS, Ruby |
| **Speed** | Very Fast | Fast | Slower |
| **Auto-Waiting** | Excellent (built-in) | Excellent (built-in) | Requires manual configuration |
| **Parallel Execution**| Built-in, excellent | Requires paid dashboard for CI | Requires Selenium Grid setup |
| **iFrames / Multi-Tab**| Full native support | Historically limited/difficult | Full support |
| **Network Intercept**| Excellent | Excellent | More complex to set up |

## Recommendations

### Playwright (Top Recommendation)
**Use when:** Starting a new project, needing multi-browser support (especially Safari/WebKit), testing applications with multiple tabs or iframes.
**Strengths:** Incredibly fast, great tooling (UI mode, Trace Viewer), reliable auto-waiting, native parallelization.

### Cypress
**Use when:** You have a heavily JS-focused team, testing Single Page Applications (SPAs), and developer experience is paramount.
**Strengths:** "Time-travel" debugging, excellent documentation, easy setup.
**Weaknesses:** Runs in the browser loop, making multi-tab and cross-domain testing difficult.

### Selenium
**Use when:** Maintaining legacy systems, requiring obscure browser support, or if the team has deep existing Java/Selenium expertise.
**Strengths:** The industry standard, massive community, supports almost everything.
**Weaknesses:** Prone to flakiness without extensive abstraction layers, slower execution, difficult setup.
