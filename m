Return-Path: <linux-renesas-soc+bounces-29427-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MO0C+lqt2kYRAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29427-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:28:57 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEC729409F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:28:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D51C930DB7F9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 02:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17EA930E0EF;
	Mon, 16 Mar 2026 02:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="K0iQsjzh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011010.outbound.protection.outlook.com [40.107.74.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CBE30C615;
	Mon, 16 Mar 2026 02:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773627940; cv=fail; b=B6ntvbYi3SKK9FpbBoC15tGx73Cky7Yovd3BdBwhfMt2xaFuHInAoWdyveg+6u8vR33hdV+VuyAh60NvBDiqYCNgTvE7axMaXPX8rmwFOta4IbREa9Z8veXf0t4k9Q+qnLFOX56eQTKlKlXL/QFru2vmoRFmwp8RA8peDNnlLBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773627940; c=relaxed/simple;
	bh=EqFWQTQQrvDcZ6uh30EvqXiBlrzon7jvf3a+yOoSPEI=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=G7QWqNQH6mHOvuK04YQ0++NSd/wfVbvXgn6BRM0+seXIcE5caxFGdrF7xwjuf+MITIjI/Fmyomu1BOglpvbhhBUjOuchunF8xLjcHuifkWOegtRdGiqo5BuUVEXYmwJC29nXbQTFmrGuJjd7jxldTyeCX6D9LtCgDejopPUCMHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=K0iQsjzh; arc=fail smtp.client-ip=40.107.74.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I6UYjP+EhObVSzMcCGT0EX+1CXF2vAZtKWJKwF785lXqGQJYQXFtdRXB3p3JvN6vuNyK00mP6595Tdbvo8rnp2elKd3OIENFpNQkIrqMWxp6QWYQelAuwvnAzWJ2gr7H+O2S2+t6QmjG12tbqJqY26l/4X6GYq5gnTdCFmDiGKaD1kY/9tLwkeC/mvDg3b9rHJQE8ZApfoQKQL2w0HcEua0z+sQYZv8EQdWelV6A4Eh5bkql48U7NTyfNRQkkEW13h7n8LQQBK15atQ8Jp9IICZze0ET9hgT2K2dmTERrFjlhfZLOXDa2YWsUyzV6gt8FTWLDKSBygtFNUtQH4q5Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYASI+5428opbgK0/bB2OYvo44oieODzXj0+KTxlPtY=;
 b=n7/WqMhDnwdtoWGF/wVHwrli1nP56sF9cRQieppBT/eauHupj4oT/YCTpE/+yJPEIC2St4ax2d2cEIG18mOojl2i6hStm8+8wL8E3yV+u5DAr8fbfZQnxxaqEV3EmrRn8vJOBAkm9ro9o1W5EyQ/BwGcqd6eb2wEhEovl5wxh5xp4IjQAA95GnKU49KpDtwmpZakRTRDxufAL//4vKlx4Xxw2cpJWc8QfrPUlqf5HjphsPh5xpGReA2FNfbesooYv50GnAtFO/XcIDBJvHFWtH+UsYAVP8V+m06TAOsl4dKhxdzUgQlLNGdnx8sJICjV4ytO0T2xse+oZnf7GDm1iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYASI+5428opbgK0/bB2OYvo44oieODzXj0+KTxlPtY=;
 b=K0iQsjzhqpBeu5BLan3+iwvUNX/VT453WQGC3oLXpzFKbjmZl+MDQvSDgxdl7y/lYFr2rY78dJWeOdlHcI5pvNwHlYjew94nOriFKDOzCPTiQmrBcUi2/effG7ov+RdAamFxOKZoUh5GNNUQN6bmwGjRazpKvtWAANI1VZfDPc0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS9PR01MB13205.jpnprd01.prod.outlook.com (2603:1096:604:30f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 02:25:17 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 02:25:27 +0000
Message-ID: <873420ldcy.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 06/29] ASoC: bcm: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 02:25:26 +0000
X-ClientProxiedBy: OS0P286CA0066.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9f::17) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS9PR01MB13205:EE_
X-MS-Office365-Filtering-Correlation-Id: c2034145-3143-411b-04fc-08de8303498e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|921020|56012099003|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	AO0IR6olskdovDHqTU665OwbR/k4NJlTXOMIz8sS3D62Ns78lMcBRG8Z6KQxk197x48VUqUaAZmMLpXTIuL6irzxr1X7o46ne06v9qIhsSwmmVD7/U9PbeC+w8Gy3m8BF/N9G4gACswrj7/1VuwZoqDxROu49rtFXmMlsmbC0C6nkgzyADKRzuUX0jsdkwkwBGq9VAEsZOMynmAjUG0KD8vzUQAUFUTQbwlGhZaFi/0wH56o/DPh4Q14YH+TE6mAC9/LxRhErk7svsN9aeZoK88XucuilDlGnV0mnzZBi6a3BcGtQC7h1r8lQ0EnQdXbWXBkXR5pXm6VzJ949WIXI5232YPEu3p5g489IqsOfxcs8MeMUUTT6WenKvilQuQqvVRJNZToweMyLsyBgmLUeDeSv9NFv22qDwdrnweDp6od+niZyjfxS2iSzP5r+jnLuCF6DtyIu2WSXHQoVt5yc3l6+9WLlfUPDkbJyKEwzhcj/W+T368ghw5gxXyiEWbdlbWDjfGIfsCB7mJvAh8jBLUIqsdHWx+r9w0Z4dbrg9yFMl86mRXg88qzKZhWQE1COlrw0gQ7+C049w1SnFMVY/Dgq9SCisOlNRYm1SXkK6aVDiLM3DE9I26UKC0ucmfBHwaGmmyk8K4horReRLpQBXFCE6RhcOtGx+iSAUVGQGRQa7mkf42vjxfoawNZ+2oMYkO1Fsw1xpa53TkHCf+H6Dq/zl+3AdmkrB/FxlF3unfkbVXzngUEfNeSimp8jE1GoZciJ2sn8QUK4geCMP2NmuNNxMWrNU3BRgrvCLBdZ3BI1eWK6qPAuGcnCbm5bk9gfX8C24zjetrrFZ2SYGvU6w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(921020)(56012099003)(22082099003)(18002099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lft3ocmHMpzwjr7kadXOiU1HTK0ROE0n44M3HxXcJK7os/yGNUQjjLysszwj?=
 =?us-ascii?Q?XeNN8S7D14ctWCpu8RN8LkIUtVpO3ymOeEuqd1fMyHRd4IIZbhDAVMmwckCO?=
 =?us-ascii?Q?Dy/gPZY+y7oRwww/xBP99la77DOfrysK4+JF0oR3Me8lO/Fu1bq4w7BGWKgz?=
 =?us-ascii?Q?58YzeurKucy7bdObJM6TEC3yItfTrG1CU7tjoZGcex/5/UYMjFRKit4Awb63?=
 =?us-ascii?Q?r4Oz9z+quaDQX9+I/SplRg5Fogix1sbTmxcDG022BVH4KBUPAvEcknGpnNzV?=
 =?us-ascii?Q?H0LWdX8RdsFIsMhjk1N7XOXmuEhSf2gOCUVgmYk5ezSSPTm9GFhOxZbdize0?=
 =?us-ascii?Q?5KbQK9hUWbCJAfjPq4ApNBGKz4QgI0rnbll6aYl+BdXDXTIXMKQC4J5aottX?=
 =?us-ascii?Q?+G5oDNew9H+SjYtxGeCSUAhmXQPylbr4WFmxFphYTkr0xh4LSS2tW87k1ep2?=
 =?us-ascii?Q?psMqOBFKLv3k85iQ3yCElis6APo7BFE1f8cMmvbuPHBT+Xe1l37HKZw039K/?=
 =?us-ascii?Q?qaI2++uaFlOjuR/UYdTm/5xi7CYAHhsG7yPhQY8QWDZEPisTHPfvAsnzg6Ef?=
 =?us-ascii?Q?+Q9eUuXNqa6y8qH/euE6dQHICvszgBCgqYJ7wzn3NOxpugVEjleBWao4ZPFF?=
 =?us-ascii?Q?Ri1T2rp3U/ySW84p/slrEICqwM7DlB6hkHesLX04kRCButpyC5TNAHyam8BZ?=
 =?us-ascii?Q?fED4qI9tQhgsEwJc9NNLtyxkyAovk8GAwfBIRAv40RHYvH/mAVkTIeNQJVgG?=
 =?us-ascii?Q?OKowKmqR0pw7cSqDiTwXsY/Y//UzG3ct9ilrIJnmZ1/1hUVUU4EnzZ5ltC4c?=
 =?us-ascii?Q?lhL2ttkqfyuBGoM757KYU0CQ3weGNbmisO4oiOe1sqga3i21orpNY3GTU1do?=
 =?us-ascii?Q?Dy+aRHP72BYrr7fN/AKlXCqTkSCaicRwQ95Ll4OOFdvLJh9KbbmQCNIEuNFd?=
 =?us-ascii?Q?9Hl5vEFESLWT2wxXXTfNrAIr+hmI/u/UfRsOCn5gWu1ysao75IPQWKlgrxWh?=
 =?us-ascii?Q?9KG73K0W3AVDbppl+eT0fVN0gM39L8TtI95BA2qro6ekgti59qxntiUMhFRQ?=
 =?us-ascii?Q?xbNVwt+AObX+5AfVuFu4bp/IKf18wAsAs1W3XPkocO7AVo/DakLgKYNWKWza?=
 =?us-ascii?Q?l0WT5YjKuKTmmPi8IXeeSGlhE9X6X6NF8g34cRvnPl6yVY/k2rzrU0qbom2L?=
 =?us-ascii?Q?rMcdKqHWR/IUY9//DZIkuSCDXnAd+4wOcu3zdWljI7+Zloqv0/8bMQwBfyk0?=
 =?us-ascii?Q?uuqr/qWbqHKoawOW6q0RA44X/2OugyGUj/o9AEMIy0K1O47AJ/Fzcx/1uTxn?=
 =?us-ascii?Q?PVIlXRjywrWkaT8clUl9ZbOoAy7jAm6OOVnF5CllsUc83fyBLz3cMHJueXJ9?=
 =?us-ascii?Q?gxpqW8eg98uCxE2GjpphRxHQv4ZG0R10ZfLklHcjCCHHoUpFucu3m5Fl0HBb?=
 =?us-ascii?Q?wsUQ8BrceRjExT15NsPTGOZbSqkPNBQaoXcR471t6d+tPpn+4EcAF0BmIWsg?=
 =?us-ascii?Q?hwWX55zOPSdBK+Qp3jdxGPlwQT9AtN4t/KCArnWsYu7RdHar8b8QbKA4uUQM?=
 =?us-ascii?Q?40xJ9J5XXeg2zHrOOZt0VvejQrR+pUcZBA2Eqxzymk2Z9UOF0Ypb8XjjL/7H?=
 =?us-ascii?Q?Y6+cODDxBr3ynzSp+hi2R6vlPOrf8oQQxawrjkFkMd2xsxHjf/5AyziEgs5A?=
 =?us-ascii?Q?COEpPDXHtrrnY/xyEeIwuGYhsarKSSZnWA2/oyDVsJTEwy3z/n+gEBJ/8hXL?=
 =?us-ascii?Q?4bx3w6S0Lxpz3tG0c9zIyrGX5Ut7TZ8an8OmowJ7pH8yZOuXUXqr?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2034145-3143-411b-04fc-08de8303498e
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:25:27.7193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XzLgNVXRMFKR7/ySFtMAR1bBxSPPyyWjuyhE1Azzo9U1TOloqCmXs8Dm+D59KWuPyPX7XeF9lHEW8GSxnhdJYTDNj4FxvssuiV3H0XAudhCFYT/sgWcKeAbAPiNzeFeB
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
	TAGGED_FROM(0.00)[bounces-29427-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: EDEC729409F
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
 sound/soc/bcm/bcm63xx-pcm-whistler.c | 2 +-
 sound/soc/bcm/cygnus-pcm.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/bcm/bcm63xx-pcm-whistler.c b/sound/soc/bcm/bcm63xx-pcm-whistler.c
index 6a3fd0d893656..a40f6bed69c6f 100644
--- a/sound/soc/bcm/bcm63xx-pcm-whistler.c
+++ b/sound/soc/bcm/bcm63xx-pcm-whistler.c
@@ -386,7 +386,7 @@ static const struct snd_soc_component_driver bcm63xx_soc_platform = {
 	.prepare = bcm63xx_pcm_prepare,
 	.trigger = bcm63xx_pcm_trigger,
 	.pointer = bcm63xx_pcm_pointer,
-	.pcm_construct = bcm63xx_soc_pcm_new,
+	.pcm_new = bcm63xx_soc_pcm_new,
 };
 
 int bcm63xx_soc_platform_probe(struct platform_device *pdev,
diff --git a/sound/soc/bcm/cygnus-pcm.c b/sound/soc/bcm/cygnus-pcm.c
index 4cb2fe10bcdc1..dc243f2dfd32b 100644
--- a/sound/soc/bcm/cygnus-pcm.c
+++ b/sound/soc/bcm/cygnus-pcm.c
@@ -713,7 +713,7 @@ static const struct snd_soc_component_driver cygnus_soc_platform = {
 	.prepare	= cygnus_pcm_prepare,
 	.trigger	= cygnus_pcm_trigger,
 	.pointer	= cygnus_pcm_pointer,
-	.pcm_construct	= cygnus_dma_new,
+	.pcm_new	= cygnus_dma_new,
 };
 
 int cygnus_soc_platform_register(struct device *dev,
-- 
2.43.0


