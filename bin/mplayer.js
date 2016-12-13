var spawn = require('child_process').spawn,
	fs = require('fs'),
	mplayer = spawn('mplayer', [
		'-noborder',
		'-nocache',
		'-demuxer', 'lavf',
		'-lavfdopts', 'format=mjpeg:analyzeduration=1',
		'http://' + fs.readFileSync('/home/pi/wormhole_target_ip').toString('utf8').replace(/(?:\r\n|\r|\n)/g, '') + ':8080/cam.mjpg',
		'-fs',
		'-vo', 'x11'
	]);

mplayer.stdout.pipe(process.stdout);
mplayer.stderr.pipe(process.stderr);

mplayer.on('close', function (code) {
	process.exit(code);
});