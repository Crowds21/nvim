local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    numbers = "buffer_id", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    modified_icon = '✥',
    buffer_close_icon = '',
    always_show_bufferline = false
  }
}
