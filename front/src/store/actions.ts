import { ActionTree } from 'vuex';
import { State } from './state';
import { getSobList } from '../api/sob';
import { types } from './types';

const actions: ActionTree<State, any> = {
  async getSobListAsync({ commit }) {
    const res = await getSobList();
    if (res.status === 200) {
      commit(types.SET_SOB_LIST, res.data);
    }
    return res;
  },
};

export default actions;
