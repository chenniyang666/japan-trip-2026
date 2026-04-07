const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');

const base = 'https://fancy-palmier-1d009d.netlify.app/';
const outDir = 'c:\\Users\\70927\\WorkBuddy\\20260407093217';
const imgDir = path.join(outDir, 'images');

if (!fs.existsSync(imgDir)) fs.mkdirSync(imgDir, { recursive: true });

const images = [
  'images/d1_narita_airport.jpg','images/d1_japan_night.jpg',
  'images/d2_sensoji_1.jpg','images/d2_sensoji_2.jpg',
  'images/d2_tempura_1.jpg','images/d2_tempura_2.jpg',
  'images/d2_akiba_1.jpg','images/d2_akiba_2.jpg',
  'images/d2_skytree_1.jpg','images/d2_skytree_2.jpg',
  'images/d3_gyoen_1.jpg','images/d3_gyoen_2.jpg',
  'images/d3_shibuya_1.jpg','images/d3_shibuya_2.jpg',
  'images/d3_tokyo_tower_1.jpg','images/d3_tokyo_tower_2.jpg',
  'images/d4_engakuji_1.jpg','images/d4_engakuji_2.jpg',
  'images/d4_buddha_1.jpg','images/d4_buddha_2.jpg',
  'images/d4_enoshima_1.jpg','images/d4_enoshima_2.jpg',
  'images/d5_fuji_1.jpg','images/d5_mount_fuji.jpg',
  'images/d5_onsen_1.jpg','images/d5_onsen_2.jpg',
  'images/d6_moa_1.jpg','images/d6_moa_2.jpg',
  'images/d6_castle_1.jpg','images/d6_atami_coast.jpg',
  'images/d7_shuzenji_1.jpg','images/d7_shuzenji_2.jpg',
  'images/d7_waterfall_2.jpg','images/d7_waterfall_3.jpg',
  'images/d8_market_1.jpg','images/d8_market_2.jpg',
  'images/d8_unagi_1.jpg','images/d8_unagi_2.jpg'
];

let ok = 0, fail = 0;
for (const img of images) {
  const url = base + img;
  const localPath = path.join(outDir, img);
  try {
    execSync(`curl.exe -s -L "${url}" -o "${localPath}"`, { timeout: 15000 });
    const stats = fs.statSync(localPath);
    if (stats.size > 100) { ok++; } else { fail++; console.log('EMPTY: ' + img); }
  } catch(e) { fail++; console.log('FAIL: ' + img); }
}
console.log('Done! OK: ' + ok + ', Failed: ' + fail);
