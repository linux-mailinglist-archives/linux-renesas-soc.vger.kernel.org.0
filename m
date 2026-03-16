Return-Path: <linux-renesas-soc+bounces-29438-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPo+DB1st2kYRAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29438-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:34:05 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DC47029420D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:34:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7FACD306CF65
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 02:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667E830BBBC;
	Mon, 16 Mar 2026 02:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="MDwx/+VW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011001.outbound.protection.outlook.com [52.101.125.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C769D30C359;
	Mon, 16 Mar 2026 02:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773628020; cv=fail; b=fK3gy7O28AaJgdwvr/6sg/taeKTucK7xmZ2KMrLxTSDy8wSruJN0YQo27tYpV5BaYQeJGAyp802HovWqSZBFh8rg18zjA/ZKrMVdAaf4d/5SRga8dP+WVv0XkFIX4QcbhKvwgOYc9WWoh/kQdAEzHtfuEKJbwjEc6G58dmKLsdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773628020; c=relaxed/simple;
	bh=jfUiiV36XCBdJrCj9WtSJW8uMiBYvBdDQZSEUsjxaq0=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VQ4Ti9X3bFC+R/lCedbfzSjVgRqW5PQ2PbVkDiN1mvZUY5MOg0FDXB+5ASMnadETRJd8gb+W7u45fVeTDPkUcUAQcwkh1Xs/KE2G1Cvih+mf2iJY/pqX1tXnXkneZe2JVfLbGDwuanwJrkispx9cjwTviG2DYc4eDkhzIt6t/qI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=MDwx/+VW; arc=fail smtp.client-ip=52.101.125.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TW1UlgO2YBTgLi2SS46k78etOcD6EJ2VUyDAUr3K4mWNkR4x0wc2ofJe6qhDt6/1SAU2V2lkBSAeVhCdTEO7XcZVfNK12kJ7hxCL2t45TqqxGDUNWTmv268qtjN7W8+3CyqhutAIv0QQCe66DGnDhl0SdMESWQzqjvQYFj/J2bE+x62dPL1L3jpGTioNMDViGV86FYFTDn1A0N8gHxi3vYqinzXSUyRc6oMsHRbGnztWeJDJSgdDcVRY84zuel4p4gjtxL2yb3c9FZvMD4JUSNJwVc9X8yKFkzQGD8NHB9QvYDiDxBAoiourBxBRjAlQcr+L3QZp+37p/vO8nWlQjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSd76YuhXC9adtXIbJqMe8lOS4sHwaYN5vTvBDhtSfk=;
 b=pp6PBjILpoevzRRdZjFR+0a308h5dBf7Yj00/JslPtk+qY30403KOg1PYNsZwLkRPWRdDCMe1B9zkJBU4DOVgaUAdqwTudDNyktD+VoAaTuJlIBtk0WXsQFDm+fw/bDIwKVCx5zOi1ZUioqeNIxOolAmGQoM2p/Y1sosm/vELppXtiEZFbmMrt8hPbDQ8oyGVO1GlR84WlFV7HnfOvL2jGNOUboJrc20XDfMa8eTVDU3Wu37B2Z9OEQ4bQh2Ca7AaB7dpNaFGVI4/JVZhDCKrWcQbRdngjTgxDx8lDcxDDBkpOPB6I1I3MpcblVopvh5Oq0VCDTGkpZoNUbN1rZAhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSd76YuhXC9adtXIbJqMe8lOS4sHwaYN5vTvBDhtSfk=;
 b=MDwx/+VWouRjlI27OOtDwr/VOatlvTg8FXbC95ealR6Pe/NRyvJSUe+1DFefEVugyUQuHqqrnYAVvrb3e299JOethmZ7q3ffh97Fu5jzkQUpL86L5jo/nDSMn1T0LkJlRU7YDYUxvy2xUF+VI2yFZ+zc0koItP6p2fSyspxV0EM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS9PR01MB13205.jpnprd01.prod.outlook.com (2603:1096:604:30f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 02:26:38 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 02:26:48 +0000
Message-ID: <87ms08jyq8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Martin_Povi=C5=A1er=22?= <povik+lin@cutebit.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrei Simion
 <andrei.simion@microchip.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Benson Leung <bleung@chromium.org>, Biju
 Das <biju.das.jz@bp.renesas.com>, Cezary Rojewski
 <cezary.rojewski@intel.com>, Cheng-Yi Chiang <cychiang@chromium.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Cyril Chao <Cyril.Chao@mediatek.com>, Dan
 Carpenter <dan.carpenter@linaro.org>, Daniel Baluta
 <daniel.baluta@nxp.com>, Daniel Mack <daniel@zonque.org>, Fabio Estevam
 <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Guenter Roeck <groeck@chromium.org>, Haojian
 Zhuang <haojian.zhuang@gmail.com>, Herve Codina <herve.codina@bootlin.com>,
 Jaroslav Kysela <perex@perex.cz>, Jonathan Hunter <jonathanh@nvidia.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Nicolin Chen
 <nicoleotsuka@gmail.com>, Oder Chiou <oder_chiou@realtek.com>, Olivier
 Moysan <olivier.moysan@foss.st.com>, Orson Zhai <orsonzhai@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Ray Jui <rjui@broadcom.com>, Robert
 Jarzmik <robert.jarzmik@free.fr>, Sascha Hauer <s.hauer@pengutronix.de>,
 Scott Branden <sbranden@broadcom.com>, Sheetal <sheetal@nvidia.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Srinivas Kandagatla
 <srini@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi
 Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, Tim Bird
 <tim.bird@sony.com>, Tzung-Bi Shih <tzungbi@kernel.org>, Venkata Prasad
 Potturu <venkataprasad.potturu@amd.com>, Vijendar Mukunda
 <Vijendar.Mukunda@amd.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: [PATCH v2 17/29] ASoC: pxa: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 02:26:47 +0000
X-ClientProxiedBy: TYCP286CA0320.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::16) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS9PR01MB13205:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c1af74b-f67b-4ae2-1da7-08de8303796e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|921020|56012099003|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	h78ZyIZ0aEFzBCSb8ayjrba3Au+19CbfkCDCr3VmjafVxyyI5101V3wuH97DraChWqHayLfEi/tG/HLxesartBAgdJaiSRaIHQLeyWQelr3DAioJKwvtIv++44hODtIXT+I/F+FDALCeqhg7ci3BctxXEiAjrNb+pKv1JNkLxN20ESMj8ZDzNy13jk/XfAW9prG16c1JouSKPjDOlQkTd9GxV5H0r+vUPV1OUBCLjNxlo3yZX8+FxHmFpDnA+1X9USkYe22+M/eFvqtN2M14MIn3xttrTNXndgfmzmE1YhmgD8i/bB98XU/kGMhCf95/wPqIuXR55bZ7tre/oQebA5uzENZfh3qGCGVGbX7r3LLjROtLQhSAKrMnwmBKmo6FpcoxZpmYFDGsWa4dvfdK4ZTtZvnLFSurqdhLBRd00Th0b355L4Tu9WYynRNU2IJpQSC3VQ6Ot5aRx0nds8nUsc7tEzC6JBdQ+5JiUAtQeZuykOiZdM4kkpMNfvj4NXVlTmK+Aq2vwYSHUjJ+nVQDzEjqevjM7VpvkWim3DxVMR/609/XAINmwdf7mdAPoZV2JYWme7JvMidIkaZUAMYemJHGEXkcghJiTgolhbis/9JKXhvZYH2llT8NQAh2CyiQWduaG6D7SG2bE3PikCiHgtgewgJf44Acyric1HgDanSfhtmfv6AuFuI6p4Cmj7NGyYM2XLxfvC39dtI93pB0LYCN7L4kCzfJa65qeuMcKsHWoARgJdsxVYFuwx2evG5e02ewoAy6QfvG3SqLQXY+PJQ93a9mujdoJyHysoYbUtn8cEj7AM9KVHzHQTFzsJ80CvqGouZknNM7YLQZCVqeDw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(921020)(56012099003)(22082099003)(18002099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nlDMjpHv+L1yZiW+4Xgt8ML9Wa0zMJwdDoe6nMTeUtIqVHOFg8WwmU3MRnn6?=
 =?us-ascii?Q?fCjbp34Gu9LrO3LGIjSr153E/WWM456DaOs85c8kwNg2mNmMsozKZrnRC3RY?=
 =?us-ascii?Q?SYKCZn+MCasy46dwID+cr7oiNXFLoFqFeCU+Ah8hs97O0PGNd+cTeuOQPgLK?=
 =?us-ascii?Q?PKgxuULImHuC5bKemxjiEmM/5AP66/tqFcPp86q8NcsqCSJ2oe4pjPlgBI76?=
 =?us-ascii?Q?Y3ouFPJ65qbKR4bmUM3XPDmkEHSJUHqK4xuM7PLKQ8NWov1yO5qPx6HPl56V?=
 =?us-ascii?Q?vKCU5Fa4JQc8YBC92A6IP5mH3je1m/i9+cwbxyZN9zbvL0eSU0+ngsfYt7pJ?=
 =?us-ascii?Q?yCI2Aovxo07RdUOcBBV6YcAf7Rd/nguDR8Ie9zsr8MlHOrOsgGzHx43CgoZI?=
 =?us-ascii?Q?lLOkFLARxtcToqLKBsJeqmpwVmlTINwvvqOzBw9zLjzndaUA3ecGDGm4+yuA?=
 =?us-ascii?Q?9yr5VXWbSftQQSmTfRWAxqrztW0srqgkH780O98f862TOrwYvtOUD6dkU8tV?=
 =?us-ascii?Q?HXSdciKNkYLy7/hzoEVVin0M6V2treY9wmnNScmGQ9o7ITEcVOUhbA0xAanI?=
 =?us-ascii?Q?t2k/eGbTycvVyoxz//zLkbGv6+rxjEk+dUOeY0uqlQbMCmtDIWPNVUR7Xi9n?=
 =?us-ascii?Q?gdbaTgpigXWsg+kKJfPS/lTaxe+W6hoNUJBmWhmAfyAXmWIMkXYg2xLh5WpC?=
 =?us-ascii?Q?dVhTx43q4VMlo9bBi9qGaQF3gSMEveNWbNJJnHjwB8pbsS1bEngG2lWfOPWQ?=
 =?us-ascii?Q?vtNCsuaSbvxdtAtz4ugMZ328ToZBR5wm/m0xmZGs9Js78LjZXCTKxo36PZ/R?=
 =?us-ascii?Q?qevmwVK8Fk2+Wk/0t/IiB40ypJs35rkEdRL0b5QekrXvwA5wWtrdbRubFNUv?=
 =?us-ascii?Q?KiodPNBRD6W2AGytxWb0YDALzp5L104hw1+S11lUkUhHIjBfIrdNSjAo0Axl?=
 =?us-ascii?Q?yi7E9DY+USeerq+ZgSI1W0RBDeJBVaIE/x63ArDbcIPEmGzM+/rfhEEkdrq+?=
 =?us-ascii?Q?bJ73hyuzrYcPHIPv7mIfxUybS6gVuJKuNb3g5sND/3U2NseQAZyVqG4CkUQn?=
 =?us-ascii?Q?419zbQjt0h+UOkRQK9h/Xtw2qUIXzlz60fMCMip0imhxkduQQrdmUODXDaqg?=
 =?us-ascii?Q?7mvmUVldG9v9MQ9xYY4g8a12qUyfemGSS9r0JXtNvcoC9cAMkfoi6FGua9be?=
 =?us-ascii?Q?YytBpCdYE7S+ZahMx7BHf0d69usRHbGSK16mTE1QEmItTYm84aFs6vdUHShr?=
 =?us-ascii?Q?CiCQTxwvWQNyNNYpN+SIIMfM5kSh6sDW0TzssQk0/Wuz9X5i7LTW34N5dwDF?=
 =?us-ascii?Q?n7Vm8DnzXarxcWRemTMrmrp+sQOiRVTI0fcElFV/LuBtbt7gIhFiOnDOAZXK?=
 =?us-ascii?Q?GPzC0meD/jew9Yuj+9i+FQ96bdRJQ2d/qUgXAyBW354g3SDx1oagJG9TuLN+?=
 =?us-ascii?Q?6amT1w1GdxPf4IkOsBs7z1EBaRGfgxYuBzaQNHelQAAu2IaMTQFaGwRdz2wE?=
 =?us-ascii?Q?nPhJCz/eNedlUfVxaRdO5IIxGv4J3FdFkyhdEeY4OtKIeU89lGUoQod+i1Ag?=
 =?us-ascii?Q?c6fnV7Yr9zYIOLPy4i0vyGL+sQw4hb3RStInwk3awCYenrcaU6NemwE25c06?=
 =?us-ascii?Q?bkgtOaj4xD6oCBTcv6n+l9SuLqxk+DzZ/utW4svvVgP2WRntslzvOR1JJxzg?=
 =?us-ascii?Q?pqikewEalSpiRt61DBsqgy0vArXzDL/cJH/jhG/pKzQhvlPON7ryFxlHK7K/?=
 =?us-ascii?Q?gtU/3GJWi30TozERgeAa5qzMC65TIyJfX7MGwDf9EruoSGVUQqWh?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c1af74b-f67b-4ae2-1da7-08de8303796e
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:26:48.0120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 12qqayKLxerCkPwo2iFD2KpanEkTAFWaux0oGE2n45sRGVsH6foyentM/vBWFIqW1ZDDC+tXXtsvKNHjz7mnpev1rXbthEaOyUk9qNL/Xtx/10uOYdnOKlaLlJ2/bkzf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13205
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[cutebit.org,bootlin.com,foss.st.com,microchip.com,collabora.com,linux.alibaba.com,linux.intel.com,chromium.org,bp.renesas.com,intel.com,gmail.com,tuxon.dev,mediatek.com,linaro.org,nxp.com,zonque.org,glider.be,perex.cz,nvidia.com,socionext.com,metafoo.de,kernel.org,amd.com,realtek.com,linux.dev,broadcom.com,free.fr,pengutronix.de,samsung.com,suse.com,sony.com,arm.com,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29438-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	RCPT_COUNT_GT_50(0.00)[67];
	TAGGED_RCPT(0.00)[linux-renesas-soc,lin,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:dkim,renesas.com:email,renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DC47029420D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

We have been used pcm_new()/pcm_free(), but switched to
pcm_construct()/pcm_destruct() to use extra parameters [1].

pcm_new()/free() had been removed [2], but each drivers are still
using such function naming. Let's name back to pcm_new()/pcm_free()
again.

[1] commit c64bfc906600 ("ASoC: soc-core: add new pcm_construct/pcmdestruct")
[2] commit e9067bb50278 ("ASoC: soc-component: remove snd_pcm_ops from component driver")

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/pxa/pxa-ssp.c     | 2 +-
 sound/soc/pxa/pxa2xx-ac97.c | 2 +-
 sound/soc/pxa/pxa2xx-i2s.c  | 2 +-
 sound/soc/pxa/pxa2xx-pcm.c  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/pxa/pxa-ssp.c b/sound/soc/pxa/pxa-ssp.c
index c34bfa27a446a..37bd8dbd541f7 100644
--- a/sound/soc/pxa/pxa-ssp.c
+++ b/sound/soc/pxa/pxa-ssp.c
@@ -843,7 +843,7 @@ static struct snd_soc_dai_driver pxa_ssp_dai = {
 
 static const struct snd_soc_component_driver pxa_ssp_component = {
 	.name			= "pxa-ssp",
-	.pcm_construct		= pxa2xx_soc_pcm_new,
+	.pcm_new		= pxa2xx_soc_pcm_new,
 	.open			= pxa2xx_soc_pcm_open,
 	.close			= pxa2xx_soc_pcm_close,
 	.hw_params		= pxa2xx_soc_pcm_hw_params,
diff --git a/sound/soc/pxa/pxa2xx-ac97.c b/sound/soc/pxa/pxa2xx-ac97.c
index 109a4958d9c04..a0c6726029186 100644
--- a/sound/soc/pxa/pxa2xx-ac97.c
+++ b/sound/soc/pxa/pxa2xx-ac97.c
@@ -198,7 +198,7 @@ static struct snd_soc_dai_driver pxa_ac97_dai_driver[] = {
 
 static const struct snd_soc_component_driver pxa_ac97_component = {
 	.name		= "pxa-ac97",
-	.pcm_construct	= pxa2xx_soc_pcm_new,
+	.pcm_new	= pxa2xx_soc_pcm_new,
 	.open		= pxa2xx_soc_pcm_open,
 	.close		= pxa2xx_soc_pcm_close,
 	.hw_params	= pxa2xx_soc_pcm_hw_params,
diff --git a/sound/soc/pxa/pxa2xx-i2s.c b/sound/soc/pxa/pxa2xx-i2s.c
index 849fbf176a70f..f6ada6cffc889 100644
--- a/sound/soc/pxa/pxa2xx-i2s.c
+++ b/sound/soc/pxa/pxa2xx-i2s.c
@@ -356,7 +356,7 @@ static struct snd_soc_dai_driver pxa_i2s_dai = {
 
 static const struct snd_soc_component_driver pxa_i2s_component = {
 	.name			= "pxa-i2s",
-	.pcm_construct		= pxa2xx_soc_pcm_new,
+	.pcm_new		= pxa2xx_soc_pcm_new,
 	.open			= pxa2xx_soc_pcm_open,
 	.close			= pxa2xx_soc_pcm_close,
 	.hw_params		= pxa2xx_soc_pcm_hw_params,
diff --git a/sound/soc/pxa/pxa2xx-pcm.c b/sound/soc/pxa/pxa2xx-pcm.c
index 9d6c41f775e51..ff0fbb61dccd9 100644
--- a/sound/soc/pxa/pxa2xx-pcm.c
+++ b/sound/soc/pxa/pxa2xx-pcm.c
@@ -18,7 +18,7 @@
 #include <sound/dmaengine_pcm.h>
 
 static const struct snd_soc_component_driver pxa2xx_soc_platform = {
-	.pcm_construct	= pxa2xx_soc_pcm_new,
+	.pcm_new	= pxa2xx_soc_pcm_new,
 	.open		= pxa2xx_soc_pcm_open,
 	.close		= pxa2xx_soc_pcm_close,
 	.hw_params	= pxa2xx_soc_pcm_hw_params,
-- 
2.43.0


