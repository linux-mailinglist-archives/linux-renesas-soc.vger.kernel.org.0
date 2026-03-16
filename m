Return-Path: <linux-renesas-soc+bounces-29422-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jGD3LDZtt2l+RAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29422-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:38:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B24062942B3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:38:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 61AB6302AADC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 02:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4F330C60E;
	Mon, 16 Mar 2026 02:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Vgfyn5Um"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011065.outbound.protection.outlook.com [52.101.125.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201FD263C9F;
	Mon, 16 Mar 2026 02:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773627897; cv=fail; b=iAOgQOoucUoQvAdy91c7mch9FHjHz+Yr4Ux/W9WmmnT8GLc10nVWUplg6kexfr+54ypDkvMH1n1dw0DIOtAtyoqrF+WmUpc1+n7xrQJgJYpI40M2UxiFEvobQwrqT/Sgo199fGGOFq7Wk3JcVf7vIjDDtvJ3D70oU+8iMgG3Blc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773627897; c=relaxed/simple;
	bh=mPuXo7CDJJS54O3HLmh+KbjbmE7SpOicdzqYlC9VpyU=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HIhv4Sr1uW8TidJkIcf/xJBT+uy2Du9R2g4p1NRbklNwTQyIhsS8cr6blfLYWdNZ2XtAeyb53tQy8PGCaHoG3rwdbfsX9f4qJcO9CcYphbTtuLQ/hIxEA4km8sJSkWxx66A58+vpTy1qGwj7Zaeal/pAqzt5IngpMM0AppefvoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Vgfyn5Um; arc=fail smtp.client-ip=52.101.125.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fRH/jm4I0qWfvsnXBXUWNirw8NKv081mCCXGR3dmilN2U1DH6i32vyXKV91U/IsHcQJgea/xOm6MppfcQfyj6lrTOguBE45khwk0xqlQMoSAwzPXxYB2V6r64djDbd1t/5j1p3J1p+AzM9F4EWlht+rH32u4R3ZrrLjJJc76O3y46SzT7cKbPp7kLc9QRDXv0E2xvnAR5ZlgergC3rQ/bZDWf7N9X6WT8KwY9wrjlkF4Rnltvsc4J4z7q/gm2XSUtU2mIss9IkVpsjK6tG8jS3xWYx8bnBLT3/7qwbAZg3N5ERhCtANFg+exAHyi7rAEIIaF6nSvyuczAxtFrWcaug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8n4rzLxscWWFNbXE9Lc/H8S4rWrC1gUMhVY5jcpHT8=;
 b=xbPQtkbA8d90AEje7INvvVhQ4cWnfvIkofVXg5KCU/pyTE7qZUhP/u1wAUHevR3nkXno9n1pWbQeAHmfysgi0Lpn6dnDBRhH/5aTY4xM+gQz3Y4U53lXyNMbNVmiozprDUrUBI71t4keu0hlVLwZC4KSjchXVUmptuEHjulIIvQsuC49NIw0UTeXehw1t/xbEPkPLJ01jugjc62FAkB6vea2eKe2Uz2JTUYWQmlG3JsoFfwBWQlegfeS5y+pmkhh27rBeT2EtvJQk7qZ1pNwkTaj95/zQJmOrTrMJBJVavNRR3QbYRyr4XIDvf5Vg6r0zW2816CeX5mwDmtMhHkAaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8n4rzLxscWWFNbXE9Lc/H8S4rWrC1gUMhVY5jcpHT8=;
 b=Vgfyn5Umsgus/LCxxMVJ1Xymm49jP9NICb9WNGAtT9Xxu9P2lr6YPVH3673SZv9xzXjNb4jkUUnPY8wuRiwyVBqCGccMf1ubqrZSwyn2+4Ei48HfHgfQ5EZ6MVb/TbUxGKj3t130HEVm2yZiGRYAVZqwecGTpo8zk//EB1ItelY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS3PR01MB10123.jpnprd01.prod.outlook.com (2603:1096:604:1e2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 02:24:49 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 02:24:44 +0000
