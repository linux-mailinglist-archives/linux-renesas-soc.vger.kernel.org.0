Return-Path: <linux-renesas-soc+bounces-29450-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAwKAmRtt2l+RAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29450-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:39:32 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D892942D1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:39:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 13C5930CD8A0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 02:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3AE230C630;
	Mon, 16 Mar 2026 02:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KW+koq8j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010026.outbound.protection.outlook.com [52.101.229.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AE130C61B;
	Mon, 16 Mar 2026 02:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773628092; cv=fail; b=S8yJ9r0Df6tF6xDpWDKhU3Zf+uSsV5LDqFthmXg/fzJ7b5AQ3LrJzDaWZHKve4W5ZqGsGCDxVvH/P+fPrZP1nut4XqLVcv/RgNRDXLGJ+zmoXsCyG6i2vthn2oXtH2BDp7EeyWr/Am2C/agsRb8iJpRs118RskK2fsxMwGH6ZKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773628092; c=relaxed/simple;
	bh=Y8ExOKRz6eI6ZgohGTx7r8RPkhzblB7a8VU0HX0PEVo=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TbcEH0Z1YUuGN0UngzrsEpCIYiBNySsZznOjp6BoR1u+65+wiJI6B5E3wzAtL9OvhD3NS7G3Oqv1EYHTto9Zcibpx+CFaKP3f2YUdkGERp+x+l4iioz/Daa8aHD6PJ/OdMLWSTtk6u1J/fdVwSr8O4lINY0WjY/+DrSy7aSqF40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KW+koq8j; arc=fail smtp.client-ip=52.101.229.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oynb6IRVeJIJOD4PHGUcbXL6J8YKWpxFR/mo5uva7Or8tFPJWTxqISEQuuuPAWhw7Iw4WqD+/j1qyuPe6MBVGWaP4b+7DSF8iRFhAoWASVb/Qv9HvhUEjpcQtN6Mu3o3zB01oVaz6TepiCBJoSjGtxkCQnVrLx+ILoq5JWsvf6Ww3MIz6vl+3QqxWsIjy0lKMlpWlj2ObGCaLAGSEGYqDb+K4E2/xBHhztZR/E8ofCa97csXeKqnhM+G9FwwkWBDypzyzdywniCmUfr9L78fD3y8Wi9ADxsnFavRoVbHeJORnU6YKz+wDENOgRGFkURJSXbIqPH5STbqW9tDJFq9FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SHPBiDE2+o1okH6Wc1Vn5IRQphFo2MXJ/Ap6I2Vqx8=;
 b=wg+kscMV2ozKUDF4q+1/yzNOaQLZNSioB5hAkCJJr57YP6LxXP0kQY/ORfLXxHjY9x21LUtQ35imC39mp+NYNMp2O+Wht2/sX4huq5rnFCqqh2v3dC1Cw2w190iw0lyTA9fBSWb+Xoeo5zdvzqMv6+hoyaMECh8ZEr1P7x+lG9ooboVxWYpip94VxUo+uAFKB6l6e+hihNgIV7D3Ynacl1C/cILDQ8c0AeMjLqckd6N6lT/x/Qc741BlwRwmjuk2LmgPXn1/KCRJVzwtdKHzG1QVhwPuZqGrzZBtFUNQX+7XntOYBiWIwtHm4l+Tqw3alh+uBuKwzMvMNikJlPEDZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6SHPBiDE2+o1okH6Wc1Vn5IRQphFo2MXJ/Ap6I2Vqx8=;
 b=KW+koq8jW7zE8tXnR1V3Ll8hALFvLnE2Ue04cb8iZNKajdD4QEzE436ArLXb5LhGKN7iC77JGE9P6b2OXFADF2vcLtxyVj3hA1ToilGfD17EGNI3VUV4CEN6H768NAs+1zHzkxW4zm1ex4BCCIKUM6IOSgdEqfb3o4GTMhupiI0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS7PR01MB14729.jpnprd01.prod.outlook.com (2603:1096:604:395::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.21; Mon, 16 Mar
 2026 02:27:43 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 02:27:59 +0000
Message-ID: <875x6wjyoa.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 29/29] ASoC: soc-component: remove pcm_construct()/pcm_destruct()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 02:27:57 +0000
X-ClientProxiedBy: OSBPR01CA0074.jpnprd01.prod.outlook.com
 (2603:1096:604:2d::14) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS7PR01MB14729:EE_
X-MS-Office365-Filtering-Correlation-Id: 12b30a03-8627-4f77-5525-08de8303a412
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014|18002099003|56012099003|22082099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	1xI/rvCRDz+P1TTHkN7kWKehyCfu4SUrhyK01oPAOglAWxaNkP4KxJHPvNu9MorC+tLqHtJuGBfU6hhIFiWuUuJ3KDaPXIWs0PrxLXvIx5z7E1Gar9s4gzb6OiG7LeTaD9dctY9RlLZY/6wxgQ//A6laCU/yAWa68k+KLlO8mNRrfEfg0DW9+z0U9RtPGh8dC5oGEjZ8t9CR3Yy57uOr2amV7lfPe08xpN4FoMLT9PW6p2yy/OXSYka0M5ZnjPbquRujVD790HojbIpLN040amxkvi8rnqbgxsVdhCta76V8UdHGnSVSS+T2XsK+Vht9BBT/kuBeQEhJln74gchtcF4pYfQEBnIua0sepbMt1a9R3KAeWf75OXPdPo//37X8w326O8ujNbOSzvOAt3KpbtsgDwpl3teg1R5Iwx3oEo+dNQYg9wNSmcQoxJa5Xv0se2jzs1soG6srxuRTpRzBeUOmlY0KyyD3VHJD9x1YSRTCCZ4NvPvky4OgcmxCMSrHHVRwweX/k/qVoX6CUL8STMXowFlT7yzRCfoDHDp19LPz2bMKbGUDIHK3D5JbEcM8HMN5i4D2Fok/qLvdX1M4TxY7dzxjtWydSnQ8RQbIbRl0egiaRY8p3orC0ftc3y787h+lF3djjNjz9XDycfrET06cBx67YTdFBpE7SjduCaxHRGjNxKZnO8jcnQNWRpBQ0dPXEIr4sgQJzi4FuCQyImNbU2UR/JaXeRqjQVY5lliTxTwgtGyzLX6wgE1i6gzF3jcgPGDV/bCxt5623mdII2kolMeS8ImBaGdmeKdVQwNvcTtCdrXgO9a+d6HXPz2pnH4RR3uxsfYyJ9ojh/XpVg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014)(18002099003)(56012099003)(22082099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LRvOd2o53Lqpz4UwUSY3XWjrA2n1VhACu7Rh1ngphlD6xChYHy/sOGB7jXZZ?=
 =?us-ascii?Q?eCU29S+umvzaa+PI+Kuee3TGfy4ll0Bjohw/wKMcvTMz+BrHZLzMYpewWghB?=
 =?us-ascii?Q?fbJz4yVrvI0c32ySPzDleeoWPTYnaJ1uABlEzsRhJ/dJf9LBPaVXCx1X/NmZ?=
 =?us-ascii?Q?CaSpgZsmCy0az3esKlF+VjFC9+U86AwugEZdHq8XIwhm8JrWT14J+4K1odHp?=
 =?us-ascii?Q?ErHwgkYN+co86+uZw4czrFzAtnMsENW2hISAHQRNBTU3GZOtRc1kiM2fksON?=
 =?us-ascii?Q?/W+S/sELO7srlKHBJ3fR4y0gKM/VJSEmArdZwjXL2jcPGxcaPmYsXR266EeK?=
 =?us-ascii?Q?/S6JCzfmpmbDMB9wEFldZS65+HxL7sPaqFScoulFqPt3oqypIzuH46j3fe4S?=
 =?us-ascii?Q?qfdqLGyFBxJtf5BzdwcDnUHzapaelrQOTnaE/3j9F/VHIh9o2o5sbTLzPUPf?=
 =?us-ascii?Q?ZTnggSmzv6MDaAV1iy0SUML1KCD+CAOhYcjqh9S6YQEIVAsf0GJvOr+wWnr2?=
 =?us-ascii?Q?oZ2Sg7sWr3dsaj3Pfjcc/SWwu5pKCHMGNd2SZq7kp9WXgPXv28heKMkngdw3?=
 =?us-ascii?Q?DAC0PNaOUbfA9tKtzi/s7xx6obyU8XC6ahBOlFLhpuWaLkYv2iakVuwuEQNO?=
 =?us-ascii?Q?SMLSZb41dqNI3Hj30fn7sZu/2ilIMIS5/ga5AHaXd1vNWCVZaValBenOSh2f?=
 =?us-ascii?Q?5m9Cj2TSuu2W2PJarEN+VsUTXJIBhB1RnwdzfBZLAEAVRO/yV6ETjSrJqnoW?=
 =?us-ascii?Q?jIcCuEhHw0LTJN8Ce4ytZuvD2dXVT7yfOwx6ivUJ9QZyNtn78Eg2gn8y5M47?=
 =?us-ascii?Q?VWnDyj6P1qUd4ni2j4KNRNdcHQxcDjOyelAg6iUXuIUaxDQnaQZ9NsN3d+b/?=
 =?us-ascii?Q?gLZt+1T7nrHIJ+bsmM8uCbALIRc4xaVsXV4RdBl9cfZ74pRLUy26Fs+PizRy?=
 =?us-ascii?Q?zNKg046RfzsiihdytOF0Wo04oe5iCATvJK+1vawXzr1nyQQF9bUE6L2m/1iq?=
 =?us-ascii?Q?Fl2E2/up1tb3uX3dZjZYLjihlD4tyMVmmxd2Yycl4ivrgkM2s673iqkoR7Am?=
 =?us-ascii?Q?RhKwHKK7ftzFM5Ea194x1sJdT8kvsvxLnsmVAJayOa+gphbL19T7lj3Tbt/q?=
 =?us-ascii?Q?Yq4Gwyo2vI+wHEeqZQBBdgNqCP8Y4f+qeP6KaR/ONIGtMQD6KXWABZr7YF1y?=
 =?us-ascii?Q?KVUtyE6USd2QK8PtKalTsxl97fUlwvRFkilbje897M41TT402Va95m9nETdW?=
 =?us-ascii?Q?VyBliN6RwnILupbLASggslF0uKGpcSekw7H4fHfXDmyCH9aL3Cm99dErVR5C?=
 =?us-ascii?Q?+53HCK1nm7GgyLn5XLryK6KVPO05OTjCU8M5+ac9uC51M09kOSC9AKP4PX+M?=
 =?us-ascii?Q?QeZ9r3T6xMkHvyY0OK6vdzcF5E7rRsiSGGTbtkIDo0SQ2QTvk9YtHhK/xnqM?=
 =?us-ascii?Q?frSBIVpcOUNZ2P5oikakyXzER7XX4OTK8YXhon4Z+bBR6pTXu8QO2gf5rE4v?=
 =?us-ascii?Q?EItHD8Ox6Xk3FhWhhFdFnyA47RFwByfikmu9/hg+WjFM9hrtLLAm54J+f+wp?=
 =?us-ascii?Q?namO8jkrBmSBLSKc/nNISuA/2yk1T+93sbEqTYyUp1Maxi9njWsYdtJBHCxm?=
 =?us-ascii?Q?iL+J03fELpTRyP+chmmgTMmDlsZbj1+PoUIQqvES6Kl9B50C1DNx+bWbpLOM?=
 =?us-ascii?Q?6wT40NQcPw20+SZHmfM/dDeH/dACbHlgMX65TcQ4mIFApAhWEC4afpcGgkqW?=
 =?us-ascii?Q?UCfbpEoyZ0i4fjNWpiBse/Z9limkLInWr9ffgwDaMn0GiB+MWQC2?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12b30a03-8627-4f77-5525-08de8303a412
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:27:59.6029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D13iPk0TbzDgnBCU8MOYiGvOQASyElEbNnhLZXNo2KKIHuLIGLejqzPAn0vPcfrAMlNV47Xhct0GF97THABz7I4iyBme9tP3u8axuSQP3/FObTYAs+4DimmAIVUQwv5Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14729
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
	TAGGED_FROM(0.00)[bounces-29450-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 10D892942D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

All driver have switched to use pcm_new()/pcm_free(), let's remove
pcm_construct()/pcm_destruct().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h        |  4 ----
 sound/soc/generic/audio-graph-card.c |  3 +--
 sound/soc/soc-component.c            | 10 +---------
 3 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index e1d536746ddd4..7e158d27ae8d3 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -86,10 +86,6 @@ struct snd_soc_component_driver {
 		     unsigned int reg, unsigned int val);
 
 	/* pcm creation and destruction */
-	int (*pcm_construct)(struct snd_soc_component *component,
-			     struct snd_soc_pcm_runtime *rtd);
-	void (*pcm_destruct)(struct snd_soc_component *component,
-			     struct snd_pcm *pcm);
 	int (*pcm_new)(struct snd_soc_component *component,
 		       struct snd_soc_pcm_runtime *rtd);
 	void (*pcm_free)(struct snd_soc_component *component,
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 74e8f2ab7ffc9..18ce4ee063509 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -76,8 +76,7 @@ static bool soc_component_is_pcm(struct snd_soc_dai_link_component *dlc)
 {
 	struct snd_soc_dai *dai = snd_soc_find_dai_with_mutex(dlc);
 
-	if (dai && (dai->component->driver->pcm_construct ||
-		    dai->component->driver->pcm_new ||
+	if (dai && (dai->component->driver->pcm_new ||
 		    (dai->driver->ops && dai->driver->ops->pcm_new)))
 		return true;
 
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 41b44cd385fca..21492d15833f7 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1044,11 +1044,6 @@ int snd_soc_pcm_component_new(struct snd_soc_pcm_runtime *rtd)
 	int i;
 
 	for_each_rtd_components(rtd, i, component) {
-		if (component->driver->pcm_construct) {
-			ret = component->driver->pcm_construct(component, rtd);
-			if (ret < 0)
-				return soc_component_ret(component, ret);
-		}
 		if (component->driver->pcm_new) {
 			ret = component->driver->pcm_new(component, rtd);
 			if (ret < 0)
@@ -1067,12 +1062,9 @@ void snd_soc_pcm_component_free(struct snd_soc_pcm_runtime *rtd)
 	if (!rtd->pcm)
 		return;
 
-	for_each_rtd_components(rtd, i, component) {
-		if (component->driver->pcm_destruct)
-			component->driver->pcm_destruct(component, rtd->pcm);
+	for_each_rtd_components(rtd, i, component)
 		if (component->driver->pcm_free)
 			component->driver->pcm_free(component, rtd->pcm);
-	}
 }
 
 int snd_soc_pcm_component_prepare(struct snd_pcm_substream *substream)
-- 
2.43.0


