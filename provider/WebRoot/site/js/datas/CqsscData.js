var LotteryData = {
	"wzxfs" : {
		playTypetitle : '五星直选复式',
		playTypeCode : 'wzxfs',
		methoddesc : '从个、十、百、千、万位各选一个号码组成一注。',
		methodhelp : '从万位、千位、百位、十位、个位中选择一个5位数号码组成一注，所选号码与开奖号码全部相同，且顺序一致，即为中奖。',
		ballLayout : [ {
			title : '万位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 0,
			cols : 1
		},  {
			title : '千位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 0,
			cols : 1
		},  {
			title : '百位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 0,
			cols : 1
		}, {
			title : '十位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}, {
			title : '个位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 2,
			cols : 1
		} ],
		code_sp : '',
		prize : {
			1 : '1800.00'
		},
		nfdprize : {
			levs : '1920',
			defaultprize : 1800.00,
			userdiffpoint : 6
		},
		modes : [ {
			modeid : 1,
			name : '元',
			rate : 1
		}, {
			modeid : 2,
			name : '角',
			rate : 0.1
		}, {
			modeid : 3,
			name : '分',
			rate : 0.01
		} ],
		maxcodecount : 0
	},
	"wwxzh" : {
		playTypetitle : '五星组合',
		playTypeCode : 'wwxzh',
		methoddesc : '从个、十、百、千、万位各选一个号码组成五注。',
		methodhelp : '从百位、十位、个位中选择一个3位数号码组成一注，所选号码与开奖号码后3位相同，且顺序一致，即为中奖。',
		ballLayout : [ {
			title : '万位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 0,
			cols : 1
		},  {
			title : '千位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 0,
			cols : 1
		},  {
			title : '百位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 0,
			cols : 1
		}, {
			title : '十位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}, {
			title : '个位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 2,
			cols : 1
		} ],
		code_sp : '',
		prize : {
			1 : '1800.00'
		},
		nfdprize : {
			levs : '1920',
			defaultprize : 1800.00,
			userdiffpoint : 6
		},
		modes : [ {
			modeid : 1,
			name : '元',
			rate : 1
		}, {
			modeid : 2,
			name : '角',
			rate : 0.1
		}, {
			modeid : 3,
			name : '分',
			rate : 0.01
		} ],
		maxcodecount : 0
	},
	"wzx120":{
		playTypetitle:"组选120",
		playTypeCode : 'wzxfs',
		methoddesc : "从0-9中选择5个号码组成一注。",
		methodhelp : "从0-9中任意选择5个号码组成一注，所选号码与开奖号码的万位、千位、百位、十位、个位相同，顺序不限，即为中奖。",
		ballLayout : [ {
					"title" : "",
					"no" : "0|1|2|3|4|5|6|7|8|9",
					"isCtr" : 0,
					"cols" : 1,
					"minchosen" : 5
		} ],
		noBigIndex : 5,
		isButton: true
	},
	"wzx60":{
		playTypetitle:"组选60",
		playTypeCode : 'wzx60',
		methoddesc : "从“二重号”选择一个号码，“单号”中选择三个号码组成一注。",
		methodhelp : "选择1个二重号码和3个单号号码组成一注，所选的单号号码与开奖号码相同，且所选二重号码在开奖号码中出现了2次，即为中奖。",
		ballLayout : [ {
			title : '二重号',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}, {
			title : '单 号',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 2,
			cols : 1
		}],
		noBigIndex : 5,
		isButton: true
	},
	"wzx30":{
		playTypetitle:"组选30",
		playTypeCode : 'wzx30',
		methoddesc : "从“二重号”选择两个号码，“单号”中选择一个号码组成一注。",
		methodhelp : "选择2个二重号和1个单号号码组成一注，所选的单号号码与开奖号码相同，且所选的2个二重号码分别在开奖号码中出现了2次，即为中奖。",
		ballLayout : [ {
			title : '二重号',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}, {
			title : '单 号',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 2,
			cols : 1
		}],
		noBigIndex : 5,
		isButton: true
	},
	"wzx20":{
		playTypetitle:"组选20",
		playTypeCode : 'wzx20',
		methoddesc : "从“三重号”选择一个号码，“单号”中选择两个号码组成一注。",
		methodhelp : "选择1个三重号码和2个单号号码组成一注，所选的单号号码与开奖号码相同，且所选三重号码在开奖号码中出现了3次，即为中奖。",
		ballLayout : [ {
			title : '三重号',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}, {
			title : '单 号',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 2,
			cols : 1
		}],
		noBigIndex : 5,
		isButton: true
	},
	"wzx10":{
		playTypetitle:"组选10",
		playTypeCode : 'wzx10',
		methoddesc : "从“三重号”选择一个号码，“二重号”中选择一个号码组成一注。",
		methodhelp : "选择1个三重号码和1个二重号码，所选三重号码在开奖号码中出现3次，并且所选二重号码在开奖号码中出现了2次，即为中奖。",
		ballLayout : [ {
			title : '三重号',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}, {
			title : '二重号',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 2,
			cols : 1
		}],
		noBigIndex : 5,
		isButton: true
	},
	"wzx5":{
		playTypetitle:"组选5",
		playTypeCode : 'wzx5',
		methoddesc : "从“四重号”选择一个号码，“单号”中选择一个号码组成一注。",
		methodhelp : "选择1个四重号码和1个单号号码组成一注，所选的单号号码与开奖号码相同，且所选四重号码在开奖号码中出现了4次，即为中奖。",
		ballLayout : [ {
			title : '四重号',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}, {
			title : '单 号',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 2,
			cols : 1
		}],
		noBigIndex : 5,
		isButton: true
	},
	//四星
	"szxfs" : {
		playTypetitle : '直选复式',
		playTypeCode : 'szxfs',
		methoddesc : '从千位、百位、十位、个位中选择一个4位数号码组成一注。',
		methodhelp : '从千位、百位、十位、个位中选择一个4位数号码组成一注，所选号码与开奖号码相同，且顺序一致，即为中奖。',
		ballLayout : [ {
			title : '千位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 0,
			cols : 1
		},  {
			title : '百位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 0,
			cols : 1
		}, {
			title : '十位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}, {
			title : '个位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 2,
			cols : 1
		} ],
	},
	"ssxzh" : {
		playTypetitle : '四星组合',
		playTypeCode : 'ssxzh',
		methoddesc : '在千位，百位，十位，个位任意位置上任意选择1个或1个以上号码。',
		methodhelp : '从千位、百位、十位、个位任意位置上至少选择1个以上号码，所选号码与相同位置上的开奖号码一致，即为中奖。',
		ballLayout : [ {
			title : '千位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 0,
			cols : 1
		},  {
			title : '百位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 0,
			cols : 1
		}, {
			title : '十位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}, {
			title : '个位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 2,
			cols : 1
		} ],
	},
	"szx24" : {
		playTypetitle : '组选24',
		playTypeCode : 'szx24',
		methoddesc : '从0-9中选择4个号码组成一注。',
		methodhelp : '从0-9中任意选择4个号码组成一注，所选号码与开奖号码的千位、百位、十位、个位相同，且顺序不限，即为中奖。',
		ballLayout : [ {
			title : '',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 0,
			cols : 1
		}],
	},
	"szx12" : {
		playTypetitle : '组选12',
		playTypeCode : 'szx12',
		methoddesc : '从“二重号”选择一个号码，“单号”中选择两个号码组成一注。',
		methodhelp : '选择1个二重号码和2个单号号码组成一注，所选单号号码与开奖号码相同，且所选二重号码在开奖号码中出现了2次，即为中奖。',
		ballLayout : [ {
			title : '二重号',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}, {
			title : '单 号',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 2,
			cols : 1
		}],
	},
	"szx6" : {
		playTypetitle : '组选6',
		playTypeCode : 'szx6',
		methoddesc : '从“二重号”选择两个号码组成一注。',
		methodhelp : '选择2个二重号码组成一注，所选的2个二重号码在开奖号码中分别出现了2次，即为中奖。',
		ballLayout : [ {
			title : '二重号',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}],
	},
	"szx4" : {
		playTypetitle : '组选4',
		playTypeCode : 'szx4',
		methoddesc : '从“三重号”选择一个号码，“单号”中选择两个号码组成一注。',
		methodhelp : '选择1个三重号码和1个单号号码组成一注，所选单号号码与开奖号码相同，且所选三重号码在开奖号码中出现了3次，即为中奖。',
		ballLayout : [ {
			title : '三重号',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		},{
			title : '单 号',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}],
	},
	
	//后三码
	"hszxfs" : {
		playTypetitle : '直选复式',
		playTypeCode : 'hszxfs',
		methoddesc : '从个、十、百位各选一个号码组成一注。',
		methodhelp : '从百位、十位、个位中选择一个3位数号码组成一注，所选号码与开奖号码后3位相同，且顺序一致，即为中奖。',
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
	"hszxhz" : {
		playTypetitle : '直选和值',
		playTypeCode : 'hszxhz',
		methoddesc : '从0-27中任意选择1个或1个以上号码',
		methodhelp : '所选数值等于开奖号码的百位、十位、个位三个数字相加之和，即为中奖。',
		ballLayout : [{
			title : '直选和值',
			no : '0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27',
			isCtr : 0,
			cols : 1
		}],
	},
	"hszsfs" : {
		playTypetitle : '组三复式',
		playTypeCode : 'hszsfs',
		methoddesc : '从0-9中任意选择2个或2个以上号码。',
		methodhelp : '从0-9中选择2个数字组成两注，所选号码与开奖号码的百位、十位、个位相同，且顺序不限，即为中奖。',
		ballLayout : [ {
			title : '组三',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}],
	},
	"hszlfs" : {
		playTypetitle : '组六复式',
		playTypeCode : 'hszlfs',
		methoddesc : '从0-9中任意选择3个或3个以上号码。',
		methodhelp : '从0-9中任意选择3个号码组成一注，所选号码与开奖号码的百位、十位、个位相同，顺序不限，即为中奖。',
		ballLayout : [{
			title : '组六',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}],
	},
	"hshhzx" : {
		playTypetitle : '混合组选',
		playTypeCode : 'hshhzx',
		methoddesc : '从个、十、百位各选一个号码组成一注。',
		methodhelp : '从百位、十位、个位中选择一个3位数号码组成一注，开奖号码的百位、十位、个位符合后三组三或组六均为中奖。',
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
	"hszzhz" : {
		playTypetitle : '组选和值',
		playTypeCode : 'hszzhz',
		methoddesc : '从1-26中选择1个或者1个以上号码。',
		methodhelp : '所选数值等于开奖号码百位、十位、个位三个数字相加之和，即为中奖。',
		ballLayout : [ {
			title : '组选和值',
			no : '1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26',
			isCtr : 0,
			cols : 1
		}],
	},
	
	//前三码
	"qszxfs" : {
		playTypetitle : '直选复式',
		playTypeCode : 'qszxfs',
		methoddesc : '从万、千、百位各选一个号码组成一注。',
		methodhelp : '从万位、千位、百位中选择一个3位数号码组成一注，所选号码与开奖号码的前3位相同，且顺序一致，即为中奖。',
		ballLayout : [ {
			title : '万位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		},{
			title : '千位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		},{
			title : '百位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}],
	},
	"qszxhz" : {
		playTypetitle : '直选和值',
		playTypeCode : 'qszxhz',
		methoddesc : '从0-27中任意选择1个或1个以上号码。',
		methodhelp : '所选数值等于开奖号码的万位、千位、百位三个数字相加之和，即为中奖。',
		ballLayout : [{
			title : '直选和值',
			no : '0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27',
			isCtr : 0,
			cols : 1
		}],
	},
	"qszsfs" : {
		playTypetitle : '组三复式',
		playTypeCode : 'qszsfs',
		methoddesc : '从0-9中任意选择2个或2个以上号码。',
		methodhelp : '从0-9中选择2个数字组成两注，所选号码与开奖号码的万位、千位、百位相同，且顺序不限，即为中奖。',
		ballLayout : [{
			title : '组三',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}],
	},
	"qszlfs" : {
		playTypetitle : '组六复式',
		playTypeCode : 'qszlfs',
		methoddesc : '从0-9中任意选择3个或3个以上号码。',
		methodhelp : '从0-9中任意选择3个号码组成一注，所选号码与开奖号码的万位、千位、百位相同，顺序不限，即为中奖。',
		ballLayout : [{
			title : '组六',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}],
	},
	"qshhzx" : {
		playTypetitle : '混合组选',
		playTypeCode : 'qshhzx',
		methoddesc : '从万、千、百位各选一个号码组成一注。',
		methodhelp : '从万位、千位、百位中选择一个3位数号码组成一注，开奖号码的万位、千位、百位符合后三组三或组六均为中奖。',
		ballLayout : [ {
			title : '万位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		},{
			title : '千位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		},{
			title : '百位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}],
	},
	"qszzhz" : {
		playTypetitle : '组选和值',
		playTypeCode : 'qszzhz',
		methoddesc : '从1-26中选择1个或者1个以上号码。',
		methodhelp : '所选数值等于开奖号码万位、千位、百位三个数字相加之和，即为中奖。',
		ballLayout : [ {
			title : '组选和值',
			no : '1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26',
			isCtr : 0,
			cols : 1
		}],
	},
	
	//前二
	"qezxfs" : {
		playTypetitle : '直选复式',
		playTypeCode : 'qezxfs',
		methoddesc : '从万位和千位上至少各选1个号码。',
		methodhelp : '从万位和千位上至少各选1个号码，所选号码与开奖号码的万位、千位相同，且顺序一致，即为中奖。',
		ballLayout : [ {
			title : '万位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		},{
			title : '千位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}],
	},
	"qezxhz" : {
		playTypetitle : '直选和值',
		playTypeCode : 'qezxhz',
		methoddesc : '从0-18中任意选择1个或1个以上号码。',
		methodhelp : '所选数值等于开奖号码的万位、千位二个数字相加之和，即为中奖。',
		ballLayout : [ {
			title : '直选和值',
			no : '0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18',
			isCtr : 0,
			cols : 1
		}],
	},
	"qezuxfs" : {
		playTypetitle : '组选复式',
		playTypeCode : 'qezuxfs',
		methoddesc : '从0-9中任意选择2个或2个以上号码。',
		methodhelp : '从0-9中选2个号码组成一注，所选号码与开奖号码的万位、千位相同，顺序不限，即为中奖。',
		ballLayout : [ {
			title : '组选',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}],
	},
	"qezuxhz" : {
		playTypetitle : '组选和值',
		playTypeCode : 'qezuxhz',
		methoddesc : '从0-18中选择1个或者1个以上号码。',
		methodhelp : '所选数值等于开奖号码的万位、千位二个数字相加之和，即为中奖。',
		ballLayout : [ {
			title : '组选和值',
			no : '1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17',
			isCtr : 0,
			cols : 1
		}],
	},
	
	//后二
	"hezxfs" : {
		playTypetitle : '直选复式',
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
	"hezxhz" : {
		playTypetitle : '直选和值',
		playTypeCode : 'hezxhz',
		methoddesc : '从0-18中任意选择1个或1个以上号码。',
		methodhelp : '所选数值等于开奖号码的十位、个位二个数字相加之和，即为中奖。',
		ballLayout : [ {
			title : '直选和值',
			no : '0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18',
			isCtr : 0,
			cols : 1
		}],
	},
	"hezuxfs" : {
		playTypetitle : '组选复式',
		playTypeCode : 'hezuxfs',
		methoddesc : '从0-9中任意选择2个或2个以上号码。',
		methodhelp : '从0-9中选2个号码组成一注，所选号码与开奖号码的十位、个位相同，顺序不限，即为中奖。',
		ballLayout : [ {
			title : '组选',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}],
	},
	"hezuxhz" : {
		playTypetitle : '组选和值',
		playTypeCode : 'hezuxhz',
		methoddesc : '从1-17中选择1个或者1个以上号码。',
		methodhelp : '所选数值等于开奖号码的十位、个位二个数字相加之和（不含对子号），即为中奖。',
		ballLayout : [ {
			title : '组选和值',
			no : '1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17',
			isCtr : 0,
			cols : 1
		}],
	},
	
	//定位胆
	"dwd" : {
		playTypetitle : '定位胆',
		playTypeCode : 'dwd',
		methoddesc : '在万位，千位，百位，十位，个位任意位置上任意选择1个或1个以上号码。',
		methodhelp : '从万位、千位、百位、十位、个位任意1个位置或多个位置上选择1个号码，所选号码与相同位置上的开奖号码一致，即为中奖。',
		ballLayout : [ {
			title : '万位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		},{
			title : '千位',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		},{
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
	
	//不定位   代码有待补充
	
	
	//大小单双
	"dxdsqe" : {
		playTypetitle : '前二大小单双',
		playTypeCode : 'dxdsqe',
		methoddesc : '从万位、千位中的“大、小、单、双”中至少各选一个组成一注。',
		methodhelp : '对万位和千位的“大（56789）小（01234）、单（13579）双（02468）”形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。',
		ballLayout : [ {
			title : '万位',
			no : '大|小|单|双',
			isCtr : 1,
			cols : 1
		},{
			title : '千位',
			no : '大|小|单|双',
			isCtr : 1,
			cols : 1
		}],
	},
	"dxdshe" : {
		playTypetitle : '后二大小单双',
		playTypeCode : 'dxdshe',
		methoddesc : '从十位、个位中的“大、小、单、双”中至少各选一个组成一注。',
		methodhelp : '对十位和个位的“大（56789）小（01234）、单（13579）双（02468）”形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。',
		ballLayout : [ {
			title : '万位',
			no : '大|小|单|双',
			isCtr : 1,
			cols : 1
		},{
			title : '千位',
			no : '大|小|单|双',
			isCtr : 1,
			cols : 1
		}],
	},
	"dxdsqs" : {
		playTypetitle : '前三大小单双',
		playTypeCode : 'dxdsqe',
		methoddesc : '从万位、千位、百位中的“大、小、单、双”中至少各选一个组成一注。',
		methodhelp : '对万位、千位和百位的“大（56789）小（01234）、单（13579）双（02468）”形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。',
		ballLayout : [ {
			title : '万位',
			no : '大|小|单|双',
			isCtr : 1,
			cols : 1
		},{
			title : '千位',
			no : '大|小|单|双',
			isCtr : 1,
			cols : 1
		},{
			title : '百位',
			no : '大|小|单|双',
			isCtr : 1,
			cols : 1
		}],
	},
	"dxdshs" : {
		playTypetitle : '后三大小单双',
		playTypeCode : 'dxdsqe',
		methoddesc : '从百位、十位、个位中的“大、小、单、双”中至少各选一个组成一注。',
		methodhelp : '对百位、十位和个位的“大（56789）小（01234）、单（13579）双（02468）”形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。',
		ballLayout : [ {
			title : '百位',
			no : '大|小|单|双',
			isCtr : 1,
			cols : 1
		},{
			title : '十位',
			no : '大|小|单|双',
			isCtr : 1,
			cols : 1
		},{
			title : '个位',
			no : '大|小|单|双',
			isCtr : 1,
			cols : 1
		}],
	},
	
	//趣味
	"yffs" : {
		playTypetitle : '一帆风顺',
		playTypeCode : 'yffs',
		methoddesc : '从0-9中任意选择1个以上号码。',
		methodhelp : '从0-9中任意选择1个号码组成一注，只要开奖号码的万位、千位、百位、十位、个位中包含所选号码，即为中奖。',
		ballLayout : [ {
			title : '选号',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}],
	},
	"hscs" : {
		playTypetitle : '好事成双',
		playTypeCode : 'hscs',
		methoddesc : '从0-9中任意选择1个以上的二重号码。',
		methodhelp : '从0-9中任意选择1个号码组成一注，只要所选号码在开奖号码的万位、千位、百位、十位、个位中出现2次，即为中奖。',
		ballLayout : [ {
			title : '选号',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}],
	},
	"sxbx" : {
		playTypetitle : '三星报喜',
		playTypeCode : 'sxbx',
		methoddesc : '从0-9中任意选择1个以上的三重号码。',
		methodhelp : '从0-9中任意选择1个号码组成一注，只要所选号码在开奖号码的万位、千位、百位、十位、个位中出现3次，即为中奖。',
		ballLayout : [ {
			title : '选号',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}],
	},
	"sjfc" : {
		playTypetitle : '四季发财',
		playTypeCode : 'sjfc',
		methoddesc : '从0-9中任意选择1个以上的四重号码。',
		methodhelp : '从0-9中任意选择1个号码组成一注，只要所选号码在开奖号码的万位、千位、百位、十位、个位中出现4次，即为中奖。',
		ballLayout : [ {
			title : '选号',
			no : '0|1|2|3|4|5|6|7|8|9',
			isCtr : 1,
			cols : 1
		}],
	},
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

