<template>
  <div class="login-container">
    <div class="skew">
      <div class="left-skew"></div>
      <div class="right-skew"></div>
    </div>
    <div class="circle">
      <img
        src="../../static/picture/carcircle.svg"
        alt="circle"
        class="mouse"
      />
    </div>
    <div class="intro">
      <h1>Welcome To Auto Show</h1>
    </div>
    <el-form
      ref="loginForm"
      :model="loginForm"
      :rules="loginRules"
      class="login-form"
      auto-complete="on"
      label-position="left"
    >
      <!-- 标题 -->
      <div class="title-container">
        <!-- <span class="svg-logo">
          <svg-icon icon-class="logo" />
        </span> -->
        <h2 class="title">Auto Show Login</h2>
      </div>

      <!-- 用户名 -->
      <el-form-item prop="username">
        <span class="svg-container">
          <svg-icon icon-class="user" />
        </span>
        <el-input
          class="yuan"
          ref="username"
          v-model="loginForm.username"
          placeholder="请输入用户名"
          name="username"
          type="text"
          tabindex="1"
          auto-complete="on"
        />
      </el-form-item>

      <!-- 密码 -->
      <el-form-item prop="password">
        <span class="svg-container">
          <svg-icon icon-class="password" />
        </span>
        <el-input
          class="yuan"
          :key="passwordType"
          ref="password"
          v-model="loginForm.password"
          :type="passwordType"
          placeholder="请输入密码"
          name="password"
          tabindex="2"
          auto-complete="on"
          @keyup.enter.native="handleLogin"
        />
        <span class="show-pwd" @click="showPwd">
          <svg-icon
            :icon-class="passwordType === 'password' ? 'eye' : 'eye-open'"
          />
        </span>
      </el-form-item>

      <!-- 权限 -->
      <el-form-item prop="authority">
        <span class="svg-container">
          <svg-icon icon-class="user" />
        </span>
        <el-select
          v-model="loginForm.role"
          placeholder="请选择"
          style="width: 90%"
        >
          <el-option :key="0" label="经理" :value="0"></el-option>
          <el-option :key="1" label="管理员" :value="1"></el-option>
          <el-option :key="2" label="游客" :value="2"></el-option>
        </el-select>
      </el-form-item>

      <!-- 登录按钮 -->
      <div style="height: 40px; width: 90%; margin: 10px auto">
        <el-button
          :loading="loading"
          type="text"
          style="width: 45%; float: left; border: 1px solid #409eff"
          @click.native.prevent="handleLogin"
          >登录</el-button
        >
        <el-button
          :loading="loading"
          type="text"
          style="width: 45%; float: right; border: 1px solid #409eff"
          @click.native.prevent="handleRegister"
          >注册</el-button
        >
      </div>

      <!-- 提示 -->
      <!-- <div> -->
      <!-- <div class="tips">
          <span style="margin-right: 20px">管理员 username: admin</span>
          <span> password: admin</span>
        </div> -->
      <!-- </div> -->
    </el-form>
  </div>
</template>

<script>
export default {
  name: "Login",
  data() {
    const validateUsername = (rule, value, callback) => {
      callback();
    };
    const validatePassword = (rule, value, callback) => {
      callback();
    };
    return {
      loginForm: {
        username: "admin",
        password: "password",
        role: 0,
      },
      loginRules: {
        username: [
          { required: true, trigger: "blur", validator: validateUsername },
        ],
        password: [
          { required: true, trigger: "blur", validator: validatePassword },
        ],
      },
      loading: false,
      passwordType: "password",
      redirect: undefined,
    };
  },
  methods: {
    handleMouseMove(e) {
      const circle = document.querySelector(".circle");
      let x = e.clientX - 40;
      let y = e.clientY - 28;
      circle.style.transform = `translate(${x}px, ${y}px)`;
    },
    showPwd() {
      if (this.passwordType === "password") {
        this.passwordType = "";
      } else {
        this.passwordType = "password";
      }
      this.$nextTick(() => {
        this.$refs.password.focus();
      });
    },
    handleLogin() {
      this.$refs.loginForm.validate((valid) => {
        if (valid) {
          this.loading = true;
          this.$store
            .dispatch("user/login", this.loginForm)
            .then(() => {
              this.$router.push({ path: "/" }); // 无脑进首页
              this.loading = false;
            })
            .catch((message) => {
              this.$message.error(message);
              this.loading = false;
            });
        } else {
          console.log("不允许提交!");
          return false;
        }
      });
    },
    handleRegister() {
      console.log("注册按钮");
      this.$router.push({ path: "/register" }); // 进注册页面
    },
  },
  beforeMount() {
    setTimeout(() => {
      const left_SkewElement = this.$el.querySelector(".left-skew");
      left_SkewElement.style.opacity = 0;
    }, 1000);
  },
  mounted() {
    document.addEventListener("mousemove", this.handleMouseMove);
  },
};
</script>

