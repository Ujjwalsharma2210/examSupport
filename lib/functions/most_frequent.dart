Map<String, int> mostFrequent(String input) {
  // String input = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sed aliquam dolor, ut placerat quam. Nullam euismod sapien non ex dictum, vel bibendum metus viverra. Praesent ut tortor velit.";

  // Split the input string into individual words
  List<String> words = input.replaceAll(",", "").split(" ");

  // Create a map to store the frequency of each word
  Map<String, int> wordFrequency = {};

  // Loop through each word and update its frequency in the map
  if (words != null) {
    for (String word in words) {
      if (wordFrequency.containsKey(word)) {
        wordFrequency[word] = wordFrequency[word]! + 1;
      } else {
        wordFrequency[word] = 1;
      }
    }
  }

  // Find the most frequently occurring word(s)
  List<String>? mostFrequentWords = [];
  int? maxFrequency = 0;
  if (wordFrequency != null) {
    wordFrequency.forEach((word, frequency) {
      if (frequency > maxFrequency!) {
        mostFrequentWords = [word];
        maxFrequency = frequency;
      } else if (frequency == maxFrequency) {
        mostFrequentWords?.add(word);
      }
    });
  }
  // Print the result
  // print("The most frequently occurring word(s) is/are: ${mostFrequentWords.join(", ")}");
  return wordFrequency;
}
