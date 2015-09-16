var PlayType = {
	/**
	 * 重庆时时彩
	 */
	"cqssc" : {
		"wx" : {
			"name" : "五星",
			"subTypes" : [ {"code" : "wzxfs","name" : "直选单复式","dataId":"wzxfs"},
			               {"code" : "wwxzh","name" : "五星组合"},
			               {"code" : "wzx120","name" : "组选120"},
			               {"code" : "wzx60","name" : "组选60"},
			               {"code" : "wzx30","name" : "组选30"},
			               {"code" : "wzx20","name" : "组选20"},
			               {"code" : "wzx10","name" : "组选10"},
			               {"code" : "wzx5","name" : "组选5"}]
		},
		"sx" : {
			"name" : "四星",
			"subTypes" : [ {"code" : "szxfs","name" : "直选单复式"}, 
			               {"code" : "szxds","name" : "直选单式"},
			               {"code" : "szx24","name" : "组选24"},
			               {"code" : "szx12","name" : "组选12"},
			               {"code" : "szx6","name" : "组选6"},
			               {"code" : "szx4","name" : "组选4"}]
		},
		"hs" : {
			"name" : "后三",
			"subTypes" : [  {"code" : "hszxfs","name" : "直选 "},
			                {"code" : "hszxhz","name" : "直选和值 "},
			                {"code" : "hszsfs","name" : "组三 "},
			                {"code" : "hszlfs","name" : "组六 "},
			                {"code" : "hshhzx","name" : "混合组选 "},
			                {"code" : "hszzhz","name" : "组选和值 "}]
		},
		"qs" : {
			"name" : "前三",
			"subTypes" : [  {"code":"qszxfs","name" : "直选"},
			                {"code":"qszxhz","name" : "直选和值"},
			                {"code":"qszsfs","name" : "组三"},
			                {"code":"qszlfs","name" : "组六"},
			                {"code":"qshhzx","name" : "混合组选"},
			                {"code":"qszzhz","name" : "组选和值"}]
		},
		"qe" : {
			"name" : "前二",
			"subTypes" : [  {"code":"qezxfs","name" : "直选"},
			                {"code":"qezxhz","name" : "直选和值"},
			                {"code":"qezuxfs","name" : "组选"},
			                {"code":"qezuxhz","name" : "组选和值"}]
		},
		"he" : {
			"name" : "后二",
			"subTypes" : [  {"code":"hezxfs","name" : "直选"},
			                {"code":"hezxhz","name" : "直选和值"},
			                {"code":"hezuxfs","name" : "组选"},
			                {"code":"hezuxhz","name" : "组选和值"}]
		},
		"dwd" : {
			"name" : "定位胆",
			"subTypes" : [  {"code":"dwd","name" : "定位胆"}]
		},
		/*"bdw" : {
			"name" : "不定位",
			"subTypes" : [  {"code":"bdwhsym","name" : "后三一码"},
			                {"code":"bdwqsym","name" : "前三一码"},
			                {"code":"bdwhsem","name" : "后三二码"},
			                {"code":"bdwqsem","name" : "前三二码"},
			                {"code":"bdwsxym","name" : "四星一码"},
			                {"code":"bdwsxem","name" : "四星二码"},
			                {"code":"bdwwxem","name" : "五星二码"},
			                {"code":"bdwwxsm","name" : "五星三码"}]
		},*/
		"dxds" : {
			"name" : "大小单双",
			"subTypes" : [  {"code":"dxdsqe","name" : "前二大小单双"},
			                {"code":"dxdshe","name" : "后二大小单双"},
			                {"code":"dxdsqs","name" : "前三大小单双"},
			                {"code":"dxdshs","name" : "后三大小单双"}]
		},
		"qw" : {
			"name" : "趣味",
			"subTypes" : [  {"code":"yffs","name" : "一帆风顺"},
			                {"code":"hscs","name" : "好事成双"},
			                {"code":"sxbx","name" : "三星报喜"},
			                {"code":"sjfc","name" : "四季发财"}]
		},
	},
	/*******************************************重庆时时彩结束***************************************************/

	/**
	 * 江西时时彩
	 */
	"jxssc" : {
		"sx" : {
			"name" : "四星",
			"subTypes" : [ {"code" : "szxfs","name" : "直选"}, 
			               {"code" : "ssxzh","name" : "四星组合"},
			               {"code" : "szx24","name" : "组选24"},
			               {"code" : "szx12","name" : "组选12"},
			               {"code" : "szx6","name" : "组选6"},
			               {"code" : "szx4","name" : "组选4"}]
		},
		"hs" : {
			"name" : "后三",
			"subTypes" : [  {"code" : "hszxfs","name" : "直选 "},
			                {"code" : "hszxhz","name" : "直选和值 "},
			                {"code" : "hszsfs","name" : "组三 "},
			                {"code" : "hszlfs","name" : "组六"},
			                {"code" : "hshhzx","name" : "混合组选 "},
			                {"code" : "hszzhz","name" : "组选和值 "}]
		},
		"qs" : {
			"name" : "前三",
			"subTypes" : [  {"code":"qszxfs","name" : "直选"},
			                {"code":"qszxhz","name" : "直选和值"},
			                {"code":"qszsfs","name" : "组三"},
			                {"code":"qszlfs","name" : "组六"},
			                {"code":"qshhzx","name" : "混合组选"}]
		},
		"qe" : {
			"name" : "前二",
			"subTypes" : [  {"code":"qezxfs","name" : "直选"},
			                {"code":"qezxhz","name" : "直选和值"},
			                {"code":"qezuxfs","name" : "组选"},
			                {"code":"qezuxhz","name" : "组选和值"}]
		},
		"he" : {
			"name" : "后二",
			"subTypes" : [  {"code":"hezxfs","name" : "直选"},
			                {"code":"hezxhz","name" : "直选和值"},
			                {"code":"hezuxfs","name" : "组选"},
			                {"code":"hezuxhz","name" : "组选和值"}]
		},
		"dwd" : {
			"name" : "定位胆",
			"subTypes" : [  {"code":"dwd","name" : "定位胆"}]
		},
		"bdw" : {
			"name" : "不定位",
			"subTypes" : [  {"code":"bdwhsym","name" : "后三一码"},
			                {"code":"bdwqsym","name" : "前三一码"},
			                {"code":"bdwhsem","name" : "后三二码"},
			                {"code":"bdwqsem","name" : "前三二码"},
			                {"code":"bdwsxym","name" : "四星一码"},
			                {"code":"bdwsxem","name" : "四星二码"},
			                {"code":"bdwwxem","name" : "五星二码"},
			                {"code":"bdwwxsm","name" : "五星三码"}]
		},
		"dxds" : {
			"name" : "大小单双",
			"subTypes" : [  {"code":"dxdsqe","name" : "前二大小单双"},
			                {"code":"dxdshe","name" : "后二大小单双"},
			                {"code":"dxdsqs","name" : "前三大小单双"},
			                {"code":"dxdshs","name" : "后三大小单双"}]
		},
		
	},
	/*******************************************江西时时彩结束***************************************************/
	
	
	/**
	 * 新疆时时彩
	 */
	"xjssc" : {
		"sx" : {
			"name" : "四星",
			"subTypes" : [ {"code" : "szxfs","name" : "直选"}, 
			               {"code" : "ssxzh","name" : "四星组合"},
			               {"code" : "szx24","name" : "组选24"},
			               {"code" : "szx12","name" : "组选12"},
			               {"code" : "szx6","name" : "组选6"},
			               {"code" : "szx4","name" : "组选4"}]
		},
		"hs" : {
			"name" : "后三",
			"subTypes" : [  {"code" : "hszxfs","name" : "直选 "},
			                {"code" : "hszxhz","name" : "直选和值 "},
			                {"code" : "hszsfs","name" : "组三 "},
			                {"code" : "hszlfs","name" : "组六 "},
			                {"code" : "hshhzx","name" : "混合组选 "}]
		},
		"qs" : {
			"name" : "前三",
			"subTypes" : [  {"code":"qszxfs","name" : "直选"},
			                {"code":"qszxhz","name" : "直选和值"},
			                {"code":"qszsfs","name" : "组三"},
			                {"code":"qszlfs","name" : "组六"},
			                {"code":"qshhzx","name" : "混合组选"}]
		},
		"qe" : {
			"name" : "前二",
			"subTypes" : [  {"code":"qezxfs","name" : "直选"},
			                {"code":"qezxhz","name" : "直选和值"},
			                {"code":"qezuxfs","name" : "组选"}]
		},
		"he" : {
			"name" : "后二",
			"subTypes" : [  {"code":"hezxfs","name" : "直选"},
			                {"code":"hezxhz","name" : "直选和值"},
			                {"code":"hezuxfs","name" : "组选"}]
		},
		"dwd" : {
			"name" : "定位胆",
			"subTypes" : [  {"code":"dwd","name" : "定位胆"}]
		},
		"bdw" : {
			"name" : "不定位",
			"subTypes" : [  {"code":"bdwhsym","name" : "后三一码"},
			                {"code":"bdwqsym","name" : "前三一码"},
			                {"code":"bdwhsem","name" : "后三二码"},
			                {"code":"bdwqsem","name" : "前三二码"},
			                {"code":"bdwsxym","name" : "四星一码"},
			                {"code":"bdwsxem","name" : "四星二码"},
			                {"code":"bdwwxem","name" : "五星二码"},
			                {"code":"bdwwxsm","name" : "五星三码"}]
		},
		"dxds" : {
			"name" : "大小单双",
			"subTypes" : [  {"code":"dxdsqe","name" : "前二大小单双"},
			                {"code":"dxdshe","name" : "后二大小单双"},
			                {"code":"dxdsqs","name" : "前三大小单双"},
			                {"code":"dxdshs","name" : "后三大小单双"}]
		}
	},
	/*******************************************新疆时时彩结束***************************************************/
	
	
	/**
	 * 重庆11选5
	 */
	"cq115" : {
		"sm" : {
			"name" : "三码",
			"subTypes" : [  {"code" : "smzxfs","name" : "直选 "},
			                {"code" : "smzufs","name" : "组选 "}]
		},
		"em" : {
			"name" : "二码",
			"subTypes" : [  {"code":"emzxfs","name" : "直选单复式"},
			                {"code":"emzufs","name" : "组选单复式"}]
		},
		"dwd" : {
			"name" : "定位胆",
			"subTypes" : [  {"code":"dwd","name" : "定位胆"}]
		},
		"qsw" : {
			"name" : "不定胆",
			"subTypes" : [{"code":"qsw","name":"前三位"}]
		},
		"qw" : {
			"name" : "趣味型",
			"subTypes" : [  {"code":"dds","name" : "定单双"},
			                {"code":"czw","name" : "猜中位"}]
		},
		"rxf" : {
			"name" : "任选单复式",
			"subTypes" : [  {"code":"rxfyzy","name" : "一中一"},
			                {"code":"rxfeze","name" : "二中二"},
			                {"code":"rxfszs","name" : "三中三"},
			                {"code":"rxfizs","name" : "四中四"},
			                {"code":"rxfwzw","name" : "五中五"},
			                {"code":"rxfslzw","name" : "六中五"},
			                {"code":"rxfqzw","name" : "七中五"},
			                {"code":"rxfbzw","name" : "八中五"}]
		}
	},
	/*******************************************重庆11选5结束***************************************************/
	
	/**
	 * 广东11选5
	 */
	"gd115" : {
		"sm" : {
			"name" : "三码",
			"subTypes" : [  {"code" : "smzxfs","name" : "直选 "},
			                {"code" : "smzufs","name" : "组选 "}]
		},
		"em" : {
			"name" : "二码",
			"subTypes" : [  {"code":"emzxfs","name" : "直选"},
			                {"code":"emzufs","name" : "组选"}]
		},
		"dwd" : {
			"name" : "定位胆",
			"subTypes" : [  {"code":"dwd","name" : "定位胆"}]
		},
		"qsw" : {
			"name" : "不定胆",
			"subTypes" : [{"code":"qsw","name":"前三位"}]
		},
		"qw" : {
			"name" : "趣味型",
			"subTypes" : [  {"code":"dds","name" : "定单双"},
			                {"code":"czw","name" : "猜中位"}]
		},
		"rxf" : {
			"name" : "任选单复式",
			"subTypes" : [  {"code":"rxfyzy","name" : "一中一"},
			                {"code":"rxfeze","name" : "二中二"},
			                {"code":"rxfszs","name" : "三中三"},
			                {"code":"rxfizs","name" : "四中四"},
			                {"code":"rxfwzw","name" : "五中五"},
			                {"code":"rxfslzw","name" : "六中五"},
			                {"code":"rxfqzw","name" : "七中五"},
			                {"code":"rxfbzw","name" : "八中五"}]
		}
	},
	/*******************************************广东11选5结束***************************************************/
	
	/**
	 * 山东11选5
	 */
	"sd115" : {
		"sm" : {
			"name" : "三码",
			"subTypes" : [  {"code" : "smzxfs","name" : "直选单复式 "},
			                {"code" : "smzufs","name" : "组选单复式 "}]
		},
		"em" : {
			"name" : "二码",
			"subTypes" : [  {"code":"emzxfs","name" : "直选单复式"},
			                {"code":"emzufs","name" : "组选单复式"}]
		},
		"dwd" : {
			"name" : "定位胆",
			"subTypes" : [  {"code":"dwd","name" : "定位胆"}]
		},
		"qsw" : {
			"name" : "不定胆",
			"subTypes" : [{"code":"qsw","name":"前三位"}]
		},
		"qw" : {
			"name" : "趣味型",
			"subTypes" : [  {"code":"dds","name" : "定单双"},
			                {"code":"czw","name" : "猜中位"}]
		},
		"rxf" : {
			"name" : "任选单复式",
			"subTypes" : [  {"code":"rxfyzy","name" : "一中一"},
			                {"code":"rxfeze","name" : "二中二"},
			                {"code":"rxfszs","name" : "三中三"},
			                {"code":"rxfizs","name" : "四中四"},
			                {"code":"rxfwzw","name" : "五中五"},
			                {"code":"rxfslzw","name" : "六中五"},
			                {"code":"rxfqzw","name" : "七中五"},
			                {"code":"rxfbzw","name" : "八中五"}]
		}
	},
	/*******************************************山东11选5结束***************************************************/
	
	/**
	 * 快乐十分
	 */
	"klsf" : {
		"xy" : {
			"name" : "选1",
			"subTypes" : [  {"code" : "xyst","name" : "选一数投 "},
			                {"code" : "xyht","name" : "选一红投 "}]
		},
		"xe" : {
			"name" : "选2",
			"subTypes" : [  {"code":"xerxe","name" : "任选二"},
			                {"code":"xelzi","name" : "选二连直"},
			                {"code":"xelzu","name" : "选二连组"}]
		},
		"xs" : {
			"name" : "选3",
			"subTypes" : [  {"code":"xsrxs","name" : "任选三"}]
		},
		"xsi" : {
			"name" : "选4",
			"subTypes" : [  {"code":"xsirxs","name" : "任选四"}]
		},
		"xw" : {
			"name" : "选5",
			"subTypes" : [  {"code":"xwrxw","name" : "任选五"}]
		}
	},
	/*******************************************快乐十分结束***************************************************/
	
	/**
	 * 江苏快3
	 */
	"jsk3" : {
		"eth" : {
			"name" : "二同号",
			"subTypes" : [  {"code" : "ethdx","name" : "二同号单选 "},
			                {"code" : "ethfx","name" : "二同号复选 "}]
		},
		"sth" : {
			"name" : "三同号",
			"subTypes" : [  {"code":"sthdx","name" : "三同号单选"},
			                {"code":"sthtx","name" : "三同号通选"}]
		},
		"sbt" : {
			"name" : "三不同号",
			"subTypes" : [  {"code":"sbth","name" : "三不同号"}]
		},
		"slh" : {
			"name" : "三连号通选",
			"subTypes" : [  {"code":"slhtx","name" : "三连号通选"}]
		},
		"ebt" : {
			"name" : "二不同号",
			"subTypes" : [  {"code":"ebth","name" : "二不同号"}]
		},
		"hz" : {
			"name" : "和值",
			"subTypes" : [  {"code":"hz","name" : "和值"}]
		}
	},
	/*******************************************江苏快3结束***************************************************/
	
	/**
	 * 北京快乐8
	 */
	"bjkl8" : {
		"qw" : {
			"name" : "趣味",
			"subTypes" : [  {"code" : "hzds","name" : "和值单双 "},
			                {"code" : "hzdx","name" : "和值大小 "},
			                {"code" : "jop","name" : "奇偶盘 "},
			                {"code" : "sxp","name" : "上下盘 "},
			                {"code" : "hzdxds","name" : "和值大小单双 "}]
		},
		"rx" : {
			"name" : "任选",
			"subTypes" : [  {"code":"rxy","name" : "任选一"},
			                {"code":"rxe","name" : "任选二"},
							{"code":"rxs","name" : "任选三"},
							{"code":"rxsi","name" : "任选四"},
							{"code":"rxw","name" : "任选五"},
							{"code":"rxl","name" : "任选六"},
							{"code":"rxq","name" : "任选七"}]
		}
	},
	/*******************************************北京快乐8结束***************************************************/
	
	/**
	 * 福彩3D
	 */
	"fc3d" : {
		"sm" : {
			"name" : "三码",
			"subTypes" : [  {"code" : "smzxfs","name" : "直选 "},
			                {"code" : "smzzhz","name" : "直选和值 "},
			                {"code" : "smzxzs","name" : "组三 "},
			                {"code" : "smzxzl","name" : "组六 "},
			                {"code" : "smzxhz","name" : "组选和值 "}]
		},
		"em" : {
			"name" : "二码",
			"subTypes" : [  {"code":"hezxfs","name" : "后二直选"},
			                {"code":"hezuxfs","name" : "后二组选"},
							{"code":"qezxfs","name" : "前二直选"},
							{"code":"qezuxfs","name" : "前二组选"}]
		},
		"dwd" : {
			"name" : "定位胆",
			"subTypes" : [  {"code":"dwd","name" : "定位胆"}]
		},
		"qsw" : {
			"name" : "不定胆",
			"subTypes" : [  {"code":"ymbdd","name" : "一码不定胆"}]
		}
	},
	/*******************************************福彩3D结束***************************************************/
	
	/**
	 * 排列三
	 */
	"pl3" : {
		"sm" : {
			"name" : "三码",
			"subTypes" : [  {"code" : "smzxfs","name" : "直选 "},
			                {"code" : "smzzhz","name" : "直选和值 "},
			                {"code" : "smzxzs","name" : "组三 "},
			                {"code" : "smzxzl","name" : "组六 "},
			                {"code" : "smzxhz","name" : "组选和值 "}]
		},
		"em" : {
			"name" : "二码",
			"subTypes" : [  {"code":"hezxfs","name" : "后二直选"},
			                {"code":"hezuxfs","name" : "后二组选"},
							{"code":"qezxfs","name" : "前二直选"},
							{"code":"qezuxfs","name" : "前二组选"}]
		},
		"dwd" : {
			"name" : "定位胆",
			"subTypes" : [  {"code":"dwd","name" : "定位胆"}]
		},
		"qsw" : {
			"name" : "不定胆",
			"subTypes" : [  {"code":"ymbdd","name" : "一码不定胆"}]
		}
	},
};