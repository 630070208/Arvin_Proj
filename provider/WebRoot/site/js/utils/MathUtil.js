


/**
 * 用于数学计算的类，该类里面的方法全是静态方法
 * @returns
 */
 var MathUtil =  function(){};
  /**
   * 
   * 定义产生不重复随机数的算法
   * 1,定义两个数组 其中一个用来穷举要生成的数字 另一个用来存对应的boolean变量
   * 2,生成穷举数组的下标，检查boolean数组的该位置上的值是否为true，是则continue，否则将下值改成true并且将穷举数组的值放入结果集中
   * 3,返回结果集数组
   * 
   * minNum若为0表示生成0-(maxNum-1)之间的数
   *       若为1表示生成1-maxNum之间的数         还可以不传默认生成1-maxNum
   *    selectNum表示要生成几个数字  该方法为静态方法
   */
    MathUtil.generateRandom=function(maxNum,selectNum,minNum){
    
          if(typeof(minNum)=='undefined'){
             minNum = 1;
          }
    	/**
    	 * 对传的参数进行验证
    	 */
    	if(selectNum>maxNum){
    		alert("请检查你传的参数是否有误");
    		return;
    	}
    	if(minNum>maxNum){
    	   alert("请检查你传的参数是否有误");
    		return;
    	}
    	if(isNaN(maxNum)||isNaN(selectNum)){
    		alert("该函数只接受数字");
    		return;
    	}
	    //初始化传过来的参数
	     maxNum =  parseInt(maxNum);
	     selectNum = parseInt(selectNum);
	     //穷举数组
	     var  numberList =  new Array(maxNum-minNum+1);
	     //穷举数组对应的boolean数组
	     var booleanList = new Array(maxNum-minNum+1);
	     //结果集数组
	     var result = new Array(selectNum);
	     //初始化boolean数组
	     for(var i=0;i<numberList.length;i++){
	    	  numberList[i]=false;
	      }
	     /**
	       * 将要生成的数字穷举出来
	       */
	      if(minNum==0){
	         for(var i=0;i<numberList.length;i++){
	    	   numberList[i]=i;
	          }
	       }else{
	          for(var i=0;i<numberList.length;i++){
	    	     numberList[i]=i+1;
	          }
	       }
	      var index = 0;
        do{
    	   var randNum = Math.floor(Math.random()*maxNum);
    	   if(booleanList[randNum]){
    		   continue;
    	   }else{
    		   booleanList[randNum] = true;
    		   result[index++] = numberList[randNum];
    	   }
        }while(index<selectNum);
	      result.sort(function(a,b){return a>b?1:-1});
	      return result;
	  };
	  
    
    
    
	MathUtil.generateRandomBack = function(minNum,maxNum,selected){
	    var result = new Array();
	    var example = new Array();
	    for(var i=minNum;i<maxNum;i++){
	      example.push(i);
	    } 
	    var exBoolean = new Array(example.length);
	    for(var i=0;i<exBoolean.length;i++){
	        exBoolean[i]=false;
	    }
	      var index = 0;
	    do{
	       var randNum = Math.floor(Math.random()*example.length);
    	   if(exBoolean[randNum]){
    		   continue;
    	   }else{
    		   exBoolean[randNum] = true;
    		   result[index++] = example[randNum];
    	   }
	   }while(index<selected);
	      result.sort(function(a,b){return a>b?1:-1});
	      
	      
	      return result;
	};
	  
    /**
     *增加一个计算组合的方法 静态方法
     */
    MathUtil.calculateGroup=function(selectNum,baseNum){
    	if(selectNum<0||baseNum<0){
    		return 0;
    	}
    	if(baseNum<selectNum){
    		return 0;
    	}
    	if(baseNum==selectNum){
    		return 1;
    	}
    	if(isNaN(selectNum)||isNaN(baseNum)){
    		alert("请检查你所传参数");
    		return 0;
    	}
    	return  MathUtil.factor(baseNum)/( MathUtil.factor(selectNum)*MathUtil.factor(baseNum-selectNum));
    };
	/*计算阶乘的方法
	 */
    MathUtil.factor=function(num){
       if(num==0){
    		return 0;
    	}
    	if(num==1){
    		return 1;
    	}
    	var sum=1;
    	for(var i=1;i<=num;i++){
    		sum *= i;
    	}
    	return sum;
    };
    
    //m 选号个数   n 需要排列的个数
    MathUtil.comb=function comb(m, n) {
    	if (m < 0 || n < 0 || m < n) {
    		return 0;
    	}
    	n = n < (m - n) ? n : m - n;
    	if (n == 0) {
    		return 1;
    	}
    	var result = m;
    	for (var i = 2, j = result - 1; i <= n; i++, j--) {
    		result = result * j / i;// 得到C(m,i)
    	}
    	return result;
    }
    
    //组合数计算
    function Combination(n, m)
    {
    	m = parseInt(m);
    	n = parseInt(n);
    	if( m<0 || n<0 )
    	{
    		return false;
    	}
    	if( m==0 || n == 0 )
    	{
    		return 1;
    	}
    	if( m > n )
    	{
    		return 0;
    	}
    	if( m > n/2.0)
    	{
    		m = n - m;
    	}

    	var result = 0.0;
    	for(i=n; i>=(n-m+1);i--) {
    		result += Math.log(i);			
    	}
    	for(i=m; i >= 1; i--) {
    		result -= Math.log(i);
    	}
    	result = Math.exp(result);
    	return Math.round(result);
    }
    
    Array.prototype.each = function(fn){
        fn = fn || Function.K;
        var a = [];
        var args = Array.prototype.slice.call(arguments, 1);
        for(var i = 0; i < this.length; i++){
            var res = fn.apply(this,[this[i],i].concat(args));
            if(res != null) a.push(res);
        }
        return a;
    };
    
    Array.prototype.contains = function (element) {
    	for (var i = 0; i < this.length; i++) {
    		if (this[i] == element) {
    			return true;
    		}
    	}
    	return false;
    }
    
    /**
     * 得到一个数组不重复的元素集合<br/>
     * 唯一化一个数组
     * @returns {Array} 由不重复元素构成的数组
     */
    Array.prototype.uniquelize = function(){
        var ra = new Array();
        for(var i = 0; i < this.length; i ++){
            if(!ra.contains(this[i])){
                ra.push(this[i]);
            }
        }
        return ra;
    };
    
    
    /**
     * 求两个集合的交集
    {%example
    <script>
        var a = [1,2,3,4];
        var b = [3,4,5,6];
        alert(Array.intersect(a,b));
    </script>
     %}
     * @param {Array} a 集合A
     * @param {Array} b 集合B
     * @returns {Array} 两个集合的交集
     */
    Array.intersect = function(a, b){
        return a.uniquelize().each(function(o){return b.contains(o) ? o : null});
    };
    
    