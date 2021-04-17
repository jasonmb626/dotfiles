local gears =	require("gears")
local awful =	require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local mytable       = awful.util.table or gears.table -- 4.{0,1} compatibility

local modkey       = "Mod4"
local altkey       = "Mod1"
local keys	   = { }

keys.terminal     = "alacritty"

-- {{{ Key bindings
keys.globalkeys = mytable.join(
    awful.key({ modkey,           }, "F1",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),
    awful.key({ modkey, "Shift"          }, "\\", function () awful.layout.inc( 1) end,
              {description = "Cycle layout", group = "tag"}),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.bydirection("down")
        end,
        {description = "focus below", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.bydirection("up")
        end,
        {description = "focus above", group = "client"}
    ),
    awful.key({ modkey,           }, "h",
        function ()
            awful.client.focus.bydirection("left")
        end,
        {description = "focus left", group = "client"}
    ),
    awful.key({ modkey,           }, "l",
        function ()
            awful.client.focus.bydirection("right")
        end,
        {description = "focus right", group = "client"}
    ),
    awful.key({ modkey,           }, "F4", function () mymainmenu:show() end,
              {description = "show main menu", group = "awesome"}),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.bydirection("down")    end,
              {description = "swap with below", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.bydirection("up")    end,
              {description = "swap with above", group = "client"}),
    awful.key({ modkey, "Shift"   }, "h", function () awful.client.swap.bydirection("left")    end,
              {description = "swap with left", group = "client"}),
    awful.key({ modkey, "Shift"   }, "l", function () awful.client.swap.bydirection("right")    end,
              {description = "swap with right", group = "client"}),
    awful.key({ modkey, }, ">", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, }, "<", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey, }, "!", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),

    -- Standard program
    awful.key({ modkey, "Mod1" }, "Return", function () awful.spawn(keys.terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Mod1" }, "n", function () awful.spawn("firefox") end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Mod1" }, "y", function () awful.spawn("pcmanfm") end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Mod1" }, "/", function () awful.spawn("code") end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Mod1", "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Mod1", "Control" }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Control" }, "j",     function () awful.client.incwfact(0.05)          end,
              {description = "increase window height factor", group = "layout"}),
    awful.key({ modkey, "Control" }, "k",     function () awful.client.incwfact(-0.05)          end,
              {description = "decrease window height factor", group = "layout"}),
    awful.key({ modkey, }, "+",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, }, "_",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "+",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "_",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey, }, "/", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, }, "\\", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),

    -- Prompt
    awful.key({ modkey, },            " ",     function () awful.screen.focused().mypromptbox:run() end,
              {description = "run prompt", group = "launcher"}),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"}),
    -- Menubar
    awful.key({ modkey, }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"}),
-- View tag only.
awful.key({ modkey }, "u",
	  function ()
		local screen = awful.screen.focused()
		local tag = screen.tags[1]
		if tag then
		   tag:view_only()
		end
	  end,
	  {description = "view tag 1", group = "tag"}),
awful.key({ modkey }, "i",
	  function ()
		local screen = awful.screen.focused()
		local tag = screen.tags[2]
		if tag then
		   tag:view_only()
		end
	  end,
	  {description = "view tag 2", group = "tag"}),
awful.key({ modkey }, "o",
	  function ()
		local screen = awful.screen.focused()
		local tag = screen.tags[3]
		if tag then
		   tag:view_only()
		end
	  end,
	  {description = "view tag 3", group = "tag"}),
awful.key({ modkey, "Mod1" }, "u",
	  function ()
		local screen = awful.screen.focused()
		local tag = screen.tags[4]
		if tag then
		   tag:view_only()
		end
	  end,
	  {description = "view tag 4", group = "tag"}),
awful.key({ modkey, "Mod1" }, "i",
	  function ()
		local screen = awful.screen.focused()
		local tag = screen.tags[5]
		if tag then
		   tag:view_only()
		end
	  end,
	  {description = "view tag 5", group = "tag"}),
awful.key({ modkey, "Mod1" }, "o",
	  function ()
		local screen = awful.screen.focused()
		local tag = screen.tags[6]
		if tag then
		   tag:view_only()
		end
	  end,
	  {description = "view tag 6", group = "tag"}),

-- Toggle tag display.
awful.key({ modkey, "Control" }, "u",
	  function ()
		local screen = awful.screen.focused()
		local tag = screen.tags[1]
		if tag then
             awful.tag.viewtoggle(tag)
		end
	  end,
	  {description = "toggle tag 1", group = "tag"}),
awful.key({ modkey, "Control" }, "i",
	  function ()
		local screen = awful.screen.focused()
		local tag = screen.tags[2]
		if tag then
             awful.tag.viewtoggle(tag)
		end
	  end,
	  {description = "toggle tag 2", group = "tag"}),
awful.key({ modkey, "Control" }, "o",
	  function ()
		local screen = awful.screen.focused()
		local tag = screen.tags[3]
		if tag then
             awful.tag.viewtoggle(tag)
		end
	  end,
	  {description = "toggle tag 3", group = "tag"}),
awful.key({ modkey, "Mod1", "Control" }, "u",
	  function ()
		local screen = awful.screen.focused()
		local tag = screen.tags[4]
		if tag then
             awful.tag.viewtoggle(tag)
		end
	  end,
	  {description = "toggle tag 4", group = "tag"}),
awful.key({ modkey, "Mod1", "Control" }, "i",
	  function ()
		local screen = awful.screen.focused()
		local tag = screen.tags[5]
		if tag then
             awful.tag.viewtoggle(tag)
		end
	  end,
	  {description = "toggle tag 5", group = "tag"}),
awful.key({ modkey, "Mod1", "Control" }, "o",
	  function ()
		local screen = awful.screen.focused()
		local tag = screen.tags[6]
		if tag then
             awful.tag.viewtoggle(tag)
		end
	  end,
	  {description = "toggle tag 6", group = "tag"}),

-- Move client to tag.
awful.key({ modkey, "Shift" }, "u",
	  function ()
	      if client.focus then
		  local tag = client.focus.screen.tags[1]
		  if tag then
		      client.focus:move_to_tag(tag)
		  end
	     end
	  end,
	  {description = "move focused client to tag 1", group = "tag"}),
awful.key({ modkey, "Shift" }, "i",
	  function ()
	      if client.focus then
		  local tag = client.focus.screen.tags[2]
		  if tag then
		      client.focus:move_to_tag(tag)
		  end
	     end
	  end,
	  {description = "move focused client to tag 2", group = "tag"}),
awful.key({ modkey, "Shift" }, "o",
	  function ()
	      if client.focus then
		  local tag = client.focus.screen.tags[3]
		  if tag then
		      client.focus:move_to_tag(tag)
		  end
	     end
	  end,
	  {description = "move focused client to tag 3", group = "tag"}),
awful.key({ modkey, "Mod1", "Shift" }, "u",
	  function ()
	      if client.focus then
		  local tag = client.focus.screen.tags[4]
		  if tag then
		      client.focus:move_to_tag(tag)
		  end
	     end
	  end,
	  {description = "move focused client to tag 4", group = "tag"}),
awful.key({ modkey, "Mod1", "Shift" }, "i",
	  function ()
	      if client.focus then
		  local tag = client.focus.screen.tags[5]
		  if tag then
		      client.focus:move_to_tag(tag)
		  end
	     end
	  end,
	  {description = "move focused client to tag 5", group = "tag"}),
awful.key({ modkey, "Mod1", "Shift" }, "o",
	  function ()
	      if client.focus then
		  local tag = client.focus.screen.tags[6]
		  if tag then
		      client.focus:move_to_tag(tag)
		  end
	     end
	  end,
	  {description = "move focused client to tag 6", group = "tag"}),
-- Toggle tag on focused client.
awful.key({ modkey, "Control", "Shift" }, "u",
	  function ()
	      if client.focus then
		  local tag = client.focus.screen.tags[1]
		  if tag then
		      client.focus:toggle_tag(tag)
		  end
	      end
	  end,
	  {description = "toggle focused client on tag 1", group = "tag"}),
awful.key({ modkey, "Control", "Shift" }, "i",
	  function ()
	      if client.focus then
		  local tag = client.focus.screen.tags[2]
		  if tag then
		      client.focus:toggle_tag(tag)
		  end
	      end
	  end,
	  {description = "toggle focused client on tag 2", group = "tag"}),
awful.key({ modkey, "Control", "Shift" }, "o",
	  function ()
	      if client.focus then
		  local tag = client.focus.screen.tags[3]
		  if tag then
		      client.focus:toggle_tag(tag)
		  end
	      end
	  end,
	  {description = "toggle focused client on tag 3", group = "tag"}),
awful.key({ modkey, "Mod1", "Control", "Shift" }, "u",
	  function ()
	      if client.focus then
		  local tag = client.focus.screen.tags[4]
		  if tag then
		      client.focus:toggle_tag(tag)
		  end
	      end
	  end,
	  {description = "toggle focused client on tag 4", group = "tag"}),
awful.key({ modkey, "Mod1", "Control", "Shift" }, "i",
	  function ()
	      if client.focus then
		  local tag = client.focus.screen.tags[5]
		  if tag then
		      client.focus:toggle_tag(tag)
		  end
	      end
	  end,
	  {description = "toggle focused client on tag 5", group = "tag"}),
awful.key({ modkey, "Mod1", "Control", "Shift" }, "o",
	  function ()
	      if client.focus then
		  local tag = client.focus.screen.tags[6]
		  if tag then
		      client.focus:toggle_tag(tag)
		  end
	      end
	  end,
	  {description = "toggle focused client on tag 6", group = "tag"}),
    -- Show/hide wibox
    awful.key({ modkey }, "b", function ()
            for s in screen do
                s.mywibox.visible = not s.mywibox.visible
                if s.mybottomwibox then
                    s.mybottomwibox.visible = not s.mybottomwibox.visible
                end
            end
        end,
        {description = "toggle wibox", group = "awesome"}),
    -- Widgets popups
    awful.key({ altkey, }, "c", function () if beautiful.cal then beautiful.cal.show(7) end end,
              {description = "show calendar", group = "widgets"}),
    awful.key({ altkey, }, "h", function () if beautiful.fs then beautiful.fs.show(7) end end,
              {description = "show filesystem", group = "widgets"}),
    awful.key({ altkey, }, "w", function () if beautiful.weather then beautiful.weather.show(7) end end,
              {description = "show weather", group = "widgets"})
)


keys.clientkeys = mytable.join(
    awful.key({ modkey, "Shift"          }, "w",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey, }, "q",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, }, "f",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey, "Control"          }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey, "Control"          }, "w",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"})
)

return keys
