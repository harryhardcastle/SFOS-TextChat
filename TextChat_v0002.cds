// version 0.002

//---------------------- start
address $000B0000

//---------------------- variables
// Enable/disable chat
BOOL_ChatEnabled:
hexcode 1

// Overall text alpha color
DefaultFloatValue:
float $1.0

// cFont::Display does not expose a true scale parameter
// This selects which loaded cMachine font pointer is used
//   0 = cMachine + $280
//   1 = cMachine + $284
//   2 = cMachine + $288
//   3 = cMachine + $28C
chat_text_size:
hexcode 1

// Console overlay X position in pixels.
console_x_pos:
hexcode -304

// Console overlay Y position in pixels.
console_y_pos:
hexcode 168
console_y_pos_lobby:
hexcode 54

// Chat layout spacing in pixels
// This controls line spacing and prompt-to-input X advance only
chat_font_size:
hexcode 58

// Y height between messages
chat_messageY:
hexcode 14

# Maximum number of characters the user can type into the live console input box
console_input_char_limit:
hexcode 50

line_prompt:
print "CHAT>"
nop

cursor_string:
print "|"
nop

cursor_blink_counter:
hexcode 0

cursor_blink_rate:
hexcode 16

cursor_blink_visible_ticks:
hexcode 8

color_white:
float $1.0 #R
float $1.0 #G
float $1.0 #B
float $0.9 #A

color_brightgreen:
float $0.7 #R
float $1.0 #G
float $0.7 #B
float $1.0 #A

color_green:
float $0.25 #R
float $0.9 #G
float $0.1 #B
float $1.0 #A

color_red:
float $1.0 #R
float $0.1 #G
float $0.1 #B
float $1.0 #A

color_light_green:
float $0.5 #R
float $0.8 #G
float $0.5 #B
float $1.0 #A

color_chat_dynamic:
float $0.7
float $0.7
float $0.7
float $1.0

//---------------------- chat feed variables
# Feed position is tied to console_x_pos / console_y_pos.
# Messages are stacked above the live input line.

// Separate multi-line chat feed. This does not use cInfoBar's one-line cTextArea.
chat_feed_enabled:
hexcode 1

# Number of allocated chat feed message slots/timers/player-prefix buffers.
# Do not set this higher than the allocated slot count below unless you add matching buffers.
MaxChatMessageCount:
hexcode 5

# Default local placeholder until real net player names are wired in.
DefaultChatPlayerName:
print "PLAYER"
nop

# Approximate life for each chat line. Decremented by FNC_TickChatFeed.
chat_feed_timeout_ticks:
hexcode 90

# Start fading when a message has this many ticks left.
chat_feed_timeout_ticks_fadeout:
hexcode 10

# Our render hook can run more than once per frame. This divider slows timeout ticking.
chat_feed_tick_div:
hexcode 5

chat_feed_tick_counter:
hexcode 0

chat_timer0:
hexcode 0
chat_timer1:
hexcode 0
chat_timer2:
hexcode 0
chat_timer3:
hexcode 0
chat_timer4:
hexcode 0

# Five 0x80-byte null-terminated message slots.
chat_msg0:
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
chat_msg1:
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
chat_msg2:
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
chat_msg3:
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
chat_msg4:
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0

# Five 0x40-byte null-terminated player-prefix slots.
# FNC_AddChatMessage stores the formatted blue prefix here as "PLAYER: ".
chat_player0:
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
chat_player1:
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
chat_player2:
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
chat_player3:
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
chat_player4:
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0

cmd_len:
hexcode 0

# 0x80-byte null-terminated input buffer.
VAR_ChatMessageStart:
nop
cmd_buf:
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0
hexcode 0


//---------------------- keyboard handler
FNC_KeyboardHandler:
andi a2, v0, $00FF
addu a0, s1, zero
addu a1, s0, zero
jal :FNC_ConsoleInput
nop

# Default: do not trigger retail console toggle logic.
addu v1, zero, zero
andi t0, v0, $00FF

# Y / y opens the console only when it is currently closed.
addiu t1, zero, $0059
beq t0, t1, :MaybeOpenConsole
nop
addiu t1, zero, $0079
beq t0, t1, :MaybeOpenConsole
nop
beq zero, zero, :ReturnToRetailKeyboardHandler
nop

MaybeOpenConsole:
# If active, do not let T/t close it. The input shim has already appended T/t normally.
lbu t2, $002D(s1)
bne t2, zero, :ReturnToRetailKeyboardHandler
nop

