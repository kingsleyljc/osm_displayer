<template>
  <el-container>
    <el-main>
      <div ref="map" id="map-container"></div>
    </el-main>
    <el-aside>
      <el-tabs stretch>
        <el-tab-pane label="操作栏">
          <i class="el-icon-edit-outline" id="diy"></i>
          <el-row type="flex" justify="center">
            <el-button type="warning" v-on:click="backCenter"
              >回到原中心位置</el-button
            >
          </el-row>
          <el-row type="flex">
            <el-input v-model="input" placeholder=".osm"></el-input>
            <el-button type="warning" v-on:click="newOsm"
              >获取OSM文件</el-button
            >
          </el-row>
        </el-tab-pane>
      </el-tabs>
    </el-aside>
  </el-container>
</template>

<script>
import $ from "jquery";
import echarts from "echarts";
import "echarts/extension/bmap/bmap.js";
export default {
  name: "Map",
  data() {
    return {
      chart: echarts.ECharts,
      dataset: [],
      input: "bus.osm",
      centerCoords: []
    };
  },
  computed: {
    options: function() {
      return {
        bmap: {
          center: this.centerCoords,
          zoom: 21,
          roam: true
        },
        tooltip: {
          show: true,
          trigger: "item",
          showContent: "true",
          formatter: "id:{b}\n经纬度：{c}"
        },
        series: [
          {
            type: "scatter",
            coordinateSystem: "bmap",
            data: this.dataset
          }
        ]
      };
    }
  },
  methods: {
    newOsm: function() {
      var _this = this;
      // 获得订单order
      $.ajax({
        type: "GET",
        url: "http://localhost:8080/" + _this.input,
        async: false,
        success: function(response) {
          var obj = response["content"];
          console.log(obj);
          _this.dataset = obj;
          _this.centerCoords = obj[0]["value"];
        }
      });
      console.log(this.dataset);
      this.chart.setOption(this.options);
    },
    backCenter: function() {
      this.centerCoords = [104.08769817540933, 30.70018619836269];
      this.chart.setOption(this.options);
    },
    init: function() {
      this.chart = echarts.init(this.$refs.map);
      this.centerCoords = [104.08769817540933, 30.70018619836269];
      this.chart.setOption(this.options);
      let bmap = this.chart
        .getModel()
        .getComponent("bmap")
        .getBMap();
      bmap.setMaxZoom(19);
      console.log(this.dataset);
      this.chart.setOption(this.options);
    }
  },
  mounted() {
    this.init();
  },
  beforeDestroy() {}
};
</script>

<style>
#map-container {
  width: 100%;
  height: 100%;
  margin: 0;
  border-radius: 10px;
}
#diy {
  color: #9e7d60ff;
  font-size: 200%;
  margin-bottom: 10px;
}
.el-row {
  margin-bottom: 10px;
}
.loading {
  color: red;
}
.el-tag {
  margin-bottom: 6px;
  background-color: #2f4050 !important;
  color: #9e7d60ff !important;
  border-color: #9e7d60ff !important;
  font-size: 10px;
  height: 8% !important;
}
.el-pagination .btn-next,
.el-pagination .btn-prev,
.el-dialog,
.el-pager li,
.el-input-number__decrease,
.el-input-number__increase {
  background-color: #2f4050 !important;
  color: #9e7d60ff !important;
  border-color: #9e7d60ff !important;
}
.el-input__inner {
  background-color: #3f444c !important;
  color: #9e7d60ff !important;
  border-color: #9e7d60ff !important;
}
.el-input__inner:focus {
  border-color: white !important;
}
.el-button {
  margin-top: 0px !important;
  padding: 5px !important;
}
.el-button,
.el-button:focus {
  background-color: #2f4050 !important;
  color: #9e7d60ff !important;
  border-color: #9e7d60ff !important;
}
.el-button:hover,
.el-input-number__decrease:hover,
.el-input-number__increase:hover,
.el-tag:hover {
  background-color: #3f444c !important;
  color: #9e7d60ff;
  border-color: #9e7d60ff;
}
.el-tabs__active-bar {
  background-color: #9e7d60ff !important;
}
.el-loading-spinner .el-loading-text,
.el-icon-loading:before,
.el-tabs__item.is-active,
.el-tabs__item:hover {
  color: #9e7d60ff !important;
  letter-spacing: 3px;
  font-weight: bolder;
}
.el-tabs__item {
  color: #9e7d60ff !important;
  letter-spacing: 3px;
}
.situationBar {
  color: #9e7d60ff !important;
  line-height: 10px;
  letter-spacing: 2px;
}
.situationBar1 {
  display: inline-block;
  color: #9e7d60ff !important;
  line-height: 20px;
  letter-spacing: 3px;
}
</style>
