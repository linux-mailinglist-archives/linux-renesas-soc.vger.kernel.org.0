Return-Path: <linux-renesas-soc+bounces-29443-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iO4TFgJrt2kuRAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29443-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:29:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 380FA2940F3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:29:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6DD74302B4F4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 02:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8041130C37B;
	Mon, 16 Mar 2026 02:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="MwVZT9za"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011064.outbound.protection.outlook.com [40.107.74.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3C530BBBC;
	Mon, 16 Mar 2026 02:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773628051; cv=fail; b=ctSKI5oqs/U/anTc99TR0bJQMdKw85D0oGYZbdYiROOC//sWd0xNr5CpSbs4BO7YBhUPfvOAIa5UQlVIr/kPMzHwGQrSwaLePIeSOy61GL6UxV4Mx6HpP3l9si7USfiMNoyEZ2ZO21k3JhtcsJaPVTk1NIy1qVCfKE6XGrGy0ho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773628051; c=relaxed/simple;
	bh=psuBz3+1KvYb3glnGGHMS7NKUX+YWzXbwydHyskvgv0=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Wd6JFDUaf+0Xn1Hye5a/OwiWbOw/oHe+Ne0MHas0v8QjQsrPYIhCqDFhICrjq5zgrSx4vumew1tUlUAGkY7TVLPt4vm+Ji87Xk1oj6CVCQQ/1+1Zb5nXTbjEDJSnJJsS/sEDgiylgbGlZjhrxcoVzUUmJhqz3QGRZDIo68ZU78M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=MwVZT9za; arc=fail smtp.client-ip=40.107.74.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvM+CJLHk3nx5F2QVQYsia+EIsEP7+gCyiT3Uysv7LbTZVC5wok56K2QIBk2+fd7oJw3j6KeN3/LPOg69xxznEQwDHC8vj+nE+U655ydQrx0wguJTe7Iwz27HaGK8penzVJc1w8UvGxn8wWVJUpDFjr6QAX/qrb57QIir7+tbLfMBPm6FoCNa6qj/Vuwz5MSt7pr307/uVQMo5+Qn0sXPso33+ixisGWcuVbI+EJ71VVrQC1JLZahPaNSpoqpwh/ICPwNhuKKraKh+RlnKYWHKDY2n9BH8BG273Gxk6nqulBeUvfnTA9MHiVGvep328Vj5m5ZmV1bJ6fjkjxCOwbSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ide3o3kFxDLV4JMYeas3/0fgNG8+vZLL57KSAjADRsg=;
 b=c8qD7In359TRRmRGsqSvID/J8eHC9a9B3NkmY4gvVhUTBi5sfTcpaehd6YBrB1nom1AIDv0oauC/HisLk9pLl8RvEdVu1IfelMz+elAfGfjBbYI7C/apgaFISGmKYPoTIReWdGn5/aQWUbAmRXux5Lqd9rlF4kDzDpwHuorZwmAOt/jOgcWPaQgYw3pOkBGpcSeXnoX2qcEXreS+li5ejed/UgDPAUhbq45ItopRTsMducT1vsTdbj831863xR/tnxtG/gc6Wc3VEgo93YJLJvWMpmBKPOYaObiDka69i7cVdcEo+Cth3BF+hOVWUqNcEkU2TfUi2B6H2A+aYHf7bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ide3o3kFxDLV4JMYeas3/0fgNG8+vZLL57KSAjADRsg=;
 b=MwVZT9zav5iMFk7RaykvbVLRF9qzJIBj3BxwQQQ4UTcNrTJqlNDrB1lJAaSuFneRN1FvYQLxejXmmQh84+9esvWp5Fp7rq/Utn78OZ+gpH6cz5WyZGowSErg1CQ4Dz0iSw2QKxrHVxWf3f1+AW9DkQO2Bv40gtoMEtyStocoqys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS7PR01MB14729.jpnprd01.prod.outlook.com (2603:1096:604:395::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.21; Mon, 16 Mar
 2026 02:27:01 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 02:27:17 +0000
Message-ID: <87fr60jypf.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 22/29] ASoC: sof: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 02:27:16 +0000
X-ClientProxiedBy: TY4PR01CA0062.jpnprd01.prod.outlook.com
 (2603:1096:405:370::14) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS7PR01MB14729:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e371b40-3924-4f3e-f7d8-08de83038ab6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014|18002099003|56012099003|22082099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	0IPO6RHGLRnu60VuzJEg8vIGcM1171Ky2fmobksBE2ftQ/R3jtHaaR01TpAUDgjvA86B6hEkZvyowRah1UgxUae0SvR6x+p83FjaloE+W0uxzcJljjXT0+n7ply5NwxAkqgOy+WUzHUXVkXuYI0vV3bC3ox1gUsxgXZm5HXa9g32Ueg37pHJjY5WIt8b4EvcUlnUbmBdh6NfXBleyK88yzrEidrOh6j2MGlJ6jWITWRL+5tz1X6B/jCyktA6NSlODQ13cvrrTJgbPq8k8a0OCeb7fQtu9BYaEKwlYQSgHDN9oOwFcuZ2MvlWbad6Sw919c+ty0s5gizMJmRknHfxtT2D9w6IO3dHhPvMJ9ASp53llfRke9dECrxUj6YlgGpvDBlVx2ZGwMbNVuQL7WLpsv8OGGF9QK4HqoJdKC1JQ+o3iJTktnwrig23Ik+ej42N+UH4EQe9sdN7VHMbe9jNEXOzPpjV+VoQcE1HDo1Dw722He3IiDXoZwS9V5Cihjtxy2iTAl1OfNpL7EmO6y2c+KaWOJDSCKd9nqrdJRvhqbgq8SgbuPuLT9OmnfgHCmy+Ab+go4klb927oonax87/3VZ5swfNPxDVtLI8zqzKUsl2A3HcD6jso+h8gdtyonCDGS0UvNN/1rOOeDLG8o+7f2HOmkY0NH6YTC0MJtKSY1ojuUMPW2ysX036mLrjimMd8cvLh+x28X9+XZJt+eR+vrnpn5TaYDswgIOC/SQBAlAeiSEht8bshnB//9vBAs6OPHshKUXN8yRw0pSWLXbmunb9E9StVl8k5MohwtuewL0ipUY4VzkY7uLinkIO7b7HRewisrN9bHJQzk07Rs9xig==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014)(18002099003)(56012099003)(22082099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?920rEEyF2428noa/hvYSoGZRN+YOByb1/d88pb6WB4Kp3N4I9w0rox3/uUU1?=
 =?us-ascii?Q?Rf6crJy3SV7OZGyGwM/G62v7w/FCE+wyuOTQ/Ww3Bdcu5GSST0svKn5Gv8wB?=
 =?us-ascii?Q?W1xTYjO0wccF6k3WyUXUBO7qBck4ni91gYYZd517aHi7O6hzuH94zVP1JXwf?=
 =?us-ascii?Q?W+UduABXV8PVodjJFrdfslcfzOdDUmHNgmI9dOoAm4ikHI/grLpJYoiGbuAx?=
 =?us-ascii?Q?6gMC0F4h0cR5186lUbqdUG5e2CxsPgFETEkaOVZeec5ZGSffdUKSQYI3Pqfw?=
 =?us-ascii?Q?cSNsU4uHjmE/XAhbMWiqIJNaEhK8m7vWNZedt0907z3OKuNgzNQjtjOPZhzt?=
 =?us-ascii?Q?EWrpU5v1fgRm/IYkUaKdG28fh5FfZ+uzwwOu4ut8AIl1ah6HYXli6Lfrw8qU?=
 =?us-ascii?Q?UlNUSH4lVE6AUc8RogYV90zSxLoRR1rr0RyReHUp01vFD8MgVgYSlQXS5XPR?=
 =?us-ascii?Q?TCRDHVniFiRDJIATunHefGr8LULdkgWz38cvm7Z8PGfq6RbRn2wOhoxPJzcn?=
 =?us-ascii?Q?wAMpJwfGSgHmo5F95ejlP/HHj3cyQIfAdQZJN6J51FhpFn6eANgZ2ifKLCFc?=
 =?us-ascii?Q?DJmz8kroZuVb2zE7wwx7CQ/YS1fCEmF7fiZtxTKtv2hrjCC+GNB3bVMCNemX?=
 =?us-ascii?Q?dBbOJdgkFu1y4wKdjZW+5Qr7t7qvt71Q5Qp2fVH68pbkGipn/0yjz0rPesxR?=
 =?us-ascii?Q?Zg6mhXTsW7MheRhsfevdvuLdkFJeOaSlg2ppStNdhmfu8BH9IJ75UPz9WRxR?=
 =?us-ascii?Q?hE7tyvoc0n0illYQx+P4x2xyB4z0SGAdXHKS0X+rLuPvcgIourNb9DO9oblT?=
 =?us-ascii?Q?WQYMjDlGsED7KOhkTsrPSmcyexQc/lCHAEnOixey6DCRlrO2ORLkAWNWQD5I?=
 =?us-ascii?Q?C4GznBIst4CtrpEe1h7Xq+qE3tEFrpY9eXvwHul/KxHgKP0SdAz8nTmkUbhX?=
 =?us-ascii?Q?JnIMlcnaArTORPvFqh/B8hoHdnNSjfeZYGhIvdkJkY5m/svVuJymmb7LEpRo?=
 =?us-ascii?Q?2O5H28M+K40Bg0apMxjDaAV3JJWUoC7ERPrvu7ZX54s5IyW5m3KPLlfm7kBA?=
 =?us-ascii?Q?aMApHCppEhpT4hf28hEcefRd250LdbiKNIJaiHBuaY4HsmqsU3UBk+QVmw19?=
 =?us-ascii?Q?JR7Y1eezZ+F6P+AsYhHJv88zKtYuot7qGffvM0oLTY4GOcruVVlT07DJ0s30?=
 =?us-ascii?Q?9o6MEcHMzfgu1brtXzIL6LIwYFQb9mH1aQ3jm54rH9t9BcSRIBNE+pkOU3ig?=
 =?us-ascii?Q?qHTKe+YhY9LGFmX6ief+L6GB4LRZ0YH5FS5lMHgUosMuNhkwC+x4reg/wqqb?=
 =?us-ascii?Q?Qd3T6+PS6j6doOZL2dzpQi7tNGmzaY+kkWYnNRoZCXMpc8eWwJiVovDOZjvC?=
 =?us-ascii?Q?G+jZUaU/WF+M238m5b+qQPZBPACcCGU4q44DpjpcPqoEHfiRTkD6SWvxxNev?=
 =?us-ascii?Q?FPsw/xK1d0tDiw52gLjx3QAaZObkfYgqmXafnr+mppcHNhACX17+cjKIBXmw?=
 =?us-ascii?Q?NXS9yKTkCqOb6hI4LZKoxZ2VD9ylyIs4UFLvynyOhQtZrYCb5uoOOHp6LYNE?=
 =?us-ascii?Q?FeQG5+HeBpWGLCHg3PFjTxxAVxGR7EpyFtDWOU40umD8BofS/5VSI00t4CYN?=
 =?us-ascii?Q?r6ipVD7PT/jlYP8L5BQRgk3qIgQzR5bg9us+ZWiiSnJ5mpq/rN4W5YneHVQo?=
 =?us-ascii?Q?iSyGW+F1ONsba7+P4G+7qM5yZziSrPtOPTEUYgmp6/PZiK6QFL/56GrRotf2?=
 =?us-ascii?Q?2LtJxU7uiyvx1JAu4sEa4QLbDhnN9JvbyELypHJxQHe5a+5Qqesb?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e371b40-3924-4f3e-f7d8-08de83038ab6
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:27:17.0063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Qo56c8HygCrau7fbqFqZTpIe6oVb3YiBmnxID729aBXN1ppdeycjeiX4qVATVdM7oJmxHAoSHyWV6j4yPYNpRWQd4a0Y940gEN8wAIiMAq8nB9xrhP6xQHas+1LrNt7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14729
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[cutebit.org,bootlin.com,foss.st.com,microchip.com,collabora.com,linux.alibaba.com,linux.intel.com,chromium.org,bp.renesas.com,intel.com,gmail.com,tuxon.dev,mediatek.com,linaro.org,nxp.com,zonque.org,glider.be,perex.cz,nvidia.com,socionext.com,metafoo.de,kernel.org,amd.com,realtek.com,linux.dev,broadcom.com,free.fr,pengutronix.de,samsung.com,suse.com,sony.com,arm.com,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29443-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:dkim,renesas.com:email,renesas.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 380FA2940F3
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
 sound/soc/sof/pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 16c194b4851b9..d3af30398305f 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -651,7 +651,7 @@ static int sof_pcm_new(struct snd_soc_component *component,
 		return 0;
 	}
 
-	dev_dbg(spcm->scomp->dev, "pcm%u (%s): Entry: pcm_construct\n",
+	dev_dbg(spcm->scomp->dev, "pcm%u (%s): Entry: pcm_new\n",
 		le32_to_cpu(spcm->pcm.pcm_id), spcm->pcm.pcm_name);
 
 	/* do we need to pre-allocate playback audio buffer pages */
@@ -850,7 +850,7 @@ void snd_sof_new_platform_drv(struct snd_sof_dev *sdev)
 	pd->compress_ops = &sof_compressed_ops;
 #endif
 
-	pd->pcm_construct = sof_pcm_new;
+	pd->pcm_new = sof_pcm_new;
 	pd->ignore_machine = drv_name;
 	pd->be_pcm_base = SOF_BE_PCM_BASE;
 	pd->use_dai_pcm_id = true;
-- 
2.43.0


