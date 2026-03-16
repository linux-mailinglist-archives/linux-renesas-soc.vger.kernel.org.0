Return-Path: <linux-renesas-soc+bounces-29441-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKZ6E/9qt2kuRAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29441-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:29:19 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BAE2940EC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:29:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D08AB3008C2B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 02:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CC930C37C;
	Mon, 16 Mar 2026 02:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ofoiR2gZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011018.outbound.protection.outlook.com [52.101.125.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47F030AD0A;
	Mon, 16 Mar 2026 02:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773628038; cv=fail; b=tPETM3fZ9f7oEGf9NU6FFn0n4ojAO9z4Mp6pixhSfynHapP3vRk560ZMCTOeAPFjAmVAqbjSkmwvEPXHXQbKT2g5dM+LUtOmErZwiPnX8d1jQDy3QnnIe3m91aEv0Da8xjmXHKJMaMs0gav9FH6wm83WZH7LLVEBTOfdRCSBPyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773628038; c=relaxed/simple;
	bh=ZlbUkBMtPEDxEHOSwtFSP3aGSxxeAIsWbnVq1+ht6gk=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MQ7MRTHXMhtUw6s10xX1Bs+FMeCTJl0qvew5AEEcl6FaVORDdQjtJQNU/Kvmsg1GDS9Q2UpR9/yUxP5T9ZzakYXjpr0VfKyGFd+bdufaAU81CDfUoMczszy6/3rW5aDzMdQOcRtuFfORMfPax+RK5ElTlNfckRn41LeUH6Wyef4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ofoiR2gZ; arc=fail smtp.client-ip=52.101.125.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J23ULC+oCg4ZzOJy5/d4jJuhBBPNdpsingRc+5HSAdEy0QI9WTxDi4OX78bKfLFNHqy9PmB9FpPcbqbh/vgVSzljUVHdI+jSnfYBwvVeAK+0OFS+8UCLk604oa5jPYjyI7vWl95qRt50sRIkjhAi4/CSw08kkDtL++r0KVnGcnPXfIY1nV9qpbcvpDLQRePlh4mTZcGkABgrO5cCxrL5BNbSdvmO7T1xS6bn6kw7dAKZEXb0bNoEpu6aEFki5+hhTlV/H36h8kFpaU+kpQBG0xQB6vgbFvgrCk6nVmu420tD5e0+V5ejEbUm2kPZ5+0OOanSu7Faj587hngwfdPWEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HA8AKR0CYDRW3K8uOtMzRifpIiS7uycfQJy2hcR8f4w=;
 b=WFowChp/drmelEl9Bq+ETePgUrO7TKGgNarmNeICtaaMigtSnYiJdxAkQouvcT3KXXr0GTFMu+94QpANuCUHv7qV53IKsgw4w3POgfZ0Vs5Gm7r3UD0nilys3VXRpEnVuAQFKO4fXcJntiA35W6HeJVjuJPzVxswiJHYy57vivvFwQFOmFqK80bH/nRorpLqfDt0jFzKSS+BJ+mIyETL12e/zSRG3GFVOpmDcCOWUxtqrxvddhNEmRCU9J0reivl3Y0BloBo+EyY5z0qh0sMk8a2cMwrjiJSTv6LXJ8COHsZnjitA1gihc87gq+lFlkEbb23SS64vIrB6PTS34bi1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HA8AKR0CYDRW3K8uOtMzRifpIiS7uycfQJy2hcR8f4w=;
 b=ofoiR2gZxYbUnDIuQ1r+3JvQ1R5qgt0q97xcv+ePtV5nVm3JbNK8NL85pXw9gU+afrNYg+/N9ZgnXGOY3uujvpZAfHwhCaSxtfZhLzPhCGNcDBHfQFi4awE84UiCMB6lDVHFe16iSbeThuYx7pRAi3cxgVUCsPLLrrk+1W8doQc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS9PR01MB13205.jpnprd01.prod.outlook.com (2603:1096:604:30f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 02:26:56 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 02:27:06 +0000
Message-ID: <87ikawjypq.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 20/29] ASoC: samsung: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 02:27:05 +0000
X-ClientProxiedBy: TY4P301CA0101.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37b::8) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS9PR01MB13205:EE_
X-MS-Office365-Filtering-Correlation-Id: 99ccec24-84d6-48ad-b656-08de83038430
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|921020|56012099003|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	Op07Y2DQo8ltUf2AFEC6v+yst65zd3C2Pi8hgsVMGuIM9DY/BWbpSVprqxuJMk0k2eDA6KdkNamcmnZqU4BHPjTge9RKfXtBetRDp50Yo/Itj1kMWyNfq4GtejU3UKeEtbim5k5QlTa4YnsTf1gl3xyqnBA445495R2NcP7diNoY8uuXGB0jkGtx11pfA3r0RxfuQzjK20ZCj0/p+LXcLW+3PQnV894f6WCzvf0ULWcHrLhplGebuYpQkAdwTgYj+678jJHMjTnUKEhkr0PGQM1DWgvP4vDtZShv1epzmaByhue7tAwUJKeaBx15CX07VoLUB+MnRUD9F7wxapn3MUcatbAiqtIOfUbILJdAyzQqOE9kEo9tfaqqBU+Eg9p7e3Qz0ATRw4QnxkP8pDfobiTi9e/+JEkj2Ek5FDCotpIrYYmypP1LTQpIk2/XRa5CJtngaKeS3rmVYfJ5D9T9TDpHcdyLl0j6d63kDiKqcd9XeyVHsPPSVln3Kuo7f1M8Pu4s2mhChy1Xl8mR4Ing412W35euezzWeTeDxx7zD7UyS+x/PCwiw0jEVs7g1tpfTWm6bT/xXSq694k4NB875szjKUucELrSKHfSjZZNeAwyDzTlMvQpr0U1Yw9md0YuguXb2VO9Rb4gYPYAFOCVmSCBH3RZ/F0sCzQxGPcQNyExsMhjeTD5nXv8vQILCWQ3SHGqBP1n1ONG5QvbgU7O4sux0QXLbSHE9lIBlbdKpbZyEHkFBS3JqB6luPOMyhYIf39IwED/pQ38WQEP/kalqjpeEDn5fpSwmsbd0qng10IdkkMByOOjMlZ2bg+EgdsgSvZUox9bscgg7utYg4HEHA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(921020)(56012099003)(22082099003)(18002099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bzd0YFftpnHnIl5kD6xIrZdnbb4IULeWbGf4X0o5MaUNR/BuvGcGN2/JbI3c?=
 =?us-ascii?Q?0i80DDcf2p/pAdt1MeWzC1q4KU8uaeSLAR+BKjZeYjY3CtL4x9DFAK5XTp6q?=
 =?us-ascii?Q?J0foDG7bBTgyDTA62rWutxp5ZwpqwKa+xdl5IboKPoPETDL0+sUZ3I83Anec?=
 =?us-ascii?Q?dDaQ930xYZf3NFOGroUpO8tnh5p1YP4iRQFUjWcjGJ4i+P47nGkW+Sd+tRkI?=
 =?us-ascii?Q?HhhfUW9eAW5v1ZfbJ1W5XwwuZyPZlYSqYd19DxkJ56lXhUFlIz+shVtKFGHe?=
 =?us-ascii?Q?a4eugIOF9tX0/lOx3YXxsdlN1E7e3BH/JVS1WlxKQdX/KRMBpN2T0ZpUpdxu?=
 =?us-ascii?Q?RJyntwhBNb98EiCf+xozXXCoaAyXfxNUyVX/KN8jLAVmWmjXos7240QkWwcs?=
 =?us-ascii?Q?yiha7GiJt10Rnw5i+2t5lnLkd8oIohBdsisjQE5LmW+Ul/ofnrSbg6Yq5FhD?=
 =?us-ascii?Q?zwcmbE8cWG8XR0q4G03AkWxrWG1Tfyuo06HrIWq5+EtGv4eGAimkOs6o8TZO?=
 =?us-ascii?Q?aWofgUHtGpo0AzgeWxeoPkWJ5bGxw8RqGCpxg8ab2SIUKwTY45ubHFc1ThcX?=
 =?us-ascii?Q?o6ds3mS2AUTmGoQxwKbumTDj8SaJquA6fDA3Lhxwe7KnnhU6aMmkglEGy+N6?=
 =?us-ascii?Q?zwsLb+YMZP+01ehbjfXS1SIEc4gg03g/YbB/WMBkhuXGX9itn82mQEYolpUr?=
 =?us-ascii?Q?k9GxHRFWwefIkKrlrX5CEPSeklWNMNDh7jPR/XQCR1VySD3jhf8NDYVGW9OF?=
 =?us-ascii?Q?39V1/79GKzR5cd9Q/detQfF1UCubJA+mJlM/LZAbp9QOqsj7/mbzQ7RwE13D?=
 =?us-ascii?Q?D1z1Ahd9/SORh8xW3Io0IFk7HBqrX0oSN6mcBu/2v6tcaX1rEL/KFRmwt/OC?=
 =?us-ascii?Q?HKVThYCInWWyZmJF4ahVyUjAXSjWSWWnxIwsPGhbLLjGroA3xDorBdMTDoMR?=
 =?us-ascii?Q?UIi6fLXNc4vnvRF1tRuVOp4GRczLu29h9WGOtSEzrp8C1yvTzqaH65d45bAm?=
 =?us-ascii?Q?W0iC3H54U9LbeuLbPjjOTsEnfYAOou6ZkPWgwsDES5FwaLfXmY4Jl27MtgX9?=
 =?us-ascii?Q?hpl5n1o2sjLduYhtn6EZ/voQM+PGsBr7MabgCHWhc7aPkRsUJI2xixXMoa3o?=
 =?us-ascii?Q?E0FUtPnNwW0jVZQjn8zYvXhYkTC7c3jfbZp4IrAIFh3N6i3rmBHAafPB0YHj?=
 =?us-ascii?Q?bMd6kriAQ9z6/wV9idyC4QC8wkos6iKyqELYNiw2IDErE3sCIHF598IFeWZY?=
 =?us-ascii?Q?TatB8awaFDsP0cwPLhlBP1U6ZavO709aViIQb0cdQgfQ1f6q+mI6xBWpJTHs?=
 =?us-ascii?Q?Ukyz2T/2o9zcV+z7izkc56W5eicTzyz68q50YEX+we6rJ+F/iFeRZ6sO6uPJ?=
 =?us-ascii?Q?QH1J0MfFqLhQ8V/2CAIK2npNnPvKpgunphqvKJLBRAvj6gcyP3pX43TcGGKM?=
 =?us-ascii?Q?sZfuP1MBc1Wmnhvwr/aKhDksNLU1MjlTB17ZUEt4DpCMV8HAeurcqQbvQbr9?=
 =?us-ascii?Q?Kk+Ie4z4pwWFTciRT686cmiSiJuA6a9+L9AF9bTcogGYrNq6LNwJtkjNp15l?=
 =?us-ascii?Q?+y9aIqlOYgQYxcqxtUpp8Vh4FKO6ge0Qvl6XYnMwTkVeLCysbny5I/7AE31x?=
 =?us-ascii?Q?+L5IaA21vqhado6jR7nwuvGf9YCJKeMBr9iKMxuvPVPiQGUpx2/kp/rPmYYi?=
 =?us-ascii?Q?2Ql/IqQ+wvi8xU4q3cUIbPVnZJcfJq70QrWF0foRTjBVCjdDGhYlsb5XY9JB?=
 =?us-ascii?Q?/r8b7QGmWsKCgUar8AHT/p3ZNk9EBiILEBFOJjPlJivOqlQRJqKi?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99ccec24-84d6-48ad-b656-08de83038430
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:27:06.0607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hLBzJF5xbYBoPK/5LDyYogylSyBrhiErT1a3cfDjLpAPMzX7UbScM6zI1G4miJuEEIEDCMR5y0moheSlZ1bP4aQ8nlJS7uC5sb2TccLfT0YfSpr8FGxCwIniJIrKJKD1
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
	TAGGED_FROM(0.00)[bounces-29441-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 32BAE2940EC
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
 sound/soc/samsung/idma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/idma.c b/sound/soc/samsung/idma.c
index beb7e09e9fac6..cb455ddce2532 100644
--- a/sound/soc/samsung/idma.c
+++ b/sound/soc/samsung/idma.c
@@ -399,8 +399,8 @@ static const struct snd_soc_component_driver asoc_idma_platform = {
 	.hw_params	= idma_hw_params,
 	.hw_free	= idma_hw_free,
 	.prepare	= idma_prepare,
-	.pcm_construct	= idma_new,
-	.pcm_destruct	= idma_free,
+	.pcm_new	= idma_new,
+	.pcm_free	= idma_free,
 };
 
 static int asoc_idma_platform_probe(struct platform_device *pdev)
-- 
2.43.0


