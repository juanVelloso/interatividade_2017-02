s.volume.gui

// Low Pass Filter
{LPF.ar(in:WhiteNoise.ar(0.4), freq:MouseX.kr(200, 15000))!2}.play;

// High Pass Filter
{HPF.ar(in:WhiteNoise.ar(0.4), freq:MouseX.kr(200, 15000))!2}.play;

// "to ring", ressoar. Filtro "ressonante"
// CUIDADO! input do Ringz (muitas vezes) precisa ter amplitude muito reduzida!!!!
{Ringz.ar(in:WhiteNoise.ar(0.005), freq:MouseX.kr(200, 5000))!2}.play

// quaisquer geradores de som (como osciladores) podem ser inputs de um filtro

{LPF.ar(in:Pulse.ar(freq:300, mul:0.2), freq:MouseX.kr(200, 15000)!2)}.freqscope
{HPF.ar(in:Pulse.ar(freq:300, mul:0.2), freq:MouseX.kr(200, 15000)!2)}.freqscope

{Ringz.ar(in:Saw.ar(freq:300, mul:0.02),freq:MouseX.kr(200, 5000)!2)}.freqscope

////

// dois geradores de som novos: Dust.ar & Impulse.ar
// são "geradores de impulsos"

{Dust.ar(10)!2}.play
{Impulse.ar(10)!2}.play

// geradores de impulso + filtros ressonantes = <3
{Ringz.ar(in:Impulse.ar(5), freq:600, mul:0.2)!2}.play
{Ringz.ar(in:Dust.ar(5), freq:MouseX.kr(200, 5000), mul:0.2)!2}.play

// novo argumento do Ringz: decaytime
{Ringz.ar(in:Impulse.ar(1), freq:600, decaytime:MouseX.kr(0.1, 1))!2}.play
{Ringz.ar(in:Dust.ar(5), freq:MouseX.kr(300, 5000), decaytime:MouseY.kr(0.1, 1))!2}.play

////

(
{
	var geradorSom, freqFiltro;

	geradorSom = Pulse.ar(300, mul:0.2);
	freqFiltro = MouseX.kr(200, 15000);

	LPF.ar(in: geradorSom, freq: freqFiltro)!2;

}.play
)

(
{
	var osc1, osc2, freqOsc;

	freqOsc = rrand(200, 1000).postln;
	osc1 = Saw.ar(freqOsc, mul:0.2);
	osc2 = Saw.ar(freqOsc + 0.5, mul: 0.2);

	LPF.ar(in: osc1 + osc2, freq:MouseX.kr(200, 15000))!2;

}.play
)

(
{
	var trigger, freqFiltro;

	trigger = Dust.ar(3, mul:0.3);
	freqFiltro = 600;

	Ringz.ar(trigger, freqFiltro * 1, mul:0.3) +
	Ringz.ar(trigger, freqFiltro * 2, mul:0.3) +
	Ringz.ar(trigger, freqFiltro * 3, mul:0.3) !2
}.freqscope
)

// como modificar esse exemplo, de modo que a posição do mouse
// modifique o tempo de decay do filtro Ringz, mas que esse tempo
// seja diferente para cada um dos três filtros?


(
{


}.freqscope
)

////

// sintaxe e escopo das variáveis.
// qual a diferença entre SC e Processing?

n = 10;
n.postln;
(n + 1).postln;

~numeroGlobal = 15;
(~numeroGlobal / 2).postln;

(
var numeroLocal = 81;
numeroLocal.sqrt.postln;
)

////

a = {SinOsc.ar(400, mul:0.1)!2}.play;
a.free;

b = {Dust.ar(200, mul:0.1)!2}.play;
b.free;

////