var commonNumber = '01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33|34|35|36|37|38|39|40|41|42|43|44|45|46|47|48|49|50|51|52|53|54|55|56|57|58|59|60|61|62|63|64|65|66|67|68|69|70|71|72|73|74|75|76|77|78|79|80';

var LotteryData = {
	//趣味
	"hzds" : {
		playTypetitle : '和值单双',
		playTypeCode : 'hzds',
		methoddesc : '选择20个开奖号码总和值的单双属性。',
		methodhelp : '20个开奖号码的总和值为奇数时中“单”，为偶数时中“双”。',
		ballLayout : [ {
			title : '选号',
			no : '单|双',
			isCtr : 0,
			cols : 1
		}],
	},
	"hzdx" : {
		playTypetitle : '和值大小',
		playTypeCode : 'hzdx',
		methoddesc : '选择20个开奖号码总和值的大小属性。',
		methodhelp : '选择20个开奖号码总和值的大小属性：小于810为小，等于810为和，大于810为大。',
		ballLayout : [{
			title : '选号',
			no : '小|和|大',
			isCtr : 0,
			cols : 1
		}],
	},
	"jop" : {
		playTypetitle : '奇偶盘',
		playTypeCode : 'jop',
		methoddesc : '选择20个开奖号码中包含奇偶号码个数多少的关系。',
		methodhelp : '任选一个奇偶盘属性，当开奖结果的20个号码的奇偶盘属性与所投注的结果一致，即为中奖。',
		ballLayout : [ {
			title : '选号',
			no : '奇|和|偶',
			isCtr : 0,
			cols : 1
		}],
	},
	"sxp" : {
		playTypetitle : '上下盘',
		playTypeCode : 'sxp',
		methoddesc : '选择20个开奖号码中包含上盘(01-40)与下盘(41-80)号码个数多少的关系',
		methodhelp : '任选一个上下盘属性，当开奖结果的20个号码的上下盘属性与所投注的结果一致，即为中奖。',
		ballLayout : [{
			title : '选号',
			no : '上|中|下',
			isCtr : 0,
			cols : 1
		}],
	},
	"hzdxds" : {
		playTypetitle : '和值大小单双',
		playTypeCode : 'hzdxds',
		methoddesc : '选择20个开奖号码总和值的大小单双属性。',
		methodhelp : '任选一个和值大小单双属性，当开奖结果的20个号码的和值大小单双属性与所投注的结果一致，即为中奖。',
		ballLayout : [{
			title : '选号',
			no : '大,单|大,双|小,单|小,双',
			isCtr : 0,
			cols : 1
		}],
	},
	
	//任选
	"rxy" : {
		playTypetitle : '任选一',
		playTypeCode : 'rxy',
		methoddesc : '从01-80中任选1个以上号码。',
		methodhelp : '从01-80中选择1个号码组成一注，当期开奖结果的20个号码中包含所选号码，即可中奖。',
		ballLayout : [ {
			title : '选号',
			no : commonNumber,
			isCtr : 0,
			cols : 1
		}],
	},
	"rxe" : {
		playTypetitle : '任选二',
		playTypeCode : 'rxe',
		methoddesc : '从01-80中任选2-8个号码。',
		methodhelp : '从01-80中选择2个号码组成一注，当期开奖结果的20个号码中包含所选号码，即可中奖。',
		ballLayout : [ {
			title : '选号',
			no : commonNumber,
			isCtr : 0,
			cols : 1
		}],
	},
	"rxs" : {
		playTypetitle : '任选三',
		playTypeCode : 'rxs',
		methoddesc : '从01-80中任选3-8个号码。',
		methodhelp : '从01-80中选择3个号码组成一注，当期开奖结果的20个号码中包含3个或2个所选号码，即可中奖。不兼中兼得。',
		ballLayout : [ {
			title : '选号',
			no : commonNumber,
			isCtr : 0,
			cols : 1
		}],
	},
	"rxsi" : {
		playTypetitle : '任选四',
		playTypeCode : 'rxsi',
		methoddesc : '从01-80中任选4-8个号码。',
		methodhelp : '从01-80中选择4个号码组成一注，当期开奖结果的20个号码中包含4个、3个或2个所选号码，即可中奖。不兼中兼得。',
		ballLayout : [ {
			title : '选号',
			no : commonNumber,
			isCtr : 0,
			cols : 1
		}],
	},
	"rxw" : {
		playTypetitle : '任选五',
		playTypeCode : 'rxw',
		methoddesc : '从01-80中任选5-8个号码。',
		methodhelp : '从01-80中选择5个号码组成一注，当期开奖结果的20个号码中包含5个、4个或3个所选号码，即可中奖。不兼中兼得。',
		ballLayout : [ {
			title : '选号',
			no : commonNumber,
			isCtr : 0,
			cols : 1
		}],
	},
	"rxl" : {
		playTypetitle : '任选六',
		playTypeCode : 'rxl',
		methoddesc : '从01-80中任选6-8个号码。',
		methodhelp : '从01-80中选择6个号码组成一注，当期开奖结果的20个号码中包含6个、5个、4个或3个所选号码，即可中奖。不兼中兼得。',
		ballLayout : [ {
			title : '选号',
			no : commonNumber,
			isCtr : 0,
			cols : 1
		}],
	},
	"rxq" : {
		playTypetitle : '任选三',
		playTypeCode : 'rxq',
		methoddesc : '从01-80中任选7-8个号码。',
		methodhelp : '从01-80中选择7个号码组成一注，当期开奖结果的20个号码中包含7个、6个、5个、或4个所选号码，或者出现0个所选号码，即可中奖。不兼中兼得。',
		ballLayout : [ {
			title : '选号',
			no : commonNumber,
			isCtr : 0,
			cols : 1
		}],
	}
};
/**]
 * "qs" : {
		"subTypes" : [  {"code":"qszxfs","name" : "直选复式"},
		                {"code":"qszxds","name" : "直选单式"},
		                {"code":"qszxzh","name" : "前三组合"},
		                {"code":"qszxhz","name" : "直选和值"},
		                {"code":"qszsfs","name" : "组三复式"},
		                {"code":"qszsds","name" : "组三单式"},
		                {"code":"qszlfs","name" : "组六复式"},
		                {"code":"qszlds","name" : "组六单式"},
		                {"code":"qshhzx","name" : "混合组选"}],
		"name" : "前三"
	}
 */