# If inactive, set v1=1 so the original retail code activates cConsole.
addiu v1, zero, $0001

ReturnToRetailKeyboardHandler:
j $00165594
nop


//---------------------- console input
FNC_ConsoleInput:
addiu sp, sp, $FFF0
sw ra, $0000(sp)
sw s0, $0004(sp)
sw s1, $0008(sp)
sw s2, $000C(sp)
addu s0, a0, zero
addu s1, a1, zero
andi s2, a2, $00FF

// GetTextSystem__Fv #returned in v0 (fail if v0=0)
jal $003D1020
nop
beq v0, zero, :ShimReturn
nop

# Console must be active before this shim captures text.
lbu t0, $002D(s0)
beq t0, zero, :ShimReturn
addu v0, s2, zero

# ESC closes console without submitting.
# Some keyboard paths do not return ESC as ASCII $1B, so if ASCII is zero,
# also check the keyboard raw/current key field.
addiu t0, zero, $001B
beq s2, t0, :CloseConsole
nop
beq s2, zero, :CheckRawEsc
nop

# Enter / newline submits the input string, then closes the console.
addiu t0, zero, $000D
beq s2, t0, :SubmitInput
nop
addiu t0, zero, $000A
beq s2, t0, :SubmitInput
nop

# Backspace / delete.
addiu t0, zero, $0008
beq s2, t0, :Backspace
nop
addiu t0, zero, $007F
beq s2, t0, :Backspace
nop

# Printable ASCII only: $20..$7E.
slti t0, s2, $0020
bne t0, zero, :ShimReturn
addu v0, s2, zero
slti t0, s2, $007F
beq t0, zero, :ShimReturn
addu v0, s2, zero

# Append one byte to cmd_buf if cmd_len < console_input_char_limit.
setreg t1, :cmd_len
lw t2, $0000(t1)
setreg t5, :console_input_char_limit
lw t6, $0000(t5)
slt t0, t2, t6
beq t0, zero, :ShimReturn
addu v0, s2, zero
setreg t3, :cmd_buf
addu t4, t3, t2
sb s2, $0000(t4)
addiu t2, t2, $0001
sw t2, $0000(t1)
addu t4, t3, t2
sb zero, $0000(t4)
beq zero, zero, :ShimReturn
addu v0, s2, zero

CheckRawEsc:
beq s1, zero, :ShimReturn
addu v0, s2, zero
lw t7, $0098(s1)
beq t7, zero, :ShimReturn
nop
lhu t7, $009C(s1)
andi t7, t7, $00FF
addiu t0, zero, $001B
beq t7, t0, :CloseConsole
nop
# USB HID ESC usage code. Only checked when GetAsciiKey returned zero,
# so normal printable ')' / $29 is not affected.
addiu t0, zero, $0029
beq t7, t0, :CloseConsole
nop
beq zero, zero, :ShimReturn
addu v0, s2, zero

Backspace:
setreg t1, :cmd_len
lw t2, $0000(t1)
blez t2, :ShimReturn
addu v0, s2, zero
addiu t2, t2, $FFFF
sw t2, $0000(t1)
setreg t3, :cmd_buf
addu t4, t3, t2
sb zero, $0000(t4)
beq zero, zero, :ShimReturn
addu v0, s2, zero

SubmitInput:
# ProcessInput is intentionally the only submission hook.
# a0 = cConsole* / text-chat console object
# a1 = char* input string
setreg a1, :cmd_buf
jal :FNC_ProcessInput
addiu a0, s0, $002C

# Close the console after Enter, then clear the local edit buffer.
jal $003E7CD0
addiu a0, s0, $002C

setreg t1, :cmd_len
sw zero, $0000(t1)
setreg t3, :cmd_buf
sb zero, $0000(t3)
beq zero, zero, :ShimReturn
addu v0, s2, zero

CloseConsole:
jal $003E7CD0
addiu a0, s0, $002C
addu v0, s2, zero

ShimReturn:
lw ra, $0000(sp)
lw s0, $0004(sp)
lw s1, $0008(sp)
lw s2, $000C(sp)
jr ra
addiu sp, sp, $10


//---------------------- input submit hook
FNC_ProcessInput:
# This is the only place Enter sends the typed string.
# For now it pushes the local typed text into the multi-line feed.
# Later, replace or extend this with your real text-chat send routine.
# In: a0 = cConsole* / text-chat console object
#     a1 = input string
addiu sp, sp, $FFF0
sw ra, $0000(sp)
sw s0, $0004(sp)
daddu s0, a1, zero #preserve chat message

