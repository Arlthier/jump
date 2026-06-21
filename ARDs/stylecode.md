# Style Code 1.0.0v

### Nomenclatura
|           Elemento            |                   Padrão                   |                 Exemplo                  |
| :---------------------------: | :----------------------------------------: | :--------------------------------------: |
|       Pastas e Arquivos       |     `snake_case` (minúsculas com `_`)      | `player_controller.gd`, `main_menu.tscn` |
|   Nomes de Nós (na árvore)    |     `PascalCase` (Iniciais maiúsculas)     |    `CharacterBody2D`, `PlayerCamera`     |
|    Classes (`class_name`)     |                `PascalCase`                |        `class_name PlayerEntity`         |
|            Funções            |                `snake_case`                |       `_ready()`, `take_damage()`        |
| Variáveis e Constantes Locais |                `snake_case`                |      `current_health`, `move_speed`      |
|      Constantes Globais       |    `UPPER_SNAKE_CASE` (tudo maiúsculo)     |     `MAX_LIVES`, `GRAVITY_MODIFIER`      |
|       Sinais (Signals)        | `snake_case` (verbo no passado/infinitivo) |  `damaged`, `game_over`, `door_opened`   |

### Code-style

# identificação do script
```gdscript
extends CharacterBody2D
class_name Player
```

# 2. Sinais (Signals)
```gdscript
signal health_changed(new_health)

```

# 3. Enums e constantes
```gdscript
enum States { IDLE, WALK, JUMP }
const SPEED = 300.0

```

# 4. Variáveis @export
```gdscript
@export var max_health: int = 100

```

# 5. Variáveis públicas e privadas
```gdscript
var current_health: int = max_health

```

# 6. Variáveis @onready
```gdscript
@onready var sprite: Sprite2D = $Sprite2D
@onready var audio_player: AudioStreamPlayer = $AudioPlayer

```

# 7. Funções builtin
```gdscript
func _ready() -> void:
	current_health = max_health

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	_handle_movement()

```

# 8. Suas funções personalizadas
```gdscript
func _handle_movement() -> void:
	# lógica de movimento aqui
	pass

func take_damage(amount: int) -> void:
	current_health -= amount
	health_changed.emit(current_health)
```
