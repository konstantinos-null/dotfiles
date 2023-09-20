local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    print("Something went wrong with bufferline")
    return
end

bufferline.setup()
