use Mix.Releases.Config,
  default_release: :default,
  default_environment: Mix.env()

# For a full list of config options for both releases
# and environments, visit https://hexdocs.pm/distillery/config/distillery.html

# You may define one or more environments in this file,
# an environment's settings will override those of a release
# when building in that environment, this combination of release
# and environment configuration is called a profile

environment :dev do
  # If you are running Phoenix, you should make sure that
  # server: true is set and the code reloader is disabled,
  # even in dev mode.

  # It is recommended that you build with MIX_ENV=prod and pass
  # the --env flag to Distillery explicitly if you want to use
  # dev mode.

  set(dev_mode: true)
  set(include_erts: false)
  set(cookie: :"s*Y&;!cqe}YKiFy4ekZZ.[1B82z`_V@67zS(s/u2Q`hpMpxS!x`0U/e47:?gOO/!")
end

environment :prod do
  set(include_erts: true)
  set(include_src: false)

  # TODO read from env if epmd ports are open
  set(cookie: :"Ncuh4VdDm8gfvN|V3R~2l=jb!7g1QQ&%r/lgfv!39Ai4:Gh|@xF&$LJbRjcmp`F)")

  set(
    overlays: [
      {:copy, "rel/etc/config.exs", "etc/config.exs"},
      {:copy, "rel/etc/deploy.service.sample", "etc/deploy.service.sample"},
      {:copy, "rel/etc/deploy.env.sample", "etc/deploy.env.sample"}
    ]
  )

  set(
    config_providers: [
      {Mix.Releases.Config.Providers.Elixir, ["${RELEASE_ROOT_DIR}/etc/config.exs"]}
    ]
  )
end

# You may define one or more releases in this file.
# If you have not set a default release, or selected one
# when running `mix release`, the first release in the file
# will be used by default

release :deploy_demo do
  set(version: current_version(:deploy_demo))

  set(
    commands: [
      migrate: "rel/commands/migrate.sh"
    ]
  )

  set(
    applications: [
      :runtime_tools
    ]
  )
end
