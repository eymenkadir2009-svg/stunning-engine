const { spawn } = require('child_process');
const path = require('path');

// package.json'dan ana CLI dosyasını bul
const pkg = require('./node_modules/9router/package.json');
const binRel = typeof pkg.bin === 'string' ? pkg.bin : (pkg.bin ? Object.values(pkg.bin)[0] : pkg.main);
const binPath = path.resolve('./node_modules/9router', binRel);

const port = process.env.PORT || '20128';

console.log(`[Entry] Starting 9router on port ${port}...`);

// Process'i doğrudan child process olarak ön planda çalıştırıyoruz
const child = spawn(process.execPath, ['--max-old-space-size=256', binPath, '--host', '0.0.0.0', '--port', port], {
  stdio: 'inherit',
  env: process.env
});

child.on('exit', (code) => {
  console.log(`[Entry] 9router process exited with code ${code}`);
  process.exit(code || 0);
});
