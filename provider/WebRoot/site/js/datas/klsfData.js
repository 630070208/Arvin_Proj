var LotteryData = {
	//选1
	"xyst" : {
		playTypetitle : '选一数投',
		playTypeCode : 'xyst',
		methoddesc : '从01-18中选择一个或一个以上号码。',
		methodhelp : '从01-18中选择一个号码，竞猜开奖号码的第一位数字，奖金25元。',
		ballLayout : [ {
			title : '数投',
			no : '01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16|17|18',
			isCtr : 1,
			cols : 1
		}],
	},
	"xyht" : {
		playTypetitle : '选一红投',
		playTypeCode : 'xyht',
		methoddesc : '从19或20中任意选择1个或2个号码。',
		methodhelp : '19，20为红球，从这两个号码任选一个投注，开奖号码第一位是红球（19或20）即中奖，奖金5元。',
		ballLayout : [{
			title : '号码',
			no : '19|20',
			isCtr : 1,
			cols : 1
		}],
	},
	
	//选2
	"xerxe" : {
		playTypetitle : '任选二',
		playTypeCode : 'xerxe',
		methoddesc : '从01-20中选择2个或2个以上号码。',
		methodhelp : '至少选择两个号码，竞猜开奖号码的任意两位，奖金8元。',
		ballLayout : [ {
			title : '任选二',
			no : '01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16|17|18|19|20',
			isCtr : 1,
			cols : 1
		}],
	},
	"xelzi" : {
		playTypetitle : '选二连直',
		playTypeCode : 'xelzi',
		methoddesc : '前位和后位每位至少选择1个或1个以上号码。',
		methodhelp : '每位至少选择一个号码，竞猜开奖号码的任意连续两位号码，顺序也一致则中奖，奖金62元。',
		ballLayout : [{
			title : '前位',
			no : '01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16|17|18|19|20',
			isCtr : 0,
			cols : 1
		},{
			title : '后位',
			no : '01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16|17|18|19|20',
			isCtr : 0,
			cols : 1
		}],
	},
	"xelzu" : {
		playTypetitle : '前二连组',
		playTypeCode : 'xelzu',
		methoddesc : '从01-20中任意选择2个或2个以上号码。',
		methodhelp : '至少选择两个号码，竞猜开奖号码的任意连续两位号码，不限顺序，奖金31元。',
		ballLayout : [{
			title : '连组',
			no : '01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16|17|18|19|20',
			isCtr : 1,
			cols : 1
		}],
	},
	
	//选3
	"xsrxs" : {
		playTypetitle : '任选三',
		playTypeCode : 'xsrxs',
		methoddesc : '从01-20中任意选择3个或3个以上号码。',
		methodhelp : '至少选择三个号码，竞猜开奖号码的任意三位，奖金24元。',
		ballLayout : [ {
			title : '任选三',
			no : '01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16|17|18|19|20',
			isCtr : 1,
			cols : 1
		}],
	},
	
	//选4
	"xsirxs" : {
		playTypetitle : '任选四',
		playTypeCode : 'xsirxs',
		methoddesc : '从01-20中任意选择4个或4个以上号码。',
		methodhelp : '至少选择四个号码，竞猜开奖号码的任意四位，奖金80元。',
		ballLayout : [ {
			title : '任选四',
			no : '01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16|17|18|19|20',
			isCtr : 1,
			cols : 1
		}],
	},
	
	//选5
	"xwrxw" : {
		playTypetitle : '任选五',
		playTypeCode : 'xwrxw',
		methoddesc : '从01-20中任意选择5个或5个以上号码。',
		methodhelp : '至少选择五个号码，竞猜开奖号码的任意五位，奖金320元。',
		ballLayout : [ {
			title : '任选五',
			no : '01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16|17|18|19|20',
			isCtr : 1,
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

