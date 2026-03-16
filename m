Return-Path: <linux-renesas-soc+bounces-29430-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOvnIAxst2kYRAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29430-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:33:48 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 391022941EF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:33:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA4D430EEEDE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 02:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C9030BBB9;
	Mon, 16 Mar 2026 02:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="AYu61ZRg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010050.outbound.protection.outlook.com [52.101.228.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ED62206AC;
	Mon, 16 Mar 2026 02:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773627963; cv=fail; b=ponWXAh2nTYArXC6RN2vKsVb2Yul1xm43iFbW3N1wyRo858fqHn8zLQtmGGNN8N60nGr506sSE/bFYAQ6lGv+kV2cOKS3fJe1PoCZqUA9ZYzsLq7K8hLJKPx1cLUVoHIjlaw6IuQnlArBgXfheCUUiD2+AlWO4vmE4WO2d0KnZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773627963; c=relaxed/simple;
	bh=soQW8Y6gnz7kn2vBGtYFtGXjXVDVFOaaAPsoWM7H7wc=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=I0Oxh5pZLmHiAdXBlrQuqA7EHH3Y2fyQtudD4YtkoRwlPaUVvt+eok5cifxj/e9EhUUkmPP0OJ/Mk6grTyD2Zp6Wwqk2+JqLJSQZsgDk1WPWi2sk88wVYUnez4E9U+FpF71Nvut9l591pBEnFNvZKuX9/iG3S69aEtbdROTJe7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=AYu61ZRg; arc=fail smtp.client-ip=52.101.228.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cwprc1NSvlTh+IKed0b6arQxwbzRCDU23WdN8DEyySzEo/ctnLT9mexItJwpZ/QItS0P3vVqIowMwaWfPUEyQjFfUP9pQbF0LamhNkuM2qGYTQdVgdJGfcSC4lKgYooOh1P6XjCDE51h23OhIIJklMbS4A6Wn6qZDaNzB9gLbzrwgbS1ke0J39ISsRoDe5Gj2haDfJ2JsqpGtpDEKfLq/U+dCM/I/Kx1cBbA37VtK/Bp8zPeZUTJIZW21pl+soSAE54WiVw3ieCeFuaYhFz0agcvxNWLvl8eS4smCgzNxcwnQwLSaTGI0RkMH6+ZQCOhJh6k3Uzwh6HNRscNftmCKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L+B5zVxd4COYsOsERQLMpTPh9/rd0crvJ4onYfs+vKY=;
 b=EYOsrR6CWsjam1liV/8dAy2c+Wu38mfJgLu2mOH6LIjezlNAKX20UTkWcs+RpRF25JxAF3FzzhxXPTfbuqJnbpY9F3mttJOaZIeiieIgHx9qWap5KrB/fmTIDwJAnvblkpf4NvBCQGIi7+0igAlmkH13LD9rKuiyufXAVVYO+OusfKwDPPDiTQGla1conNt3vb6EMOOY1fFwHvbvJCBc2mRj9js00PeqGLkeLonb8yVn6JNj3/w6Xy/VUA/F9+laIof6Tvml2SGZGhq3pxyYcOUo6YDU1rdxw8EADabukzKbbHRsy6q26vBKwBfIL5FOYS7R6v2tm/wCFwGmFDGi2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+B5zVxd4COYsOsERQLMpTPh9/rd0crvJ4onYfs+vKY=;
 b=AYu61ZRgyMQ8PgRd2qTfVW09bOftLkwqdg6mOXrG6ZBTeEez/ZO4j2m9Pf54/AVlSX8YszFtHFY9aGdyhRhzJZSEURHBsXYbLtaIDXvwU0w2n+KCiaYfAH4PbMMda/qw+VEDwr0rEeNbWPBROD7zMke8Hu4sp10jh822feYgRdA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS9PR01MB13205.jpnprd01.prod.outlook.com (2603:1096:604:30f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 02:25:40 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 02:25:50 +0000
Message-ID: <87y0jsjyrw.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 09/29] ASoC: dwc: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 02:25:47 +0000
X-ClientProxiedBy: OSTP286CA0081.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:227::14) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS9PR01MB13205:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e5c9218-5489-4059-15bb-08de830356c4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|921020|56012099003|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	DGXrIwNWPh3TjccOOpI/FXehEP0mWFaZbx1Q0EFSn6trqgVUA2B/Id/EeWrQ/rvEPN8BOcl8J4bNYXU6FgRk2KmJ8vIkFSqEeaIUUb/R+58uWqsdwmk43RtKAS8rLUrGHVESXmPWyxkbN4O06U++qGT/qbNaca3pVbsDfCo/Dzox5mqGgOxPWpDqYVkdYdLFgyS3R/tyB9cxpE4Y1CiKvJI4R+fQOJp/IDbOJedOv1Cxk8Wny5hMk82cbmPnueqGgvuWWF4eOyL7AsVWt7LtTO1hkZQqU7x8i8jsgM/XSygLjpTCFfZIYMgvodiP3gEkWiUWVHoHHyuWxepzrBGKKexLu747WrDeoAfBnJry2AT0etyXq9erywiFQK//TkboJh29YBT+BoKwTNuDwQHMDKg9TPbATnTvXh3Qx02X7dt07w7mfxvR65JuxXBWsm0LStGn9uGrvcBUdPKxlw9kvNzLC/t4a0dEvPHfQi7wxyBe2CeGsJWCvZJ9xp7+LjcmMP1+OzqPixCIuAbSbywecYdGsjss8u8+NMRImNLtwSP71mziX5DUDr7ULl2qEoOJ6XO8+97xt1wceZEwuS5PmL8xOT4jT3ezhH6bXMimzNXVtU+apy4pvjVEFaIJKK2Y8Dl5tvcC2WywdFzDb7++v3YqK6E1l5VmkEjqxC15YSHUjHuktYHWGOWvwJDSoZFwaVcm1MyaJ04LcEeX8ekz17fadxzbEY6jF0jMgJANjUd7V67hb3NhtRlv0t4l3Ca4x7uiYlZ6+WQ7dJ0eXElWyjCbTmD9xFCttVlQAWOc0aiMneo7IwL1z28Yuhcb515UMIBtXuxqg6rreW1X2rCTew==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(921020)(56012099003)(22082099003)(18002099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l3kuuDg2tfgbkQ6jboq6WULNDGHbdUeD743PYaBA/zf9mg6sKMYFYnwYagcA?=
 =?us-ascii?Q?Clj2MIpLw91uFitpP+hQ964g7gBeYOtdgOkHQYXsL0RzQnx44doD2Ri5FIZa?=
 =?us-ascii?Q?VzxgoFjNMYgAX1GVUW6LYsRbNPQefyFoYQ++CnqWuOFGHIPll6cTVf14DItI?=
 =?us-ascii?Q?R50t3hunlTqVx9QTXPwczmu9h71QyLlwrFAmYqDzgRgzvFBhaGgt+z9kun/i?=
 =?us-ascii?Q?euuPSAaNOtl5GkbdELIfCb1G/6h0ZmjMAPn3YdZqYIGydEwtkAKyOv0SAwf2?=
 =?us-ascii?Q?4M/w7XKEwrJqYKy14QIBHbTGRIUwWnMB1HWl7mht8sliWHxq6gj6ndNb8UW6?=
 =?us-ascii?Q?n9DljGx6IjvasNjvx2S1W0FrG6C35Ry/WLLUbMjFpKYV4C/dv96nw3zrNZco?=
 =?us-ascii?Q?4YjG3lGNpgSTKkG8I4hM1RVdijy7MdUI0v72fOJC4QjPEN4uMQg7zLNctsQE?=
 =?us-ascii?Q?1nSuYZYOSiUHLwVeZ03Y4FzjQNaP5owKQmW8LglQDJoGGWpiueNbZKFffcBk?=
 =?us-ascii?Q?fUDjrS4xG6gbmbFhP53MfwHK/mIlDd3Ik+2YuvdQyQfH/RhszQ7JGBS1AvP6?=
 =?us-ascii?Q?aOvZOO5wejsPj5C/69S2oc35d2MZHuBVZt2Dz56ewggH6FTurVwvi+IRgKb4?=
 =?us-ascii?Q?A+T3jeWi7K8Rf7ePf5ULA99gUBzqOH2GYjPLgrI2ojxMVez5erX76YNYVIZ2?=
 =?us-ascii?Q?rbHjlHP4ja7PVcFJ58g2/UYb2M8PwAe2CTjC+ywjnIYYKejFCB67YDpXqNYN?=
 =?us-ascii?Q?Hp731br1uHhu6bGAByQFyfAyuxB6upTN37bjj43kuudFKtcWp09R6pI+ePLE?=
 =?us-ascii?Q?h4oTO0+ZMyxmVac9WGWpk3AbcTWVnJrFGvMK+c+UNs3TUQbGWY40IRAjDH3W?=
 =?us-ascii?Q?rY4WBvGMDW8KxDmkW8rkrVrOOPYo7itg3pr37fYSTYPQ/d+nNNoY8hb9KemR?=
 =?us-ascii?Q?NbGxN3vHOsupD92InSEsiOnQjKheYlasEYw8x3cuAGxWWEfiuYDp0XFLe0WT?=
 =?us-ascii?Q?UzbruuzdUHn4D4OrXCelq6XvstF5mPvz63HfMzwbDxqPrSG6mCKfQ7f0+wu6?=
 =?us-ascii?Q?8CsGr40UJ7cWxXx64LzzyxhdjMlh0wanHLAeUulIDrDPtHmBE+ECZ1u71bpY?=
 =?us-ascii?Q?09KjoCBX7spidhC3LJTBhhvw5J6KPpdlblkbGar51mQ4FHwtaxhliiqjRiod?=
 =?us-ascii?Q?vqDQPs0COZ0yZYtRaP7nn5aU4xCtDOvU80TI7XFt8+UOle8UE0h1p09LH3aM?=
 =?us-ascii?Q?dCechh+jazio1jvD3KlFdQEnSmaScy67RuYMGbkU3dmJr4P4Pg4z/yDHcgHB?=
 =?us-ascii?Q?Fv50G/6fUpODEcB1ukaWvZCeOW5U3jgC5A5N3lbHHhG5grD0zsJXiRVYeDma?=
 =?us-ascii?Q?6DdOPJMRiLqEtsBSzS0EjMC0fCpLCfamMN8bYax6r0pHB0MG91j6xjFuqwaJ?=
 =?us-ascii?Q?smi5GFMCIHLZ4PAEKf+Gt3A3emMp3yYFKF30QfEIty9uuCNMjKh8/kmpL6BR?=
 =?us-ascii?Q?YbegyDRC7Mg3g7Ikv+WDvhGcOx5ObwcI973Fh5LkH0OLPqBrX/kkP4Q/nKkU?=
 =?us-ascii?Q?pASQN3bAV1nFdEHy9jRNtyzGqubbmH+TxX5ugnansVxv4slrk3nk/zufkRPc?=
 =?us-ascii?Q?Q2eM1j2eULP/kiQiOD6bhQ6b3KmBOWNm218Hr/7Q3WQher3kmAEiTzpyrar4?=
 =?us-ascii?Q?T+vCSzG7eB6d/HkQww4KAhYIc5f/+PvcPWDEYUFxLf1nGOQJ9bgT5YA0H1Lc?=
 =?us-ascii?Q?C8MBPJkevYqTG1goVKhw6TudK3S39iPxuR8dVquu2EC3i55aqMOB?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e5c9218-5489-4059-15bb-08de830356c4
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:25:50.3520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p/l1o8uKvnRE3bkdwt+M3P3UIIECBmr22BdPerzi46YCPfY3uOkF5gxUfrmmfpWTszGF93oKHgesNoWd080T6PtaHEIRfGshriyRxNHh04TiT/xE7ybCFqNoWMtRETT7
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
	TAGGED_FROM(0.00)[bounces-29430-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 391022941EF
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
 sound/soc/dwc/dwc-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/dwc/dwc-pcm.c b/sound/soc/dwc/dwc-pcm.c
index 15ff39b1a5098..bbc4ea88edc4e 100644
--- a/sound/soc/dwc/dwc-pcm.c
+++ b/sound/soc/dwc/dwc-pcm.c
@@ -253,7 +253,7 @@ static const struct snd_soc_component_driver dw_pcm_component = {
 	.hw_params	= dw_pcm_hw_params,
 	.trigger	= dw_pcm_trigger,
 	.pointer	= dw_pcm_pointer,
-	.pcm_construct	= dw_pcm_new,
+	.pcm_new	= dw_pcm_new,
 };
 
 int dw_pcm_register(struct platform_device *pdev)
-- 
2.43.0


