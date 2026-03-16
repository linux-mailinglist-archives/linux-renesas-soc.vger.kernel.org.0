Return-Path: <linux-renesas-soc+bounces-29439-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMTIIyFst2kYRAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29439-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:34:09 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4751029421B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:34:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 613FB3027D91
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 02:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AE3C30C37B;
	Mon, 16 Mar 2026 02:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DoX9CItV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011001.outbound.protection.outlook.com [40.107.74.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0C330AD0A;
	Mon, 16 Mar 2026 02:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773628026; cv=fail; b=m0dB3pae+HTp0ZN7wtXp6Hxv0fNbqDjfAnV7KzKQYaD/woptEONyuJR0deE3wqQo7aSrY5xf1of1pH8Y8W3qbBg3DbF3tNDEPZt22eysx6cfRFvei8W6Dwu4v4Co1GYaDCDErtaFQMA9aQcKE36WPlayZ0dutqdhoN5TjOfw0Fw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773628026; c=relaxed/simple;
	bh=Odht/XXe60QGhtwWkxsLC3iVOm0JBIOBXyKW5SkP1C8=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YzozkE27/wqL+XcX2bXJNj1qw0eXDp32jFZvLGVcdCwZjBmdoBT5c5jQnbmnjUnxX2fV2f1rRENqCDkD/w4y9/wOGMAGYhFkhW/Qmr4dOiOtCVMzLQnYdvLw0bXovrg90lkeqDUHQd2OW+laAjTYBO7pujrUND5hMsXo+ZObu5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DoX9CItV; arc=fail smtp.client-ip=40.107.74.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lBd738y+MOz4rwc4bRLIL1G5KLrewlHybwgzoXbNgqszZaHJUxVOGocYyLNNb+Tq/mxiqo37np6RnjzGZMxbCxhUR4VU0+QIR3y6+Exk2jl+vRHzNauWae1j5l8EvucKJFY+NKHKLS7zdoH+clf688gocE2R/FrNlkXMEp8qXO0mB8EQYjdxr53RT2D7fw/uMGllI/fqiMYxDWgBrqRc+9hbdZ75D2F0ktL/XbaJaVp+T6DGiJS9x/rPC/Xuzf49SN5fvDhQ0I2vUox/0uOyCXZeiJRBICmRx/YQcDSVOvTRsKL38t0Tl+DZs7CPLAjC+AFq7Pi89xqQ/HiB/mMuQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/aHVDaD/JWk7Fy3MLGdvPWwtaCfYnuPyf1tET5R3SI=;
 b=gVpUzVCOssggHSrDtghOIRsdcn7oFTiSJbwxSgN2Xk9Dvkm7S0o4iMuH6LSvgkw1BUKdTEwSHLTTP5UgZFXrhLtHaZZEXu9DJ8RdeMJM6AKscSryz6t0SkcckzVETihLJHklH4j2xnJf5EwP3wpVOxrGoP/TCKESaKWJGdHm/0RveFg4rf/piwN9dkcz3oZsOtIE4VlQCHBeTM4nO/5rwFTMpuHWqWzI5ht8xDvAD/bI7xkwL7ujZ01wqH+q8D09CxTLox8evSUOgNgTs0m2SXF3nCcihby+vsg8B2AeJxORhD/aPV+Dg8G15pY79FwokEBMgr8gbk7TK2hFO8J0bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/aHVDaD/JWk7Fy3MLGdvPWwtaCfYnuPyf1tET5R3SI=;
 b=DoX9CItVcjdOlEqmhQUspmYHmegecN4TRdTwz0HpfrqZoCR9BlhT/xB3mAEmXWLuHr6NdSgH5zKYjE9U9A5k+//WRv85XhJNa8yuWRXpTSWtnjwB7bbDOgvhB7pc+/TvmfU1tSwF3xb+l6L1ELOS8qsXCQ2cJontjyj531Cx+4s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS9PR01MB13205.jpnprd01.prod.outlook.com (2603:1096:604:30f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 02:26:44 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 02:26:54 +0000
Message-ID: <87ldfsjyq1.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 18/29] ASoC: qcom: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 02:26:54 +0000
X-ClientProxiedBy: TYCP301CA0020.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::13) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS9PR01MB13205:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a58ffc6-c878-4b03-aa66-08de83037d60
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|921020|56012099003|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	iJpoZQ2B40utV+eKr3LEaXY9SpRKykKbvMUBLL2la/nJjEAqKXqTenZTRvybvtCyQ6PRmzf325hF7xIVY4WGooltMgpRwnkDWrBdNfer7p0gonTHojMZvaVB0U/XKtGr9ABMl8klx/iYA/l7C6vHMtHo6LkrDk6OSDxLlqLRjVcPWmYQG1817siV2CkgHDTk7L6B9jwhf4ClP81X6pDecm/gpePc2Gs9knMeyoLmDwNob27u+9k0dLBeQPKs1DJy9U2X7t5lWECCxpgNcT5KB9SyD2DXsgn2visrIGqDUX6dDpelpoY3Rd+yE4UlBUFRoov87GpNKEPyl8gPmazxK1RV2n2mL3Kw37d/K/TutN+z6jaduOmJ/3nKWrBHsFTzJbEvZ2UNfoP2l5V0+dMf2rkbveUWjW2/glA03hYLsRkF64rf8fcq6XEjBcfyQJrUI7aYAgroiYk+j0WFJ5edhDSprnXPKgYDXrfJA/a3qGhBxgkpv3Xsdl1FlvTVculvovbq+WvBxa7BGC6ySub4J/8GjrVXSDevDNSUPWO7fbH0wdY5hKJoF5H8NAfN+O105eJ2OQdyDZhueQBLqhA4wbohUlv2aNyyTlbLJaD5S/hNcr+EZFYOnkv6r/QX0LmG7iXDTb0MqONrj7CgKPQo7rCwasJxfnncbZetvXTuAY1XmEZrXSNoGKvuDeKYKOdYR+YkGshtScRjcKmzmqPcYdMmSyYmWRvdqsQtUioHygRjKCUDM/XrnTBjs6oyv1XH4IwYx0a7zKoISANv1WDBGYP5UsY+3mhQUXJxXyiI0+33aZmOxDlQeysQ+9oepsAHueeeY+f7eaWNmZw53X8zZA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(921020)(56012099003)(22082099003)(18002099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x4dSyG6AB+qGUOGxtTC2Wy7rQZnspAHZSM+Y8dfHlZOvPZ9EgWVWk/ipt22G?=
 =?us-ascii?Q?3AQkI7abwBcnmEvwoXD99ggTO/xbYoZ1NJIm4mhSn8b5jGtUoziyO/4mTk87?=
 =?us-ascii?Q?sdJOiNWxS5m4c329l9kXJ/QEHEXWaTjSXYjVIkf6cyGNODQgsJlVzSrhFdlA?=
 =?us-ascii?Q?Stl0lwCo3LJqcU1T2ZlfMYkKO98NtVVDYD4PRhX9tMN3zPOaGOOsJINGbxVp?=
 =?us-ascii?Q?5U0geHEU+Cr0wY2B/RYUeOj3c6cHLN9b98IUpvuoi7aLCKqcdsyn9ERqDKlG?=
 =?us-ascii?Q?w6tPBpVNoulhFYAri21+s0SUszniIC032xCCQsNcWC+so1wpD0icTmrYTQO2?=
 =?us-ascii?Q?DYPD6Qb/t2gxJU6MujjEeWNeG0YIkCxkskUIbAQKVefTCK6Z9xyKtI2MZ2DK?=
 =?us-ascii?Q?oAZ9A79AKfOG22qdVvkkE/6tBQ94pFGeI8hfh49RvEeieUBWzEJqWnQ60nWZ?=
 =?us-ascii?Q?prpO89vDtfrxLsT1gwa+Aml4VmalkA/gd/jeTbNOqpW2b3eG1rfBPeHjDLo3?=
 =?us-ascii?Q?C+gkVlKXHU0Xsrm5veyme66Ef16cv04Bl3WPnu0/acP9KmOFPisowh+4fXzP?=
 =?us-ascii?Q?PPpcMR+QVKVNY/IMc/5wN21xdNwaVePBQuOsUtLsvQCb4ML/Z5qQEEq81BVG?=
 =?us-ascii?Q?TXUYiLaK/aAgyHpEkYFQwUhblEZl5dPkl1CfpPpiNR+vnLxVLSK3ekbiFi4O?=
 =?us-ascii?Q?5dCtXUDEyM7OUqsqgeFJbZ46iLd/17Pikmc5bsVJUcfFTVGzmcD/OQk7XW8I?=
 =?us-ascii?Q?xKDItjHBbFuKkXSHzjVymoPoT9y++hzaCtGslUGvPtesKamS+7fv78XA6zNs?=
 =?us-ascii?Q?u1V1eJrT5C8osnn5Mhz1YytOaTuUuqcYgIZVKilLq4PSdH7D3UQUDhA6qsoR?=
 =?us-ascii?Q?yOwRnPgx9zD6wgK3sX89z1FYkr98rFrhX17R88/GmUHASRhV/RDXvhHjBRWR?=
 =?us-ascii?Q?373EESzVYKIPFAmjmTPCDryDO53sSrlEBxVT12PNWPWuutw6GoYMIQ65Z4tF?=
 =?us-ascii?Q?GcTKVH8Y74Y2HFa++QnGvlNaw73+2GZ6Uv98+BvmYw8H1g54Ho01HMgt2GrJ?=
 =?us-ascii?Q?Se/ZX06nAgyv4b3Zn6MZhDKedlFfCffax2LV2MY9KrfBZH+d5b8sVUiGeY/m?=
 =?us-ascii?Q?bAp8/rrSpvoQ/jzTfhpernifRLfN/5U42UgGm6q9/mQtG6wo/u+KBhUZMhJY?=
 =?us-ascii?Q?j11htgUFoJSBgby9lsC+ImdGAqlk+uJQ0xq61ktfGuEHYFDbNorEvJu79sZI?=
 =?us-ascii?Q?bI3UzwoSiN3T1rM87BqY9vCbNurmccIyAyAJN6Ecp+JZoZDGN6VGRp7xRSiv?=
 =?us-ascii?Q?nfMPJftGh0agjV/DUvMhqayo2lF6cSDcc78JGjFRci/u3TaX3Q9w9zXJLzvX?=
 =?us-ascii?Q?AYrqUH+/4VkNS7to5nMYlAfd8K0GnD/kxcr8RhvjmdOBdGbLaV1ViEMsyuGM?=
 =?us-ascii?Q?BntSXCLpmW8MUUbIgXe8qTiOEVQQ6HUxbIfvJ6mzd9iDNVmANfJ6jluTX2w+?=
 =?us-ascii?Q?k1QJgTSIR5TSEd15bJt+kAD3dyOOG9KS/S3NTZj3kU6ufAXuzTP0uVj/ri7S?=
 =?us-ascii?Q?rROVc/xQ+7HkPMZ5JtwwHvga7ArtKIu43qugIrjluF5I+8lZUIr/mA3Yc96W?=
 =?us-ascii?Q?cCaTkwdSRs+kb+bLfD1ZxrTBWUKB4akViAl9p0xBLn4YZBguPdS+8WPR96T1?=
 =?us-ascii?Q?lkb9m+zAS0PJf/aramhjU+effF5UsJWrufaiYQLk9ijZxljnVf8VPOyQqtpe?=
 =?us-ascii?Q?9oKji8YKsVb7DcIdKLJYwcuz3YPF8duNAR3tt9Csgw0R1RZo1R+0?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a58ffc6-c878-4b03-aa66-08de83037d60
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:26:54.6467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sQOFjtgbSnYt9BbQj7Okp4379+65eZMtoKBvQ8Yi89vhED9cIUjf9NNy3PNCxDP64PAyBkNFxSY56QfLAB8HvVxLvPMnipgJt+Tr93d1i/xKxohnVa6o+dkWSNdT2FHH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13205
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[cutebit.org,bootlin.com,foss.st.com,microchip.com,collabora.com,linux.alibaba.com,linux.intel.com,chromium.org,bp.renesas.com,intel.com,gmail.com,tuxon.dev,mediatek.com,linaro.org,nxp.com,zonque.org,glider.be,perex.cz,nvidia.com,socionext.com,metafoo.de,kernel.org,amd.com,realtek.com,linux.dev,broadcom.com,free.fr,pengutronix.de,samsung.com,suse.com,sony.com,arm.com,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29439-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:dkim,renesas.com:email,renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4751029421B
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
 sound/soc/qcom/lpass-platform.c  | 2 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c | 2 +-
 sound/soc/qcom/qdsp6/q6asm-dai.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index ce6896cc015dd..e162627d6f86e 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -1268,7 +1268,7 @@ static const struct snd_soc_component_driver lpass_component_driver = {
 	.trigger	= lpass_platform_pcmops_trigger,
 	.pointer	= lpass_platform_pcmops_pointer,
 	.mmap		= lpass_platform_pcmops_mmap,
-	.pcm_construct	= lpass_platform_pcm_new,
+	.pcm_new	= lpass_platform_pcm_new,
 	.suspend		= lpass_platform_pcmops_suspend,
 	.resume			= lpass_platform_pcmops_resume,
 	.copy		= lpass_platform_copy,
diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index de3bdac3e791c..7a6a1d673e875 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -831,7 +831,7 @@ static const struct snd_soc_component_driver q6apm_fe_dai_component = {
 	.open		= q6apm_dai_open,
 	.close		= q6apm_dai_close,
 	.prepare	= q6apm_dai_prepare,
-	.pcm_construct	= q6apm_dai_pcm_new,
+	.pcm_new	= q6apm_dai_pcm_new,
 	.hw_params	= q6apm_dai_hw_params,
 	.pointer	= q6apm_dai_pointer,
 	.trigger	= q6apm_dai_trigger,
diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 9e3d176f50c24..4f8f7db6c3d39 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -1224,7 +1224,7 @@ static const struct snd_soc_component_driver q6asm_fe_dai_component = {
 	.trigger		= q6asm_dai_trigger,
 	.ack			= q6asm_dai_ack,
 	.pointer		= q6asm_dai_pointer,
-	.pcm_construct		= q6asm_dai_pcm_new,
+	.pcm_new		= q6asm_dai_pcm_new,
 	.compress_ops		= &q6asm_dai_compress_ops,
 	.dapm_widgets		= q6asm_dapm_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(q6asm_dapm_widgets),
-- 
2.43.0


