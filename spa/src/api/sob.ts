import { GET } from './index';

export const getSobList = () => {
  return GET({
    url:
      process.env.NODE_ENV === 'development'
        ? 'http://localhost:3000/soblist'
        : 'https://raw.githubusercontent.com/soblist-org/list/master/soblist.json',
  });
};
