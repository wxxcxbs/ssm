<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Layui</title>
  <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<script type="text/javascript" src="./js/jQuery1.9.1.js"></script>
  <script type="text/javascript" src="./dist/layui.all.js"></script>
  <script type="text/javascript" src="./dist/jQuery1.9.1.js"></script>
  <link rel="stylesheet" href="./dist/css/layui.css?t=1590915280231" media="all">
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body> 
 
<div class="demoTable">
  搜索ID：
  <div class="layui-inline">
    <input class="layui-input" name="id" id="demoReload" autocomplete="off">
  </div>
  <div class="layui-btn" data-type="reload">搜索</div>
</div>
 
 
<table class="layui-hide" id="demo" lay-filter="test"></table>

               
          
<script src="./dist/layui.js?t=1590915280231" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use(['laypage', 'table'], function(){
	  var table = layui.table,laypage = layui.laypage;
  //方法级渲染
  table.render({
    elem: '#demo'
    ,url: '/ssm/index'
    ,limit:10
    ,totalRow: true
    ,toolbar: 'default' 
    ,limits:[10,20,50]
    ,page: true
    ,cols: [[ //表头
    	{checkbox: true, fixed: true}
          ,{field: 'user_name', title: '姓名', width:120, sort: true, fixed: 'left'}
          ,{field: 'act_sex', title: '性别', width:150,sort: true}    
     ]],id: 'testReload'
	    ,height:600,
	    done: function (res,curr,count) {
	        exportData=res.data; 
	       }
  });
  var $ = layui.$, active = {
    reload: function(){
      var demoReload = $('#demoReload').val();
      //执行重载
      table.reload('testReload', {
        page: {
          curr: 1 //重新从第 1 页开始
        }
        ,where: {
        	  team_id:demoReload,
        }
      }, 'data');
    }
  };
  table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
	    var data = obj.data //获得当前行数据
	    ,layEvent = obj.event; //获得 lay-event 对应的值
	  
	    if(layEvent === 'edit'){
	     //可执行确定按钮事件并把备注信息（即多行文本框值）存入需要的地方
	    	  $.post("/Joinact",{act_id:data.act_id},function(data){
	            	 $(".layui-laypage-btn").click()//刷新当前分页
	      	 }); 
	    }
	  });
  $('.demoTable .layui-btn').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });
  
});
</script>

</body>
</html>       
        