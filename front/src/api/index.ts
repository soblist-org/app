import * as Axios from 'axios';

const axios = Axios.default.create({
  timeout: 0,
  withCredentials: true,
  transformResponse: [
    (data: any) => {
      try {
        data = JSON.parse(data);
      } catch (e) {
        data = {};
      }
      return data;
    },
  ],
});

export const GET = (req: any) =>
  axios.get(req.url, {
    params: req.data,
  });

export default axios;