beq a1, zero, :ProcessInputReturn
nop
lbu t0, $0000(a1)
beq t0, zero, :ProcessInputReturn
nop

# Broadcast message to all clients
jal :FNC_SendChatMessage
nop

// get playerName from playerID
lui a0, $0057
jal :FNC_GetPersonaNamePtrByClientObjectID
lw a0, $1774(a0)
// v0 = client name
daddu a0, v0, zero
jal :FNC_AddChatMessage # Add chat message, a0 = PlayerName, a1 = Message
daddu a1, s0, zero

ProcessInputReturn:
lw ra, $0000(sp)
lw s0, $0004(sp)
jr ra
addiu sp, sp, $10


//---------------------- chat feed helpers
FNC_AddChatMessage:
# In: a0 = PlayerName, a1 = Message
# Stores the player prefix separately from the message body so the prefix can be blue
# and the message body can remain grey while still visually rendering as "PLAYER: MESSAGE".
addiu sp, sp, $FFE0
sw ra, $0000(sp)
sw s0, $0004(sp)
sw s1, $0008(sp)
sw s2, $000C(sp)
sw s3, $0010(sp)
sw s4, $0014(sp)
sw s5, $0018(sp)
sw s6, $001C(sp)

addu s0, a0, zero
beq a1, zero, :AddChatDone
addu s1, a1, zero
lbu t0, $0000(s1)
beq t0, zero, :AddChatDone
nop

# Null or empty player name falls back to PLAYER.
beq s0, zero, :AddChatUseDefaultPlayer
nop
lbu t0, $0000(s0)
bne t0, zero, :AddChatHavePlayer
nop
AddChatUseDefaultPlayer:
setreg s0, :DefaultChatPlayerName
AddChatHavePlayer:

setreg t0, :MaxChatMessageCount
lw s2, $0000(t0)
blez s2, :AddChatDone
nop

# Last usable slot index = MaxChatMessageCount - 1.
addiu s3, s2, $FFFF

# Base pointers for the three parallel arrays.
setreg s4, :chat_msg0
setreg s5, :chat_player0
setreg s6, :chat_timer0

# Shift existing slots upward in a loop: slot 1->0, 2->1, ... last->last-1.
# After this loop, s4/s5/s6 point at the newest/last slot.
blez s3, :AddChatCopyNew
nop
addu t9, zero, zero
AddChatShiftLoop:
slt t0, t9, s3
beq t0, zero, :AddChatCopyNew
nop

addu a0, s4, zero
jal :FNC_CopySlot128
addiu a1, s4, $0080

addu a0, s5, zero
jal :FNC_CopySlot64
addiu a1, s5, $0040

lw t1, $0004(s6)
sw t1, $0000(s6)

addiu s4, s4, $0080
addiu s5, s5, $0040
addiu s6, s6, $0004
beq zero, zero, :AddChatShiftLoop
addiu t9, t9, $0001

AddChatCopyNew:
# Copy player prefix into newest player slot as "PLAYER: ".
addu a0, s5, zero
jal :FNC_FormatPlayerPrefix
addu a1, s0, zero

# Copy submitted message body into newest message slot.
addu a0, s4, zero
addu a1, s1, zero
jal :FNC_CopyStringBounded
addiu a2, zero, $007F

setreg t0, :chat_feed_timeout_ticks
lw t1, $0000(t0)
sw t1, $0000(s6)

AddChatDone:
lw ra, $0000(sp)
lw s0, $0004(sp)
lw s1, $0008(sp)
lw s2, $000C(sp)
lw s3, $0010(sp)
lw s4, $0014(sp)
lw s5, $0018(sp)
lw s6, $001C(sp)
jr ra
addiu sp, sp, $20


FNC_CopySlot128:
addiu t0, zero, $0020
CopySlotLoop:
beq t0, zero, :CopySlotDone
nop
lw t1, $0000(a1)
sw t1, $0000(a0)
addiu a0, a0, $0004
addiu a1, a1, $0004
beq zero, zero, :CopySlotLoop
addiu t0, t0, $FFFF
CopySlotDone:
jr ra
nop


FNC_CopySlot64:
addiu t0, zero, $0010
CopySlot64Loop:
beq t0, zero, :CopySlot64Done
nop
lw t1, $0000(a1)
sw t1, $0000(a0)
addiu a0, a0, $0004
addiu a1, a1, $0004
beq zero, zero, :CopySlot64Loop
addiu t0, t0, $FFFF
CopySlot64Done:
jr ra
nop

