# 📚 Vocabulary Trainer – Team FutureGEN

This project is a simple **AI-powered vocabulary learning game** built using **Jac** and **Streamlit**, developed by Team **FutureGEN**. It helps users improve their vocabulary skills through interactive guessing, intelligent hints, and LLM-backed feedback.

---

## 📌 Overview

The **Vocabulary Trainer** is a web-based educational app that:

* Presents a challenging vocabulary word to the player.
* Asks them to **guess its meaning or a close synonym**.
* Provides **immediate feedback**: whether the guess is correct or a **hint** if it’s wrong.
* Uses **Gemini AI** to generate vocabulary, validate answers, and offer intelligent hints.
* Tracks the score and rounds completed.

It’s an engaging way for students and learners to practice language and vocabulary skills with meaningful guidance and no repetition of basic or simple words.

---

## 🔍 Key Features

* 🚀 **Start Game**: Generates a new word using Gemini LLM.
* 💬 **Guess Input**: Players enter their best synonym or explanation.
* ✅ **Check**: Validates if the guess matches the intended word meaning using AI.
* 💡 **Hint System**: If incorrect, the AI provides a helpful explanation.
* ⏭️ **Next Round**: Continue with a new vocabulary word.
* 🛑 **Quit Option**: Shows final score and allows replay.
* 🧠 **High School Level Vocabulary**: Avoids repeated or basic terms.
* 🧩 **LLM Integration**: Powered by Google’s Gemini 2.5 Flash model.

---

## 🔧 Technologies & Tools Used

* **Jac Language** – Core logic and LLM API handling
* **Google Gemini AI** – Word generation, checking, and hint explanation
* **Python 3.12+** – Backend runtime for Jac
* **Streamlit** – Simple and effective frontend for game UI
* **VS Code** – Recommended IDE
* **Jaseci Runtime** – Required to run Jac projects locally

> ![Python](https://img.shields.io/badge/python-3670A0?logo=python&logoColor=FFFF00)
> ![Jac](https://img.shields.io/badge/JacLang-%23009b77.svg?logoColor=white)
> ![Streamlit](https://img.shields.io/badge/streamlit-%23FF4B4B.svg?logo=streamlit&logoColor=white)
> ![Gemini](https://img.shields.io/badge/Gemini_AI-%2300AEEF?logo=google&logoColor=white)

---

## ⚙️ How It Works

1. The user clicks **Start Game**.
2. A vocabulary word is generated using Gemini AI.
3. The player inputs a **guess** (a synonym or explanation).
4. The system checks if the guess is **correct** using the `check_guesses()` function.
5. If wrong, the AI provides a **hint** using `explain_word()`.
6. Player can go to **Next** word or **Quit**.
7. Upon quitting, the final score is shown and option to **play again** is given.

---

## 🧰 Setup & Run Guide (VS Code)

### ✅ Requirements

* Python 3.12+
* JacLang: `pip install jaclang`
* Streamlit: `pip install streamlit`
* MTLLM plugin: `pip install mtllm[google]`
* Jac Cloud: `pip install jac-cloud`
* Gemini API Key: [Get it here](https://aistudio.google.com/app/apikey)

---

### 🔐 Set Up Gemini API Key

Before running the game, export your Gemini API key as an environment variable:

**Linux/Mac**:
```bash
export GEMINI_API_KEY="your_api_key_here"
```

**VS code terminal(Windows)**:
```bash
$env:GEMINI_API_KEY="your_api_key_here"
```

---

### 🚀 Run the Project Locally

**1. Clone the Repository**:
```bash
   git clone https://github.com/SahanUday/Vocabulary-Trainer.git
   cd Vocabulary-Trainer
```

**2. Run Jac Backend Server**:
```bash
   jac serve voc_train.jac
```

**3. Launch the Frontend**:
```bash
   streamlit run app.py
```

**Then open your browser and visit**:
```bash
   http://localhost:8501
```

---

## 🧪 Demo

Here’s a quick look at how the Vocabulary Trainer Game interface appears:

👉 [Click to watch the demo video](demo/demo_vid.mp4)

<img width="1764" height="854" alt="image" src="https://github.com/user-attachments/assets/c0e7a36f-d8b6-4414-9645-4109985ad0ac" />

> 🧠 The game encourages contextual guessing and LLM-guided learning for vocabulary enrichment!

---

## 🤝 Contribution

We welcome contributions to expand features like:
* 📊 Score leaderboard
* 🧠 Word difficulty levels
* ⏱️ Timed challenges
* 🔐 User authentication
  
Fork the repo, create a feature branch, and submit a pull request!

---

## 🛠 Built With

* 🧬 JacLang – for core logic and walker definitions
* 🤖 Google Gemini (2.5 Flash) – for AI word generation and hints
* 🐍 Python 3.10 – used for Streamlit and backend interface
* 🖥️ Streamlit – simple, fast frontend UI
* 🧠 Jaseci Runtime – to run and serve Jac programs
