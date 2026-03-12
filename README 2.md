# ⌨️ Tenfold: AI-Accelerated Clipboard Utility
**A high-performance, background-monitored macOS utility that eliminates "context-switching" fatigue by transforming the system clipboard into a searchable productivity stream.**

## 🎯 Project Overview
Tenfold bridges the gap between fragmented data copying and rapid execution. By moving the clipboard history into a lightweight, non-intrusive menu bar architecture, Tenfold enables power users to manage multiple data streams without disrupting their primary workflow.

As a Product Manager, I built this to explore:

* **Background Observability:** Continuous monitoring of system-wide clipboard events with minimal resource footprint.

* **State Synchronization:** Engineered a robust "ignore-self" filter to resolve event-loop conflicts between automated application pasting and manual user inputs.

* **Cognitive UX:** Minimalist popover interface designed for sub-second data recall and high-frequency usage.

* **Technical Rigor:** Deep integration with native macOS accessibility APIs to ensure seamless cross-app functionality.

## 🏗️ Tech Stack
* **Language:** Swift

* **Framework:** SwiftUI

* **API Integration:** macOS Accessibility & Input Monitoring APIs

* **Persistence:** UserDefaults & local system memory management

## 🚀 Key Product Features
* **Background Listener:** Automated, invisible capture of clipboard changes without requiring manual user intervention.

* **Intelligent Filtering:** Prevents duplication and resolves event-loop conflicts to ensure data reliability.

* **Global Hotkey Recall:** Instant UI invocation from any active application, minimizing context switching.

* **System-Level Integration:** Built as a background-persistent utility that remains active across system reboots.

* **Privacy-First Design:** Logic designed to handle sensitive data in-memory only, ensuring no persistent logging of secure keystrokes.

## 🏗️ System Architecture
* **Ingestion Layer:** Monitors NSPasteboard for change events, triggering updates only when new data is detected.

* **Filter Layer:** Validation logic that prevents "ignore-self" loops and filters out invalid or duplicate entries.

* **Governance Layer:** Manages application state to ensure clipboard history remains accurate during high-frequency manual/automated pasting.

* **UI Layer:** Lightweight SwiftUI popover triggered via global system hotkeys.

## 🛡️ Strategic Challenges Overcome
* **Accessibility Permissions:** Successfully navigated macOS security/privacy hurdles to enable global input monitoring.

* **State Management:** Solved "locking" bugs during manual Cmd+V interruptions by implementing a state-synchronization safety valve.

* **Event-Loop Conflicts:** Resolved race conditions between automated data-pasting and the clipboard history monitor.

* **UI Footprint:** Optimized the background architecture to ensure the utility maintains high responsiveness without consuming system resources.

## About the Author
I am a Senior Product Manager with 12 years of experience within the Salesforce and Tableau ecosystems, specializing in technical product management, data platforms, and B2B SaaS. I’m currently focused on modernizing legacy systems into unified "sources of truth" that prioritize human-centered design and strict data governance.

My current technical focus includes:

* AI Governance: Exploring the practical application of Python-based NLP pipelines and sentiment analysis.

* Data Architecture: Leveraging Databricks Foundations and cloud data architectures to build scalable products.

* Technical Leadership: Applying a "scrappy," high-accountability approach to product development, from Tier 3 technical support to senior leadership.

I am a resident of Camas, WA, a native gardener, and a believer in using data to optimize everything—from enterprise platforms to my daily dog-walking routine.

Connect with me:
* [LinkedIn](http://linkedin.com/in/deborah-brown-unicorn)
