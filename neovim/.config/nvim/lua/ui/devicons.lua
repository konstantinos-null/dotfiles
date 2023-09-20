local status_ok, devicons = pcall(require, "nvim-web-devicons")
if not status_ok then
    print("Something went wrong with nvim-web-devicons")
    return
end

devicons.setup()
