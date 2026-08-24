-- ============================================================================
-- JAVA FILETYPE CONFIGURATION (nvim-jdtls)
-- ============================================================================
-- This file ONLY executes when opening a Java file (`filetype=java`).
-- It does NOT affect or slow down editing in other languages (Python, JS, C++, etc.).
--
-- To completely disable Java LSP support:
-- 1. Comment out "mfussenegger/nvim-jdtls" in lua/plugins/init.lua
-- 2. (Optional) Delete or rename this file (e.g. java.lua.bak)
-- ============================================================================

local jdtls = require "jdtls"

-- Find project root directory based on build tools
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle", "settings.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)

if not root_dir then
  return
end

-- Create isolated workspace path for JDTLS cache
local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = vim.fn.stdpath "data" .. "/site/java-workspace/" .. project_name

-- Pathing set up by Mason
local mason_path = vim.fn.stdpath "data" .. "/mason/packages/jdtls"
local launcher_jar = vim.fn.glob(mason_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")

local sysname = vim.loop.os_uname().sysname
local machine = vim.loop.os_uname().machine
local jdtls_config_dir
if sysname == "Darwin" then
  jdtls_config_dir = mason_path .. (machine == "arm64" and "/config_mac_arm" or "/config_mac")
elseif sysname == "Linux" then
  jdtls_config_dir = mason_path .. (machine == "aarch64" and "/config_linux_arm" or "/config_linux")
else
  jdtls_config_dir = mason_path .. "/config_win"
end

local config = {
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-DOSGI_bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.level=ALL",
    "-Xmx1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    launcher_jar,
    "-configuration",
    jdtls_config_dir,
    "-data",
    workspace_dir,
  },
  root_dir = root_dir,
  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" },
      project = {
        sourcePaths = { "src" },
      },
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.junit.Assert.*",
          "org.mockito.Mockito.*",
        },
      },
    },
  },
}

jdtls.start_or_attach(config)
