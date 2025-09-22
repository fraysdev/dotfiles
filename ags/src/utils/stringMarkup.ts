type MarkupSetting = {
  fontWeight: number;
  fontSize: number | string;
  lineHeight: number;
};

export function stringMarkup(text: string, markup: Partial<MarkupSetting>) {
  const fontWeight = `weight="${markup.fontWeight?.toString() ?? "700"}"`;
  const fontSize = `size="${markup.fontSize?.toString() ?? "100%"}"`;
  const lineHeight = `line_height="${markup.lineHeight?.toString() ?? "1.0"}"`;

  return `<span ${fontWeight} ${fontSize} ${lineHeight}>${escapeMarkup(
    text
  )}</span>`;
}

function escapeMarkup(text: string) {
  return String(text)
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;");
}
