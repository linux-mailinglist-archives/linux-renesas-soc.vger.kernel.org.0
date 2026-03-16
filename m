Return-Path: <linux-renesas-soc+bounces-29447-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGJvAQZrt2kuRAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29447-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:29:26 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D84622940FA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:29:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6DFDD3020215
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 02:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E41B30C617;
	Mon, 16 Mar 2026 02:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gwA0d3TX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011044.outbound.protection.outlook.com [40.107.74.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C156030C37B;
	Mon, 16 Mar 2026 02:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773628072; cv=fail; b=U3q32r0OV1KEI7+5JjGKd2YqP9/cDHvvOIHhFCt7WZDnjJGfUBjaQkZdAm+kZORkdVe08YXFFd/w771SoPVEtZIuUbhIJm3y80r1ubkp98HU1/9uzZc34Ybpxqh26sEcFWtEXw2Jeh7I5hodKMOAAfNvCGMuO4QsobO3wTNoUxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773628072; c=relaxed/simple;
	bh=iXOTymJt3IZGZr+ip2jkDlMK+Hk4msybL+NSOvHXMkg=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=FOoynPcD3X3LEjTLmKcCFRsuObVB4UGxhPBTauL1iFiJnRJ+7o69GWJq5gd6kabixL7Myz9eIEfkUjM+ZVyiWZJ7PnfzHEcwAk7OYpnmJ0AG1Xa6UECzeOfr0X7GhP2Yy9L00Fusf2ejUMGaQGjQexDfEARIQ0bxvyyhbKQlR7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gwA0d3TX; arc=fail smtp.client-ip=40.107.74.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c69sirU/49uKsNMF2N9VxcOdFfk0yDbx2P4iEJ9ef4WOgDWwNu4e4xiUrW+flHmqHCToXcFnGPqluucQsULNDQslhDhNOjbNSsxhKo4Gbw1LoKrsSq8GrvZ7vvzC7vMKCzZBp6AOQJSwKrWB5jsAz+QSIZ1f8WwuXv7po6aoHTPDEoZURY0UEaI1ldcDpWW871Zwz3sqqAM7sqVsRN9U7i+PZPyHv9ruAD6ClYZoGgjEPxDoGXRZiBBrpaD+79+x3PcDOPZKSbfN6OCNQ3iyeHuKjwB5Vxt0U2+xxW3fjpH9/Pr3rKVVm8LfECYn+cZdn1qAag0RWFh84ipEepOZOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDv9B+V09dduJ9L2UJPPq7CHJ6AQUqEiR3icRNji7ug=;
 b=h1jZAiPBP9d14lNw/yjYUwBiJOjO/iGtGKQp1dUJLED0mmhsxrIkGFZXGs91YFe5p/UhooNasg6BJrTyzS6J79Vh1ElRDr9P77d+LhVeg9yBR+NDASIeuW2TNLVlzpgdisLZvEgkcxTkXhu0hxm/2KVP3JKWqHY+DXoYcGG7sW59490oF6SLaltMoaMaqrbcUmk1fMwDjUyI0WlPN2MSjO048xPpmh/I5vjfVaKAw03NyJ040YqCrEfZs0ysB/YDX06fjuPlE0oAO7d9dkjXFoT1pbV4GU2h9F4SwRHOrnpAK25fxpdpY1yq/jNLDp3odxhfLa1XzAeFjOw9xXXUXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDv9B+V09dduJ9L2UJPPq7CHJ6AQUqEiR3icRNji7ug=;
 b=gwA0d3TXTRqkvuvPkw2sSc7h6pWZN9gYV/+cTDnswINOe4Ml8+EPVBbUtzzGv4EVz74Pp2SM2R+ZSjzgnJYlFANsvKzEEsX7+8aAl3SDySVkWhZbJ2XttxnZA1IIgcai/4FU8xdBUWGk46LPAq/fCbkQP4g/07hb8n6zf5wB3CE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS7PR01MB14729.jpnprd01.prod.outlook.com (2603:1096:604:395::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.21; Mon, 16 Mar
 2026 02:27:23 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 02:27:39 +0000
Message-ID: <87a4w8jyot.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 26/29] ASoC: uniphier: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 02:27:38 +0000
X-ClientProxiedBy: TYWP286CA0020.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::7) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS7PR01MB14729:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ea4b522-a000-486e-7e27-08de8303981c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014|18002099003|56012099003|22082099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	qqEOqxjwnu9LGFl77LyL6mIWh7G3ebZ5YofetQtUgLWRqQho/StxXCTto6nabrizXzZshKTK85ix1BvwtZrOI+jynvOFxADeqksH87bL0vvIvsDMHR9hbiD3uoBIQiileMe/o+G2BDzp4R9qSTwPUwCDdsJC1VE6Qd6zBj4pkWL8rFbRKLtmHC0QdomkqREplEinWqMpm7RWsLDytia0MLH6KnnkVX/mwtQrZRc2UyYEsnlvprvfTAqPZ+LFPL/RqSYUxcnHGp22p6hQKOiOIEagmgunwMyULWE92OsNP++1u7kuL+SavuCvjC6QdltFjI6wgynR6CUB+G0zhCN24tuV4b7KbmHQFmk9E1UHb2WgnaHUkBMJRiNaSfPXoz1JYClpKATQvctpCCg5IPCksgShN9bamXZYcSmp00OxfjiTMJSfh1Y6EkSKq26QZNrNUKrzsY8MhJSfXD0oD02xkQrctA0Upxsck2YwicOimQ/LVnPJePU++QVD/jqiheUdnIPTUY6ajNsxdYHjOYxHF6g6MeeXl9qz5hy8h9vH5r0upeJvOupQHptIajhOxa/VFcPQylPbZgwISkHyhLIdSFKusug014z+Ac/J3zKpIWRc1pfzk2CzC3KB/xaqZ+4UHcaJn0RKMg+8TOa1DX/A8GjaW9ikXnU2zmchPYa9FJVlbnG/VPfOiN9XFP69NW1M5xpQ8fAz3ad/HJ8mM9gIZECgHyJzyVokq1jGh7iDSVnD6/i9mLiEBJgq164VfRl/S4r5ZOhjdv8IMy6ccdLuAI9woJJbG8HnG1vUq8ApGv64liYOHWlnLjsNIZwsLlTlKqIvcn6e4pITxrwWNKCZhA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014)(18002099003)(56012099003)(22082099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?exHcYI7qkR+9E32C4E+F5+EVYH2/17I62n3+eS8GhRmzssytLzkPDHKki4xx?=
 =?us-ascii?Q?Pfi1LVJ9O4gysDKuF453UdFDYtVbmikQz7jTuc9Avxd0aGXCRmfvoNOxwLEw?=
 =?us-ascii?Q?ERLLoSqMGPYJd5QPb8pbyKaQvfiMJY+R9SXxEhC9ddSEESPrPPYUnJnuQ8x2?=
 =?us-ascii?Q?cWCT64rbmucocAQwE0e8iUrkNG1JIMhQWX0hex2UpT9otISYy9Lp6ulC87yY?=
 =?us-ascii?Q?/jNCRR114trnIs9l0ELeCynxu1BH/fvx8G5vEYuYBBKohCPfWJHb4qp4cSpY?=
 =?us-ascii?Q?53y3svRohmK0/AxRYNMSA0xYvvArJrrm5QIukDWGpexwKhyJsgm51t/X51Op?=
 =?us-ascii?Q?5uNlCeyWNUpX+3j+9cFU6GrCAqPTf0nPaVnk+4ZNqvoq1r17rbBuBUu80oFl?=
 =?us-ascii?Q?P2Vq55+UggpGMXoaCQXW5JTWEwx5TnAC+06r8VRvsROE3PJPeMBmMbBxA1Oj?=
 =?us-ascii?Q?aN5j/crlupNIJgP7CJhfkKHW4uYSHrXFxcGpSl39DQDuI2sOlIez8vyDjkpS?=
 =?us-ascii?Q?funNbyeckS6oPRLrw0ac3mvu3V/kslvRq1MzDDiAGEQVasyUgRo86IuUvWzd?=
 =?us-ascii?Q?5G84PenD3DOcF9PDaZF18IB1wF7LEFQLpyDbusyXpQz9v+gfVWMEamdb4R59?=
 =?us-ascii?Q?te3EZafgXgENVuuQq1jUXoq7s4/MI12ICn77CLlxUHLQAmUJ2rvw9q8TOaGb?=
 =?us-ascii?Q?P+M/gvQ/fi8Ba238oQwcBSJHjDIYrDMfxMUB9KzSUMMhd/RMFKetmjLCI7Qh?=
 =?us-ascii?Q?Epdhit7dm2WgHlznPVnJU2MUMCBNmX9k7/UUbekD0ynPl7NWuzC4OLrKouTH?=
 =?us-ascii?Q?c+eoaLF4OBqPnGgThN7ez7TE5A13thFN5TCRKO2FFRixEQUHmX6Co7F0WwfH?=
 =?us-ascii?Q?liuCcyIPO2FgUe5BvuA8e8+ezw0vizXHHey0rZ9yQDD/6w/eAlQpCq0LFWYc?=
 =?us-ascii?Q?VX0TM3os8kPm2IZj1rNz/QrRRI0SpezubsFpMxgB16A7J6gyyVd82gRQ0WvE?=
 =?us-ascii?Q?50Za000sk1a1wgtoM5FAt34uaW+gBlZepI8wopCgu2+IK5wsYxKAV03kHicY?=
 =?us-ascii?Q?zJTMGHG/FO25lK2ipNk3kAAljyHh/m8jkwntBvSEi1mngyJKxDmol1xczFQp?=
 =?us-ascii?Q?JtNQhpLBEXnsBNfhOF3/Lkbr6rnx7fbS9bAZvCWTVbsTM/kC20hckaqY8IrJ?=
 =?us-ascii?Q?SpPrcmSaE1sg3PUmpeYr0MHFtVgUBDedA2a2wjnj6LKnlP54m+WWzofV4ZVX?=
 =?us-ascii?Q?irODFGGZEdQ7zOWigahSMPU31J/t3LaZsknFyiSBuG5DqGHprI2FAzd8Gzpx?=
 =?us-ascii?Q?xzhK5+fQICsCx853ADFOEjnvClrgXcsdpY7u0MH+EhlzA+RbA8Uar7P0JmPN?=
 =?us-ascii?Q?3NaRJ9KKx48fn7Blw9/OMdmKfyFMAbJIbMoOs7AK37dGgypnU24nqxRpUCTb?=
 =?us-ascii?Q?K2sRe2K6QdI1qZqoHiflGQ1h5lLSDF/gfWTC9nENRdl5R7xPEo2SyRBs6Ryb?=
 =?us-ascii?Q?EKZ5VrQKXzeD3vUpfsV7kysXxvr86qjWsYGIrnfg/UdgovE7X5lTMRrZd8qD?=
 =?us-ascii?Q?wvm3W/IMVrLK+exOYkPtEUl19v6bbTLs6pTmRSKaOBLeAk1jhtrRT6Kw3Z3j?=
 =?us-ascii?Q?+goNqWanocxqvBte8A7qEMSqdoQ0AU6wkB9OerXaH7I6CoV8SMcoeM+sf3yr?=
 =?us-ascii?Q?TvJ3FZuUQ1qIE2I8oz3ovwJeNPO6FaV+uAIaALnQGk59uul2QMOC5QZetXv5?=
 =?us-ascii?Q?FkTJva/bx+bypn5mzFbgiLqV6zQNXWCw4mOBPxrX9/IbILvjwoVq?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ea4b522-a000-486e-7e27-08de8303981c
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:27:39.5108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBUhvb//VUOlpKJQ4eUMn34jTe5BiBmc16hyAoPMa+LKY3LgUYgX0BFajRkLSf2J+OxoqKP8oRwQfmP60v1YxabB/X5f/A1MlYrDXInnd5ceYfZP1NJxUtQHKwfpj9Mk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14729
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[cutebit.org,bootlin.com,foss.st.com,microchip.com,collabora.com,linux.alibaba.com,linux.intel.com,chromium.org,bp.renesas.com,intel.com,gmail.com,tuxon.dev,mediatek.com,linaro.org,nxp.com,zonque.org,glider.be,perex.cz,nvidia.com,socionext.com,metafoo.de,kernel.org,amd.com,realtek.com,linux.dev,broadcom.com,free.fr,pengutronix.de,samsung.com,suse.com,sony.com,arm.com,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29447-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:dkim,renesas.com:email,renesas.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D84622940FA
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
 sound/soc/uniphier/aio-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/uniphier/aio-dma.c b/sound/soc/uniphier/aio-dma.c
index 265d61723e99a..c1ca559971037 100644
--- a/sound/soc/uniphier/aio-dma.c
+++ b/sound/soc/uniphier/aio-dma.c
@@ -226,7 +226,7 @@ static const struct snd_soc_component_driver uniphier_soc_platform = {
 	.trigger	= uniphier_aiodma_trigger,
 	.pointer	= uniphier_aiodma_pointer,
 	.mmap		= uniphier_aiodma_mmap,
-	.pcm_construct	= uniphier_aiodma_new,
+	.pcm_new	= uniphier_aiodma_new,
 	.compress_ops	= &uniphier_aio_compress_ops,
 };
 
-- 
2.43.0


