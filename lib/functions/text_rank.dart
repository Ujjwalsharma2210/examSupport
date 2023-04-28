import 'dart:math';

List<String> getKeywords(String text, {int numKeywords = 1000}) {
  // Split text into sentences
  List<String> sentences = text.split(RegExp(r'\.|\?|\!'));

  // Split each sentence into words
  List<List<String>> words =
      sentences.map((sentence) => sentence.trim().split(' ')).toList();

  // Calculate word frequencies
  Map<String, int> wordFreqs = {};
  words.forEach((sentence) {
    sentence.forEach((word) {
      wordFreqs[word] = (wordFreqs[word] ?? 0) + 1;
    });
  });

  // Calculate weighted word frequencies using TextRank algorithm
  Map<String, double> weightedWordFreqs = {};
  words.forEach((sentence) {
    sentence.forEach((word) {
      double score = 0.0;
      sentence.forEach((otherWord) {
        if (wordFreqs[otherWord] != null && wordFreqs[otherWord]! > 0) {
          score += 1.0 / (wordFreqs[otherWord] ?? 1);
        }
      });
      weightedWordFreqs[word] = score;
    });
  });

  // Sort words by weighted frequency
  List<MapEntry<String, double>> sortedWords = weightedWordFreqs.entries
      .toList()
    ..sort((a, b) => b.value.compareTo(a.value));

  // Return top n keywords
  return sortedWords
      .take(min(sortedWords.length, numKeywords))
      .map((entry) => entry.key)
      .toList();
}
