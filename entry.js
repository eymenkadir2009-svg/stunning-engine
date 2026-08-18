const { spawn } = require('child_process');
const path = require('path');

const pkg = require('./node_modules/9router/package.json');
const binRel = typeof pkg.bin === 'string' ? pkg.bin : (pkg.bin ? Object.values(pkg.bin)[0] : pkg.main);
const binPath = path.resolve('./node_modules/9router', binRel);

const port = process.env.PORT || '20128';

console.log(`[Entry] Launching 9router on 0.0.0.0:${port}...`);

// Node.js çöp toplayıcısını (GC) ve bellek kullanımını agresif şekilde kısıtlıyoruz
const args = [
  '--max-old-space-size=128',
  '--optimize-for-size',
  '--gc-global',
  binPath,
  '--host', '0.0.0.0',
  '--port', port
];

const child = spawn(process.execPath, args, {
  stdio: 'inherit',
  env: { 
    ...process.env, 
    PUPPETEER_SKIP_CHROMIUM_DOWNLOAD: 'true',
    DISABLE_AUTO_UPDATE: 'true'
  }
});

child.on('exit', (code, signal) => {
  console.log(`[Entry] 9router process exited with code ${code}, signal: ${signal}`);
  process.exit(code || 1);
});