Message-ID: <87a4w8lde4.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 01/29] ASoC: soc-component: re-add pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 02:24:43 +0000
X-ClientProxiedBy: TY4P286CA0046.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::13) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS3PR01MB10123:EE_
X-MS-Office365-Filtering-Correlation-Id: f255f48b-5d44-4711-74b3-08de83032fdd
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|921020|38350700014|18002099003|22082099003|56012099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	Iz31upTed9F8/pHsSwzMJZHa+ffKTPdgRxBPiq+/Bqn9qe+HA+HH7QPxEzqJgk1FwNqBNLtbxkIIPFUItaSHpgPEIKKM7XsJvl5rUXYTTa4JAJKS9DS5ABcEWDClMUIRbK4A/gMyukNzrMTGlVkS4dy8rmpS/Lsw41AA+7UhqHovMqdGgkBSNS3tRjS27N//y2r4O/GGh7kJsiNwOQno1gkFaCUjYbunKvhYh8KFWxwxHuGmp2x+CxbrYHoQ1cR7tNaKer7kMngl/fnPzT2HQfthRV2WzL+S6EX2nhXfLRLdZc7IRpwAvCyCwOjfh7h3X1sqfLHaJ5hwzJokeKcrkEOvGCf7DR+1KTzK95AoUGdlHluimcSVpNgFi6gaeNjSi5HCCDGDjl9PFMns67O8Del3kThRw/6LdUgFfuNJwQM7POPfyYvADOc4y4KicIVk0PyGSaLMRdFo72Yb5Ui1s/sPiGc/kktlkuDlt+uoYW1UkaK+/GaM9KOg4Kn6fJGV0WA8g+Tf893qo2mRa/H/vesD5GEbAuUaUzdBE0R9tAHD+7YIFtZUlJJ8Ld5Z/mLhkl+qlfEUd9206XchDLmclZk5u4zIhvgMzuVil/zT6iS9VzjI4PMWOw2ZBZJnZL1BUdqjRf3Tb90nseD61U+Ms0G3RgDt4Bzs5wpLlG0K1zUihunlGX/0SjJjLNLOWubfBhQcqp2hVz6LkKxWSGObHMilCuOsoSOirM2PgttUS5AtK6EHkYTL+NN0hfYAv6LbxrytnvcCGDhqaFyRHIpZMc2sNih9gl4XH5Fkjdjt2mKQ2vGoDsf9R1aOasL3oE15Y4ly2n2D0mVuPlOK/PH2Tw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(921020)(38350700014)(18002099003)(22082099003)(56012099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vPPFkZyZlrkgBOiTKrcblY8SQ/6PGPlufWfU30u+1k7tkFPBkHitBJHF/ICp?=
 =?us-ascii?Q?zCHniDWImFCufBq/U8dvHf7FAqGp9Lpbsy42pwu5AVyU6xg4nxu1qvDyOnD4?=
 =?us-ascii?Q?o42fqcSebcjEVn8KX9kExYFpDDWTwVkLUWoIIicEh8efOoIQoYLWzToA7wU+?=
 =?us-ascii?Q?Me40IXC2tYxr4ZNaQyFMF5PCwOXc4+sIPVpLeOLiKbHaXQB9Y5NI0FWvkyRu?=
 =?us-ascii?Q?xNUscbCGmuEVAc9SxNp3MraEzi5J0bGm90dt06ZwFtb1MZrYNu/hLoLDbdk7?=
 =?us-ascii?Q?ir6PO6GMH1JNrLSSXaF+AWAnfSp1+2odI57FfOIDtWerUqb+bli982Zxmmn/?=
 =?us-ascii?Q?E8Uk3LZOx0+HfOt8ZZQ1D6mvitTMoDndfJpGWyqwpsB4teu/8Z1zCPLXFaUX?=
 =?us-ascii?Q?RC2OUv9O9sSIMkPJyGxe6SUJP8+YXe5S7TVfaqOg/oZSqfkGv2Msk97wh2Th?=
 =?us-ascii?Q?BwlhE1dERDgjxQ/l89PuktgLybzAtBn0fr89QM2xJR9kdaCLh0c9XP3fSVeG?=
 =?us-ascii?Q?k8RVywziLOqnGi9Z8JiZtKt1Ni/7U1GnLk1ekC90R/Z0Aij9GUbiHxxiGlhK?=
 =?us-ascii?Q?Fjlorv10nUaPHYqlOLRYdxk/5gp5YbBF+YIMP3s7K/L3LaDEYBIKE/ecVPJU?=
 =?us-ascii?Q?6fvjRzWDyu56RlZbXKwpNQo8mEmKnpHiMQPqJDFqkXz8QFYMRrowfr/Eyd1J?=
 =?us-ascii?Q?7OAF24+GfzQRVReIjbkBdgnjcMPvzXwKKwRF/u32I6GjvqgJ55BPiaadqOhw?=
 =?us-ascii?Q?+1hSN3E+R7REFk89gpKANofpSNbDzfIXolPiQDF7hWEhLonHtZk4i+f+SCBo?=
 =?us-ascii?Q?RlueoPg1smRtEDetzTaUgVqXQCnmtBzGt9ccOXgVy/4yIX12y2F5ITRHrusT?=
 =?us-ascii?Q?EFcGWJnLZKw37YsuXVz162maB+40OyyD2n3cMDk2txacLcOa2NAmlKKIrhjq?=
 =?us-ascii?Q?YJcy7qUrrHdRC6r3+LExtd1KkdcH396iuHHlnONnxy0eBhzZqSjeVk5K/WQ1?=
 =?us-ascii?Q?9RhzOEO8yiZZ52ZzMO2/RZP5x+vQnK4iWUBmH5j7HnOyCQCveBoNbTYVkWPv?=
 =?us-ascii?Q?YY19pmL3N8Q+/80NveLMatiGh0filFujAUFDxtGxKqxt0GMcgN/BWkkUL6XA?=
 =?us-ascii?Q?HG2AlmP6CxpdZDMI7l6At6CS2Fm0QOn3tEvWG565pZ268827u0LT0/xQLj8K?=
 =?us-ascii?Q?qkvY2T+bEwy6drbvmvhZt6Xf+lHyGeoGv/hPpe+/efR4cqWVOJw4z1bHmxvZ?=
 =?us-ascii?Q?Nde3rIQETcCyvBGmyKI4TVzRTK0Ycd1pa4E0vKX6dTLMvaAQCO/Pk4+EHQm8?=
 =?us-ascii?Q?TxWlazCPcCWAGPsQzjrvhj4nWO+1Dm0rmKHh5OoSorxfFCrtz9jWNuttVyk8?=
 =?us-ascii?Q?J6HBpr8UiC0bhNb0WY4DLQs2DFnQO/m9+xf/BJGhM0Ktb6o+n5yDnwYJQU8g?=
 =?us-ascii?Q?uS7xr8wGK6/pQ8hEvNP8ZYM1rwNnbyKEaYh7WkjGnx/kqtnvMnglDNMUXL5R?=
 =?us-ascii?Q?nN0kkDKZ3QdU97RMvNtGtBiQPWCHuWOISst366VClazBBdxoh8FnkHFJkioQ?=
 =?us-ascii?Q?oS6BXhxJEDqdibYA2Qam5hhN7dAiwkkEhnzg4SuMzKpfuGoyHv9sv3fht+MP?=
 =?us-ascii?Q?PSg+CC+nTmmEKBiErETdRxJO4KZubv5xFyykaNHw+QHAv85+BD2HgBDyo+BI?=
 =?us-ascii?Q?JXmN5qEzs85J9ngVNXfJ043KniRxBKL3KHTgYj69cP/Bbu/N6IKq0ohpkmLE?=
 =?us-ascii?Q?9b8kcss2hLdG1qTKcY+9ZsS7yz5qCptyYB6MQX+O5iKyBpyUwSjs?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f255f48b-5d44-4711-74b3-08de83032fdd
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:24:44.6212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hr69p0MLQWfPRdVdC6Py6inFTD0+3yS3ZFW5icwXMhaNKaNxgYeSTJK4gwXHAk3E83QetIpcZDWHgLwDJBqf9shA4w50sepQxmSr+suDBhD9312Ao6+t+Rs8fX4cf7NV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10123
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[cutebit.org,bootlin.com,foss.st.com,microchip.com,collabora.com,linux.alibaba.com,linux.intel.com,chromium.org,bp.renesas.com,intel.com,gmail.com,tuxon.dev,mediatek.com,linaro.org,nxp.com,zonque.org,glider.be,perex.cz,nvidia.com,socionext.com,metafoo.de,kernel.org,amd.com,realtek.com,linux.dev,broadcom.com,free.fr,pengutronix.de,samsung.com,suse.com,sony.com,arm.com,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29422-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:dkim,renesas.com:email,renesas.com:mid]
X-Rspamd-Queue-Id: B24062942B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Because old pcm_new()/pcm_free() didn't care about parameter component,
to avoid name collisions, we have added pcm_construct()/pcm_destruct() by
commit c64bfc9066007 ("ASoC: soc-core: add new pcm_construct/pcm_destruct")

