var descHelpContent = "<table cellspacing='0' class='descHelp'><tbody><tr><th>投注</th><td>";

var LotteryData = {
	//二同号
	"ethdx" : {
		playTypetitle : '二同号单选',
		playTypeCode : 'ethdx',
		methoddesc : '竞猜开奖号码中的二同号数字（即对子号码）和不同号的数字，奖金80元。',
		methodhelp : descHelpContent+"34</td></tr><tr><th>开奖</th><td><i class='orange'>344</i></td></tr><tr><th>奖金</th><td>80元</td></tr></tbody></table>",
		ballLayout : [ {
			title : '同号',
			no : '11|22|33|44|55|66',
			isCtr : 0,
			cols : 1
		},{
			title : '不同号',
			no : '1|2|3|4|5|6',
			isCtr : 0,
			cols : 1
		}],
	},
	"ethfx" : {
		playTypetitle : '二同号复选',
		playTypeCode : 'ethfx',
		methoddesc : '竞猜开奖号码中的二同号数字（即对子号码），非对子不中奖，奖金15元。',
		methodhelp : descHelpContent+"44</td></tr><tr><th>开奖</th><td><i class='orange'>*44</i></td></tr><tr><th>奖金</th><td>15元</td></tr></tbody></table>",
		ballLayout : [{
			title : '选号',
			no : '11|22|33|44|55|66',
			isCtr : 0,
			cols : 1
		}],
	},
	
	//三同号
	"sthdx" : {
		playTypetitle : '三同号单选',
		playTypeCode : 'sthdx',
		methoddesc : '从三同号（111-666）中任选一个进行投注，开奖号码为此三同号即中奖，奖金240元。',
		methodhelp : descHelpContent+"444</td></tr><tr><th>开奖</th><td><i class='orange'>444</i></td></tr><tr><th>奖金</th><td>240元</td></tr></tbody></table>",
		ballLayout : [ {
			title : '选号',
			no : '111|222|333|444|555|666',
			isCtr : 0,
			cols : 1
		}],
	},
	"sthtx" : {
		playTypetitle : '三同号通选',
		playTypeCode : 'sthtx',
		methoddesc : '对所有三同号进行投注，开奖号码为任意三同号（111-666）即中奖，奖金40元。',
		methodhelp : descHelpContent+"三同号通选</td></tr><tr><th>开奖</th><td><i class='orange'>333</i></td></tr><tr><th>奖金</th><td>40元</td></tr></tbody></table>",
		ballLayout : [{
			title : '选号',
			no : '三同号通选',
			isCtr : 0,
			cols : 1
		}],
	},
	
	//三不同号
	"sbth" : {
		playTypetitle : '三不同号',
		playTypeCode : 'sbth',
		methoddesc : '三不同号是指开奖号码的3个数字都不相同，竞猜这3个数字，猜对即中奖，奖金40元。',
		methodhelp : descHelpContent+"345</td></tr><tr><th>开奖</th><td><i class='orange'>345</i></td></tr><tr><th>奖金</th><td>40元</td></tr></tbody></table>",
		ballLayout : [{
			title : '选号',
			no : '1|2|3|4|5|6',
			isCtr : 0,
			cols : 1
		}],
	},
	
	//三连号
	"slhtx" : {
		playTypetitle : '三连号通选',
		playTypeCode : 'slhtx',
		methoddesc : '对所有三连号进行投注，开奖号码为任意三连号（123、234、345、456）即中奖，奖金10元。',
		methodhelp : descHelpContent+"345</td></tr><tr><th>开奖</th><td><i class='orange'>345</i></td></tr><tr><th>奖金</th><td>40元</td></tr></tbody></table>",
		ballLayout : [ {
			title : '选号',
			no : '三连号通选',
			isCtr : 0,
			cols : 1
		}],
	},
	
	//二不同号
	"ebth" : {
		playTypetitle : '二不同号',
		playTypeCode : 'ebth',
		methoddesc : '选择两个号码进行投注，开奖号码中包含这两个号码即中奖，奖金8元。',
		methodhelp : descHelpContent+"35</td></tr><tr><th>开奖</th><td><i class='orange'>135</i></td></tr><tr><th>奖金</th><td>8元</td></tr></tbody></table>",
		ballLayout : [ {
			title : '选号',
			no : '1|2|3|4|5|6',
			isCtr : 0,
			cols : 1
		}],
	},
	
	//选5
	"hz" : {
		playTypetitle : '和值',
		playTypeCode : 'hz',
		methoddesc : '竞猜开奖的号码的数值之和。',
		methodhelp : descHelpContent+"3</td></tr><tr><th>开奖</th><td><i class='orange'>111</i></td></tr><tr><th>奖金</th><td>240元</td></tr></tbody></table>",
		ballLayout : [ {
			title : '选号',
			no : '3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18',
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