//-------------------- Format player name
FNC_FormatPlayerPrefix:
# In: a0 = destination 0x40-byte prefix slot, a1 = player name.
# Out: destination contains "PLAYER: " and is null-terminated.
beq a0, zero, :FormatPlayerDone
addu t0, a0, zero
beq a1, zero, :FormatPlayerEmpty
addu t1, a1, zero
# 0x3D leaves room for ':', space, and terminator in a 0x40-byte slot.
addiu t2, zero, $003D
FormatPlayerLoop:
beq t2, zero, :FormatPlayerAppendSeparator
nop
lbu t3, $0000(t1)
beq t3, zero, :FormatPlayerAppendSeparator
nop
sb t3, $0000(t0)
addiu t0, t0, $0001
addiu t1, t1, $0001
beq zero, zero, :FormatPlayerLoop
addiu t2, t2, $FFFF
FormatPlayerEmpty:
addu t0, a0, zero
FormatPlayerAppendSeparator:
addiu t3, zero, $003A
sb t3, $0000(t0)
addiu t0, t0, $0001
addiu t3, zero, $0020
sb t3, $0000(t0)
addiu t0, t0, $0001
sb zero, $0000(t0)
FormatPlayerDone:
jr ra
nop

//-------------------- Get string length
FNC_StringLengthBounded:
# In: a0 = string, a1 = max chars. Out: v0 = length up to max or null.
addu v0, zero, zero
beq a0, zero, :StringLengthDone
addu t0, a0, zero
blez a1, :StringLengthDone
addu t1, a1, zero
StringLengthLoop:
beq t1, zero, :StringLengthDone
nop
lbu t2, $0000(t0)
beq t2, zero, :StringLengthDone
nop
addiu v0, v0, $0001
addiu t0, t0, $0001
beq zero, zero, :StringLengthLoop
addiu t1, t1, $FFFF
StringLengthDone:
jr ra
nop

//-------------------- Copy string
FNC_CopyStringBounded:
beq a0, zero, :CopyStringDone
addu t0, a0, zero
beq a1, zero, :CopyStringTerminate
addu t1, a1, zero
addu t2, a2, zero
CopyStringLoop:
beq t2, zero, :CopyStringTerminate
nop
lbu t3, $0000(t1)
sb t3, $0000(t0)
beq t3, zero, :CopyStringDone
nop
addiu t0, t0, $0001
addiu t1, t1, $0001
beq zero, zero, :CopyStringLoop
addiu t2, t2, $FFFF
CopyStringTerminate:
sb zero, $0000(t0)
CopyStringDone:
jr ra
nop

//-------------------- Tick chat feed
FNC_TickChatFeed:
setreg t0, :chat_feed_tick_counter
lw t1, $0000(t0)
addiu t1, t1, $0001
setreg t2, :chat_feed_tick_div
lw t3, $0000(t2)
slti t4, t3, $0001
bne t4, zero, :TickNow
nop
slt t4, t1, t3
beq t4, zero, :TickNow
nop
sw t1, $0000(t0)
jr ra
nop

TickNow:
sw zero, $0000(t0)

setreg t5, :MaxChatMessageCount
lw t9, $0000(t5)
blez t9, :TickDone
nop
setreg t5, :chat_timer0
setreg t7, :chat_msg0
setreg t8, :chat_player0
addu t6, zero, zero
TickTimerLoop:
slt t4, t6, t9
beq t4, zero, :TickDone
nop
lw t1, $0000(t5)
blez t1, :TickNextTimer
nop
addiu t1, t1, $FFFF
sw t1, $0000(t5)
bne t1, zero, :TickNextTimer
nop
# Timer expired; clear both the message body and player prefix.
sb zero, $0000(t7)
sb zero, $0000(t8)

TickNextTimer:
addiu t5, t5, $0004
addiu t7, t7, $0080
addiu t8, t8, $0040
beq zero, zero, :TickTimerLoop
addiu t6, t6, $0001

TickDone:
jr ra
nop


//----------------------- Calculate message alpha color(if message is fading)
FNC_ApplyChatFadeAlpha:
# In:
#   a0 = remaining timer ticks
#   a1 = tRGBA* color to update
#
# Out:
#   v0 = same tRGBA* color pointer
#
# Alpha behavior:
#   remaining > fadeout_ticks  -> alpha = DefaultFloatValue
#   remaining <= 0             -> alpha = 0.0
#   otherwise                  -> alpha = DefaultFloatValue * fade_percent
#
# Draw code should set a1 to whichever color should be faded before calling:
#   setreg a1, :color_light_green
#   jal :FNC_ApplyChatFadeAlpha

