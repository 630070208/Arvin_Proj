var minRebate=100;
var PlayType={"wzxfs":"直选复式", "wzxds":"直选单式","wwxzh":"五星组合", "wzx120":"组选120","wzx60":"组选60",
			  "wzx30":"组选30",  "wzx20":"组选20", "wzx10":"组选10", "wzx5":"组选5","szxfs":"直选复式",
			  "szxds":"直选单式", "ssxzh":"四星组合","szx24":"组选24", "szx12":"组选12", "szx6":"组选6","szx4":"组选4",
			  "hszxfs":"直选复式","hszxds":"直选单式","hszxzh":"后三组合","hszxhz":"直选和值","hszsfs":"组三复式",
			  "hszsds":"组三单式","hszlfs":"组六复试","hszlds":"组六单式","hshhzx":"混合组选","hszzhz":"组选和值",
			  "qszxfs":"直选复式","qszxds":"直选单式","qszxzh":"前三组合","qszxhz":"直选和值","qszsfs":"组三复式",
			  "qszsds":"组三单式","qszlfs":"组六复式","qszlds":"组六单式","qshhzx":"混合组选","qszzhz":"组选和值",
			  "qezxfs":"直选复式","qezxds":"直选单式","qezxhz":"直选和值","qezuxfs":"组选复式","qezuxds":"组选单式",
			  "qezuxhz":"组选和值","hezxfs":"直选复式","hezxds":"直选单式","hezxhz":"直选和值","hezuxfs":"组选复式", 
			  "hezuxds":"组选单式","hezuxhz":"组选和值","dwd":"定位胆","qsw":"不定胆","bdwhsym":"后三一码","bdwqsym":"前三一码",
			  "bdwhsem":"后三二码","bdwqsem":"前三二码","bdwsxym":"四星一码","bdwsxem":"四星二码","bdwwxem":"五星二码","bdwwxsm":"五星三码","dxdsqe":"前二大小单双","dxdshe":"后二大小单双","dxdsqs":"前三大小单双","dxdshs":"后三大小单双",
			  "yffs":"一帆风顺","hscs":"好事成双","sxbx":"三星报喜","sjfc":"四季发财","dds":"定单双","czw":"猜中位","hzds":"和值单双","hzdx":"和值大小","jop":"奇偶盘","sxp":"上下盘","hzdxds":"和值大小单双",
			  "smzxfs":"直选复式","smzxds":"直选单式","smzufs":"组选复式","smzuds":"组选单式","smzudt":"组选胆拖","smzxhz":"组选和值","smzxzs":"组三","smzxzl":"组六","smzzhz":"直选和值",
			  "emzxfs":"直选复式","emzxds":"直选单式","emzufs":"组选复式","emzuds":"组选单式","emzudt":"组选胆拖","rxfyzy":"一中一","rxfeze":"二中二","rxfszs":"三中三","rxfizs":"四中四",
			  "rxfwzw":"五中五","rxfslzw":"六中五","rxfqzw":"七中五","rxfbzw":"八中五","rxdyzy":"一中一","rxdeze":"二中二","rxdszs":"三中三","rxdizs":"四中四","rxdwzw":"五中五",
			  "rxdslzw":"六中五","rxdqzw":"七中五","rxdbzw":"八中五","gpry":"任选一","gpre":"任选二","gprs":"任选三","gpri":"任选四","gprw":"任选五","gprl":"任选六","gprq":"任选七"};

function initRebateByString(str) {
	var gameTypeStrs = str.split("|");
	var items = [];
	var liststr = "";
	var map = {};
	for ( var i = 0; i < gameTypeStrs.length; i++) {
		liststr = gameTypeStrs[i];
		items = liststr.split("-");
		if (map[items[0]] == null) {
			map[items[0]] = {
				"playTypes" : []
			};
		}
		var playItem = {};
		playItem.gameType = items[0];
		playItem.playType = items[1];
		playItem.playTypeName = PlayType[items[1]];
		playItem.maxPrzie = parseFloat(items[2]);
		playItem.minPrzie = parseFloat(items[3]);
		playItem.rebate = parseFloat(items[4]);
		playItem.isRelocate = items[5];
		playItem.isRelocateName = items[5]=="true"?"是":"否";
		if(minRebate>playItem.rebate){
			minRebate=playItem.rebate;
		}
		map[items[0]].playTypes.push(playItem);
	}
	return map;

}