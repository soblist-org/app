import { types } from './types';
import { State } from './state';

export default {
  [types.SET_SOB_LIST](state: State, data: any) {
    state.sobList = data;
  },
};
