// const ALPHABETS = "abcdefghijklmnopqrstuvwxyz";
// const DIGITS = "0123456789";

export function limitString(str: string, ellips = true, len = 30, maxlen = 50) {
  if (str.length <= len) return str;

  let newLength = maxlen;
  for (let i = len; i < newLength; i++) {
    const char = str[i];

    if (char === " ") {
      newLength = i;
      break;
    }
  }

  if (newLength > maxlen) return str.slice(0, 30) + (ellips ? "…" : "");
  if (newLength === str.length) return str;
  return str.slice(0, newLength) + (ellips ? "…" : "");
}

export function doubleLineLabel(
  title: string,
  subtitle: string,
  reverse = false
) {
  if (reverse)
    return `<span size="65%" line_height="0.8" weight="400">${subtitle}</span>\n<span size="85%" line_height="0.8">${title}</span>`;
  return `<span size="85%" line_height="0.8">${title}</span>\n<span size="65%" line_height="0.8" weight="400">${subtitle}</span>`;
}
