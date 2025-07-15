# Vocabulary Trainer Game using LLM
import from mtllm.llms { Gemini }

# Connect to Gemini
glob llm = Gemini(model_name="gemini-2.5-flash", verbose=False);

# LLM-powered functions
def generate_word() -> dict byllm();        # Gives a new word with definition
def check_guess(guess: str, word: str) -> bool byllm();  # Compares user guess
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
