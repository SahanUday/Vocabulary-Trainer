# Vocabulary Trainer Game using LLM
import from mtllm.llms { Gemini }

# Connect to Gemini
glob llm = Gemini(model_name="gemini-2.5-flash", verbose=False);

# LLM-powered functions

"""Avoid simple or concrete nouns like: apple, ball, table, sea, car, food, etc and also avoid generate the same word over and over again.Generate high school level vocabulary words"""
def generate_word() -> str byllm();   # Gives a new word with definition

"""Your job is to check whether the guess is semantically the same as the vocabulary word."""
def check_guesses(guess: str, word: str) -> bool byllm();  # Compares user guess

"""Provides a helpful hint or explanation for the given word based on the user's guess.
   If the guess is close, it gives a hint; otherwise, it explains the word."""
def explain_word(word: str, user_guess: str) -> str byllm(); # Gives helpful hint

node flashcard {
    has word: str;
    has guess: str;
}

walker VocabTrainer {
    obj __specs__ {
        # static has methods: list = ["post"];   # Allow POST requests
        static has auth: bool = False;         # No auth required
    }
    can start_game with `root entry;
}

walker check_guess {
    has guess: str;
    has word: str;

    obj __specs__ {
        static has auth: bool = False;
    }
    can checking with `root entry;
}
