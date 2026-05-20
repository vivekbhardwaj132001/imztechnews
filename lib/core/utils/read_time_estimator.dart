class ReadTimeEstimator {
  static int estimate(String? content) {
    if (content == null || content.isEmpty) return 0;
    
    // Average reading speed: 200 words per minute
    const int wordsPerMinute = 200;
    final int wordCount = content.split(' ').length;
    final int minutes = (wordCount / wordsPerMinute).ceil();
    
    return minutes > 0 ? minutes : 1;
  }
}
