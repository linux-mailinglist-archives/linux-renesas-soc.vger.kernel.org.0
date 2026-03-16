Return-Path: <linux-renesas-soc+bounces-29432-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IH3FC05qt2nXQwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29432-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:26:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89203293FAD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:26:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF8A4300D94F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 02:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83FA530AD0A;
	Mon, 16 Mar 2026 02:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Lrr9+dat"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010040.outbound.protection.outlook.com [52.101.229.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C1513D51E;
	Mon, 16 Mar 2026 02:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773627979; cv=fail; b=s2AdICUNYphCliBpTARnEwp08Ru4ZW0X8sXS3fdzOHrTTgAgUdvMzBfDh5aEp4JLevsOJBdwZhnr+J5pnfNZav2+SHYOCyrPEnRMisYOUS1c1Nf2drt1E8k5K1+KLqyAV/rbOKh0DS5xr80wwX+8o6iCkfFd0rXiJ4p0B4G4qxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773627979; c=relaxed/simple;
	bh=Gs9fVHvSidmsi2nZWfSaFUpic2WXvzQAdYJCpM6VTHo=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YIRxUr/9aLrDs2zJzwb1IQr7RINphcMfo/vrZjcgW15uKFit6Vz8KFOOgIGZessKFCcpSd/0GNEpSj6PVLLJBON1bx1CNr9c35RJeob1vGYx/0JKl1FC1in7BH5KYk7DsSt+kIQaRRYnNzKreCNsd6DXKDHgXzyBki2z2eW1ZSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Lrr9+dat; arc=fail smtp.client-ip=52.101.229.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+lwJaYGT9iGx6pbun2AvkiOftEbS5SKBMN4jU8gBw6cCLV3nQ8oTsKhgbubnzC27G9lzZPnKkrzSFMTTOeSvcaXXFWGYpQSWZT6eUD6nU0Q5L3gaHoQ7NR+rVqpwBwIqu8HHkZABoE3H+FMgw9g+6wP0d8Kcp6HQzzGsXPHeAaJbgR89NRVkEYHXur0rGJgJzyTQbItE0OCA6+TUCjvc9xr6+QiVEBq8Of3Pg1bKCr5STdKKPYL3XZPU1gmizGQ3D+dT1f8Ns8Y1t1gzc5wpEXynx6tpeXs8APWG66CSJkfUd3yew/XvGpDvPRsV4H4mu8eC3s6fn51W14o7qH/+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1segrHEqqSGJWuMh2likouTuq4non1CVAxS7WtXtJ5E=;
 b=r/XxI5keGhfnItH0kEfGw/ogHJOm4o2L+Bqu5u4pKk2CFFwS4z4nQmQwiaUl4LTwHmfe3wj/ezsm6RMHprsBswAYIcXm9/07NQT1wzKM6TFVv6RUoj9gMAeD0LowupnaReOFUEU4JUj5/EcQ45PpWJ2epL0pDIYpOqECIAyfefHwxSGO6EngvuZGoEA+6rpttyrR+gSsTIBE+DGkLHG2KeQyMKhFlJUnT5ESiho4CCYj/dwX0cP0ONiMMopc74F+Cb//iRnFjNHo/P7+vZmMqpKsOpyHDaSF9Y5cKkmcRp/UP/PA5eJyAoSPj29jl0W76rGeIHPceZsEVR9wXJD/Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1segrHEqqSGJWuMh2likouTuq4non1CVAxS7WtXtJ5E=;
 b=Lrr9+datsGhDehtr/PpvANgCVZoKAq/Ja3+OpTfp38mH6UygSZs9K0zOQSPyQv04BJ5x3e76qbraV4KR0JM3JY50tOaV5ISGjaVt1clpkgGYifzs07IFcXr2gR+Lt982FIMk6oT1Mbo9ob3oEXeCBem+ghj2z268nX4jbj1/mEQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS3PR01MB10123.jpnprd01.prod.outlook.com (2603:1096:604:1e2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 02:26:10 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 02:26:06 +0000
Message-ID: <87v7ewjyrf.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 11/29] ASoC: generic: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 02:26:04 +0000
X-ClientProxiedBy: OSTPR01CA0062.jpnprd01.prod.outlook.com
 (2603:1096:604:21a::20) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS3PR01MB10123:EE_
