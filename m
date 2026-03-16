Return-Path: <linux-renesas-soc+bounces-29429-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MM/TBO9qt2kYRAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29429-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:29:03 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBF12940B6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:29:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9D154308E5D0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 02:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA9B630BF66;
	Mon, 16 Mar 2026 02:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="U1+iBKUu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011008.outbound.protection.outlook.com [40.107.74.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABA413D51E;
	Mon, 16 Mar 2026 02:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773627955; cv=fail; b=JFL3a+0OcKLn5+Ck1UUCQRXkXLFm11veEQy8fOs1VTP8PwkSJ1P0UP2iksAOwvpmDkE1wEDlIA4k39iqoNYlmudLWBfZUWU+BzXPNEITyEpIrM+IEfK6xEutJXyRbJzD7OaRc3UySHbdLBZND40+RSvLDsAaknuNgBKsEHR8AQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773627955; c=relaxed/simple;
	bh=6W+J/wEUWJ8dqB4LFDkRGEzA8QRHYPKR8pdYHIZytfQ=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mID4gb23jPRwPiaU3npeow9KtWLXWjzmqowY95oYzaiY3Gi32RppNE3D/BumEzWxvQnkKJPQU+dWz4laPmuySmFd52ITLfirGPAA4RDfQJHN9YlCku35kmNuSf10Y/YFYufcNey0UXmZSTVB1aO9WhTFWYzPS4dnsAfEx0MUvLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=U1+iBKUu; arc=fail smtp.client-ip=40.107.74.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hikk8Ooq7UhOrdb6j+ixYHLH5Tw86LB5vpmfpkb0nkvTmYhFMJ09Vrq60yQt0HJI+vZe1nIf9cgjrNzsIEWsrFmcuyWPLTveo+7/9u1oi2yoVNqhsUinbx5fB0neqciXZP4j7HAYPZhloCkyRBk8QfI3rBxnf/jM994JX0eiD1VvMDVCqV5ihotR9UNIMDuwuE5HaBfpkGH5g/azXIH9ZKHO5dgJkGNprl54chx08+FadKR3UWafTju7dR6fGoZhokgeEDqY0+btQssmIhMsr+slniNkqIIT7UhIjEhF+mg6BZrpIYA5Zdm/3K+bDi6gHB2ewE8WU80ioMs2/QvbqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hFeVdmM9MODQ6TFl5Mf1bWYblmLHI4svJmGkLc2qkMQ=;
 b=vQPOPisA9ZWRwGY/kZ8TOEOFRiDD6l67U1Nea5Pgb1576qq0K0K51QVABNgjLOCr58DJqorHj1WvRrdybbCq1pzVkvWBcS1rwd7LIuVAZBWMqfGCQS3JF7vypXkuQgOlgChlvSDBTJUXVyJ07/rxaIfI01D4LWKelTdEMSZX4n+8FkOUdvV8tvQjP2bJUh0Wdbgkvd/o36/ejeiGcQ9rnG0IpAwqVS/YoEZy2J4j11bKSZyWm2tyqxB1mynNoLI3SCPQ7WXIVRNDcjk8Ls5IJRtW9WJwZYhyYPp7F5KVn7Au3W02HrNfbsguYP2+smDZoEBvYqqmGbHL+dsf+DjAnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFeVdmM9MODQ6TFl5Mf1bWYblmLHI4svJmGkLc2qkMQ=;
 b=U1+iBKUuiwrRKGE5AJ2rr1V3F0VXPHCvfsYIMgNHsulrJwDdFizqqZYNmqNzgqy07Ca77hCZ8G5IiyxI0ss1HjWZgI4Bn0NDwvRLgTbh5zrHXlbtJEBdPhQoRCmDm4HQqmhzBg5i3inkxlnt83IiBrpJaUSoZHn+XHpjJed/Av0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS9PR01MB13205.jpnprd01.prod.outlook.com (2603:1096:604:30f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 02:25:32 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 02:25:42 +0000
Message-ID: <87zf48jys3.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 08/29] ASoC: codecs: rt5xxx-spi: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 02:25:40 +0000
X-ClientProxiedBy: OSTP286CA0087.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:227::6) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS9PR01MB13205:EE_
X-MS-Office365-Filtering-Correlation-Id: c3c5dc44-5341-49b3-db16-08de83035275
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|921020|56012099003|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	5mpkkvdQNEtmI1/hyGkXyYYFTjAVF7NXwcnLeA5kBPPfAMemNOSZEEOw/miSwwq4eUk6qMa+iSMZKXpzeJzYQ4CN6qOH5u3YfGFZR1gWhUe/rL+J/kiHMgAJn0QYe5KpuRFsqNy7igXik+O42t0TOz5wvTqE4Wa8TpqpmS4iuDc8WrIh7bJwgsSxwP4fvgnYq39mkEIVBQOrIaIOmd6dUBYazxB2CglmUEN9+UjZkGqzAiGZmUXVVEvzOZBt7dT8VCgypMBt7OqixRHwbzbXEcQW4fQpsNFiv54pLkW1I4w6rs7cYlS5yDNw3O4eNxzZf7puDXf/cQ48k5JGTZm0PZiOV74msjjn6qgEETDb96+T397buAaaksmYVhvM1w8syo3ezYbpDvIPZ2U1efHBPAp9PGfe/VT+Dcou2CENw7ZqKY0i8U5iSXHZL9Mex8Hx7g2rllE50e4UyM1q/KLg+qBdYvCKY6d3CnhldKwU4xxmoRphqMr1tS/uiF1SJsBv7AhXKCnglApwn6kLDwFiX/ws7yWHMjJuJ1ZUz21ZTPxhiKP9/At5lsLCOpSDJW7coiukb7SqXskhwljN1LzE+NQLHwjw5vCIKccbefNaQS/Qzyvnb//O4qfh63CH3ACY+O119BtjADsR+wW4cYyXBH8lVyoRA9/QRhuRJHszbhbQHjTHrDUjq3R4JlnPYsjCLr+5eRHuO7+aApvtp4ukajrANkRI0mVQUOwSnJ8DB/3KDeC3tBt47lHp9DRHBn7Yc9Jk1eUl+y2r56wjZkD7CAdrbiEZqEYCFfyRgdWgG1KFmvfzlNF4KfVT8JyJ0zl2FBchbw7CP+RtSaC6n8n12w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(921020)(56012099003)(22082099003)(18002099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?15mwGzIGY7Vo8KVMbatnQSavaUtB/8t/qanxs2s7YDWSjPAQaKTtAsbPdnOv?=
 =?us-ascii?Q?zyHtcPwE/eg4+Ec04YbV7OOGxiinbljH//0q+DSSMfV6kDai4QjogHivJBMf?=
 =?us-ascii?Q?p/bFX031Csxh28FF17gGaI8SAheoxp6PRYOPdy2dBLdZIU9X+HPf+Je0MZ1A?=
 =?us-ascii?Q?FoGLY+IUOFJ5H2ZdY4ef4ppGmEa1Guh78pATupIUEKbSoinxC4+JzJBpjNsY?=
 =?us-ascii?Q?nEM/W9IrW0P+qo/XRGah0R1cfCwtK0lroij/UXkvlaQI3yLDShX+HNluXtfH?=
 =?us-ascii?Q?PyMSGOA0QXWT/25UWZ5CEgWlAvnO4j5ZIT5HgUMANfWeSI9tkILCog2CJY03?=
 =?us-ascii?Q?0+yKapHurAqi/TKpTgH5W6G0/Wf/kH8M1TDkzKNferLM/PlILtSHc6AhWby/?=
 =?us-ascii?Q?faIKQMTpeQXMRVVVeGonSSYyRlSFKnUYHrWuxxVQ74zWufIKAvHe/vTUxf+V?=
 =?us-ascii?Q?kNzGB5JXTpqrcKXzupm1A8h08iwbRzvF8tuk/HyEoiuHZuk6tC7/1axAYdoi?=
 =?us-ascii?Q?oKz8Hbr8eAd2C1xiw5Xb4r17o45RxCoJECHdjJ9kz4EvQEB0WD8Hogvnroum?=
 =?us-ascii?Q?N00i0W5RdJYZddnG4oYX9YORvtnzAmNJAGd09xNyYt68t3cck3+OOdZ1GDxu?=
 =?us-ascii?Q?rusjnFqvZ73UFDw35D11jPYPCr4bBYtqpW+FNkFgKmKMhnRIADIP7X9bmXO3?=
 =?us-ascii?Q?OlDWkDCTS6tz+faJ1n7oyuAK+8omFbm2P32dO9LYzp1GraIeiHItKPiMPOWi?=
 =?us-ascii?Q?r0ere9HMTmpBzPpeBDsAU3vnbbEhIwWSPJ2lBntYWvqzNtem/7EnXP1G/Fq/?=
 =?us-ascii?Q?y6ictahyzDL6WyhvdFhrOWj52bynhnQY6HC5s5SQUs6ag5QnGvc1Ir7SPvHI?=
 =?us-ascii?Q?vPOA32h/4DVl+suAJl0dL3ABrDsekuvUy4YamOMPiKIsUV2/QfSgN3WWYZWW?=
 =?us-ascii?Q?Xi52UHusNmPoR3o9cgl4CaYjfgvsWCnld2SrJgFiPNl+R8u3ampWUv8rr2wK?=
 =?us-ascii?Q?LX+2Xs9Lg+zQMvfvXuU4m8j7c8SXl2yc2VaYgB6/I9OegIKJjZOCzNA62mFm?=
 =?us-ascii?Q?sUuefd90fCxWPMzYJybQI4wewP1v+me3aqVSO5nPDE5u3VD7ShNNODKX5WDc?=
 =?us-ascii?Q?LsBuYAHFuMfgq3PyjG1Y6rMNUZPXmDA28MzCgRC4mwyQcbG0ZSUjXOmqj0PZ?=
 =?us-ascii?Q?hpPIrFWKJINlOJlMcq6dY9ghgRpxAGt1RHksl1bw0I3wjkVaMX6+uFavCg8N?=
 =?us-ascii?Q?vPtZC1f/a6lFK2ziXP8LaYEoZ57apKdDEAME0sryyccBcBtn76OFM6xxBBVq?=
 =?us-ascii?Q?Bi1bE0UpkDD/BXFvsNmtWwU0s8Q/OOgTl0pWaIY/2RWzEp9qc+0LIksYUi3L?=
 =?us-ascii?Q?P/EKIwtPdEzUXU8YIQ1KeJHCukdrUtfe0FJZclpwJRRhyYoDq9s9D4bw9m7Y?=
 =?us-ascii?Q?grOTkVZhwbSdV2vTXbbBz/9VlYjXcX7EQAUTt/9m2HDh7EcU+C+Zp3/Km83B?=
 =?us-ascii?Q?Tx4zv49OFSoH7bE7PzIMfHPuR5hXVuqMCO3+DaE/UL5OcwjVnvtuLgH40SXf?=
 =?us-ascii?Q?U/n8JI5awWHvMLLQA8GbdP9mHCL5Cmbrbrg0Lk+C7OT6hUPqwHwG6ypYrf7D?=
 =?us-ascii?Q?nQVyB2zs1M6m47ByRqG17klL2IxFlh+MuhmZjEkgrw8JT1SXaQFri7IOspYj?=
 =?us-ascii?Q?QuxzQGJ1t42FjLmPpUdzlHaEuLo8CQXjkYH545X7Azg6x6K5rS788PTIFr/w?=
 =?us-ascii?Q?tfD7SELvcdt09yfB8u4dbvSLcVouGTB1P/Rm1Gcnphimk8iQngm6?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c5dc44-5341-49b3-db16-08de83035275
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:25:42.6089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K8jpT5t1ZwZdcvum0WhXaxJ5qtcxxk7ldkc0xC5sdK8XkFCqTnp1EReCbGmeeEouqHiOtYpJ8pPPCalVY7TEbubuh6uZ6StXuxKjRxcxFgkGDiKVvvV4b08leJcRVUGl
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
	TAGGED_FROM(0.00)[bounces-29429-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: EDBF12940B6
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
 sound/soc/codecs/rt5514-spi.c | 2 +-
 sound/soc/codecs/rt5677-spi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5514-spi.c b/sound/soc/codecs/rt5514-spi.c
index 54d84581ec475..199507d12841f 100644
--- a/sound/soc/codecs/rt5514-spi.c
+++ b/sound/soc/codecs/rt5514-spi.c
@@ -303,7 +303,7 @@ static const struct snd_soc_component_driver rt5514_spi_component = {
 	.hw_params		= rt5514_spi_hw_params,
 	.hw_free		= rt5514_spi_hw_free,
 	.pointer		= rt5514_spi_pcm_pointer,
-	.pcm_construct		= rt5514_spi_pcm_new,
+	.pcm_new		= rt5514_spi_pcm_new,
 	.legacy_dai_naming	= 1,
 };
 
diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index 548180ec5762c..1bcafd5f44682 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -404,7 +404,7 @@ static const struct snd_soc_component_driver rt5677_spi_dai_component = {
 	.hw_free		= rt5677_spi_hw_free,
 	.prepare		= rt5677_spi_prepare,
 	.pointer		= rt5677_spi_pcm_pointer,
-	.pcm_construct		= rt5677_spi_pcm_new,
+	.pcm_new		= rt5677_spi_pcm_new,
 	.legacy_dai_naming	= 1,
 };
 
-- 
2.43.0


