import streamlit as st
import requests

# Set page config
st.set_page_config(page_title="Vocabulary Trainer", layout="centered")
st.title("📚 Vocabulary Trainer Game")

# ----------------- Session State Setup -----------------
if "game_started" not in st.session_state:
    st.session_state.game_started = False
if "word" not in st.session_state:
    st.session_state.word = ""
if "guess" not in st.session_state:
    st.session_state.guess = ""
if "message" not in st.session_state:
    st.session_state.message = ""
if "score" not in st.session_state:
    st.session_state.score = 0
if "rounds" not in st.session_state:
    st.session_state.rounds = 0
if "show_score" not in st.session_state:
    st.session_state.show_score = False

# ----------------- API Calls -----------------
def start_game():
    try:
        res = requests.post("http://localhost:8000/walker/VocabTrainer", json={"op": "start_game"})
        data = res.json()
        new_word = data["reports"][0]["New word generated"]
        st.session_state.word = new_word
        st.session_state.message = ""
        st.session_state.guess = ""
        st.session_state.rounds += 1
    except Exception as e:
        st.error(f"Start game error: {e}")

def check_guess():
    try:
        payload = {
            "word": st.session_state.word,
            "guess": st.session_state.guess
        }
        res = requests.post("http://localhost:8000/walker/check_guess", json=payload)
        data = res.json()
        report = data["reports"][0]

        if "Correct" in report:
            st.session_state.message = "✅ That's correct! 🎉 Well done."
            st.session_state.score += 1
        else:
            st.session_state.message = "❌ Not quite. Here's a hint:\n" + report["Hint:"]
    except Exception as e:
        st.error(f"Guess check error: {e}")

def reset_game():
    st.session_state.game_started = False
    st.session_state.word = ""
    st.session_state.guess = ""
    st.session_state.message = ""
    st.session_state.score = 0
    st.session_state.rounds = 0
    st.session_state.show_score = False

# ----------------- UI Logic -----------------

if not st.session_state.game_started:
    if st.button("▶️ Start Game"):
        st.session_state.game_started = True
        st.session_state.show_score = False
        start_game()

# Game UI
if st.session_state.game_started and st.session_state.word:
    st.subheader(f"Word #{st.session_state.rounds}: **{st.session_state.word}**")

    st.session_state.guess = st.text_input("💬 Enter your guess:", value=st.session_state.guess, key="guess_input")

    col1, col2, col3 = st.columns(3)
    with col1:
        if st.button("✅ Check"):
            if st.session_state.guess.strip() == "":
                st.warning("Please enter a guess.")
            else:
                check_guess()

    with col2:
        if st.button("⏭️ Next"):
            start_game()

    with col3:
        if st.button("🛑 Quit"):
            st.session_state.game_started = False
            st.session_state.show_score = True

    if st.session_state.message:
        st.markdown("---")
        st.markdown(st.session_state.message)

# Show final score after quitting
if st.session_state.show_score:
    st.success(f"🎯 Final Score: {st.session_state.score} out of {st.session_state.rounds}")
    if st.button("🔁 Play Again"):
        reset_game()
