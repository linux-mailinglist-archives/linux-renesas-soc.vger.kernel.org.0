Return-Path: <linux-renesas-soc+bounces-29431-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZZgVHfVqt2kuRAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29431-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:29:09 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 505272940C6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:29:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EA3013034249
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 02:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC98530AAD0;
	Mon, 16 Mar 2026 02:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BdH7s4AH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010044.outbound.protection.outlook.com [52.101.228.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133D1262FC0;
	Mon, 16 Mar 2026 02:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773627974; cv=fail; b=npgPMyK4GieeSMNktZhgu0CrEM6+dZ+Wam35ogvmjb1/kWkLFCLh7tALe/iSMb7MGpVjudvtmBFPp8O4DgWExY8891RVprKvsPpW5SZniScgjZzDOX27OfwGJdfauPo6W7b1AIQjiC5leX6Tsla6tz7+elXew2uvZiyRk1dzqVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773627974; c=relaxed/simple;
	bh=iP90qlvjvO/eOgqbo0b19xafuv5LY8xXv2d9WkIN+I0=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=aczflGLeqjxBEz5QNG1qG6UietkBcrA2lasdjrxm70RMyObo31Q3tAtfGD4f3SVvWZKPYZcanOt6Qz4th+c0nEu8I/XV2bvAC78gdT5cp1j++Cv3n7VVo/V2zwhqiziLCeFr3S/UqhDdfRMjds7zDFPSU6LG5OArcZhpe7GKFc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BdH7s4AH; arc=fail smtp.client-ip=52.101.228.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGw+Dn3gmKpiReGyB7Z2rT2hgnl24Q7nQtBgXKI/J1qGXU6QwCMuEWNGspR+vLS5sVbGxRz3eNk7XwwZQO1jwwgmKN/yhIjkE8l/lRFxpPN5GPSw7+NK2Cbtop9lCTRhH2MZRf6WNuEOMpa2Iqmkq8ML7R3t9yuQi2MrdXpWI8hcy7/ghPj/fWovf36a9xwMEWaYhQHRI270ITqAetWuUZ3qpSnLXx/+Q82a6ZGCxbH/gzHYKdwjf74HDJhQKMHweUGdOGnLYRHmh/3PZhgB5dp79dGqD7kxeR7bFOjHt1lqglPDeNTlYtRX9qVmDg3XMa2lwAeRDj0s124dY3axRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ow4BqyNYhcHZnq2wMhup+3gom/ZrhBWOBBtkaoEXUps=;
 b=QQEs9xF3vFTpznQU3e185ocfsRF3P4vTSD80lNjG7xJS8XLcxG/RASAqBewRI4R7RjUnj2A10E5nTtbCFXHpYd+nbtdtQLOJi87zFVN8bnwNZKfBdizyZEVk1z1mrMnI+SsycTBDYxeLiS6RVpY7GVouTEqJEzTrqiv6N0KwUiY9tsqu7GJh9B8RWNtpnkhcIcyHADahwUvJ1VVF95XJ8g/R3pEVtiM7JiryEDJqX4jgU6NEGMLMfHYmKUMdofhgh2kmxNf3vhGrJnm50wOgCSRm32upyLLRMFOvOPPy7Ti6vEsXf57iHSpdQD/WJbkAu7P0qjZNG0rpnAhDdYvW7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ow4BqyNYhcHZnq2wMhup+3gom/ZrhBWOBBtkaoEXUps=;
 b=BdH7s4AHMNIjS4oDsm/vMWZzQEttFdQRt1mXgVInZV7apt1q8k8QqX2u0w9BGMpomzqFKt9Y6IlC3f5kAmkTxRU5lyRue22DyWj1Htz5mZaCf5UXaQh68lkEwaE0IfShOp2VV+HaqIf7lnbik+iZL4ThOFTZHCRjS5+ivP4DQcs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS3PR01MB10123.jpnprd01.prod.outlook.com (2603:1096:604:1e2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 02:26:03 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 02:25:59 +0000
Message-ID: <87wlzcjyrn.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 10/29] ASoC: fsl: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 02:25:56 +0000
X-ClientProxiedBy: OS0P286CA0046.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9e::15) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS3PR01MB10123:EE_
X-MS-Office365-Filtering-Correlation-Id: 0876593c-a683-4f0a-51a5-08de83035c14
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|921020|38350700014|18002099003|22082099003|56012099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	0dnQ7GOJXAoZiOac04eiYsGmGYiwLDkitIq3mDajRLdAqQeBot1Il8iOwrx7Cxg/4Xpvs26cfrnbJodwCTPLWYDHvXeindS2hwffjphBFPSITIRO7bPKFb+TORHAyy43iyNPnQptq2ZR5O65h44DUR8g1nNmBvKcil34o/nPGkLsIDwdUuJU+t/9Dw4qWskQtcjqu5HPjNNvFO/CzWhHrCfZp/uiQ9vr5WbsFKyea5ofPb1RMmHCvOHA9eSWnWsE8iCuVC5j3F2+O6R7ibgxLmBe2G/T+EysPUxcESkJYTOnof4WY4IrCPVTcBxLpEGkku5QWGIjyJJj+7w/N60lymMLK399QE+DSGN6CtBlNBovTHewUHeX0uej2iZYwHfoAMdbEDerHKFD1Bc+tIC154To2bd7gguMe7zAZynLzUlCVHLB0ea2D262iLoHvzg2m2CziZ/l5xAPH17B3Mmy+eicu3JenIt7djpuw1sT0uwSr2XQtEDEj8Ezhe6vzrKR3DZBVivRRROxVeVQfDhm/48Mu6YdEizEHjw4adZrTDEj6WAbdETHQNcRtXWWh90iI8Wc7y26J932zxPIAEFNWDHZbOZgmgdyVPiRQH0j8FQ/gyzzVdiiqL84jq1OGlky1PCsqF0aJq2TYm6CFtKp+AhABZfn5Ivf1R1tYXQvUloCofXenZXgq7cdLI5v8uaLHsMAgMg/ilFM4KMwT/AuaQ4n5jcPHxNz1q0cAHZgCXsRkkPTF5cgU2EtaFQq/Jy1hEoM00IzN6z3U6CB4mYnJCf/nyjasLPSJN/huuW0dAQY+eSMkQe+teI7mAQoyYZuJ9FTam1L/IR3joKy9TttVw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(921020)(38350700014)(18002099003)(22082099003)(56012099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6NgnKNA8IEvY720eFBDmJuiVOIGzfZrhXcTQOEpb05ykFFYKzt/VGvw7h4Gg?=
 =?us-ascii?Q?WFEuD3BK+uhyJk4LLP3bJiCTdBDln6X/bMdUbAClv2rbSP8lv6Gz9w82Zd17?=
 =?us-ascii?Q?s4EgPNiris0sHBN98ZRaJfXcwaU4ufcwaVA1d0moTyJNS38rbqFxt9gPwDP+?=
 =?us-ascii?Q?0BToLyjDsC3k+HwRhcwn1Ty5pjzNve4uuAjkZjEvaWAIg28sz0gyTHk6G6EX?=
 =?us-ascii?Q?YNYCB3pL38/+qBDtmpAPnNApogi/JwH2Mw3e+ibUYvpzV7RA7g1T2AIt+VFE?=
 =?us-ascii?Q?U7QkCSo26rmM9wGdSjj8uoupuRBO70ynGCWtc5jUYfBoXbvoZHNrF8CCgUSO?=
 =?us-ascii?Q?W9n5VNtHTMmLBvH4zG8FTPpeBkPg5PTw/LmqEXuJt1CqJKh/Qo5+rXxwW0zV?=
 =?us-ascii?Q?isfW8czDgC7ar79yxSMpDOLHEILS/g+XkTJAqA7tndCW4Nc7mCCjHMiaaoMJ?=
 =?us-ascii?Q?2qFTv6Ns0cOt9Dsp8heRlAVftgeM2cwpEApm3c285n7HRupRNHSNE5WV59Am?=
 =?us-ascii?Q?e+6bOcBiCgyT4rdYcc5vPVGE1snsD2IK1dEwRYg0AuGTwIh1pCcxUtmghSnh?=
 =?us-ascii?Q?pbUbEh+REjiNsJvLnqLR1aFTidciMg4NfrKrs+lMQYBpBCADMvQT/drq/fC0?=
 =?us-ascii?Q?vTuOB7buH3kwYLaf9SCnwoTyb4TkoV0NFp3ULIIIb3n1AtQ3bYmREgbCXCkv?=
 =?us-ascii?Q?vgoNap05aImr7detEQet+FbYYGmmVpEg88ynrW0PHsegAWwwvk7YhqWnDDkM?=
 =?us-ascii?Q?Rl9xl1kjqcHaWJvPpkB/jY7Ryz7TrQgcVMFZTiaQf0B1Os9ThQNiIjxOpoZW?=
 =?us-ascii?Q?3mtSac35wkUIny9LVMLgAsTkZ389twPVO8Bnse3kr4ozWFBjslkyzNnhKArL?=
 =?us-ascii?Q?PxmJyag2plF/GP6ISoJCzh/fl0tSXSQRLVr+BQs8/WQ8QHdpN+ZFDtP4VueB?=
 =?us-ascii?Q?iBjLEC0iomdNRXMtd6+VGkFJj665xaZFMWxsN6LEVzg+zoOIhuTlZzGSpYny?=
 =?us-ascii?Q?DjnegDOElEeevjJI+DcMP+MVBMO/sG6cipEnxeUrTpixnATYfEjizQ6N9gDF?=
 =?us-ascii?Q?sUTBdshzrdxtfrXkBFAZxqr3Uc6T0ZljHzjJVh81q0vMYGzhhk622cePIPAv?=
 =?us-ascii?Q?QW0JLTgfJtc4eMJI0c1mkOWkIV5XVfztspvfTAjgSGs7DDPrXLNys1A5eLpE?=
 =?us-ascii?Q?ZV7MqYaosx+oL69EJ1OSlY5YjgWVPVsZbnQD/FpNlpYxOcaI7Gw/YcfjDC2y?=
 =?us-ascii?Q?O6tyvBdedrOsAsxCdUbMqlnKiuuj/rMU9EEwPdizo6SZZ8v1O00Is1j4wYCh?=
 =?us-ascii?Q?GNmKvLFjhRS7K9/a6BMGqPVPp1HEYc4ks6+kTSF+X26aYslx1W4Z4HC00V+t?=
 =?us-ascii?Q?wCh1GY15XIK00ayQ0B3dLHMhDqR1B0kSWEaFmpqtQPvJYjecTXFFxOQEju5Z?=
 =?us-ascii?Q?ZDrxUOSrmm//rX3604CUvTTJuweA8K+PQHRTSryvojDVl345wWIbUpW0stm0?=
 =?us-ascii?Q?IH7NA/Nk74AztWcvQzwKdLHT48aSrvZSXcG3QWlDLiyVAtmal4KTju7NG+uZ?=
 =?us-ascii?Q?6H5OOrxwIBfJ4ClegQOkSyCi4u1QfULcyVnaTZN7pb/6sh1Dk/QT+eUv2C6k?=
 =?us-ascii?Q?8k0tbtpxfT75o9aYewZRxM9gCTWm2dJMJvbiFKNGP3SMoln58Lw9g56otQRW?=
 =?us-ascii?Q?exmZkrHIvvtqHZ3faO8IDBl9M0v98mZVbEJV/m+lcfMxqCMWDmMiJ8rv7nMz?=
 =?us-ascii?Q?Jrt6QLgIPgxnKS1xem6hP30Ky5UATJbTsn3ISYjbtlN6QbgLQ6S5?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0876593c-a683-4f0a-51a5-08de83035c14
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:25:58.9138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0fazlp3a0GctqIfuXbuNotvziMoGQdPmaCqA0kuJPixgKGBnnuclsyGCaJIvpySqyA5peUF1HmNZXn1QZU+yBL4nPwmgsmFmdd736Xlz7+Bd2D63p0vWyN2QNcrKs5nL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10123
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
	TAGGED_FROM(0.00)[bounces-29431-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 505272940C6
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
 sound/soc/fsl/fsl_asrc_dma.c  | 2 +-
 sound/soc/fsl/fsl_dma.c       | 2 +-
 sound/soc/fsl/fsl_qmc_audio.c | 6 +++---
 sound/soc/fsl/imx-pcm-fiq.c   | 4 ++--
 sound/soc/fsl/imx-pcm-rpmsg.c | 2 +-
 sound/soc/fsl/mpc5200_dma.c   | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index 348b0aabfa683..5aa96af994c41 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -505,7 +505,7 @@ struct snd_soc_component_driver fsl_asrc_component = {
 	.open		= fsl_asrc_dma_startup,
 	.close		= fsl_asrc_dma_shutdown,
 	.pointer	= fsl_asrc_dma_pcm_pointer,
-	.pcm_construct	= fsl_asrc_dma_pcm_new,
+	.pcm_new	= fsl_asrc_dma_pcm_new,
 	.legacy_dai_naming = 1,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_prefix	= "asrc",
diff --git a/sound/soc/fsl/fsl_dma.c b/sound/soc/fsl/fsl_dma.c
index 26ddbe867b581..b120b3514fbec 100644
--- a/sound/soc/fsl/fsl_dma.c
+++ b/sound/soc/fsl/fsl_dma.c
@@ -860,7 +860,7 @@ static int fsl_soc_dma_probe(struct platform_device *pdev)
 	dma->dai.hw_params = fsl_dma_hw_params;
 	dma->dai.hw_free = fsl_dma_hw_free;
 	dma->dai.pointer = fsl_dma_pointer;
-	dma->dai.pcm_construct = fsl_dma_new;
+	dma->dai.pcm_new = fsl_dma_new;
 
 	/* Store the SSI-specific information that we need */
 	dma->ssi_stx_phys = res.start + REG_SSI_STX0;
diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
index 43d401ae2d03e..76e014dfb6d7b 100644
--- a/sound/soc/fsl/fsl_qmc_audio.c
+++ b/sound/soc/fsl/fsl_qmc_audio.c
@@ -54,8 +54,8 @@ struct qmc_dai_prtd {
 	struct snd_pcm_substream *substream;
 };
 
-static int qmc_audio_pcm_construct(struct snd_soc_component *component,
-				   struct snd_soc_pcm_runtime *rtd)
+static int qmc_audio_pcm_new(struct snd_soc_component *component,
+			     struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_card *card = rtd->card->snd_card;
 	int ret;
@@ -340,7 +340,7 @@ static const struct snd_soc_component_driver qmc_audio_soc_platform = {
 	.hw_params		= qmc_audio_pcm_hw_params,
 	.trigger		= qmc_audio_pcm_trigger,
 	.pointer		= qmc_audio_pcm_pointer,
-	.pcm_construct		= qmc_audio_pcm_construct,
+	.pcm_new		= qmc_audio_pcm_new,
 	.of_xlate_dai_name	= qmc_audio_of_xlate_dai_name,
 };
 
diff --git a/sound/soc/fsl/imx-pcm-fiq.c b/sound/soc/fsl/imx-pcm-fiq.c
index d51a3de493cb5..e0fb4f8fd5228 100644
--- a/sound/soc/fsl/imx-pcm-fiq.c
+++ b/sound/soc/fsl/imx-pcm-fiq.c
@@ -273,8 +273,8 @@ static const struct snd_soc_component_driver imx_soc_component_fiq = {
 	.prepare	= snd_imx_pcm_prepare,
 	.trigger	= snd_imx_pcm_trigger,
 	.pointer	= snd_imx_pcm_pointer,
-	.pcm_construct	= snd_imx_pcm_new,
-	.pcm_destruct	= snd_imx_pcm_free,
+	.pcm_new	= snd_imx_pcm_new,
+	.pcm_free	= snd_imx_pcm_free,
 };
 
 int imx_pcm_fiq_init(struct platform_device *pdev,
diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index edab68ae83665..031e5272215d4 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -624,7 +624,7 @@ static int imx_rpmsg_pcm_new(struct snd_soc_component *component,
 
 static const struct snd_soc_component_driver imx_rpmsg_soc_component = {
 	.name		= IMX_PCM_DRV_NAME,
-	.pcm_construct	= imx_rpmsg_pcm_new,
+	.pcm_new	= imx_rpmsg_pcm_new,
 	.open		= imx_rpmsg_pcm_open,
 	.close		= imx_rpmsg_pcm_close,
 	.hw_params	= imx_rpmsg_pcm_hw_params,
diff --git a/sound/soc/fsl/mpc5200_dma.c b/sound/soc/fsl/mpc5200_dma.c
index a593a95aa532e..ee4fb5c932cae 100644
--- a/sound/soc/fsl/mpc5200_dma.c
+++ b/sound/soc/fsl/mpc5200_dma.c
@@ -307,7 +307,7 @@ static const struct snd_soc_component_driver mpc5200_audio_dma_component = {
 	.close		= psc_dma_close,
 	.pointer	= psc_dma_pointer,
 	.trigger	= psc_dma_trigger,
-	.pcm_construct	= psc_dma_new,
+	.pcm_new	= psc_dma_new,
 };
 
 int mpc5200_audio_dma_create(struct platform_device *op)
-- 
2.43.0


