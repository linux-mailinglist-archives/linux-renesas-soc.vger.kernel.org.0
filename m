Return-Path: <linux-renesas-soc+bounces-29440-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHrMOf1qt2kuRAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29440-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:29:17 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D1D2940E4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:29:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 873D4301BD41
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 02:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83FF730C372;
	Mon, 16 Mar 2026 02:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="a5E1J+y1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010068.outbound.protection.outlook.com [52.101.228.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9D230AAD0;
	Mon, 16 Mar 2026 02:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773628032; cv=fail; b=Ltz1G28YWgjP+5QUcVhFlFqxMWHJVrycwRUKdjFiZrYvzdfTPSCW505/1R9VSqUVxQG8FpGyIE9YkvOdMGPoKMS75O8ZI2+1PqCSppx5CuPLUhnNq2b1xHmFdodGJoVKWAbHYo59RKuCMx2qG9o3Hs4UoVxwc/qttEEb3JtC0CA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773628032; c=relaxed/simple;
	bh=2E8FHAN2p7tRNBHNi5+u3hD8vJMearFOTywD0uUYcss=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=OVEPj734xkwz/GAh/rzp7ljlpHZvRFfbAGT+LaCPHNWZgsm7IZ08sMacVgstuXXUUMpX/0jsm5ZUnvHurIemthoaPadrLjfzGthYkh/Fcpa6yptPHIVtEt4zF7mEYHUfp622CiXRfSioWmfOSAbXkO0nCr8bc0DqW19PxeAQuPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=a5E1J+y1; arc=fail smtp.client-ip=52.101.228.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ignxc/rsb9fTRlAdRlvOAsjRvBY6Pf7HqkNjLpJkQIlOL6N456F+njwPyj2kx7X9V0siq+gtsWHZgv2fFCCdUL7rwm/xacR6qzjzTSsMVwO5l2nOTG+otNpijYMe23MSw7aFWIuasTUhEez4JhNl3sIO7jCfpImS+25lafoxSUXzNnsluRfQNL+aI9696o57MXKrhb9JlBgf+Z+IjEUxoB63deYVcRxSoMmcjlHoALYMIEQCZPg4R++lR65GHe+C7YqUXz8I+1RSaKSjVyjr1ACDCERIfReP7KJIBJNQkestna78iNmkdJJTGeU5ynAlBvENpwnD6IRCXLEOo/xV4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oaU+bIewngahAzUIS5+CSaobYPI46wRkHsWe9xIBzIw=;
 b=GETeDxBKKMuNiYq33cK+y6YEbK32XWlhHgzOLURi5dEPOFxTdon/AQJgMdm2TSy9OZtbTxdTKGhRbqgIxC1C3yt5SJGsE9khad2tns8f1RyhWFCoMDv0UQuJtmlEffIBwkKZW+22zzbe96lR2iij7HDcAlGz4JJADll4RMHD6yhhvA8j0K+NGxySdFMS8rIn6boOK5dICdknKsUi0WYJULOrJj9agbNNfyEUXgR0mhG8vEKpD62D8ezYMc10TV8/U1UfZj7HImZbfGTnVpTKd87gijUdaVes2AQlxOf75voef9hbyjQ/0LtpDcrgHYFEAn7KzKBj5KM0IuNrX8ocAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oaU+bIewngahAzUIS5+CSaobYPI46wRkHsWe9xIBzIw=;
 b=a5E1J+y1ASpEUUyHMXEbcrC5rVZxSssADF/S+UC3sRWsiCr4nfQCdyZ5iNgChDJ2BL1wcgsUK90xHi+D+ae/4VmfM/HzC3cngHCZI4wX3Xx70ISo4bkJGrU5h99bkbIG5PfGQUnwACqGUXhl+55hOYQQfhCOjCemIAqYLCZ0zvs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS9PR01MB13205.jpnprd01.prod.outlook.com (2603:1096:604:30f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 02:26:50 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 02:27:00 +0000
Message-ID: <87jyvcjypw.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 19/29] ASoC: renesas: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 02:26:59 +0000
X-ClientProxiedBy: TY4PR01CA0036.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::6) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS9PR01MB13205:EE_
X-MS-Office365-Filtering-Correlation-Id: d43fd01f-e16b-44db-3418-08de830380d2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|921020|56012099003|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	9xBAoyRqPzn+j8wf8r0LLCADcPbuOAt3mNiiFRWHMKKF/pRqnNVDL+bp0ISJ6B0ATNNmREazXXENJOBasWAAMMNEJSFtQSq6XQ1J7MBJbSI2tWFBjzVBjiQie4pPQzTmhA842+u+s3C0sBzBcgH53zMmH3m+5e333Ed78Ys9nwwAjovLitr8WcSai8BI12OwhHp9yRlkGJcGf+5XOtI4PatuF8FD/ve2PgcDx6glkuSxv9ucdjFxiGabR+07bRI1R7pYLlbRYJ2hUCc1qKiC4RlCWRGHnFZ5WUSgkdXG3goUrOsZRVlsdOSzEBJYeKSqZFULxtmd+jlqDOv5cnVgyJnoJCGfGSn18JeXMf4+KnHieOklcLnlJ+yckzFDKjaJXPFfUQMZrn7q4+mwBdKl1uufgp9cE20tLA68+iISQcKxSBqrmtJWQCQUI3055T+eJrQDaOpLAU2QUKo2h6+wA1ddqthiVhR/BuIuZj27XP5l/qg6wOu9RijtqIox1w3iPipFWR3MVy3XnVebFgM4Qeje4zrtIR+OJBL90e7SjzWGO9LTNoLmvzVQv/n789LxnefGTHEoucGhYyytxOcAWeIUbPIrJiYkr5SrpSJEz4lfy/8SoHby4FBPsZ1ZdqGDVgScdvQs+O2nro7vXDNpBLJs15Z8oDuEKaSj5ugERjJRHNOIYiq12GYPLqnT/l77zLAiEx8DBlz0DfA4jIBvSOsL9iPErWj5uB9kffHHlCA4V3w6aZ7VzEJDtZo2KJ2hkULp/ahuQpBrVGFjHovIV5qMQtjMHr0uED56NTSyawFaYh7PzPvtwHqSFQf6DllbwE964ZLd3/q0Umgj4ePY/A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(921020)(56012099003)(22082099003)(18002099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C0w+KlPv+EeB3XrYCgWNmwwtuYmOc+sePjeR2HEaO52ag31wzJKeV6RP11/c?=
 =?us-ascii?Q?69i2ZauNoE6ydaGZZKwC6ooZVfr+MoACj9UXsccP2TAA6ZBbZeujO29dRkgh?=
 =?us-ascii?Q?ZJHg0fgFlzJ0z/fK85b1FfXO/gXFtWa2oRGG6n3xxWExl735JgXncZM/4dZK?=
 =?us-ascii?Q?+jmRqMjjgvJNFjfhsyFrwrjjezilfcEIr8nm7Q15j2wuKfSuAkXSyo0Y3is1?=
 =?us-ascii?Q?no4D8dHmjGtJeBTD8E0jpMzQ0omCJ0nzyxslkG5FCq6M7IBmIwf8lXbCnYQt?=
 =?us-ascii?Q?gNbecLvk825YBPs0jF8OJ+TWlqsLiOeQ9YIwAQ4LEG+bafMmXza0Ai5ISXjF?=
 =?us-ascii?Q?GFjWp28zGgqHTta1WZJ2OEq+yS0oxhP3qAiJwwUGPk+3dr5C8S/HaEkJNokm?=
 =?us-ascii?Q?WSBt3vBBfGA+ixKBztFbXvaoXxMw65KbmLxeVB4pbUbnDnfRNua/1FvN0iMk?=
 =?us-ascii?Q?fbaRlOtXL2WiFS5iyIBiHMytNDIhSflL7CtsBnx8hzQDqmF8HFsKMZ33FmGK?=
 =?us-ascii?Q?/fPvywXGCCv3qLQO1/e6xbwHEO8ApDaafkXHTo1BnX45MpPX2CVZU8sJTvmw?=
 =?us-ascii?Q?pP7cDwGjsbHzHJnNLHTYolugI3G5BX898nGFjIi17qB2Wb2wq7hWlQjISVOB?=
 =?us-ascii?Q?fEqlwU65y0llVQKyIaj357lUhM0zzirzgCsO46Je+o15YaRlXIQjtMsK1rUP?=
 =?us-ascii?Q?347sDW/Z1gXf+vBG5XfwSWMmiAxG6/F0xYzPkUR0wbh2192Hdd1OnKd664Wg?=
 =?us-ascii?Q?/H5CI6mQCSwPOF8aqh4b1xkpM36CAR3VLCi5JHM+G20/kKgCDi9SeAT3VqK4?=
 =?us-ascii?Q?j7XFVAyGayPiUTM0s2CF8mW+VeTux90l47h0voWWm8WyBnS2Ln4ZyRcfWBDx?=
 =?us-ascii?Q?T1iqe5lQichOCmCn1/jHaq6YQPpNO6x8Ro9shmHjg3AFnyElMH5Da8qqGdAA?=
 =?us-ascii?Q?ZuaYSNZ515fEr6pKtR/P2msHcxzju5C8VasBZ92RGhl83ieHZ1ZmTyBYIrg8?=
 =?us-ascii?Q?Ivew8Guttg/7xpoAIXD3Hpl/q1gTtT0lEVp8wh8htICjLFDSvXWEyeQa0GMn?=
 =?us-ascii?Q?repeomuuUR2zpHilFyX9UMh51+GD18vXolwzrm17hP6JpJqu2oWUv7El2Ob4?=
 =?us-ascii?Q?dpbey9S6Gr+ENUE8c8lK9YzyNnJ+y3y3JpD8Ita/tYwJwHbqhl8bCgjcibEH?=
 =?us-ascii?Q?EUXlCwSG5fzFFs/4bkQYz3mqG+XFZEeD6rPkZdH6kdT5jel4wIN6CjSCLOvT?=
 =?us-ascii?Q?c0DhVDbui0KYw1crNnwuzjX4KB7hKQkPwCMMBn7cZ8HZD7ImqCVSFIwLOkXh?=
 =?us-ascii?Q?iA9c+vyXUJWqxbZIze0yH3pjM9WkZBYolURsTlZ2p387MKIanG6KN2UICAOu?=
 =?us-ascii?Q?l8ErcBAJzOgvLzwad/Sy9BJ6T27vN49YuyUY+zB3dZ4XPhgI6CVCCw7P8kzc?=
 =?us-ascii?Q?87M6bF9ITjjebabRI/58EfvkKbETQm4Zh2mSRPIJM6Aijs5LciQm8pSuh2Hs?=
 =?us-ascii?Q?tVna1xgBJmuZaxPreSBGQUOPfqrjqvG4aYnElHZ0od4uC+8DZxkg6yz1JL95?=
 =?us-ascii?Q?OfEo9LOxbf4Eo0JFmb3z0/j05sEpXlioHYxzgaPHp9H5aDeNSs15AkXdFu+N?=
 =?us-ascii?Q?80lcQ3suQoT7ZNPNhS9jyLL+CZquvmfr5c6g7A5MpTqbJp0cu2LJ2OOcCBsP?=
 =?us-ascii?Q?SYprYG57k4TV2BXES2B8ydxVVxO7GuPe119Dx5qvH6EYlt1P1ZRAAjzRa2YH?=
 =?us-ascii?Q?TipxNbaSJXWgXmr+ZQsTWlzJNzMnKYu1jMFYZgNlzJ2Leubn95z/?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d43fd01f-e16b-44db-3418-08de830380d2
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:27:00.3890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HEaXesuWRWVAsak8V9nKfHIb+ufemTEYfDmZTUAqLZKIfoSDChQ8L3h3L1pW03aGIGER+QIGK0DISu1rh/NWUIi+0NKzlhGW5PJk63fmxn1NnEvP2er6uWDu7GDUq9y1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13205
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
	TAGGED_FROM(0.00)[bounces-29440-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 97D1D2940E4
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
 sound/soc/renesas/dma-sh7760.c | 2 +-
 sound/soc/renesas/fsi.c        | 2 +-
 sound/soc/renesas/rcar/msiof.c | 2 +-
 sound/soc/renesas/rz-ssi.c     | 2 +-
 sound/soc/renesas/siu_pcm.c    | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/renesas/dma-sh7760.c b/sound/soc/renesas/dma-sh7760.c
index c53539482c208..ca128ea903dae 100644
--- a/sound/soc/renesas/dma-sh7760.c
+++ b/sound/soc/renesas/dma-sh7760.c
@@ -310,7 +310,7 @@ static const struct snd_soc_component_driver sh7760_soc_component = {
 	.prepare	= camelot_prepare,
 	.trigger	= camelot_trigger,
 	.pointer	= camelot_pos,
-	.pcm_construct	= camelot_pcm_new,
+	.pcm_new	= camelot_pcm_new,
 };
 
 static int sh7760_soc_platform_probe(struct platform_device *pdev)
diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 1491c2f2cc961..8cbd7acc26f49 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1817,7 +1817,7 @@ static const struct snd_soc_component_driver fsi_soc_component = {
 	.name		= "fsi",
 	.open		= fsi_pcm_open,
 	.pointer	= fsi_pointer,
-	.pcm_construct	= fsi_pcm_new,
+	.pcm_new	= fsi_pcm_new,
 };
 
 /*
diff --git a/sound/soc/renesas/rcar/msiof.c b/sound/soc/renesas/rcar/msiof.c
index f2addfbac9237..2671abc028cce 100644
--- a/sound/soc/renesas/rcar/msiof.c
+++ b/sound/soc/renesas/rcar/msiof.c
@@ -514,7 +514,7 @@ static const struct snd_soc_component_driver msiof_component_driver = {
 	.open		= msiof_open,
 	.close		= msiof_close,
 	.pointer	= msiof_pointer,
-	.pcm_construct	= msiof_new,
+	.pcm_new	= msiof_new,
 	.trigger	= msiof_trigger,
 	.hw_params	= msiof_hw_params,
 };
diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 74e078c041502..71e434cfe07b9 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1117,7 +1117,7 @@ static const struct snd_soc_component_driver rz_ssi_soc_component = {
 	.name			= "rz-ssi",
 	.open			= rz_ssi_pcm_open,
 	.pointer		= rz_ssi_pcm_pointer,
-	.pcm_construct		= rz_ssi_pcm_new,
+	.pcm_new		= rz_ssi_pcm_new,
 	.legacy_dai_naming	= 1,
 };
 
diff --git a/sound/soc/renesas/siu_pcm.c b/sound/soc/renesas/siu_pcm.c
index f15ff36e79345..ae5c0c40299d6 100644
--- a/sound/soc/renesas/siu_pcm.c
+++ b/sound/soc/renesas/siu_pcm.c
@@ -546,8 +546,8 @@ const struct snd_soc_component_driver siu_component = {
 	.prepare		= siu_pcm_prepare,
 	.trigger		= siu_pcm_trigger,
 	.pointer		= siu_pcm_pointer_dma,
-	.pcm_construct		= siu_pcm_new,
-	.pcm_destruct		= siu_pcm_free,
+	.pcm_new		= siu_pcm_new,
+	.pcm_free		= siu_pcm_free,
 	.legacy_dai_naming	= 1,
 };
 EXPORT_SYMBOL_GPL(siu_component);
-- 
2.43.0


