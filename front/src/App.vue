<template>
  <div id="app">
    <header>
      <b-navbar
        toggleable="lg"
        type="dark"
        variant="danger"
        class="navbar"
      >
        <b-container>
          <b-navbar-brand href="#">
            <b-img src='https://avatars3.githubusercontent.com/u/50773892?s=40&v=4'>
            </b-img>
            {{ $t('siteTitle')}}
          </b-navbar-brand>
          <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

          <b-collapse
            id="nav-collapse"
            is-nav
          >

            <b-navbar-nav class="ml-auto">
              <b-nav-item
                active
                class="link"
              >
                <router-link to="/">{{ $t('home') }}</router-link>
              </b-nav-item>
              <b-nav-item class="link">
                <router-link to="/about">{{ $t('about') }}</router-link>
              </b-nav-item>
              <b-nav-item-dropdown
                id="my-nav-dropdown"
                :text="languageDropdownText"
                toggle-class="nav-link-custom"
                right
              >
                <b-dropdown-item @click='zhClick'>简体中文</b-dropdown-item>
                <b-dropdown-item @click='enClick'>English</b-dropdown-item>
              </b-nav-item-dropdown>
            </b-navbar-nav>
          </b-collapse>
        </b-container>

      </b-navbar>

    </header>
    <div id="nav">

    </div>
    <router-view />
  </div>
</template>

<script lang="ts">
import {
  Vue,
  Component,
  Prop,
  Emit,
  Watch,
  Model
} from "vue-property-decorator";
@Component({})
export default class App extends Vue {
  languageDropdownText: string = "简体中文";
  zhClick() {
    this.languageDropdownText = "简体中文";
    this.$i18n.locale = "zh-cn";
  }
  enClick() {
    this.languageDropdownText = "English";
    this.$i18n.locale = "en";
  }

  mounted() {
    this.$i18n.locale = "zh-cn";
  }
}
</script>

<style lang="scss">
.navbar {
  background-color: white;
  padding: 15px 0px;
  margin-bottom: 10px;
  .link {
    a {
      color: white;
    }
  }
}
</style>
