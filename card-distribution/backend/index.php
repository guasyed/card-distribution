<?php
header('Content-Type: application/json');
try {
    // Input validation
    $input = isset($_GET['people']) ? intval($_GET['people']) : null;
    if (is_null($input) || $input < 0) {
        echo json_encode(['error' => 'Input value does not exist or value is invalid']);
        exit;
    }

    $numPeople = $input;
    $suits = ['S', 'H', 'D', 'C'];
    $values = [1 => 'A', 2, 3, 4, 5, 6, 7, 8, 9, 10 => 'X', 11 => 'J', 12 => 'Q', 13 => 'K'];

    // Build deck
    $deck = [];
    foreach ($suits as $suit) {
        foreach ($values as $num => $value) {
            $deck[] = $suit . '-' . $value;
        }
    }

    shuffle($deck);

    // Distribute cards
    $result = array_fill(0, $numPeople, []);
    $cardIndex = 0;

    while ($cardIndex < count($deck)) {
        for ($i = 0; $i < $numPeople && $cardIndex < count($deck); $i++) {
            $result[$i][] = $deck[$cardIndex++];
        }
    }

    // Output
    foreach ($result as $personCards) {
        echo implode(',', $personCards) . "\n"; // Output with \n, NOT [LF] symbol
    }

} catch (Exception $e) {
    echo json_encode(['error' => 'Irregularity occurred']);
    exit;
}
