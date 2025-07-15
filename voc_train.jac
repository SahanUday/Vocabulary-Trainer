# Vocabulary Trainer Game using LLM
import from mtllm.llms { Gemini }

# Connect to Gemini
glob llm = Gemini(model_name="gemini-2.5-flash", verbose=False);

# LLM-powered functions

"""Avoid simple or concrete nouns like: apple, ball, table, sea, car, food, etc."""
def generate_word() -> str byllm();        # Gives a new word with definition

"""Your job is to check whether the guess is semantically the same as the vocabulary word."""
def check_guess(guess: str, word: str) -> bool byllm();  # Compares user guess

"""Provides a helpful hint or explanation for the given word based on the user's guess.
   If the guess is close, it gives a hint; otherwise, it explains the word."""
def explain_word(word: str, user_guess: str) -> str byllm(); # Gives helpful hint

walker VocabTrainer {
    has word: str = "";
    has meaning: str = "";

    can start_game with `root entry;
    def process_guess(guess: str);
}

node flashcard {
    can check with VocabTrainer entry;
}

# Run the trainer
with entry {
    VocabTrainer() spawn root;
}
