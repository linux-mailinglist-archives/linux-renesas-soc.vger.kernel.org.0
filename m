Return-Path: <linux-renesas-soc+bounces-29428-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEfKOrdrt2kYRAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29428-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:32:23 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAB429419E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:32:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4031830EA375
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 02:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B36630C359;
	Mon, 16 Mar 2026 02:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Nyx3yrJ/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010013.outbound.protection.outlook.com [52.101.228.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF37513D51E;
	Mon, 16 Mar 2026 02:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773627948; cv=fail; b=X8jc7As3+LJtvVcLlpJByjyWEFqxA++XD0k/HRUytF6m32x+5ayHbJiK7GiM6AicUQF38XayRLYB8LqwqiEqGcqIZgFaMrMUKZ+1mxUF/0YFgvVqnvGJKf5OObjNeMjkyflJG4F1vVRgeTn2gGgMcKaOKJPBIXl4iiK9ikOyFfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773627948; c=relaxed/simple;
	bh=YwB2OG5ktHSOFpEhsEkYgDTiAoGFd0vorkGiZ56Ev0Q=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=KG6UCZ60iwlFohvJ9mP7CG3VVKpeA2v8RfZ05xa9kFTNSufznrN7vMnP+kgoCNrWaYByFf1tqVky83Tvry8mT+mVgyNEFkDopxyXfh3/teIiYi7Dy1hVAauCwlnbBrVjb3wXSWoMeOR+kNPc76SAScYvIWVPULrvA0l5KmKYArg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Nyx3yrJ/; arc=fail smtp.client-ip=52.101.228.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rk+MYUfccoese7jT9zLTkWGVL+zTbiUJP3Epcw2foaZTw6hdsbWHp1+olXIKec+MBEKXBhqw67Z1vsjo5bnPOfZq3b0VkeCiWDADC+sElI9lLv5xGRdikphyQYuGa/E0PGvyYtsRnzt164f9jsMxb1/N757AJ4BOzT8Qms5xGgNkl5piezFw5A2hpFT6Cg0LXY+HQ1ax8a47cDyoP9jlLy/4rRFNhVUGXki7rjGdJWVbmOfsGLkZl2h93LxHE0Wh7/XV4bO7UkCp8elRsXPY7EXAsOm6vF+V/TTKtu+ubdjBpX17nKMY6JHHNfiswvPrafuAD5wj5o6ocwF8w4yF3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8ig7IMCW3YGor3Xw6uQmOnckh1x37WeoD1j6tDwUkc=;
 b=Xl4B6MfisDoc64QrlwmDMKUSTSldr9WshlQj1/AhRm+o+63l3EaEuExkD3yJjCUpM6hoS3V8q86/0ls85Nxyae3HojpY1tqLcLVb8GQoNPqAT3gaENKD5aiByiC1yxvMOpzfYh6C5eImtzWMCQQ7/d3JZ6XUasqyBHuZN6sdz2ZrlJcP1QtVe9bELGfi/IcqmrAjPWlPHPPFQphk9skWLJOX7hci086hrpZtBTYoyahxpSktFvsAGWScfkyZn3an4P3za+6ECPuDvB142xOOP6iQgSX/g8qnS/W3GuPcge6JauAgpUKUQ+lu8AKIA6NC8sg4Uictk2uhp6VGlb+yEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8ig7IMCW3YGor3Xw6uQmOnckh1x37WeoD1j6tDwUkc=;
 b=Nyx3yrJ/cFyLETeUYxp7ApNOVdP8LEWktEFAV9tjigiPxdS5bBhFLqtUl6+4fWttcSaxM9F2AHR0YNp3D5K7xvubc8Ctl0mYwIrX8yJ1qjiO8Iavf+6o/OtQ+bZi8+gW390v9qtE/X95Ul8a4zMLYTHEHshsY9TSPqrG+0x9LR0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS9PR01MB13205.jpnprd01.prod.outlook.com (2603:1096:604:30f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 02:25:25 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 02:25:35 +0000
Message-ID: <871phkldcq.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 07/29] ASoC: codecs: cros_ec_codec: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 02:25:33 +0000
X-ClientProxiedBy: OS3P301CA0005.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:604:21d::12) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS9PR01MB13205:EE_
X-MS-Office365-Filtering-Correlation-Id: c7baa51d-b951-4482-ce9e-08de83034e2e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|921020|56012099003|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	dX0kvCoGoWP+oV+lqON+KJKwHphGrVO0dS0Iv2IDFjyeE+uUu2tF8mmAps19N7T609QBAyLBs/QcVKqJVTS7ViIb4u9JOLRoLMWNTNS5ljFDtfnQ50Dor54B5SSKJPSeY69kfcN04uK+o0RPhDhPJ5iWX6abm+moAIvxo9mOzGBnJwpySzZUaB5sqUyiMH00f//JK1Jh3jtzZ1HbCXhIXzAJFZ/hOvqQG6fysQBapXCc4UDPx3hoSqOFYuL6EG1QfaTSFvx1L/G8XRss0t1GWl5I2yXT7IlQba4eXcynOVgZeS0kN5gthUL4sTcXNBiWLUadPPvGNVqdOIoc8AOePPOJzVAkt8nwfifeRMI+HCghBfw5eL0xj+FqrRj7sNtH8sQm4Pna5+sadgv7Te35gLbK/uZ0cwGN013LWYaRjhvTinQfnQXVfEqYazgxCs6RlP7/sQoI0SLs09Gm5OU5UOzZN4JhVR8Y+xKXfJCkBAWHMxsIzpjXsXfyNyKUjpwO2eOHTiSIaVk4d/eJMjnUgDBZaTQrCrMye2ilqCaajzFUd3EcrDeRq9zKS2yShmyLcLOrxtd/PBjY1R4Onjw8NwPesV5fkbKsr9RmH7nKIcHvKuBKBwJaIKvjgjZBmX01Iv0dU1vXUijnRXuWQiUC15bEb3+3Gx0SsarpftFYHrnyQU/HvdxP41d4AFyRDobIDXpBbTKi8XVM2liFXIH70ksRl3Nb1q9zGKF20IRZWF2aIvFKwK1PJtcyb95ykFxB0Fneox7V2vKlfJxb3GOyK7KH8+k3w6LTRqNZyVFOefsjYB/Bs4jsHjx0kYIs5TMPVST+9AI9A97Zb6vaf3WuWQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(921020)(56012099003)(22082099003)(18002099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Hpit5ru+2S/boxoc1xAtlczMCwVQEZo+3FQo2UQS5q6pgg3LEJrGC6tUb1AN?=
 =?us-ascii?Q?ncy06aOldEQNutc3TYxNtB2dsmkBv3kYj2A14PQjFmabAWWQ5Pb2UZL2FzWP?=
 =?us-ascii?Q?f5lWkKBX79I6PhraRgZQ4K/sVBXXpX0zNBWxS2fAyPOBG6pLcr43ERgvEuq9?=
 =?us-ascii?Q?QK5IvwMC/us0PSqTHBAi8bRa6sBqVTf/Cxmpvif01QlWTkU72Hwx8c/5XjJB?=
 =?us-ascii?Q?L7X0tCujCreonP8fUK7K5b15niNDJrTCqF5O95+oBoRfyBu7SZEmVLmiMRNp?=
 =?us-ascii?Q?nQavs1FfAAuj5UbkwlicsP9vwfbSbCwwmmolfuA7HaCQc+sCVlYsnfahmUcI?=
 =?us-ascii?Q?ChUIHWisCPzmuJ8OzBWLpdp6YdxiG2N0Es+npUmV+l87mUXscWumgtO0hTDx?=
 =?us-ascii?Q?zWps1WJunZd16M6nl/3NOGAHB1Rg7vowurnxEMdmOAq10TpzAcVCtM3gxQNO?=
 =?us-ascii?Q?Fp9P+GM/MkbynM9X5C/f+2czYLGBbhKiA2/ovAxkRK8N0m6pcigDmucvh3Cn?=
 =?us-ascii?Q?3jZ3N4RT6wQT0fsm+J3elp81zXhrRJDMPttnsIwj38EBIVqTkSNjfaNryRwd?=
 =?us-ascii?Q?nygqIGngDkq09qc8T9JCzdrUQyDdNg6ZJ8e8qC0ipliY14sINay8LsNA3P9U?=
 =?us-ascii?Q?hoENO1S7IQZ49CL2MK17yYGRSX2hZnwmJ30gss9pTTED6TkDsYNDaL6736Pa?=
 =?us-ascii?Q?N/XHx9mvN1aG7ufriWS4asr1pJiK461DTldYoL2KljMTsu0/nLBkKmCnNBMI?=
 =?us-ascii?Q?wackQWDsdFXYg2lExHgtS8V1wXBnz+DuaU1GjMh/bd55pH43QdFqPx41Qadd?=
 =?us-ascii?Q?SX3PBtznh2rdZ8Y6iAfOTVbd9ZqZpVl9Ir2VRxCokHtDAgShplYfbKpbYFkK?=
 =?us-ascii?Q?2fTLuA0SqxvofpOMAwboRMZQDYcuVZVjwimAExoR3ZR8tXo5YXII+oEfLr6h?=
 =?us-ascii?Q?unZ6y7APZK0AaZMhCDAMivFf/kdozFx+/33Xqstx2DS2+OkRmJQ3yeYsVGss?=
 =?us-ascii?Q?G+MD6O1SjDODphVw4rtYRzp8e0oxT+jLATNlFxGTId7n7G2ycNxMvLrIFJHW?=
 =?us-ascii?Q?NYtYptOAJPnPIDHBNMzQ9TXN8wR0wBcvC6VmYYAGJvc+Zx67XBv//S7NJ35Z?=
 =?us-ascii?Q?v+11XkaypCCsRClL0H8y1QdjgRvbQ0r1Qu5wvW9PIY3RuQ3sULrC0zN3t1DN?=
 =?us-ascii?Q?Z1WI4P1S+knV9riIooeiA4eyBEhTlDoMWiUeQwUzNf62aswARaIn3c2zCkhr?=
 =?us-ascii?Q?VqiUcu8Qn6kwbchlQh9QfhdMjM9LoHvs62zkA3LBW1MRpxD2YE1YfFcxKzDJ?=
 =?us-ascii?Q?FimCuuKGgD/bLtc78akr3mF2axpIbe/lAQ1BjdOfHILPRSfna3hk/TaWO2Lo?=
 =?us-ascii?Q?khkJt9dDWyxd6unNXjJWWGafdc1PzJUY+Qwr9vAO7NZ8dWSCUs2oi4GGb9HP?=
 =?us-ascii?Q?8tAeyspHMpiOcHzj9dPbIhlpwBbO4ySqnlQFvi8Qf9f6j5xvTWEnGpfub855?=
 =?us-ascii?Q?fj1vexMR42bN3qxJCl45X6lXluAT3CGCVONAA7crrlRqmAZZWLYcB50hm3J7?=
 =?us-ascii?Q?laDIAz2cmGe0gws9ufn6Gx0uC3SGFP+zhAZtIRr8mHiq1iAX7NIT8nVCsO2V?=
 =?us-ascii?Q?LH2chuN1DoIZnhgYpP/TZ5CLkw2l/PFYNIpkkkEMIUt3iKaFITp6twzp8vDn?=
 =?us-ascii?Q?l4tPNeQ8NxZ5kNeRdstZoqYIOQTbMqf7XHaizqeXw1OAIREpWoelQspeyvsd?=
 =?us-ascii?Q?owB8bs8YRE8zORo8kWkrGrSOw2724W88CDZugLOgxEa9a6yGKzBe?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7baa51d-b951-4482-ce9e-08de83034e2e
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:25:35.5358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RhQpc1b1ToxT0dlNqgpVF1zvXIWkOjdiifmRQQ0MVgY61Cwu1JFoWyAAqu5BUTXIerqNQNls0EQrVq2EEGu6CsVYO2TvPhrFonqvt7A6No2aKcAQ17gtPTnQt3zWpiyo
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
	TAGGED_FROM(0.00)[bounces-29428-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 6CAB429419E
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
 sound/soc/codecs/cros_ec_codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index f78a85b89d955..7dc5a7c3ca96d 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -948,7 +948,7 @@ static const struct snd_soc_component_driver wov_component_driver = {
 	.hw_params	= wov_pcm_hw_params,
 	.hw_free	= wov_pcm_hw_free,
 	.pointer	= wov_pcm_pointer,
-	.pcm_construct	= wov_pcm_new,
+	.pcm_new	= wov_pcm_new,
 };
 
 static int cros_ec_codec_platform_probe(struct platform_device *pdev)
-- 
2.43.0


