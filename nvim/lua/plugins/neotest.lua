return {
  {
    "nvim-neotest/neotest",
    adapters = {
      ["neotest-golang"] = {
        go_test_args = { "-v", "-race", "-count=1", "-timeout=60s" },
        dap_go_enabled = true,
      },
    },
  },
}
