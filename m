Return-Path: <linux-renesas-soc+bounces-29442-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CK4UCC5st2kYRAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29442-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:34:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F106294232
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:34:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F8D4302A54B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 02:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E247A30BF66;
	Mon, 16 Mar 2026 02:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gAT8z5hn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010070.outbound.protection.outlook.com [52.101.228.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D2730AD0A;
	Mon, 16 Mar 2026 02:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773628044; cv=fail; b=tgP9b4k2DgePKVgc/wIH9QvsXB7RdFeTEgu4U399jTiecydmRCuK5wddsZcOI9x3Kgv70TVm6O7HCbwP0G5sw4dXvul9T9HDTMx1UgfjVyk3xwqhubExbBG0gmUWAOE4tquhLdQDv9pSk2qG5j2zDL5ojkSGU7lKQ9wNGSs5YJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773628044; c=relaxed/simple;
	bh=yBGlRrYziKkfpsKck50WKMtpa1rWumYZI30AxOZzfmg=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=FNVq0+YaeEFRVUA3xstTPJpzqp6dn+EvWaPZuVekqNQgv7FA+Zd5k16gO9bakeA0W7o2bLpTp7+E/RbdQ8o3QL/bg9InXdqoztY2Pj1jqXMHMYiVnsy9FHoCf3Emwmq4yPRO/cOE6TuxRznxbgahx4vcw27Vq9Ku6y6/Z6Qkh+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gAT8z5hn; arc=fail smtp.client-ip=52.101.228.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aLaAHHF7EMkVvRpmHBiIFjSdoRPdG7p0DKyGX2u+4GR2BanMs4LVLOZeWQaDUqjXgTqU6MzvTm3JA9rL6cPrT0zBTqMWDEegxtzxs9dm/QgSb8GxkRIbreHmIODSAFemIEqBOfdL69qdrumG8khJkGphG5J8wYyo3fmzSKfTnqpJQNk6iPWOMlxfQ1ShNmRxjy6De8aIuo8yN20O9WH0n3r34USeSJRBOdVkkOueu/MjtR9JCd0EmloxWRO0uHTOKNfVbz69Kn4Wb2DaeAjBraUFfmJZ4NMmd7GPU3FDshRj26VcRbPQVeSQUlWEXLGLa0m5jzP74oxA0GgvdaNRRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PU5bBJvPgi+kWUGsAn605HuODx3u/Je0t/CL440L+Sc=;
 b=w6kmFElU8LGcESjxmm+VJ8WBNy3ueclBqQgSaVxRiiQlBrv4K4zLmjyuBifyrxwXJc4m/1wXQ1gIRwALjsue9jQTIldlj4QLaehQKngfokALA37jtpJ9vhD32hmLNOmChg2mS+CvsUBEL6vgbWqRtl0vQSpZKPsSSI8X7ALhQ7HrDxKZneab16jutL45uvYYNkLdLIVtW4wgfxuYfUVLSlVhJSy05HbENLlf+Xg20L0GhK1nJRdftphbZMFicMdjIPcTY3kubL20isgeNBijYM0XaTq7SVraK2b9IhU/R0sywwmjKmb76otby1tJHS1Rutqi3MdEFjXomoKSBbd+PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PU5bBJvPgi+kWUGsAn605HuODx3u/Je0t/CL440L+Sc=;
 b=gAT8z5hn1ihxNnWjEGdd7hgwA7kGRp0qNZldY/AwxhMKXuJYUPTG4myrdc8bbGAKE1GukcRtQxBFO5Rg1vzdp6Fov/XDoN5HdduJ0gf6WqEEIbO5ZHomEvkrinnzC4lJkXXO7+WFN/Giq6DPhbmKdu4cWXtQQcF7VMqs4BprSkw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS9PR01MB13205.jpnprd01.prod.outlook.com (2603:1096:604:30f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 02:27:01 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 02:27:11 +0000
Message-ID: <87h5qgjypk.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 21/29] ASoC: soc-generic-dmaengine-pcm: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 02:27:11 +0000
X-ClientProxiedBy: TYXPR01CA0055.jpnprd01.prod.outlook.com
 (2603:1096:403:a::25) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS9PR01MB13205:EE_
X-MS-Office365-Filtering-Correlation-Id: 45fe635d-b7b7-4b52-a9b2-08de83038787
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|921020|56012099003|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	8kXrrL2ErCH5ZeZk2erch4Y6DwusoJGsNcRP8JAd8hqmRDzA6U99mo5jZjWyNjgCXidhXZ60la6qQQKU07CQIDtJgljeNVais8QEvjk3qBNA0EDlWuZ4QWvVPytyC6/rOa6x3bzpMb6nj7PLAtFJilXjSPpYDJF5RKSQ5iHdSP71NF8wJKyhB8CetgzupHReg6kNaKJK40Apkw429rHSkIvhMtiYrfxtGF6Rot9eIlt7UDSI2gppoPoRt4X76c1319Of5ZavW3GoVY834l/ejmW21PYSmPYivS6//DTjFSD/VdGf/lDjiu+2Hn7Vv2htgkgbDZTaAo8/KtmARBqpaCoOo4sdFpgU8WjP9hwgogS3pZkhJ9cuzGO7ZMfmNKdsnvBtgq6Ngfz2Myus1nAoPBjP5GStNlOnRS4vkbxtEpItAVRL55vYisHHspt85C3oYnCgWUUVgPcbVXBjWi9j0/vIy0SNO40wMRc7n30ufWov8Nl6N33fBB2wHEcBxkn6Zqq3fX9qTOa+sRSUGCzlh0HgLFs9NebtAn6e5eOti+H3cXrUrpWT9Vi3fHzL7PMuS5Uw0WBgDiQmB07GrpUJsUjQZGTaVJ0WebCNIX2KSshSzEKGZCpkTXUbWR7yZfrsF6CeQ0n9awX7EvzS4f36+jEpRUNuoOwBqU30EfS7lyK3mlLTkFn6ATOn4rhcpuBWvcbXWIbJ7R6dI/Sa6WvajhuFh7p9YNGhqwLJ2JeT5+/m5Y3wuZhAgSHU1uHrdSO6EY+dsy1cMThrCVKeEjxqGIGdlo8wizxzDLgEXp46+Q4OrV6WWXoesgOPhCue3fR+VSi5o/ukmbfnyZuJEZOafA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(921020)(56012099003)(22082099003)(18002099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YszFFeh6s058OO4bDEkYspzk4YfOrqwVBw2lpqfyT3Ivm1e5JjfcXlzhr+8G?=
 =?us-ascii?Q?xO0oV4qLPxqnDo+2OIGYdHtN0kGakdheCigC6an0dkjC+n8DCwzgleQ5bACN?=
 =?us-ascii?Q?9HbxDnT7SsAey/AF+Gi1qxfStKaGyC7Dvefo0knmeYJ7TYwa3//45gAU/R0Q?=
 =?us-ascii?Q?Wndkx5Tudv3Kjy6BpFISqJpnxsSKaUazo3HUpWdCyf9u378WRS5oVjyhY99E?=
 =?us-ascii?Q?VaV+VbR81oE4Rjftu24XTHe0su2QerxCTarXVmJE2ep3qppbAVah4JxCDqX2?=
 =?us-ascii?Q?kD2GwexLtHIyLXsF12fRJ5mJGx+66wGmkoM/cNLaL1WSKKaDrVuhbOo0Vvd/?=
 =?us-ascii?Q?FV/DDONuXhoJ2+7SG+YSMCrnv8vZpbXJYIbSKlCQrZwH/4w8CABlKbGO1WaU?=
 =?us-ascii?Q?MGtTxrM5pF2yJJtq1WB3bbxNsywj5PjLH93KYmivGSd0ocGNrDB78+eqdmNO?=
 =?us-ascii?Q?eYOBJ/J/0FVIBA5DfwI+3pvB7LsBowhJ5npd/gVyMWPdA9aZMfRN6Il35msy?=
 =?us-ascii?Q?es/pe2GWtusE+gw0zeoznCeJT3zTsl/CbclNHzjn+unPUxfAaC5bjEK+BCw2?=
 =?us-ascii?Q?c2hJOQL6HOVD1H/xJLj3Gn6kSU5xmKk3KS1X18HK+6Z0ScppyNZpPwXbE3qG?=
 =?us-ascii?Q?u9C8XnM5w+Ox4+EEp3E2P2jwA9/tuKRGU9Pyk6LoNeaelgb8YnsTMgovUvff?=
 =?us-ascii?Q?CDnj6u3drXAkIkRVnKbkViLUjEPu6W3qiz6C/Uq+kHwRetifWDAFbWdP8QB0?=
 =?us-ascii?Q?HCWfi4vO5+J9qEZDTxyKbaNaxkXU3zHLumOJU3YsG64koPKkLD+iDTeWEFCb?=
 =?us-ascii?Q?RR8D82ItyauRgiO5RQ595dKPPdbQlw66cyrZf4xfoGDUuEp1tYwo59GVV1rm?=
 =?us-ascii?Q?mfs0FAKdNVv3R11UnC0z3FytZrq018XYvIK2iYpKwcp7PcDst1gbKTAcI20i?=
 =?us-ascii?Q?56pCYUB6wnlpCU6CTi90iaz4TdnDUgsEokQNAenLrYHk53qdyOSHOD+aB8/B?=
 =?us-ascii?Q?ne9ATz0hNaPjNEQI0D9oAbflA/7V4Omo32wbTtQIBjjjK3KwOReOLaMMXgde?=
 =?us-ascii?Q?jmOz/VH3I+r3tNjf/SVsuea9+wPt+mgNkNl3NBCP1608HELKUIdFR1GCrgHu?=
 =?us-ascii?Q?qxHTj6I4+gFlrI3zwYyRrVQRI4y79HyMz10l6tX4WZ4iRidWMii7Re+uhUIi?=
 =?us-ascii?Q?/7vKM+D5mYBaC951biod/RTXSCB7VdEyjvYC1crtzCltPaYNvJkrj/6CCKO/?=
 =?us-ascii?Q?XjusOcq8n2QziHdXoLYJGVHnuEAXN0+fNd/1Pb+hMNbA7f3v0uoPOuPQXhxH?=
 =?us-ascii?Q?C/3NFVWZlI9IgI0RJO+PaUAhdz58kfZoHp8naJSmq8Lv3/nVuMwOEr/JxyIe?=
 =?us-ascii?Q?42AZ4me0d/wcubExTawzkKX4fi1cSTlOfWSMM+tz82u8zLOm206ev23KltlH?=
 =?us-ascii?Q?pGu+QxKFXFI0jjHxiYQp5zj2vHCO2gCl94TCO2+9uRuK5lC8f9i3pti3Yu0c?=
 =?us-ascii?Q?vVPLxi69ngC/K8qAWmpUdyv38OIh2R42aioPb9tQxPIcWE9U1EZ2cjIPgyFf?=
 =?us-ascii?Q?9jeaSQT7YlQDH9yxir3KsVvxInziK5D18Sg4+a7A9a3x8QVfGn4TDJaNBOFb?=
 =?us-ascii?Q?yv9Oe+o6oxuEOQhC5q65/xxKMiW8A+q3M7EyJb3zduN0UAt8tB4hG2C2/Ibo?=
 =?us-ascii?Q?tkhj9TtszlHF+YlcMfUtQEoZHI3J40R23OPV95nlqKpnbxVPSOOhwb6Xy5MY?=
 =?us-ascii?Q?XMFRCn3Wy9qRGKIkzqcJm7mRABxw2Ia4bCjdDa6OG/9xcHMT/elg?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45fe635d-b7b7-4b52-a9b2-08de83038787
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:27:11.6326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQOHTqeUxvGvpTKeVIFmw7jEVlR9DzwuZSfuJwcD4KQtaTA8yX5hbCRw3iLOls9KMRlORQ3OEtzIfF+piUJfcY2gP0093PyRoo4tu1ovvW7mQ/hMZ6w073rMtNSXgRvx
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
	TAGGED_FROM(0.00)[bounces-29442-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:dkim,renesas.com:email,renesas.com:mid]
X-Rspamd-Queue-Id: 9F106294232
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
 sound/soc/soc-generic-dmaengine-pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index dbec46703b35a..6b8c65763c828 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -332,7 +332,7 @@ static const struct snd_soc_component_driver dmaengine_pcm_component = {
 	.hw_params	= dmaengine_pcm_hw_params,
 	.trigger	= dmaengine_pcm_trigger,
 	.pointer	= dmaengine_pcm_pointer,
-	.pcm_construct	= dmaengine_pcm_new,
+	.pcm_new	= dmaengine_pcm_new,
 	.sync_stop	= dmaengine_pcm_sync_stop,
 };
 
@@ -345,7 +345,7 @@ static const struct snd_soc_component_driver dmaengine_pcm_component_process = {
 	.trigger	= dmaengine_pcm_trigger,
 	.pointer	= dmaengine_pcm_pointer,
 	.copy		= dmaengine_copy,
-	.pcm_construct	= dmaengine_pcm_new,
+	.pcm_new	= dmaengine_pcm_new,
 	.sync_stop	= dmaengine_pcm_sync_stop,
 };
 
-- 
2.43.0