<style lang="scss">
/* 修复input 背景不协调 和光标变色 */
/* Detail see https://github.com/PanJiaChen/vue-element-admin/pull/927 */

$bg: #fdfdfdce;
$light_gray: #fff;
$cursor: rgb(19, 17, 17);

@supports (-webkit-mask: none) and (not (cater-color: $cursor)) {
  .login-container .el-input input {
    color: $cursor;
  }
}

/* reset element-ui css */
.login-container {
  .el-input.yuan {
    display: inline-block;
    height: 47px;
    width: 85%;

    input {
      background: transparent;
      border: 0px;
      -webkit-appearance: none;
      border-radius: 0px;
      padding: 12px 5px 12px 15px;
      color: black;
      height: 47px;
      caret-color: $cursor;

      &:-webkit-autofill {
        box-shadow: 0 0 0px 1000px $bg inset !important;
        -webkit-text-fill-color: $cursor !important;
      }
    }
  }

  .el-input {
    display: inline-block;
    height: 47px;
    width: 100%;

    input {
      background: transparent;
      border: 0px;
      -webkit-appearance: none;
      border-radius: 0px;
      padding: 12px 5px 12px 15px;
      color: black;
      height: 47px;
      caret-color: $cursor;

      &:-webkit-autofill {
        box-shadow: 0 0 0px 1000px $bg inset !important;
        -webkit-text-fill-color: $cursor !important;
      }
    }
  }

  .el-form-item {
    border: 1px solid rgba(255, 255, 255, 0.1);
    width: 90%;
    height: 50px;
    margin: 10px auto;
    background: #fdfdfdce;
    border-radius: 5px;
    border: 1px solid rgba(128, 128, 128, 0.438);
    color: #4e4b4b;
  }
}
</style>

<style lang="scss" scoped>
$bg: #2d3a4b;
$dark_gray: #889aa4;
$light_gray: #eee;

.login-container {
  min-height: 100%;
  width: 100%;
  // background-color: $bg;
  overflow: hidden;

  background-image: url("../../static/picture/06_sx.jpg");
  background-repeat: no-repeat;
  background-size: cover;

  .circle {
    width: 10px;
    height: 10px;
    border-radius: 50%;
    // background-color: red;
  }

  .mouse {
    width: 45px;
    height: 45px;
    position: absolute;
    // z-index: 10000;
  }

  .left-skew {
    position: absolute;
    left: -25%;
    height: 100%;
    width: 90%;
    background-color: white;
    transform: skew(-38deg);
    opacity: 0.8;
    transition: opacity 5s ease-out;
  }

  .right-skew {
    position: absolute;
    right: -20%;
    height: 100%;
    width: 55%;
    background-color: white;
    opacity: 0.8;
    transform: skew(-38deg);
  }

  .intro {
    margin-left: 10%;
    margin-top: 5%;
    font-size: 2rem;
    font-family: "Courier New", Courier, monospace;
  }

  .login-form {
    position: absolute;
    bottom: 20%;
    right: 4%;
    height: 330px;
    width: 370px;
    max-width: 100%;
    background-color: rgba(255, 255, 255, 0.548);
    border-radius: 4%;
    border: 1px solid #2d3a4b44;
    padding: 10px 10px;
    overflow: hidden;
  }

  .tips {
    font-size: 14px;
    color: gray;
    margin-bottom: 10px;

    span {
      &:first-of-type {
        margin-right: 16px;
      }
    }
  }

  .svg-container {
    padding: 6px 5px 6px 15px;
    color: $dark_gray;
    vertical-align: middle;
    width: 30px;
    display: inline-block;
  }

  .title-container {
    position: relative;

    .title {
      font-size: 26px;
      color: black;
      margin: 10px auto 10px auto;
      text-align: center;
      font-weight: bold;
    }
  }

  .show-pwd {
    position: absolute;
    right: 10px;
    top: 7px;
    font-size: 16px;
    color: $dark_gray;
    cursor: pointer;
    user-select: none;
  }
}
</style>
