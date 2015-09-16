var LotteryData = {
	//三码
	"smzxfs" : {
		playTypetitle : '前三直选复式',
		playTypeCode : 'smzxfs',
		methoddesc : '从第一位、第二位、第三位中至少各选择1个号码。',
		methodhelp : '从01-11共11个号码中选择3个不重复的号码组成一注，所选号码与当期顺序摇出的5个号码中的前3个号码相同，且顺序一致，即为中奖。',
		ballLayout : [ {
			title : '第一位',
			no : '01|02|03|04|05|06|07|08|09|10|11',
			isCtr : 1,
			cols : 1
		},{
			title : '第二位',
			no : '01|02|03|04|05|06|07|08|09|10|11',
			isCtr : 1,
			cols : 1
		},{
			title : '第三位',
			no : '01|02|03|04|05|06|07|08|09|10|11',
			isCtr : 1,
			cols : 1
		}],
	},
	"smzufs" : {
		playTypetitle : '前三组选复式',
		playTypeCode : 'smzufs',
		methoddesc : '从01-11中任意选择3个或3个以上号码。',
		methodhelp : '从01-11中共11个号码中选择3个号码，所选号码与当期顺序摇出的5个号码中的前3个号码相同，顺序不限，即为中奖。',
		ballLayout : [{
			title : '前三组选',
			no : '01|02|03|04|05|06|07|08|09|10|11',
			isCtr : 1,
			cols : 1
		}],
	},
	
	//二码
	"emzxfs" : {
		playTypetitle : '前二直选复式',
		playTypeCode : 'emzxfs',
		methoddesc : '从第一位、第二位中至少各选择1个号码。',
		methodhelp : '从01-11共11个号码中选择2个不重复的号码组成一注，所选号码与当期顺序摇出的5个号码中的前2个号码相同，且顺序一致，即中奖。',
		ballLayout : [ {
			title : '第一位',
			no : '01|02|03|04|05|06|07|08|09|10|11',
			isCtr : 1,
			cols : 1
		},{
			title : '第二位',
			no : '01|02|03|04|05|06|07|08|09|10|11',
			isCtr : 1,
			cols : 1
		}],
	},
	"emzufs" : {
		playTypetitle : '前二组选复式',
		playTypeCode : 'emzufs',
		methoddesc : '从01-11中任意选择2个或2个以上号码。',
		methodhelp : '从01-11中共11个号码中选择2个号码，所选号码与当期顺序摇出的5个号码中的前2个号码相同，顺序不限，即为中奖。',
		ballLayout : [{
			title : '前二组选',
			no : '01|02|03|04|05|06|07|08|09|10|11',
			isCtr : 1,
			cols : 1
		}],
	},
	
	//不定胆
	"qsw" : {
		playTypetitle : '不定胆',
		playTypeCode : 'qsw',
		methoddesc : '从01-11中任意选择1个或1个以上号码。',
		methodhelp : '从01-11中共11个号码中选择1个号码，每注由1个号码组成，只要当期顺序摇出的第一位、第二位、第三位开奖号码中包含所选号码，即为中奖。',
		ballLayout : [{
			title : '前三位',
			no : '01|02|03|04|05|06|07|08|09|10|11',
			isCtr : 1,
			cols : 1
		}],
	},
	
	//定位胆
	"dwd" : {
		playTypetitle : '定位胆',
		playTypeCode : 'dwd',
		methoddesc : '从第一位，第二位，第三位任意位置上任意选择1个或1个以上号码。',
		methodhelp : '从第一位，第二位，第三位任意1个位置或多个位置上选择1个号码，所选号码与相同位置上的开奖号码一致，即为中奖。',
		ballLayout : [ {
			title : '第一位',
			no : '01|02|03|04|05|06|07|08|09|10|11',
			isCtr : 1,
			cols : 1
		},{
			title : '第二位',
			no : '01|02|03|04|05|06|07|08|09|10|11',
			isCtr : 1,
			cols : 1
		},{
			title : '第三位',
			no : '01|02|03|04|05|06|07|08|09|10|11',
			isCtr : 1,
			cols : 1
		}],
	},
	
	//趣味型
	"dds" : {
		playTypetitle : '定单双',
		playTypeCode : 'dds',
		methoddesc : '从不同的单双组合中任意选择1个或1个以上的组合。',
		methodhelp : '从5种单双个数组合中选择1种组合，当期开奖号码的单双个数与所选单双组合一致，即为中奖。',
		ballLayout : [ {
			title : '',
			no : '5单0双|4单1双|3单2双|2单3双|1单4双|0单5双',
			isCtr : 0,
			cols : 0
		}],
	},
	"czw" : {
		playTypetitle : '猜中位',
		playTypeCode : 'czw',
		methoddesc : '从3-9中任意选择1个或1个以上数字。',
		methodhelp : '从3-9中选择1个号码进行购买，所选号码与5个开奖号码按照大小顺序排列后的第3个号码相同，即为中奖。',
		ballLayout : [ {
			title : '猜中位',
			no : '3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}],
	},
	
	//任选复式
	"rxfyzy" : {
		playTypetitle : '一中一',
		playTypeCode : 'rxfyzy',
		methoddesc : '从01-11中任意选择1个或1个以上号码。',
		methodhelp : '从01-11共11个号码中选择1个号码进行购买，只要当期顺序摇出的5个开奖号码中包含所选号码，即为中奖。',
		ballLayout : [ {
			title : '选一中1',
			no : '01|02|03|04|05|06|07|08|09|10|11',
			isCtr : 1,
			cols : 1
		}],
	},
	"rxfeze" : {
		playTypetitle : '二中二',
		playTypeCode : 'rxfeze',
		methoddesc : '从01-11中任意选择2个或2个以上号码。',
		methodhelp : '从01-11共11个号码中选择2个号码进行购买，只要当期顺序摇出的5个开奖号码中包含所选号码，即为中奖。',
		ballLayout : [{
			title : '选二中2',
			no : '01|02|03|04|05|06|07|08|09|10|11',
			isCtr : 1,
			cols : 1
		}],
	},
	"rxfszs" : {
		playTypetitle : '三中三',
		playTypeCode : 'rxfszs',
		methoddesc : '从01-11中任意选择3个或3个以上号码。',
		methodhelp : '从01-11共11个号码中选择3个号码进行购买，只要当期顺序摇出的5个开奖号码中包含所选号码，即为中奖。',
		ballLayout : [{
			title : '选三中3',
			no : '01|02|03|04|05|06|07|08|09|10|11',
			isCtr : 1,
			cols : 1
		}],
	},
	"rxfizs" : {
		playTypetitle : '四中四',
		playTypeCode : 'rxfizs',
		methoddesc : '从01-11中任意选择4个或4个以上号码。',
		methodhelp : '从01-11共11个号码中选择4个号码进行购买，只要当期顺序摇出的5个开奖号码中包含所选号码，即为中奖。',
		ballLayout : [{
			title : '选四中4',
			no : '01|02|03|04|05|06|07|08|09|10|11',
			isCtr : 1,
			cols : 1
		}],
	},
	"rxfwzw" : {
		playTypetitle : '五中五',
		playTypeCode : 'qshhzx',
		methoddesc : '从01-11中任意选择5个或5个以上号码。',
		methodhelp : '从01-11共11个号码中选择5个号码进行购买，只要当期顺序摇出的5个开奖号码中包含所选号码，即为中奖。',
		ballLayout : [ {
			title : '选五中5',
			no : '01|02|03|04|05|06|07|08|09|10|11',
			isCtr : 1,
			cols : 1
		}],
	},
	"rxfslzw" : {
		playTypetitle : '六中五',
		playTypeCode : 'rxfslzw',
		methoddesc : '从01-11中任意选择6个或6个以上号码。',
		methodhelp : '从01-11共11个号码中选择6个号码进行购买，只要当期顺序摇出的5个开奖号码中包含所选号码，即为中奖。',
		ballLayout : [ {
			title : '选六中5',
			no : '01|02|03|04|05|06|07|08|09|10|11',
			isCtr : 1,
			cols : 1
		}],
	},
	"rxfqzw" : {
		playTypetitle : '七中五',
		playTypeCode : 'rxfqzw',
		methoddesc : '从01-11中任意选择7个或7个以上号码。',
		methodhelp : '从01-11共11个号码中选择7个号码进行购买，只要当期顺序摇出的5个开奖号码中包含所选号码，即为中奖。',
		ballLayout : [ {
			title : '选七中5',
			no : '01|02|03|04|05|06|07|08|09|10|11',
			isCtr : 1,
			cols : 1
		}],
	},
	"rxfbzw" : {
		playTypetitle : '八中五',
		playTypeCode : 'rxfbzw',
		methoddesc : '从01-11中任意选择8个或8个以上号码。',
		methodhelp : '从01-11共11个号码中选择8个号码进行购买，只要当期顺序摇出的5个开奖号码中包含所选号码，即为中奖。',
		ballLayout : [ {
			title : '选八中5',
			no : '01|02|03|04|05|06|07|08|09|10|11',
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

