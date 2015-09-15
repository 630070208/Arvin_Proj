var LotteryData = {
	//三码
	"smzxfs" : {
		playTypetitle : '直选复式',
		playTypeCode : 'smzxfs',
		methoddesc : '从百位、十位、个位中至少各选1个号码。',
		methodhelp : '从百位、十位、个位中选择一个3位数号码组成一注，所选号码与开奖号码相同，且顺序一致，即为中奖。',
		ballLayout : [ {
			title : '百位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		},{
			title : '十位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		},{
			title : '个位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}],
	},
	"smzzhz" : {
		playTypetitle : '直选和值',
		playTypeCode : 'smzzhz',
		methoddesc : '从0-27中任意选择1个或1个以上号码。',
		methodhelp : '所选数值等于开奖号码的三个数字相加之和，即为中奖。',
		ballLayout : [{
			title : '直选和值',
			no : '0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27',
			isCtr : 0,
			cols : 1
		}],
	},
	"smzxzs" : {
		playTypetitle : '组三',
		playTypeCode : 'smzxzs',
		methoddesc : '从0-9中任意选择2个或2个以上的号码。',
		methodhelp : '从0-9中任意选择2个数字组成两注，所选号码与开奖号码相同，且顺序不限，即为中奖。',
		ballLayout : [ {
			title : '组三',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}],
	},
	"smzxzl" : {
		playTypetitle : '组六',
		playTypeCode : 'smzxzl',
		methoddesc : '从0-9中任意选择3个或3个以上的号码。',
		methodhelp : '从0-9中任意选择3个号码组成一注，所选号码与开奖号码相同，顺序不限，即为中奖。',
		ballLayout : [{
			title : '组六',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}],
	},
	"smzxhz" : {
		playTypetitle : '组选和值',
		playTypeCode : 'smzxhz',
		methoddesc : '从1-26中任意选择1个或1个以上号码。',
		methodhelp : '所选数值等于开奖号码的三个数字相加之和，即为中奖。',
		ballLayout : [{
			title : '连组',
			no : '1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26',
			isCtr : 0,
			cols : 1
		}],
	},
	
	//二码
	"hezxfs" : {
		playTypetitle : '后二直选复式',
		playTypeCode : 'hezxfs',
		methoddesc : '从十位和个位上至少各选1个号码。',
		methodhelp : '从十位和个位上至少各选1个号码，所选号码与开奖号码的十位、个位相同，且顺序一致，即为中奖。',
		ballLayout : [ {
			title : '十位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		},{
			title : '个位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}],
	},
	"hezuxfs" : {
		playTypetitle : '后二组选复式',
		playTypeCode : 'hezuxfs',
		methoddesc : '从0-9中任意选择2个或2个以上号码。',
		methodhelp : '从0-9中选二个号码组成一注，所选号码与开奖号码的十位、个位相同，顺序不限，即为中奖。',
		ballLayout : [ {
			title : '组选',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}],
	},
	"qezxfs" : {
		playTypetitle : '前二直选复式',
		playTypeCode : 'qezxfs',
		methoddesc : '从百位和十位上至少各选1个号码。',
		methodhelp : '从百位和十位上至少各选1个号码，所选号码与开奖号码百位、十位相同，且顺序一致，即为中奖。',
		ballLayout : [ {
			title : '百位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		},{
			title : '十位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}],
	},
	"qezuxfs" : {
		playTypetitle : '前二组选复式',
		playTypeCode : 'qezuxfs',
		methoddesc : '从0-9中任意选择2个或2个以上号码。',
		methodhelp : '从0-9中选2个号码组成一注，所选号码与开奖号码的百位、十位相同，顺序不限，即为中奖。',
		ballLayout : [ {
			title : '组选',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}],
	},
	
	"dwd" : {
		playTypetitle : '定位胆',
		playTypeCode : 'dwd',
		methoddesc : '在百位，十位，个位任意位置上任意选择1个或1个以上号码。',
		methodhelp : '从百位、十位、个位任意1个位置或多个位置上选择1个号码，所选号码与相同位置上的开奖号码一致，即为中奖。',
		ballLayout : [ {
			title : '百位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		},{
			title : '十位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		},{
			title : '个位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}],
	},
	
	"ymbdd" : {
		playTypetitle : '一码不定胆',
		playTypeCode : 'ymbdd',
		methoddesc : '从0-9中任意选择1个或1个以上的号码。',
		methodhelp : '从0-9中选择1个号码，每注由1个号码组成，只要开奖结果中包含所选号码，即为中奖。',
		ballLayout : [ {
			title : '不定胆',
			no : '0|1|2|3|4|5|6|7|8|9',
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