addu v0, a1, zero

# Default alpha value used before fadeout begins.
setreg t0, :DefaultFloatValue
lw t1, $0000(t0)
sw t1, $000C(v0)

# No fadeout window means stay at DefaultFloatValue.
setreg t0, :chat_feed_timeout_ticks_fadeout
lw t2, $0000(t0)
blez t2, :ApplyChatFadeAlpha_Return
nop

# If remaining timer is above the fade window, stay at DefaultFloatValue.
slt t3, t2, a0
bne t3, zero, :ApplyChatFadeAlpha_Return
nop

# Clamp tick divider to at least 1.
setreg t0, :chat_feed_tick_div
lw t4, $0000(t0)
slti t5, t4, $0001
beq t5, zero, :ApplyChatFadeAlpha_HaveDiv
nop
addiu t4, zero, $0001

ApplyChatFadeAlpha_HaveDiv:
# numerator = remaining_ticks * tick_div - current_subtick
mult a0, t4
mflo t5

setreg t0, :chat_feed_tick_counter
lw t6, $0000(t0)
subu t5, t5, t6

# If numerator is zero or negative, alpha is 0.0.
bgtz t5, :ApplyChatFadeAlpha_HaveNumerator
nop
sw zero, $000C(v0)
jr ra
nop

ApplyChatFadeAlpha_HaveNumerator:
# denominator = fadeout_ticks * tick_div
mult t2, t4
mflo t7
blez t7, :ApplyChatFadeAlpha_Return
nop

# If numerator is at/above denominator, leave DefaultFloatValue.
slt t8, t5, t7
beq t8, zero, :ApplyChatFadeAlpha_Return
nop

# alpha = DefaultFloatValue * (numerator / denominator)
mtc1 t5, f0
cvt.s.w f0, f0

mtc1 t7, f2
cvt.s.w f2, f2

div.s f0, f0, f2

setreg t0, :DefaultFloatValue
lwc1 f2, $0000(t0)
mul.s f0, f0, f2

swc1 f0, $000C(v0)

ApplyChatFadeAlpha_Return:
jr ra
nop


//-------------------- Scale font
FNC_PrintTextScaled:
# Direct font display helper.
# Note: Display__5cFontCFPCcRC5tRGBAiif's float argument is Z/depth, not text scale.
# Actual size is controlled by selecting a different loaded font in FNC_SelectChatFont.
# In, matching the old local print-call convention:
#   a0 = cTextSystem*  ignored here
#   a1 = char*         text
#   a2 = cFont*        font
#   a3 = tRGBA*        color
#   t0 = x
#   t1 = y
# Calls retail Display__5cFontCFPCcRC5tRGBAiif at $0036A300:
#   a0 = cFont*
#   a1 = char*
#   a2 = tRGBA*
#   a3 = x
#   t0 = y
#   f12 = Z/depth
addu t2, a1, zero
addu a0, a2, zero
addu a1, t2, zero
addu a2, a3, zero
addu a3, t0, zero
addu t0, t1, zero
setreg t9, :DefaultFloatValue
j $0036A300
lwc1 f12, $0000(t9)


//-------------------- Select font
FNC_SelectChatFont:
# In:  a0 = cMachine*
# Out: v0 = selected cFont* or first available fallback.
# chat_text_size is a single font-size selector, not a raw scale.
# Extra safety: during game teardown, cMachine/font slots can briefly be null
# or small invalid values. Returning those into cFont::Display causes TLB misses
# at $0036A3B4 / $0036AA50. Only return pointers >= $1000.
beq a0, zero, :SelectFontNone
nop
sltiu t3, a0, $1000
bne t3, zero, :SelectFontNone
nop

setreg t0, :chat_text_size
lw t1, $0000(t0)
sltiu t2, t1, $0005
bne t2, zero, :SelectFontIndexOK
nop
addu t1, zero, zero

SelectFontIndexOK:
sll t1, t1, $0002
addiu t2, a0, $0280
addu t2, t2, t1
lw v0, $0000(t2)
sltiu t3, v0, $1000
beq t3, zero, :SelectFontReturn
nop

lw v0, $0280(a0)
sltiu t3, v0, $1000
beq t3, zero, :SelectFontReturn
nop

