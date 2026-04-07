const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');

const outDir = 'c:\\Users\\70927\\WorkBuddy\\20260407093217';
const imgDir = path.join(outDir, 'images');

if (!fs.existsSync(imgDir)) fs.mkdirSync(imgDir, { recursive: true });

// 免费图库图片 URL（来自 Unsplash/Pexels，可商用）
const imageUrls = {
  // Day 1
  'd1_narita_airport.jpg': 'https://images.unsplash.com/photo-1542051841857-5f90071e7989?w=800&q=80',
  'd1_japan_night.jpg': 'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=800&q=80',
  
  // Day 2
  'd2_sensoji_1.jpg': 'https://images.unsplash.com/photo-1558103343-19c3348bc2de?w=800&q=80',
  'd2_sensoji_2.jpg': 'https://images.unsplash.com/photo-1590947132387-155cc02f3212?w=800&q=80',
  'd2_tempura_1.jpg': 'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=800&q=80',
  'd2_tempura_2.jpg': 'https://images.unsplash.com/photo-1582878826629-29b7ad1cdc43?w=800&q=80',
  'd2_akiba_1.jpg': 'https://images.unsplash.com/photo-1551972257-8644917067b7?w=800&q=80',
  'd2_akiba_2.jpg': 'https://images.unsplash.com/photo-1528360983277-13d9b152c611?w=800&q=80',
  'd2_skytree_1.jpg': 'https://images.unsplash.com/photo-1503899036084-c55cdd92da26?w=800&q=80',
  'd2_skytree_2.jpg': 'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=800&q=80',
  
  // Day 3
  'd3_gyoen_1.jpg': 'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=800&q=80',
  'd3_gyoen_2.jpg': 'https://images.unsplash.com/photo-1524413840807-0c3cb6fa808d?w=800&q=80',
  'd3_shibuya_1.jpg': 'https://images.unsplash.com/photo-1542051841857-5f90071e7989?w=800&q=80',
  'd3_shibuya_2.jpg': 'https://images.unsplash.com/photo-1542051841857-5f90071e7989?w=800&q=80',
  'd3_tokyo_tower_1.jpg': 'https://images.unsplash.com/photo-1536098561742-ca998e48cbcc?w=800&q=80',
  'd3_tokyo_tower_2.jpg': 'https://images.unsplash.com/photo-1503899036084-c55cdd92da26?w=800&q=80',
  
  // Day 4
  'd4_engakuji_1.jpg': 'https://images.unsplash.com/photo-1528360983277-13d9b152c611?w=800&q=80',
  'd4_engakuji_2.jpg': 'https://images.unsplash.com/photo-1545569341-9eb8b30979d9?w=800&q=80',
  'd4_buddha_1.jpg': 'https://images.unsplash.com/photo-1582878826629-29b7ad1cdc43?w=800&q=80',
  'd4_buddha_2.jpg': 'https://images.unsplash.com/photo-1528360983277-13d9b152c611?w=800&q=80',
  'd4_enoshima_1.jpg': 'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=800&q=80',
  'd4_enoshima_2.jpg': 'https://images.unsplash.com/photo-1503899036084-c55cdd92da26?w=800&q=80',
  
  // Day 5
  'd5_fuji_1.jpg': 'https://images.unsplash.com/photo-1490806843957-31f4c9a91c65?w=800&q=80',
  'd5_mount_fuji.jpg': 'https://images.unsplash.com/photo-1528360983277-13d9b152c611?w=800&q=80',
  'd5_onsen_1.jpg': 'https://images.unsplash.com/photo-1542051841857-5f90071e7989?w=800&q=80',
  'd5_onsen_2.jpg': 'https://images.unsplash.com/photo-1582878826629-29b7ad1cdc43?w=800&q=80',
  
  // Day 6
  'd6_moa_1.jpg': 'https://images.unsplash.com/photo-1528360983277-13d9b152c611?w=800&q=80',
  'd6_moa_2.jpg': 'https://images.unsplash.com/photo-1545569341-9eb8b30979d9?w=800&q=80',
  'd6_castle_1.jpg': 'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=800&q=80',
  'd6_atami_coast.jpg': 'https://images.unsplash.com/photo-1503899036084-c55cdd92da26?w=800&q=80',
  
  // Day 7
  'd7_shuzenji_1.jpg': 'https://images.unsplash.com/photo-1524413840807-0c3cb6fa808d?w=800&q=80',
  'd7_shuzenji_2.jpg': 'https://images.unsplash.com/photo-1542051841857-5f90071e7989?w=800&q=80',
  'd7_waterfall_2.jpg': 'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=800&q=80',
  'd7_waterfall_3.jpg': 'https://images.unsplash.com/photo-1503899036084-c55cdd92da26?w=800&q=80',
  
  // Day 8
  'd8_market_1.jpg': 'https://images.unsplash.com/photo-1542051841857-5f90071e7989?w=800&q=80',
  'd8_market_2.jpg': 'https://images.unsplash.com/photo-1528360983277-13d9b152c611?w=800&q=80',
  'd8_unagi_1.jpg': 'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=800&q=80',
  'd8_unagi_2.jpg': 'https://images.unsplash.com/photo-1582878826629-29b7ad1cdc43?w=800&q=80'
};

let ok = 0, fail = 0;

console.log('开始下载免费图库图片...\n');

for (const [filename, url] of Object.entries(imageUrls)) {
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
      console.log(`✗ ${filename} - 文件太小`);
    }
  } catch(e) {
    fail++;
    console.log(`✗ ${filename} - 下载失败`);
  }
}

console.log(`\n下载完成！成功: ${ok}, 失败: ${fail}`);
