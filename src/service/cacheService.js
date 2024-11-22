// const { createClient } = require('redis');

// const redisClient = createClient({
//   password: 'seHLzukLoV86cjaCo1U1ePkrvsyHw74u',
//   socket: {
//     host: 'redis-11157.c244.us-east-1-2.ec2.redns.redis-cloud.com',
//     port: 11157,
//     reconnectStrategy: retries => Math.min(retries * 100, 3000),
//     timeout: 20000,
//   },
// });

// redisClient.on('connect', () => console.log('Redis connected!'));
// redisClient.on('error', err => console.error('Redis error:', err));

// (async () => {
//   await redisClient.connect();
// })();

// const cacheService = {
//   async get(key) {
//     try {
//       const value = await redisClient.get(key);
//       return value ? JSON.parse(value) : null;
//     } catch (err) {
//       console.error('Error getting cache:', err);
//       return null;
//     }
//   },

//   async set(key, value, ttl = 300) {
//     try {
//       await redisClient.set(key, JSON.stringify(value), { EX: ttl });
//     } catch (err) {
//       console.error('Error setting cache:', err);
//     }
//   },
// };

// module.exports = cacheService;
