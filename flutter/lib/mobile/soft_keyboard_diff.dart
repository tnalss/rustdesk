/// Returns how many characters [newValue] removed from [oldValue] and the text
/// it inserted in their place, wherever the IME caret was.
///
/// The common prefix is matched first, so inside a run of equal characters
/// (the '1' padding of the soft keyboard field) an insertion is attributed to
/// the position after the run, not to the run itself.
(int, String) softKeyboardDiff(String oldValue, String newValue) {
  var prefix = 0;
  while (prefix < oldValue.length &&
      prefix < newValue.length &&
      oldValue[prefix] == newValue[prefix]) {
    ++prefix;
  }
  var suffix = 0;
  while (suffix < oldValue.length - prefix &&
      suffix < newValue.length - prefix &&
      oldValue[oldValue.length - 1 - suffix] ==
          newValue[newValue.length - 1 - suffix]) {
    ++suffix;
  }
  return (
    oldValue.length - prefix - suffix,
    newValue.substring(prefix, newValue.length - suffix),
  );
}
