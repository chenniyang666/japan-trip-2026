const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');

const imgDir = 'c:\\Users\\70927\\WorkBuddy\\20260407093217\\images';

// 重新下载失败的图片，使用备用图片源
const retryImages = {
  'd2_sensoji_1.jpg': 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?w=800&q=80',
  'd2_akiba_1.jpg': 'https://images.unsplash.com/photo-1528360983277-13d9b152c611?w=800&q=80',
  'd2_akiba_2.jpg': 'https://images.unsplash.com/photo-1545569341-9eb8b30979d9?w=800&q=80',
  'd4_engakuji_1.jpg': 'https://images.unsplash.com/photo-1542051841857-5f90071e7989?w=800&q=80',
  'd4_buddha_2.jpg': 'https://images.unsplash.com/photo-1582878826629-29b7ad1cdc43?w=800&q=80',
  'd5_mount_fuji.jpg': 'https://images.unsplash.com/photo-1490806843957-31f4c9a91c65?w=800&q=80',
  'd6_moa_1.jpg': 'https://images.unsplash.com/photo-1524413840807-0c3cb6fa808d?w=800&q=80',
  'd8_market_2.jpg': 'https://images.unsplash.com/photo-1545569341-9eb8b30979d9?w=800&q=80'
};

let ok = 0, fail = 0;

console.log('重新下载失败的图片...\n');

for (const [filename, url] of Object.entries(retryImages)) {
  const localPath = path.join(imgDir, filename);
  try {
    console.log(`正在下载: ${filename}...`);
    execSync(`curl.exe -s -L "${url}" -o "${localPath}"`, { timeout: 30000 });
    const stats = fs.statSync(localPath);
    if (stats.size > 5000) {
      ok++;
      console.log(`✓ ${filename} (${Math.round(stats.size / 1024)}KB)`);
    } else {
      fail++;
      console.log(`✗ ${filename} - 文件仍然太小`);
    }
  } catch(e) {
    fail++;
    console.log(`✗ ${filename} - 下载失败`);
  }
}

console.log(`\n重新下载完成！成功: ${ok}, 失败: ${fail}`);
