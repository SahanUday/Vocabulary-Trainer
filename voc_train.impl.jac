impl VocabTrainer.start_game {
    report {
        "New word generated": generate_word(),
    };
}

impl check_guess.checking {
    new_card = flashcard(word=self.word, guess=self.guess);
    here ++> new_card;  ## link new_post to 
    
    # Check if the guess is correct
    result = check_guesses(new_card.word, new_card.guess);
    if result {
        report{"Correct":new_card.guess};
    } else {
        hint = explain_word(new_card.word, new_card.guess);
        report{"Hint:" : hint};
    }
}


#jac serve voc_train.jac