impl flashcard.check {
    print("💡 Word to define: " + visitor.word);
    guess = input("Enter your guess for what it means: ");
    visitor.process_guess(guess);
    visit [-->];
}

impl VocabTrainer.start_game {
    end: `root | card = here;
    vocab = generate_word();
    print(vocab);
    self.word = vocab["word"];

    for i = 0 to i < 3 by i += 1 {
        end ++> (end := flashcard());
    }

    visit [-->];
}

impl VocabTrainer.process_guess(guess: str) {
    if check_guess(guess, self.word) {
        print("✅ That's correct! 🎉 Well done.");
        disengage;
    } else {
        hint = explain_word(self.word, guess);
        print("❌ Not quite. Here's a hint:\n" + hint);
    }
}
