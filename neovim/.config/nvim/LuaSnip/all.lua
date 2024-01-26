return {
    s({trig="dtr"},
        fmta(
        [[
            - "traefik.http.routers.<>.rule=Host(`<>.<>`)"
            - "traefik.http.routers.<>.entrypoints=websecure"
            - "traefik.http.routers.<>.tls.certresolver=myresolver"
        ]],
        {
            i(1),
            rep(1),
            i(2),
            rep(1),
            rep(1),
        }
    )
    ),

    require("luasnip").snippet(
    { trig = "test" },
    { t("Heyoooo")}
    ),
}