lw v0, $0284(a0)
sltiu t3, v0, $1000
beq t3, zero, :SelectFontReturn
nop

lw v0, $0288(a0)
sltiu t3, v0, $1000
beq t3, zero, :SelectFontReturn
nop

lw v0, $028C(a0)
sltiu t3, v0, $1000
beq t3, zero, :SelectFontReturn
nop

lw v0, $0290(a0)
sltiu t3, v0, $1000
beq t3, zero, :SelectFontReturn
nop

SelectFontNone:
addu v0, zero, zero
SelectFontReturn:
jr ra
nop


//----------------------- Draw messages
FNC_DrawChatFeed:
addiu sp, sp, $FFD0
sw ra, $0004(sp)
sw s0, $0008(sp)
sw s1, $000C(sp)
sw s2, $0010(sp)
sw s3, $0014(sp)
sw s4, $0018(sp)
sw s5, $001C(sp)
sw s6, $0020(sp)
sw s7, $0024(sp)

addu s0, a0, zero
addu s1, a1, zero

setreg t0, :chat_feed_enabled
lw t1, $0000(t0)
beq t1, zero, :DrawChatDone
nop

setreg t0, :MaxChatMessageCount
lw s2, $0000(t0)
blez s2, :DrawChatDone
nop

# Feed uses the same X as the console input line.
setreg t5, :console_x_pos
lw s3, $0000(t5)

# Base Y = console_y_pos + (MaxChatMessageCount * chat_font_size).
# In this game's text coordinate space, larger Y appears higher on screen.
# chat_msg0 is the oldest/top line; newest lands one line above the input box.
// check if player is in game or lobby
setreg t6, :console_y_pos
lui t1, $004F
lw t1, $7F70(t1)
bne t1, zero, :DCF_continue1
nop
setreg t6, :console_y_pos_lobby
DCF_continue1:
lw s4, $0000(t6)
setreg t7, :chat_messageY
lw t8, $0000(t7)
mult s2, t8
mflo t9
addu s4, s4, t9

setreg s5, :chat_timer0
setreg s6, :chat_msg0
setreg s7, :chat_player0
DrawChatLoop:
blez s2, :DrawChatDone
nop
lw t1, $0000(s5)
blez t1, :DrawChatNext
nop
lbu t2, $0000(s6)
beq t2, zero, :DrawChatNext
nop

# Draw the formatted player prefix ("PLAYER: ")
setreg a1, :color_light_green
jal :FNC_ApplyChatFadeAlpha
addu a0, t1, zero
addu a0, s0, zero
addu a1, s7, zero
addu a2, s1, zero
addu a3, v0, zero
addu t0, s3, zero
jal :FNC_PrintTextScaled
addu t1, s4, zero

# Compute x advance for the message body using the actual rendered prefix width.
addu a0, s7, zero
jal :FNC_StringLengthBounded
addiu a1, zero, $003F
addu a0, s1, zero
addu a1, s7, zero
jal $0036AA50
addu a2, v0, zero
addu t0, s3, v0
sw t0, $0000(sp)

# Draw the message body in the existing grey fade color.
setreg a1, :color_chat_dynamic
jal :FNC_ApplyChatFadeAlpha
lw a0, $0000(s5)
addu a0, s0, zero
addu a1, s6, zero
addu a2, s1, zero
addu a3, v0, zero
lw t0, $0000(sp)
jal :FNC_PrintTextScaled
addu t1, s4, zero

DrawChatNext:
setreg t7, :chat_messageY
lw t8, $0000(t7)
subu s4, s4, t8
addiu s5, s5, $0004
addiu s6, s6, $0080
addiu s7, s7, $0040
beq zero, zero, :DrawChatLoop
addiu s2, s2, $FFFF

DrawChatDone:
lw ra, $0004(sp)
lw s0, $0008(sp)
lw s1, $000C(sp)
lw s2, $0010(sp)
lw s3, $0014(sp)
lw s4, $0018(sp)
lw s5, $001C(sp)
lw s6, $0020(sp)
lw s7, $0024(sp)
jr ra
addiu sp, sp, $30


//----------------------- Draw input box
FNC_DrawConsoleOverlay:
addiu sp, sp, $FFD0
sw ra, $0000(sp)
sw s0, $0004(sp)
sw s1, $0008(sp)
sw s2, $000C(sp)
sw s3, $0010(sp)
sw s4, $0014(sp)
sw s5, $0018(sp)
sw v0, $001C(sp)
sw s6, $0020(sp)

