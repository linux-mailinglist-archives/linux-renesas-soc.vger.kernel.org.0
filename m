Return-Path: <linux-renesas-soc+bounces-29424-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFagIeBqt2kYRAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29424-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:28:48 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7074D29408A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:28:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 359A5302EC96
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 02:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC6930DD0A;
	Mon, 16 Mar 2026 02:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="XUTrUPu+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010002.outbound.protection.outlook.com [52.101.228.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE4D263C9F;
	Mon, 16 Mar 2026 02:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773627916; cv=fail; b=mx3fEUiR7L+NNd89+A/n1CmiSP7aTpdd7JzyXXOqmDZyMvMAPAfhlYSjx0N/Au3/a27VTkrjou7saLq1hqsgCc+M8FrCH6Tc0mXeDYbYXcDjs3S/UK/5byrDQm0y4o7vih4tSROssnkHoYLH10EKNq7bOxpwNsDAFNU6MdIC/9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773627916; c=relaxed/simple;
	bh=DiihS53u2YcSunu7B7kvSRTjfck02Ql4L/fgTYVZfgQ=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=hF/q7kdNCLfm0E2FEpEkQfsUO0c54izvQjX6ecR6gFkYN9gbogwgseGLtZhGxCdY13M+5WQDHsBv3JDy6m8DlOYcaAdfZdM4CpvwXf9gpmDmY9HbpLnS/ZHjgoAWz4nu53I193HryFRh0w0rQ8VXUNwAM4EFAxyOW639IAswsWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=XUTrUPu+; arc=fail smtp.client-ip=52.101.228.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gD0t3SoIt3n+FKp8AG08bmgVu+JpewS1YLr3H1pugtmFVCdEhpwuO86o/EGPyHwfNsq0Ie2MGenLQR+sE/OLBZqgIKa+RpUBrSgnKKSj2c3PYoUS+Ybd2o1eJygYP1w2N9kUKfxm0jV8v/RIR7u2VUXbf02rOWnOrHp5fiqQMv44x3ViGb1Vldk6NpYI26AaKhAUKTddmRKqmZFuPG/0hPDSJXaVneW87mOLLnXplfSZ+F/e1+a52ytbwx+VibjlsV5tNf7ZSUne1quQ9FVryS3XBjmYCOwmFGF8J2Zlj0Q4L6SIbfWPOr6agwh+j0cGkBCNJwRK7Tbo4HzeJLLC0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3+6wEnhX8BkNMU1t+V3TO2rHevwZ5TGpU4SYoOifLM=;
 b=BUzz5MDlRVURYeIbq3trjc+LhSpsz4imYuC3MV57RXSLbsabGea1tUMSbXzo89dIGny5jwt7XC+xpUrLoA0p8So4ZqdiDGiTXog04n7xebqATIFbg5P42icQxMZjT5/qm2u3R93RsVL3Mr6wrJl/+rizyZsQsqfyFBXQVm8hxztmsROTHNSGn5P8S9Ctxe8qI5M4DX8vrbNhfwzg5fQeA2UdCEicJRYGw+B/DZsDIQc7jrHjSRCIdxSh1N2U5vrOr94QFe4DT3NpFPuJT13pKZL4HEtoWkEGY0tt4EMGuO66oKM1MiI8KO7/xxDp3H5IiuzZ0bj9iAr1Cx+2DQcIlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U3+6wEnhX8BkNMU1t+V3TO2rHevwZ5TGpU4SYoOifLM=;
 b=XUTrUPu+0Mbgmy54fRxb3fu04Q4kBg/r/f94nzNdcrmkvOl5aNuCwLBMIfg26wG+YLJ3LPL+rZwDDN6vX1kvVrgez9nXUXKocxSFBaFkR5ntOnKRD44sxigH4r9xLVvozGx6cXizxgIBcHKu2ig4wcrUUoSPlkXe+k13R/rM2TE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS9PR01MB13205.jpnprd01.prod.outlook.com (2603:1096:604:30f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 02:24:53 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 02:25:03 +0000
Message-ID: <877brclddm.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 03/29] ASoC: apple: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 02:25:01 +0000
X-ClientProxiedBy: OSAPR01CA0266.jpnprd01.prod.outlook.com
 (2603:1096:604:2b::14) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS9PR01MB13205:EE_
