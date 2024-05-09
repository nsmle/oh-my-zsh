# Oh My Zsh Custom

<!-- Installation -->

## Installation

```
git clone https://github.com/nsmle/zsh.git $ZSH/custom
```

or:

```

```

<!-- Configuration -->

## Configuration

### Custom Config Path

```
zstyle :omz:custom config-path /your_custom_config_path
```

### Notification

#### Notify at Start Up

value: `yes`/`no`

```
zstyle :omz:custom notify-at-startup yes
```

value: [`your_notification_logo_path`]

#### Logo Path

```
zstyle :omz:custom notify-logo /your_notification_logo_path
```

#### Sound

value: `Default`, `IM`, `Mail`, `Reminder`, `SMS`, `Alarm`, `Alarm2`, `Alarm3`, `Alarm4`, `Alarm5`, `Alarm6`,
`Alarm7`, `Alarm8`, `Alarm9`, `Alarm10`, `Call`, `Call2`, `Call3`, `Call4`, `Call5`, `Call6`, `Call7`,
`Call8`, `Call9`, `Call10`

```
zstyle :omz:custom notify-sound Default
```

### Start Up Animation

#### Start Up Animation Style

value: `default`, `classic`, `bar`, `bar_reverse`, `vertical_block`, `horizontal_block`

```
zstyle :omz:custom startup-animation-style default
```

#### Clear Start Up Animation

```
zstyle :omz:custom startup-animation-clear yes
```

#### Console Clear Start Up Animation

```
zstyle :omz:custom startup-animation-console-clear yes
```

<!-- Customization -->

## Re-Customization
