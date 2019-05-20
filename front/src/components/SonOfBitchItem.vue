<template>
  <b-card class="sob-item">
    <b-container>
      <b-row>
        <b-col cols='2'>
          <b-img
            left
            :width="70"
            :src="sob.picSrc"
          ></b-img>
        </b-col>
        <b-col cols='10'>
          <h3>
            <a @click='detailVisible = !detailVisible'>
              {{ sob.name }}
            </a>
            <span
              class='capitalize'
              v-show='enName'
            >
              ( {{ enName }} )
            </span>
          </h3>
          <div class="meta">
            {{ $t('born')}} <i>{{ sob.birth ? sob.birth : '?' }}</i>
            {{ $t('update')}} <i>{{ sob.addedDate ? sob.addedDate : '?' }}</i>
            <i> {{$t('locate')}} {{ sob.addr ? sob.addr : '?' }}</i>
          </div>
        </b-col>
      </b-row>

      <b-row>
        <b-collapse
          id="shit"
          v-model="detailVisible"
        >
          <div class="detail">
            <div class="sub-header">
              {{ $t('alternatives') }}
            </div>
            <b-list-group class="alternative-fields">
              <b-list-group-item
                class='d-flex justify-content-between align-items-center'
                v-for="(alternativeField, index) in availableFields"
                :key="index"
              >
                <label>{{ $t(alternativeField) }}</label>
                <b-badge
                  variant="danger"
                  pill
                >
                  {{ sob[alternativeField] }}
                </b-badge>
              </b-list-group-item>

            </b-list-group>

            <div class="sub-header">
              {{ $t('cases') }}
            </div>
            <div class="cases">
              <div
                v-for="(item, index) in sob.cases"
                :key="index"
              >
                {{ item }}
              </div>
            </div>
          </div>
        </b-collapse>
      </b-row>
    </b-container>

  </b-card>
</template>

<script lang="ts">
import { Vue, Component, Prop } from "vue-property-decorator";
import { SonOfBitch } from "@/store/state";

const pinyin = require("chinese-to-pinyin");

@Component({})
export default class SonOfBitchItem extends Vue {
  alternativeFields: string[] = [
    "activeArea",
    "idNumber",
    "isMarried",
    "schoolName",
    "companyName",
    "socialMedia",
    "job",
    "major"
  ];
  detailVisible: boolean = false;

  @Prop(Object) sob!: SonOfBitch;

  get availableFields() {
    return this.alternativeFields.filter(v =>
      Object.keys(this.sob).includes(v)
    );
  }

  get enName() {
    const enWords = (pinyin(this.sob.name, { noTone: true }) as string).split(
      " "
    );
    switch (enWords.length) {
      case 2:
        return enWords.reverse().join(" ");
        break;
      case 3:
        enWords.push(enWords.shift() as string);
        return enWords.join(" ");
      default:
        return enWords.join(" ");
        break;
    }
  }
}
</script>

<style lang="scss">
.sob-item {
  margin-bottom: 10px;
  .capitalize {
    text-transform: capitalize;
  }
  .meta {
    text-align: left;
  }
  h3 {
    text-align: left;
    a {
      text-decoration: underline !important;
      cursor: pointer;
    }
  }
  .detail {
    .sub-header {
      text-align: center;
      font-size: 20px;
      font-weight: 800;
      margin: 5px 0;
    }
    margin-top: 10px;
  }
}
</style>