X-MS-Office365-Filtering-Correlation-Id: 62e86776-fe8c-4db5-0bfe-08de8303606d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|921020|38350700014|18002099003|22082099003|56012099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	4PK8jZszn2Ctq9pUH62JAD1OHK+9c3ZMXb9DkxUDJRt3p5eCu8HMZ9n/66XH0RfMlLfvlLIocSTSirFK1iQnMLEhTTztjk1ZTBfl4aOgAgJHRMtpz7NfuCfN9iT142uXsTxYgV5P/KYO11ITsSkafgMjzbrj1dVqdbv5yMoNDSyDxNqieVJjvh/NwfW4t+O4oHdRPih7sVXdhYt37qTRSqsvHzDIE7O/6p8Ja0k8D9hzO6goqvfuKW0AaWtIDdoXWLvtpQ+nDm3sKHUeAgN0UY4dNfaEJofau+bJkbx3FHtg7bXf86bMNP7vYhOQ4p1lPSWlgA2s/lWZaY0fclsbG29QOo7SGbdiGGE+EbAbfoXwU/Zx+va1O+CLtGK0S5naqtr2F4fQLaFHfT9jHek4hC+2qN5fulSjMf+coPgDI0V00u3rHBXxMMSxAZdZ/KjloQSwAnZS/XjdASw5d64fwWwPJNHBOs8BXEk2beW3YmH27JgS1CtdzN+HeEG1p77YyKg6s4iJQvzoe2pY7uJoKBYL9Naqwn2mUE0jdT+DDVOJjhYNTJT50QRqViOfLU93UnpdiB0pbt9mj+JrH5kcFuP82F1ELsa3LLSy+TpDbGi2Jsb+P05IzPJh58aUKjSkfQsbH00tsglE6nZa1EtLH8qXFdDBxkNebrCDOpPdCSKDl8QgeL+76ek5E/p1l1f/yU+J7ejq5K9zZHwPRjlotqg31oBiECsh81rHwnY9fVCsmlufcIOtzOpXRnbkAHYRqC+nKGRqqFle1/CANGGAqKr5+dzbd8eK7wPwJkFgzX/ccOrkTI7EIi+TNOaWaOWnjbulQKKmghA3cSTpI6Hqhw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(921020)(38350700014)(18002099003)(22082099003)(56012099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gbIXkhMXZwLgqEaxwj5RhF7/BO2e7Njocnz+rUB9CzdiZ4uxNIFoCmcQHDQT?=
 =?us-ascii?Q?i+wckccG1zTepKzGLgUhuJSuRL2g5EIvnycddR0bplNwn4VwNy71/lzREMtP?=
 =?us-ascii?Q?Ws2zntCFUt4f+KmlCi8OJkWRSoKpgJAnVZRFbBs6G3Z0mM7Sjj2x+qH+E3Xd?=
 =?us-ascii?Q?ABSq+21n2fFxf/4PqoApsnavXes3soSZsT7XlSfqwm5ZGeEYWGs5HDI9/pZ2?=
 =?us-ascii?Q?J73ZeyX7aeJMLuGGDGzxssbgTBySdY/i/GJvBauXA28vAJrCHjSF9l4dNs/8?=
 =?us-ascii?Q?MN1fhTrgXC99WrbnIP219aPRpDmdn/SJbQSkKQbF35Asr52S09lsC0cFX9sq?=
 =?us-ascii?Q?1nIq0hibgGviRMHcDzAVDnm+5EB40BZc1Tw1Wk7zndeCPgDblnQ71Hmg+Ad4?=
 =?us-ascii?Q?j7Nqnpg2TJgcX5QaM2tcBbv4NBE+lNK1Tqj1RePjke1fyStURNNdxV2lvU16?=
 =?us-ascii?Q?tf2n5auhKWsaY1m90dK+o4qcBF1ocu+EPpVAGtRU67n7Sgcp/xwqcbsZNdXs?=
 =?us-ascii?Q?/hUmSP0XO8NwEJzUDs9bHY43gzbpk+zJxdDLaJuwFU2r1DuKoxAP3XsSYECg?=
 =?us-ascii?Q?VTgaLoScNTZUmVc/IzTK0q/R2JNeSIab7LoTOyoKcyA4ZhmB88lpVCmeDulS?=
 =?us-ascii?Q?ZfJesZcHLrYnFXXgo9N+7/WWwxYefK2yZ9UuIGlyPQZOMbbK8MH6ryo9Fs9G?=
 =?us-ascii?Q?FPY7IU1VfEgiCBcXUoZ+w+cqjzQRcvQMrMrzMvfpDJ7bH56nPtCKAj7PCxm5?=
 =?us-ascii?Q?3hiQl4TqcJHbxQmhG/GM/cNsZeXbrPL8gO9jNBOwe7tz+3jK0nGsZQnv7JHW?=
 =?us-ascii?Q?OY+o9Zag+4GUGYz5N79pvXpCe8L9xs0kEOxgtz9dsS2Kqu1ERSy8AtGEyoTp?=
 =?us-ascii?Q?HtOcdO6bbCdiJJtg6WrkS+LiyoabFhjHquXWhjEF0LarQN5Wqm04bYLOwXtS?=
 =?us-ascii?Q?kjAL50K8cjeMKle/TAQW2DWurZsD6SZX3DG1S0tqzGfznAiVnM42aYnOyxiC?=
 =?us-ascii?Q?wUG0HMALLm5YuH5QO6n/kvqCNFNrofXBxoVNNiq7y5sCCp8J4A/gmlEAudKk?=
 =?us-ascii?Q?zsVCEffT9c6j2eEF9+Z3IBlTJcZTDogb0K2TNjcxEnI3kuRVIntn9Tkf+6ER?=
 =?us-ascii?Q?OlDSKCsG+citdbfM2WGJQrp6IHBeo6R7HQml3jvRu0rfG/h6bejz35j8ehcF?=
 =?us-ascii?Q?fwjVIytRLZSfDwwNWJlPEaukP4s66AzYErrwSeP/1svwHbHkI1rW5c97n43G?=
 =?us-ascii?Q?oj6IQNYInqGVR+v4RrZFo0f6MZagRX7WlqvA1zSJHZ2XUNDdrFi36HBhzbhe?=
 =?us-ascii?Q?kCFsVLgDk/5TR96VRFHxs5v1wWA0AzTUS/ma8M2u+ytTL55bfWmzAnmslRIq?=
 =?us-ascii?Q?HRuwx1KQWMz5eejxlSn/oR0afHknYRDb1LHtJGmtfkK3LlYOp3jg6Y2aKpy1?=
 =?us-ascii?Q?Daq/mLucxt9Rh8TIiRPZ5SbwETM1MU5r4fGx1pPhYmhHm7yQdxlD0Uw3xy70?=
 =?us-ascii?Q?j+L+wHMezbrkYvP6ZBijTx1vyn1Jp1KwwiCJjMJGJHp+2aNufcZlJqh3iJWB?=
 =?us-ascii?Q?LFp/MyT4LK2NJxxvPtdDRdkECzkQgAI9LGT1cWhgLzOusIS8a32oQK10PLA2?=
 =?us-ascii?Q?3spdXTruqyanMbxVmphUX4xy46JtrUbZA/5rWOyOLkhCvBZ1xWajhCcz9h2f?=
 =?us-ascii?Q?foqAkB5bMEcDwDyDX1Ise9FbH9P7UfIxQR63ssnF/eiafTykbnP9q2OUTUg2?=
 =?us-ascii?Q?CnxMfTubW3+racOC+t/PV1YZEZoqxDVQt6L7i/d8fECdAnV+RFFD?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e86776-fe8c-4db5-0bfe-08de8303606d
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:26:06.0736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AK0OOh99bej2bl1DuA9QmLFJZEHPdLryP/DnCLeAdc3Vm6WhSwS5z5JJnsGsdLMMPfcuJGQVKk/4Dltw2F54Ohc5dF3PKS70cIZVweXYV+KBjDrbBXXgyC8N7Fs3tIyI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10123
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[cutebit.org,bootlin.com,foss.st.com,microchip.com,collabora.com,linux.alibaba.com,linux.intel.com,chromium.org,bp.renesas.com,intel.com,gmail.com,tuxon.dev,mediatek.com,linaro.org,nxp.com,zonque.org,glider.be,perex.cz,nvidia.com,socionext.com,metafoo.de,kernel.org,amd.com,realtek.com,linux.dev,broadcom.com,free.fr,pengutronix.de,samsung.com,suse.com,sony.com,arm.com,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29432-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:dkim,renesas.com:email,renesas.com:mid]
X-Rspamd-Queue-Id: 89203293FAD
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
 sound/soc/generic/test-component.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
index 2e49066dedd41..fc40d024152e6 100644
--- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -273,8 +273,8 @@ static int test_component_resume(struct snd_soc_component *component)
 }
 
 #define PREALLOC_BUFFER		(32 * 1024)
