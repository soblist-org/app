<template>
  <div id="app">
    <header>
      <b-navbar
        toggleable="lg"
        type="dark"
        variant="black"
        class="navbar"
      >
        <b-container>
          <b-navbar-brand href="#">
            <b-img
              width='200'
              src='https://res.cloudinary.com/dnuewvqib/image/upload/v1558329391/soblist/sblocklist%E5%89%AF%E6%9C%AC_ayftb3.png'
            >
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
import { Vue, Component } from "vue-property-decorator";
@Component({})
export default class App extends Vue {
  languageDropdownText: string = "English";
  // TODO for enhance
  zhClick() {
    this.languageDropdownText = "English";
    this.$i18n.locale = "zh-cn";
    // TODO document title
  }
  enClick() {
    this.languageDropdownText = "简体中文";
    this.$i18n.locale = "en";
  }

  mounted() {
    this.$i18n.locale = "zh-cn";
  }
}
</script>

<style lang="scss">
body {
  background-color: #f3f3f3;
}
.navbar {
  background-color: black;
  padding: 15px 0px;
  margin-bottom: 10px;
  .link {
    a {
      color: white;
    }
  }
}
.navbar-black {
  background-color: black;
}
.card {
  border-radius: 0px;
}
</style>
