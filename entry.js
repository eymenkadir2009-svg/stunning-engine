// entry.js
const { execSync } = require('child_process');

// Render'ın dinamik PORT'unu veya varsayılanı al
const port = process.env.PORT || 20128;
const host = process.env.HOSTNAME || '0.0.0.0';
const baseUrl = process.env.NEXT_PUBLIC_BASE_URL || `http://localhost:${port}`;

console.log(`9router starting on ${host}:${port}...`);

try {
  // 9router CLI komutunu uygun ortam değişkenleriyle çalıştırır
  execSync(`npx 9router`, {
    stdio: 'inherit',
    env: {
      ...process.env,
      PORT: port,
      HOSTNAME: host,
      NEXT_PUBLIC_BASE_URL: baseUrl
    }
  });
} catch (err) {
  console.error("9router başlatılamadı:", err);
}
