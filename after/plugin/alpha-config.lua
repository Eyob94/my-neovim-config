local alpha = require('alpha')

local dashboard = require('alpha.themes.dashboard')
dashboard.section.header.val = {
    [[                                                                                       ]],
    [[                                                                                       ]],
    [[                                                                                       ]],
    [[                                                                                       ]],
    [[                                                                                       ]],
    [[                                                                                       ]],
    [[                                                                                       ]],
    [[                                                                                       ]],
    [[                                           ▒▒                                             ]],
    [[                                           ▒▒                                             ]],
    [[                                           ▒▒                                          ]],
    [[                                           ▒▒                                          ]],
    [[                                           ▒▒                                          ]],
    [[                                           ▒▒                                          ]],
    [[                                           ▒▒                                          ]],
    [[                                           ▒▒                                          ]],
    [[                                       ████▒▒████                                      ]],
    [[                             ▒▒██    ██▒▒▒▒▒▒▒▒▒▒██    ██▒▒                            ]],
    [[                             ▒▒██  ██▒▒▒▒▒▒▒▒▒▒▒▒████  ██▒▒                            ]],
    [[                             ▒▒██  ██▒▒▒▒▒▒▒▒▒▒▒▒████  ██▒▒                            ]],
    [[                       ▒▒██  ▒▒██  ██▒▒▒▒▒▒▒▒▒▒▒▒████  ██▒▒  ██▒▒                      ]],
    [[                       ▒▒██  ▒▒██  ██▒▒▒▒▒▒▒▒▒▒██████  ██▒▒  ██▒▒                      ]],
    [[                       ▒▒██  ▒▒██  ████▒▒▒▒▒▒▒▒██████  ██▒▒  ██▒▒                      ]],
    [[                       ▒▒██  ▒▒██    ██████████████    ██▒▒  ██▒▒                      ]],
    [[                         ▒▒██  ▒▒████▒▒██████████▒▒████▒▒  ██▒▒                        ]],
    [[                           ▒▒██  ▒▒▒▒██▒▒██▒▒██▒▒██▒▒▒▒  ██▒▒                          ]],
    [[                             ▒▒██████▒▒██▒▒▒▒▒▒██▒▒██████▒▒                            ]],
    [[                               ▒▒▒▒▒▒████▒▒▒▒▒▒████▒▒▒▒▒▒                              ]],
    [[                                   ████▒▒██████▒▒████                                  ]],
    [[                                 ██▒▒▒▒██▒▒▒▒▒▒██▒▒▒▒██                                ]],
    [[                               ██▒▒    ██▒▒  ▒▒██    ▒▒██                              ]],
    [[                               ██▒▒  ██▒▒      ▒▒██  ▒▒██                              ]],
    [[                             ██▒▒    ██▒▒      ▒▒██    ▒▒██                            ]],
    [[                             ██▒▒  ██▒▒          ▒▒██  ▒▒██                            ]],
    [[                             ██▒▒  ██▒▒          ▒▒██  ▒▒██                            ]],
    [[                                   ██▒▒          ▒▒██                                  ]],
    [[                                   ██▒▒          ▒▒██                                  ]],
    [[                                   ██▒▒          ▒▒██                                  ]],
    [[                                                                                       ]],
    [[                                                                                       ]],
    [[                                                                                       ]],
    [[                                                                                       ]],
    [[                                                                                       ]],
    [[                                                                                       ]],
    [[                                                                                       ]],
    [[                                                                                       ]],
    [[                                                                                       ]],
    [[                                                                                       ]],
    [[                                                                                       ]],
    [[                                                                                       ]],
    [[                                                                                       ]],
    [[                                                                                       ]],
}



dashboard.section.buttons.val = {
    dashboard.button("p", "⚒  Projects", ":Telescope opener<CR>"),
    dashboard.button("f", "🔍 Find file", ":Telescope find_files <CR>"),
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("r", "🗃  Recently used files", ":Telescope oldfiles <CR>"),
    dashboard.button("t", "👓  Find text", ":Telescope live_grep <CR>"),
    dashboard.button("q", "👋  Quit Neovim", ":qa<CR>"),
}


local function footer()
    local lines = { " ", "  ", "   ", " ", " ", " ", os.date(" %a, %d %b %Y %h:%M") }
    return table.concat(lines, "\n\n\n")
end


dashboard.section.footer.val      = footer()

dashboard.section.footer.opts.hl  = "Type"
dashboard.section.footer.opts.hl  = "Include"
dashboard.section.buttons.opts.hl = "Keyword"


dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