-static int test_component_pcm_construct(struct snd_soc_component *component,
-					struct snd_soc_pcm_runtime *rtd)
+static int test_component_pcm_new(struct snd_soc_component *component,
+				  struct snd_soc_pcm_runtime *rtd)
 {
 	mile_stone(component);
 
@@ -287,8 +287,8 @@ static int test_component_pcm_construct(struct snd_soc_component *component,
 	return 0;
 }
 
-static void test_component_pcm_destruct(struct snd_soc_component *component,
-					struct snd_pcm *pcm)
+static void test_component_pcm_free(struct snd_soc_component *component,
+				    struct snd_pcm *pcm)
 {
 	mile_stone(component);
 }
@@ -562,7 +562,7 @@ static int test_driver_probe(struct platform_device *pdev)
 
 	if (adata->is_cpu) {
 		cdriv->name			= "test_cpu";
-		cdriv->pcm_construct		= test_component_pcm_construct;
+		cdriv->pcm_new			= test_component_pcm_new;
 		cdriv->pointer			= test_component_pointer;
 		cdriv->trigger			= test_component_trigger;
 		cdriv->legacy_dai_naming	= 1;
@@ -597,7 +597,7 @@ static int test_driver_probe(struct platform_device *pdev)
 		cdriv->be_hw_params_fixup	= test_component_be_hw_params_fixup;
 
 		if (adata->is_cpu)
-			cdriv->pcm_destruct	= test_component_pcm_destruct;
+			cdriv->pcm_free	= test_component_pcm_free;
 	}
 
 	i = 0;
-- 
2.43.0