Because all driver switch to new pcm_construct()/pcm_destruct(), old
pcm_new()/pcm_free() were remoted by commit e9067bb502787 ("ASoC:
soc-component: remove snd_pcm_ops from component driver")

But naming of pcm_construct()/pcm_destruct() are not goot. re-add
pcm_new()/pcm_free(), and switch to use it, again.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h        |  4 ++++
 sound/soc/generic/audio-graph-card.c |  1 +
 sound/soc/soc-component.c            | 10 +++++++++-
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 65dc540246aa2..e1d536746ddd4 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -90,6 +90,10 @@ struct snd_soc_component_driver {
 			     struct snd_soc_pcm_runtime *rtd);
 	void (*pcm_destruct)(struct snd_soc_component *component,
 			     struct snd_pcm *pcm);
+	int (*pcm_new)(struct snd_soc_component *component,
+		       struct snd_soc_pcm_runtime *rtd);
+	void (*pcm_free)(struct snd_soc_component *component,
+			 struct snd_pcm *pcm);
 
 	/* component wide operations */
 	int (*set_sysclk)(struct snd_soc_component *component,
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 8a5f417047397..74e8f2ab7ffc9 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -77,6 +77,7 @@ static bool soc_component_is_pcm(struct snd_soc_dai_link_component *dlc)
 	struct snd_soc_dai *dai = snd_soc_find_dai_with_mutex(dlc);
 
 	if (dai && (dai->component->driver->pcm_construct ||
+		    dai->component->driver->pcm_new ||
 		    (dai->driver->ops && dai->driver->ops->pcm_new)))
 		return true;
 
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 2eaad5db21300..41b44cd385fca 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1049,6 +1049,11 @@ int snd_soc_pcm_component_new(struct snd_soc_pcm_runtime *rtd)
 			if (ret < 0)
 				return soc_component_ret(component, ret);
 		}
+		if (component->driver->pcm_new) {
+			ret = component->driver->pcm_new(component, rtd);
+			if (ret < 0)
+				return soc_component_ret(component, ret);
+		}
 	}
 
 	return 0;
@@ -1062,9 +1067,12 @@ void snd_soc_pcm_component_free(struct snd_soc_pcm_runtime *rtd)
 	if (!rtd->pcm)
 		return;
 
-	for_each_rtd_components(rtd, i, component)
+	for_each_rtd_components(rtd, i, component) {
 		if (component->driver->pcm_destruct)
 			component->driver->pcm_destruct(component, rtd->pcm);
+		if (component->driver->pcm_free)
+			component->driver->pcm_free(component, rtd->pcm);
+	}
 }
 
 int snd_soc_pcm_component_prepare(struct snd_pcm_substream *substream)
-- 
2.43.0


