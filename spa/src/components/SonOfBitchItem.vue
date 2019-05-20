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
              v-show='sob.enName'
            >
              ( {{ sob.enName }} )
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
        <b-collapse v-model="detailVisible">
          <div class="detail">
            <div class="sub-header">
              {{ $t('alternatives') }}
            </div>

            <div class="meta">
              <div
                v-for="(alternativeField, index) in availableFields"
                :key="index"
              >
                <i>{{ $t(alternativeField) }}</i>: <i> {{ sob[alternativeField] }}</i>
              </div>
            </div>

            <div class="sub-header">
              {{ $t('cases') }}
            </div>
            <div class="cases">
              <b-card
                v-for="(item, index) in sob.cases"
                :key="index"
              >
                <h2>{{ $t('case') + ' #' + index}}</h2>
                <!-- META -->
                <div class="meta">
                  <span
                    v-for="(meta, index) in caseMetaFields"
                    :key='index'
                  >
                    <i>{{ $t(meta) }}</i>: <i> {{ item.meta[meta] }} </i>
                  </span>
                  <span>
                    <i>{{ $t('refUrls') }}</i>:
                    <ul>
                      <li
                        v-for="(link, index) in item.meta.refUrls"
                        :key='index'
                      >
                        <a :href="link">{{ link }}</a>
                      </li>
                    </ul>
                  </span>
                </div>
                <!-- CONTENT -->
                <div class="content">
                  <h3>
                    {{ item.title }}
                  </h3>
                  <p>
                    {{ item.content }}
                  </p>
                </div>
                <!-- IMAGES -->
                <div class="images">
                  <b-carousel
                    id="carousel-1"
                    :interval="4000"
                    no-animation
                    controls
                    indicators
                    :img-width="300"
                    style="text-shadow: 1px 1px 2px #333;"
                  >
                    <b-carousel-slide
                      v-for="(img, index) in item.images"
                      :key="index"
                      :img-src='img'
                    >
                    </b-carousel-slide>
                  </b-carousel>
                </div>
              </b-card>
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
  caseMetaFields: string[] = [
    "date"
    "victim",
    "addr",
    "archiveUrl"
  ];
  detailVisible: boolean = false;

  @Prop(Object) sob!: SonOfBitch;

  get availableFields() {
    return this.alternativeFields.filter(v =>
      Object.keys(this.sob).includes(v)
    );
  }
}
</script>

<style lang="scss">
.sob-item {
  background-color: white;
  border: none;
  padding: 10px 0;
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
.badge-black {
  background-color: black;
  color: white;
}
.card {
  border-radius: 0px !important;
  border: none;
}
</style>
