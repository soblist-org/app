<template>
  <div class="home">
    <div
      class="loading"
      v-show='showSpin'
    >
      <b-spinner
        style="width: 3rem; height: 3rem;"
        label="Large Spinner"
      ></b-spinner>
      <h3>{{ $t('loading') }}</h3>
    </div>
    <b-container
      v-show="!showSpin"
      class="sob-container"
    >
      <son-of-bitch-item
        v-for="(sobItem, index) in sobItems"
        :key="index"
        :sob="sobItem"
      />
    </b-container>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from "vue-property-decorator";
import SonOfBitchItem from "@/components/SonOfBitchItem.vue";

@Component({
  components: {
    SonOfBitchItem
  }
})
export default class Home extends Vue {
  showSpin: boolean = true;
  get sobItems() {
    return this.$store.state.sobList;
  }
  mounted() {
    this.$store
      .dispatch("getSobListAsync")
      .then(res => {
        this.showSpin = false;
      })
      .catch(e => {
        console.log(e);
      });
  }
}
</script>