# Skip if in-game player list/local player globals are null
lui t0, $0056
lw t0, $C770(t0)
beq t0, zero, :DrawDone
nop
lui t0, $0057
lw t0, $1770(t0)
beq t0, zero, :DrawDone
nop

// GetTextSystem__Fv #returned in v0
jal $003D1020
nop
sltiu t0, v0, $1000
bne t0, zero, :DrawDone
addu s1, v0, zero

jal $001698C0
nop
sltiu t0, v0, $1000
bne t0, zero, :DrawDone
addu s0, v0, zero

# Use the font selected by chat_text_size.
jal :FNC_SelectChatFont
addu a0, s0, zero
beq v0, zero, :DrawDone
addu s3, v0, zero

// set Y position
setreg s6, :console_y_pos
lui t1, $004F
lw t1, $7F70(t1) #load sTotalTime__9cBackpack (time in game)
bne t1, zero, :DC0_continue1
nop
setreg s6, :console_y_pos_lobby
DC0_continue1:

// font color
setreg s2, :color_brightgreen

# Draw the multi-line chat feed even when the input console is closed.
jal :FNC_TickChatFeed
nop
addu a0, s1, zero
addu a1, s3, zero
jal :FNC_DrawChatFeed
addu a2, s2, zero

# Only draw the live input box while the console is active.
lbu t0, $002D(s0)
beq t0, zero, :DrawDone
nop

# cTextSystem::Print(a0=this, a1=text, a2=font, a3=color, t0=x, t1=y)
# Draw only the prompt and live input buffer.
addu a0, s1, zero
setreg a1, :line_prompt
addu a2, s3, zero
addu a3, s2, zero
setreg t5, :console_x_pos
lw t0, $0000(t5)
jal :FNC_PrintTextScaled
lw t1, $0000(s6)

addu a0, s1, zero
setreg a1, :cmd_buf
addu a2, s3, zero
setreg a3, :color_white
setreg t5, :console_x_pos
lw t0, $0000(t5)
setreg t7, :chat_font_size
lw t8, $0000(t7)
addu t0, t0, t8
jal :FNC_PrintTextScaled
lw t1, $0000(s6)

# Flashing cursor after the last typed character.
setreg t0, :cursor_blink_counter
lw t1, $0000(t0)
addiu t1, t1, $0001
setreg t2, :cursor_blink_rate
lw t3, $0000(t2)
slti t4, t3, $0001
bne t4, zero, :CursorCounterReset
nop
slt t4, t1, t3
bne t4, zero, :CursorCounterStore
nop
CursorCounterReset:
addu t1, zero, zero
CursorCounterStore:
sw t1, $0000(t0)
setreg t5, :cursor_blink_visible_ticks
lw t6, $0000(t5)
slt t7, t1, t6
beq t7, zero, :SkipCursorDraw
nop

# cursor_x = console_x_pos + chat_font_size + GetStringWidth(font, cmd_buf, cmd_len)
# GetStringWidth__5cFontCFPCci gives the real rendered width, so the cursor
# no longer drifts right as more characters are typed.
addu a0, s3, zero
setreg a1, :cmd_buf
setreg t9, :cmd_len
jal $0036AA50
lw a2, $0000(t9)
setreg t5, :console_x_pos
lw t0, $0000(t5)
setreg t7, :chat_font_size
lw t8, $0000(t7)
addu t0, t0, t8
addu t0, t0, v0
CursorXDone:
# Cursor is green normally, but turns red when cmd_len >= console_input_char_limit.
setreg t9, :cmd_len
lw t7, $0000(t9)
setreg t6, :console_input_char_limit
lw t8, $0000(t6)
slt t9, t7, t8
bne t9, zero, :CursorUseGreen
nop
setreg a3, :color_red
beq zero, zero, :CursorColorDone
nop
CursorUseGreen:
setreg a3, :color_green
CursorColorDone:
addu a0, s1, zero
setreg a1, :cursor_string
addu a2, s3, zero
jal :FNC_PrintTextScaled
lw t1, $0000(s6)
SkipCursorDraw:

DrawDone:
lw ra, $0000(sp)
lw s0, $0004(sp)
lw s1, $0008(sp)
lw s2, $000C(sp)
lw s3, $0010(sp)
lw s4, $0014(sp)
lw s5, $0018(sp)
lw v0, $001C(sp)
lw s6, $0020(sp)
jr ra
addiu sp, sp, $30


