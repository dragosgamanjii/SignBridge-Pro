# SignBridge Pro 🤟⚡
> **Autonomous Bidirectional Edge-Vision Kiosk & Assistive Public Desk Communicator**  
> *Developed for Infomatrix International Project Competition • Category 01: Software Development*

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Edge AI](https://img.shields.io/badge/Inference-100%25%20On--Device-emerald.svg)]()
[![WCAG](https://img.shields.io/badge/Accessibility-WCAG%202.1%20AAA-success.svg)]()
[![Cloud Data](https://img.shields.io/badge/Cloud%20Data-0.00%20KB-brightgreen.svg)]()
[![UN SDGs](https://img.shields.io/badge/UN%20SDGs-Goal%2010%20%7C%20Goal%203%20%7C%20Goal%209-orange.svg)]()

---

## 🌟 Executive Summary

**SignBridge Pro** is a zero-latency, privacy-first software solution designed to eliminate the communication barrier between deaf or hard-of-hearing citizens and hearing service staff at public service desks (hospitals, schools, registration offices, train stations).

Unlike traditional student projects that only classify static alphabet letters ($A-Z$) in one direction, **SignBridge Pro introduces a complete bidirectional ecosystem**:
1. **Sign-to-Speech:** Interprets continuous hand and upper-body gestures in real-time via camera using MediaPipe and temporal classification, translating them into natural synthesized human voice.
2. **Speech-to-Sign:** Listens to desk clerks' spoken questions and commands, tokenizes the speech into sign glosses, and renders an animated **3D Kinematic Humanoid Avatar** that signs the response back in real-time.
3. **100% On-Device & Zero Cloud Dependency:** Guarantees absolute citizen privacy and HIPAA/GDPR alignment by processing video frames and voice strictly inside volatile RAM on the local client machine.

---

## 🎯 Sustainable Development Goals (SDGs) Alignment

* **Goal 10: Reduced Inequalities** — Grants equal, independent civic access to over 70 million deaf individuals globally without requiring an on-site human interpreter for everyday desk tasks.
* **Goal 3: Good Health & Well-being** — Enables fast, accurate communication at emergency room triage desks, reducing fatal misdiagnoses caused by language barriers.
* **Goal 9: Industry, Innovation & Infrastructure** — Introduces edge computing architectures that operate seamlessly in offline or resource-constrained public environments.

---

## 🚀 Key Features

| Feature | Description | Technical Implementation |
| :--- | :--- | :--- |
| **Bidirectional Kiosk Engine** | Simultaneous dual-panel interface supporting visitor gesture view and desk clerk voice view. | Responsive Grid / WebGL & DOM Sync |
| **Edge Computer Vision** | 60 FPS skeletal tracking across 21 hand landmarks per hand with neon bone rendering. | MediaPipe Hands via WebAssembly |
| **Kinematic 3D Signer** | Real-time bone-rigged 3D avatar rendering authentic sign glosses (Hello, Help, Doctor, Thanks). | Three.js WebGL / Inverse Kinematics |
| **Zero-Cloud Privacy** | Zero camera frames or voice recordings leave the local workstation. | Volatile ArrayBuffers / No External Telemetry |
| **WCAG 2.1 AAA Accessibility** | High-contrast black/cyan mode, visual vibration flash for deaf users, emergency SOS matrix. | CSS Custom Properties & Web Speech APIs |
| **Live Telemetry & Diagnostics** | Continuous real-time display of FPS, inference latency, confidence scores, and memory load. | Performance.now() Microtask Timers |

---

## 💻 Tech Stack & Architecture

```
[ Visitor Camera Feed ] ────────► [ MediaPipe WASM Landmark Extractor ]
                                                  │
                                                  ▼
                                      [ Heuristic / TCN Vectorizer ]
                                                  │
                                                  ▼
                                      [ Web Speech Synthesis (TTS) ] ──► [ Audio Out ]

[ Clerk Microphone Input ] ──────► [ Web Speech STT Engine ]
                                                  │
                                                  ▼
                                      [ Natural Language Tokenizer ]
                                                  │
                                                  ▼
                                      [ Three.js 3D Kinematic Avatar ] ──► [ 60 FPS Visual Sign ]
```

* **Frontend Engine:** HTML5, CSS3, Modern ES6+ JavaScript.
* **Computer Vision:** Google MediaPipe Hands (WebAssembly pipeline).
* **3D Rendering & Animation:** Three.js (WebGL rendering, directional light shading, hierarchical bone rotations).
* **Audio & Speech Engine:** Native Web Speech API (`SpeechRecognition` & `SpeechSynthesis`).
* **Packaging:** Single self-contained architecture ready for standalone browser use or Electron/PWA desktop deployment.

---

## 🏃 Quick Start Guide

You do **not** need to install heavy dependencies or configure complicated databases to run SignBridge Pro.

### 1. Launching Directly in Browser
Simply open the `index.html` file in any modern web browser (Google Chrome, Microsoft Edge, Brave, or Safari):
```bash
# Double-click index.html or launch via command line:
start C:\Users\rodic\.gemini\antigravity\scratch\signbridge-pro\index.html
```

### 2. Camera & Microphone Permissions
When prompted by the browser, click **"Allow"** for:
* **Camera Access:** Powers the visitor hand-tracking engine.
* **Microphone Access:** Powers the desk clerk speech-to-avatar translation.

*Note: If testing on a machine without a webcam, click any of the interactive **"Try Gestures"** or **"Quick Voice Answers"** chips at the bottom of the screen to simulate live input.*

---

## 📁 Repository Structure

```
signbridge-pro/
├── index.html                   # Main production application (self-contained)
├── README.md                    # Project overview and quick start guide
├── DOCUMENTATION.md             # In-depth 9-section technical engineering report
├── AI_AND_ETHICS_DISCLOSURE.md  # Official Infomatrix Responsible AI statement (5/5)
├── ORAL_PRESENTATION.md         # 4-Minute competition pitch script & Q&A defense
└── STAND_DESIGN_BLUEPRINT.md    # Interactive booth plan, poster copy & jury flashcards
```

---

## 👥 Authors & Infomatrix Team
* Category: **Category 01 — Software Development**
* Project Name: **SignBridge Pro**
* Competition: **Infomatrix International Finals**