X-MS-Office365-Filtering-Correlation-Id: 25709f4d-4c36-4b98-4ecd-08de83033ae7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|921020|56012099003|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	kWnan9zGrsgA+x3zH9ZIFJAU0/I97RG1GXpbEfnCtlEQ9v4WNX9BeKBhZmQFhW5mw2eJH9A7Z4OU6PbvhIikH5gilE2v71HWxAKVjirzbehMMEkAlAKm+WW9gk1grrscYxI0UkoiZy9ba/cc8DYXfC++6vTDbU3Gxi50b8+WyhrvuPkydB8iROIOPQDpqFEhPgnfX8n06HjthHRfRjcHaEOrjhTn5MWSK4LtIA9FDpUEMfhSlLUEItoIx5gbN1Pu1VmU29OvYWQuTduFiD/mt/SGo/CM4GZRM6M+upBEjcH64jSJ089oRs6+9eBoP3PBbb2SZA/tmRSOOMbSlgj4+pBtf8JPuQ/Y2jPWzU+EO1Xz/kCkMYglMhca6CZK/15E+JjfTXj4UcybxAr+2V0PJCalRfnfLvCSHUOhUEp6CxHbVEop2/XCODXjmlgogvp/rYbzYcjCKOZIBK7JSXr9FPI+TESIxPrKdbKDAzdHfA2GHCQiBm5ok4el4mWCk0PiBXXzY+iVLszNhUe4HwBZa+qXdUGCF9adJvBn8JD3w68EdKcFPT/ZLxJ3M5+A67iMal/bUsc+sgL4IdcksTFstbaJY9svG2APiNh6kOC82gwuX891Z6TSNaK5PqinK9TE23NxgKqikbQCdKGe2isvcy/9aKwT2Ex3wv9N+Syzii4gMCqXMfPvP0xdiAeRXIqzkQevRikOP3dYBj5azxUDFALG5vrpVRHh2nFrPloUaLk6kjlDioaILfolMgIBkFWKywmHUgwNkxbUoIPVYaf+MXTNZpGTV/Odt9QFLgoldR6dVNr7Pvd3c6D2YetshpehVYzPXBS16E3o0c7UsC+ovg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(921020)(56012099003)(22082099003)(18002099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?03fwR4drJGx8ndU+cY1IXjz+F/WaLoDpEqBPF7ZYhNsZLh5zlvjtDgckL1SH?=
 =?us-ascii?Q?70RNQnfdcY/Jpg9rngucKti+/vkzP62XnVB4eiuo1sCweCBF3dHjfRMKcK+m?=
 =?us-ascii?Q?DvtXwYAmJ15xezG/AJsuoR8idrjtmx2tSbmUWfIInjq4KKt/3iOz/PPQ+X5a?=
 =?us-ascii?Q?jyjl1iV/An79+4SUK0V/iF0OZUPIRSBHIVXHC0iaBWZS2bL4M3xsSCZRKj2l?=
 =?us-ascii?Q?+XJIB3x6tV5ExEytYWJdyN/BYw5kxlQ3/tGaRCdFwp2cs/Yym8y/PmTHzIvG?=
 =?us-ascii?Q?a9Hf8zOVnbvQn0B43zEke9BAFM3ZxjNtgJZKPex26JZq6+OcavD3ugPaoQ4b?=
 =?us-ascii?Q?+fHkzdn/C5KX91miUz25ocWbY83oNtecCV/W4JtlimG5ZFPjG7lYqYERh6C3?=
 =?us-ascii?Q?TyOAZXkGYwg4BqWH85+MmsblViG1eWpm9dzWsMFuVtu5ornYjLm5kAswKqme?=
 =?us-ascii?Q?/AeuROOVT6xNwZFnA21RG7Uf/w8fKVvco2l+QReja2L9xhdlFwYP5tvJms36?=
 =?us-ascii?Q?I4vpnWt6HdihRHb/fc5BwYHBoagBZsbe9c4RRE3sTgMT7djq49WyIFuLWPt6?=
 =?us-ascii?Q?frSR+4k4PW/mVkDuwnmb8dgRf0RJGbk3JN46KdBRC3ASWKLnagR1cSE8wc4J?=
 =?us-ascii?Q?8EDgNCSGElKqmeuf+VjkAFP6edmR4oshPykOBegVaGN90lklQPZTLHcXLb7V?=
 =?us-ascii?Q?ftRvQfjPcnu6ERg7JTbmhVOxXipRP7EVvaTrB3DXxmLdx5/t1JONGSLr6GRd?=
 =?us-ascii?Q?vWPtrWUWRBvztOdQ9uJ8Wfa/zKDgk7gE9sMpBNTGh72kAp2sqG2x/XnEohea?=
 =?us-ascii?Q?Y67wC1ogeMOzh9rl0ppGkHgqgKKVxSvuuVwV3ymVEIPYKu2Y5d+BfToUvWWJ?=
 =?us-ascii?Q?Gv067GeqiOv81igVXCpdBsvHexilrzFrJWBwT0YyW+DuHCsVH/64d+1lVy3b?=
 =?us-ascii?Q?D8MgX3YjavLP5fbe+ghb4lE9l/qTBazBac824xAgPmg22XoSE7IRWhtEr6mV?=
 =?us-ascii?Q?0qt8zDePobMfM1SBJxShC7ccBgJyiZt3rvC63huij4b/v3LMwVs+B9qjyEx1?=
 =?us-ascii?Q?FriSNkLv7+G2r1c+ydC5DU31NsZdKy1Jc8TccGYBuxbrkVX2nwuI0l0VVEIg?=
 =?us-ascii?Q?pkA+QUElKjENA/R/ienDgdGlcdq5SJHTRa56kbmMRTvSexBPPkn/otCZKYq0?=
 =?us-ascii?Q?iqzf1Vp8aFKIZFZfsAnsaJEXwgiPwgui3YRWoG1uDDuZqrWiFu3/1WUeLbu9?=
 =?us-ascii?Q?RHEQYENTtuD+T24DP4BdUvtHwzPNJiHqOUHBN2GV3QDD7/jgs6Muy4RiJlRv?=
 =?us-ascii?Q?AWTonY2T2otWz1l6jj8HxCxwd8w9EBsKwM/jX5kSxJlNykmuqELSXVvijHt4?=
 =?us-ascii?Q?MYpUuaBEUgDxEP5TKCQjeWN0Om/u+LSiwZCsKM8Mgbn1zVZqWLGEzqjla+/C?=
 =?us-ascii?Q?7PfalCVueXc15W81WqxDTKCCN6mP86i53mcFyR/Dc+4AH3LvgmoSSBtE2dDQ?=
 =?us-ascii?Q?3PJa29+62NWHBTIPlZXYoMkfh4BMZepHr/OtrncYQK9XDVjrFzugNIr1HROd?=
 =?us-ascii?Q?IQxtkh5j+Qs7spyD1LioHkaCr/+WleZCq+TnyuR+x608Km+AVg1uCffUBXbN?=
 =?us-ascii?Q?yVJ6ichV/VcOiTgP2wUiiiQp4ySp1VBGrwNhp8LmW21YXoMylsqdAg7Kx/jc?=
 =?us-ascii?Q?5krKYM+ov6/tNfbj5aBqE5tI/IG+RACV00PI5KK3nuf0TiFuMrAI8lz876wU?=
 =?us-ascii?Q?838ZpBvci3j5zK69nMbMU2BTk0wrBOWfhQtQnviZb+z9xGf3li0J?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25709f4d-4c36-4b98-4ecd-08de83033ae7
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:25:03.1786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GB9TIhGS3tddZcnMoiR4tpzHhDqv+izZ6ZewYRqRCj8v5JIJvTzZcj0qo0mzrSMtmqBwnnPPQACR69kk1aAQ9eDmK/WnelKnTS94KmmTBoXZkEwdABDKJATYSDDa64ZV
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
	TAGGED_FROM(0.00)[bounces-29424-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 7074D29408A
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
 sound/soc/apple/mca.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index c4dcb2b545912..39269cc7def62 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -1002,8 +1002,8 @@ static const struct snd_soc_component_driver mca_component = {
 	.hw_params = mca_hw_params,
 	.trigger = mca_trigger,
 	.pointer = mca_pointer,
-	.pcm_construct = mca_pcm_new,
-	.pcm_destruct = mca_pcm_free,
+	.pcm_new = mca_pcm_new,
+	.pcm_free = mca_pcm_free,
 };
 
 static void apple_mca_release(struct mca_data *mca)
-- 
2.43.0