//---------------------- Get PlayerName from PlayerID
FNC_GetPersonaNamePtrByClientObjectID:
# In:
#   a0 = client object id
#        Example:
#          $01020801 = Player1 / client 0 / persona slot 0
#          $02020801 = Player2 / client 1 / persona slot 1
# Out:
#   v0 = player name pointer

# t0 = high byte
srl t0, a0, 24
# t0 = persona slot index
addiu t0, t0, $FFFF
# t0 = persona slot offset
sll t0, t0, 2
# t1 = PersonaTable_Base
lui t1, $004F
ori t1, t1, $FD18
# t1 = PersonaTable_Base + slot offset
addu t1, t1, t0
# v0 = Persona*
lw v0, $0000(t1)
# v0 = Persona->PlayerName
jr ra
addiu v0, v0, $08AC


//---------------------- Setup text chat
FNC_SetupTextChat:
addiu sp, sp, $FFF0
sw ra, $0000(sp)
sw v0, $0004(sp)

//-- Register chat message packet (only executes once)
setreg t0, :BOOL_PacketsRegistered
lbu t1, $0000(t0)
// check if packets are already registered
bne t1, zero, :RCP_end
nop
// set BOOL_PacketsRegistered to TRUE
ori t1, zero, $1
sb t1, $0000(t0)
// register ChatMessage
setreg a0, :C0_ChatMessage
setreg a2, :FNC_ChatMessageReceiver
jal $00305998 #RegisterMessage
addiu a1, zero, $0
RCP_end:

// Skip in-game player list is null
lui t0, $0056
lw t0, $C770(t0)
beq t0, zero, :TextChatTickDone
nop

//-- Draw chat menu
jal :FNC_DrawConsoleOverlay
nop

TextChatTickDone:
lw ra, $0000(sp)
lw v0, $0004(sp)
jr ra
addiu sp, sp, $10

// variable to verify if function has already registered packets
BOOL_PacketsRegistered:
nop
// chat message ID
C0_ChatMessage:
nop


//---------------------- Send chat message
FNC_SendChatMessage:
addiu sp, sp, $FFF0
sw ra, $0000(sp)

// check if player list exists(is in game)
lui t0, $0056
lw t0, $C770(t0)
beq t0, zero, :CMS_end
nop

//-- PACKET SETUP
// flags
ori a0, zero, $0
// connection index
ori a1, zero, $0
// FFFF broadcast
addiu a2, zero, $FFFF
// packet ID
setreg a3, :C0_ChatMessage
lhu a3, $0000(a3)
// packet size
addiu t0, zero, $36 #54 bytes
// packet data
setreg t1, :VAR_ChatMessageStart
// load clientID and save it
lui t3, $0057
lw t3, $1770(t3) #playerobject
lw t3, $000C(t3) #clientID
// NetSendDmeMessage
jal $002DE880
sw t3, $0000(t1) #save to start of packet data
//--

CMS_end:
lw ra, $0000(sp)
jr ra
addiu sp, sp, $10


//---------------------- Receive chat message
FNC_ChatMessageReceiver:
addiu sp, sp, $FFF0
sw ra, $0000(sp)
sw s0, $0004(sp)
// move packet data to s0
daddu s0, a3, zero

// check if user has chat disabled
setreg t0, :BOOL_ChatEnabled
lbu t0, $0000(t0)
beq t0, zero, :CMR_end
nop

// check if packet size exceeds 50(max buffer is 7F)
// needed in case someone tries a buffer overflow
slti t0, s4, $50
beq t0, zero, :CMR_end
nop

// get playerName from playerID
jal :FNC_GetPersonaNamePtrByClientObjectID
lw a0, $0000(s0) #load clientID from packet
beq v0, zero, :CMR_end
nop
// check if no name
bne v0, zero, :CMR_AddMessage
nop
// no name, use unknown
setreg v0, :STR_UnknownPlayer

CMR_AddMessage:
// add chat message
daddu a0, v0, zero #player name
jal :FNC_AddChatMessage
addiu a1, s0, $4 #message start

CMR_end:
addiu v0, zero, $36 #return packet size
lw ra, $0000(sp)
lw s0, $0004(sp)
jr ra
addiu sp, sp, $10

STR_UnknownPlayer:
print "UNKNOWN PLAYER"
nop


//---------------------- hooks / patches
address $00165584
j :FNC_KeyboardHandler
nop
// enable console
address $00167DB8
nop
// Text Chat Tick
address $001691FC
j :FNC_SetupTextChat
