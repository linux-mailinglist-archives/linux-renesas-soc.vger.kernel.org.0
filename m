Return-Path: <linux-renesas-soc+bounces-29421-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EP8dCqJrt2kYRAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29421-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:32:02 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 920F529417F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:32:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E11D830CF65F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 02:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ACD830EF92;
	Mon, 16 Mar 2026 02:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="brL61I0e"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010024.outbound.protection.outlook.com [52.101.228.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D1130E0E7;
	Mon, 16 Mar 2026 02:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773627858; cv=fail; b=nHNQ0BcYCIyJGt41MhjogE0qMgokNkyJg7hYqwE485G0Km8mzw/PYh6hS3le5Ovs+JWyEGsjFIXv9xJBiV161ZMtNbT+Iyr6VQJ4Hia5KzpuInT2AwAIURqCxkMTDxqUqYB1w47sZqOhR/pItvu2EsEgfCVBhOMy1oP2RPpHFD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773627858; c=relaxed/simple;
	bh=6KUv4cxvCGOJBzEsoUyKkh8JH98+LD2iEA4nIh1QC24=;
	h=Message-ID:From:To:Subject:Content-Type:Date:MIME-Version; b=OZfVidWNVVkEhNUplyznXNFy+d1fZrTw6hc8oNlCyBwiwyBxlke4P8tNFaul88nwgBgvPjGZsGCUNfYjSwVJMVX8ae0jrmUf7zKxgt+ZxSgL+n9nNt9JW+vmIpW1787kMMHsLB8LsN479Dbo5tJ9VXwZp4BgNXUq9M8y8SOZAaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=brL61I0e; arc=fail smtp.client-ip=52.101.228.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wFgCLxyRbQep4R9XAgF7iOzaXSmxT9/LNEtZkaL1UBpfI1fMdPg9nwcy4edIBVsArEPVPklhBAp/KIyUqQt+zqd8EMC7D0yW+Db5Ik+8xSbLP4bhEM8sUlg1l069r6fzWf/XCiTyIyOY6+BARHym5bVrgD95Xp/btHoBupzb1NLBJ7dWMS3ATWn9v3/AaJAyI4Q5slZF9S14ucxKqVci2uvwiqfInKSB4ZQot89E7qcML8NMj+kX1jXc9WXCvpNq+agHSPTj26Tf0Al0wiKkxNJjT96wW7l5sLNplgQ8SCHVeOscSRETu0JWSPP3eRuw2EaqxXDQ24tFfSGuPp7jbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=el68S+e+ph+6GJ1nFvk3Id0kGlGhPpBWiqDOf1S+HqI=;
 b=QQ6djEPBv2QnAljhwZgwgAjQ29qQWVLAFn00B1jU5EE5PvF2GS9g9qHHb1z4mJQd+lSl7i0lTmV7YBDs4jx+oZ6JEA0AoP5MTqPAWF86wn+9pMML/rvVTYr9WTmde82LgT2F6m9qJgCTReo3M9lWemYOxumYaglaeO4/kaxnxJLLZ7nK79B+6V9HUGGoiJItf0VhmDbbDDzLvUOp4AbVtWAhsyKANgWajlTcjJVxIxMcQwJC4yu6vwMvNPINMQcCBQ6S2qSM2pEl131NWWxaTwnfsLj7smayAkjm6/zymGjECB2vqx4cMOwJvdxBKWyQjY/Smn/MO1R+ROHq3MSCVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=el68S+e+ph+6GJ1nFvk3Id0kGlGhPpBWiqDOf1S+HqI=;
 b=brL61I0el2qHbzQCEzh2PQrwyVTjegiGBaK8haWIExjUVMJshUX/jwSgGdxt9PVVzrT3+GaKpbL9ptpBkJxa6ExUy9nurX84zc/VurYYl1i32HB9cAFBs2kYVCsB1pprJyhnPJuyw8939jdlNFSw7FO2Nu1cI3kYLxoGHMEcItM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS3PR01MB10123.jpnprd01.prod.outlook.com (2603:1096:604:1e2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 02:24:08 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 02:24:04 +0000
Message-ID: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 00/29] ASoC: soc-component: re-add pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 02:24:02 +0000
X-ClientProxiedBy: OS7PR01CA0284.jpnprd01.prod.outlook.com
 (2603:1096:604:259::13) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS3PR01MB10123:EE_
X-MS-Office365-Filtering-Correlation-Id: 08a2d6e0-a5d9-42e3-eded-08de830317e2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|921020|38350700014|18002099003|56012099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	HeM08kY9AmkkYxSWeAs//if0ANiUXSCOdHPGhL6roiqY2tqW2sn0+9xKpXj3VyVhF7Asu+AJjxHnw25I9GGLfLeizrUEz9uk2kE3PUuRocTS/AWQwCU9jCRGzXwtASSw8pyZ4FrCegj2Qps9FdesB3vTLu/V3pAe0NvW6pmid2FwILxkgk1l8KkWCD5PzbnlYs8xxF1rNxJ5cktP1fPV4MbQZCo2JqbwjJCRFgP1aamSPxRDD0f/sI92Tg+kTdI7WkOgEDzWqvzjaGNfa7iGAQAE+3eQzZ05b3CeRu2reZZIMHd9WrrxpVg4unWWEm2oQ6WABIEKdwHWxyWcBLp3bf4YFj94bA0iM3YGcSmTGFfFDfR+plMI+3Tq8xuBcZpIGwijw3wPBf3epG58I9rpKmQ7lqGns38JfQqFX8A92ornrxBlX8RXUh6bNTCamrjDOp1ufDNl6qgy5ZredHal/5rtRYLofbQYFr2f5i3QdUyYfovws+YyEV+OHkMP1Un+gwkzKDmk/pc8ewCOfkcjaN8wqubXmXoJWCl3HaaTHAIh/ZoOrPwZN39bnzGMcx7XxNCjby4Kq6JZxd8dSjr/TnAstVefo9ONGLGlVMJYWZVcYhqF2nJ18rDExIKIg1vlWRbOEgDb/VNH4dD6vABIIiHBpZPZ5wFKY7uZmES5IBZ1y32KTQDG5svelP6K8IWD8vHVdCC5UoDGlxZ9sEXplmNte4+A8xvSWzP4S6nKR3zVpv+PQE02ze6sFUbkaRTbJCuS+c3hJzqNnpqcx839IMuxuIYd7AAZLHQdKpu+iMkUC6KLOir6YmkEqAsA55BbDc+TiYzDq0rsP0EfDhjVZvfytWAz87gE1DyaMBg0+r0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(921020)(38350700014)(18002099003)(56012099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CzL3a1ABb691ARTva2BPk91gghJFX9NBpPP/+pHzv20pRT56vwPnIHOgcazB?=
 =?us-ascii?Q?Vx7Bv4PhSSc2EGuQ1gCIv2W/aTKRfeVxBakHjyFe/9b+Ts+MnxcJgDB7mbq9?=
 =?us-ascii?Q?p7Dh793G9GIAs5jO+FdPJ+JEzBDAlPNDcN4sjF2+IcxUGNZ2lQSHd7iCOyVF?=
 =?us-ascii?Q?tQf0iRRkezd0wmYAECtfXfgc/lHnxx2VYs+kX50w89n7p0o9WvyTRxPSdg1q?=
 =?us-ascii?Q?Sg6S2sq2cey93qbP6x8lmZ11Jywkfh614np+dniTf+GwOlSR5lJRInpz8PLc?=
 =?us-ascii?Q?wsSCQ5JwfcrUXP8KuGKn6Oub4LLuKj3Plrat8ckZ0bqOZrwfab52cH5Xu3uA?=
 =?us-ascii?Q?9HPCLNbBDNWHA66Q62JsvXZ67dGhvunmXFlXxPcJGe2GBXB0HrJamWAsxqzJ?=
 =?us-ascii?Q?KiZVbPARgVxES9Ivto0+rg7WiNyuv/o+mvoR9EmJOtx0fy9b5G5FrVucIWIC?=
 =?us-ascii?Q?D5n22djj1j+E0Qs+FUZJ8l1yF8toPpx97sFQSEU2ISWNc60U+4G2SUCQ2aQv?=
 =?us-ascii?Q?pGAYNiSsNkyV7J2OPrXFxC5fRUNEO8Vvu1TTqPynE8zQhmkDajDKEM3PGm9L?=
 =?us-ascii?Q?3LXQua3TPIw1uDkYZtMZH4hAuAAuCWjnlSAE9I5hfsoCgZfbdN6vaW+xSfz0?=
 =?us-ascii?Q?ewELkhUiTUrEaQe2TmIk7+jjWuRkZS/kjq/kW/dr+OautOZPyf/HMb8wmD3d?=
 =?us-ascii?Q?qTES09iMNRhX/uX8ayHaFfTxjBxH4TetajAyzCQYsL5UdgrzC0Ir0gAo2Bq3?=
 =?us-ascii?Q?LrBNEoNMbBm9N2Ion0Si4cigBn24VrOC2/UhlXOh3fNM5wOsyWJhT+3tgAOY?=
 =?us-ascii?Q?9d+rBG/qUqWW1YFKgztA0jMYWi935DFYqlsWVsz/P9LDlLIjVytxOg9XKqF8?=
 =?us-ascii?Q?iWzGldQDzMRbH6lp9FeTlRsvgkATHZIIs2gXKmWUGskmHHoVMuwx+0tzhrPg?=
 =?us-ascii?Q?gmpvXwh/FNWe3hERjBHPsBNfdxyD3CjdyX8U/uBaEKr44Zq5buotndr7w2WU?=
 =?us-ascii?Q?7A9QRRIBR3dt1PYcLV17IRN/gcDNiufwdF1pENSeVwiCjARMoaraX6h+Y2bA?=
 =?us-ascii?Q?qM1FY2AwcJrLV9E58+wJ/rVBdFmtknTiMNr3+kkO5cSjVq2qg+fbT1JkXE+r?=
 =?us-ascii?Q?1mhKURP4cXfZVn2fpBMq9xIay2cEcujaQYyfNDXBdb+jASgIURg9v/xj4+lg?=
 =?us-ascii?Q?dt02p5DUs7WRD9tXaBwbvMPQgys4kZiq4Tjc3AKY4YiRI1L30IxdTRHvs2b5?=
 =?us-ascii?Q?SHq8n3eifgLXRa2WY/UEEbhOXT4baMPjniMyzld/nN6H/EPi/kSg7dBP+EN1?=
 =?us-ascii?Q?L3S9xyQbGkohGT6pS91pUBIqRh19cXsSq54Rnm55FY9dApNSdA/0rrWm3rth?=
 =?us-ascii?Q?at447+REKlXgURBXcSml9od2VC2au9jZgXQdqhryvmiRsDegU+19wfVaeWEN?=
 =?us-ascii?Q?wQL/NFRVp5NjsqrnkV56cS+ElES1lJwzu6m25ZBBz8upCFbNprMnfc+vk/Au?=
 =?us-ascii?Q?n/pzWVrYC9+TmZMP0e8rWtknxBMFGvaYseI7bLtRCkDSYdtr5lmHLlFgjXY9?=
 =?us-ascii?Q?3Aqkqb+MUOzl7/EAEal/xzKvMVXomVaIed2Nyap4tsUG0i0p20fqkMll5wFg?=
 =?us-ascii?Q?XWqeR0+WP0jRorVHYEA2h5PVOvtRxY+03vjD2fR0+3HCvoDx/0Q/nCKVdI+D?=
 =?us-ascii?Q?G7oTIUoUNSZut/fBjFyUL/Ds4EVgXJMZ29gANSyZYr9UvQ0ifi792bN83SRV?=
 =?us-ascii?Q?ohrq4UzV2B3KeiL4/rZG7GLkYcyj6NhhyhaT+sBfgnjXIuG1CB4m?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08a2d6e0-a5d9-42e3-eded-08de830317e2
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:24:04.4062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jvokzUq34aI95J/6+UI+0SkNj8sIcZgOAjCgdZO+/fdV5eWy/4d88uUqVmG2Y2gGl6Fc942IFKOBepdbPBk5vUzIZsPn9du9F89MCsSLr+GK1wOaqOZlZCyjJ83ojfIs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10123
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[cutebit.org,bootlin.com,foss.st.com,microchip.com,collabora.com,linux.alibaba.com,linux.intel.com,chromium.org,bp.renesas.com,intel.com,gmail.com,tuxon.dev,mediatek.com,linaro.org,nxp.com,zonque.org,glider.be,perex.cz,nvidia.com,socionext.com,metafoo.de,kernel.org,amd.com,realtek.com,linux.dev,broadcom.com,free.fr,pengutronix.de,samsung.com,suse.com,sony.com,arm.com,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29421-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	RCPT_COUNT_GT_50(0.00)[67];
	TAGGED_RCPT(0.00)[linux-renesas-soc,lin,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:dkim,renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 920F529417F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mark

Because old pcm_new()/pcm_free() didn't care about parameter component,
to avoid name collisions, we have added pcm_construct()/pcm_destruct() by
commit c64bfc9066007 ("ASoC: soc-core: add new pcm_construct/pcm_destruct")

Because all driver switch to new pcm_construct()/pcm_destruct(), old
pcm_new()/pcm_free() were remoted by commit e9067bb502787 ("ASoC:
soc-component: remove snd_pcm_ops from component driver")

But naming of pcm_construct()/pcm_destruct() are not goot. re-add
pcm_new()/pcm_free(), and switch to use it, again.

Because it has no functional significance, 1 patch is for 1 vender.

v1 -> v2
	- rebase on latest asoc/for-7.1 branch

Link: https://lore.kernel.org/r/87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (29):
  ASoC: soc-component: re-add pcm_new()/pcm_free()
  ASoC: amd: name back to pcm_new()/pcm_free()
  ASoC: apple: name back to pcm_new()/pcm_free()
  ASoC: atmel: name back to pcm_new()/pcm_free()
  ASoC: au1x: name back to pcm_new()/pcm_free()
  ASoC: bcm: name back to pcm_new()/pcm_free()
  ASoC: codecs: cros_ec_codec: name back to pcm_new()/pcm_free()
  ASoC: codecs: rt5xxx-spi: name back to pcm_new()/pcm_free()
  ASoC: dwc: name back to pcm_new()/pcm_free()
  ASoC: fsl: name back to pcm_new()/pcm_free()
  ASoC: generic: name back to pcm_new()/pcm_free()
  ASoC: google: name back to pcm_new()/pcm_free()
  ASoC: intel: name back to pcm_new()/pcm_free()
  ASoC: kirkwood: name back to pcm_new()/pcm_free()
  ASoC: loongson: name back to pcm_new()/pcm_free()
  ASoC: mediatek: name back to pcm_new()/pcm_free()
  ASoC: pxa: name back to pcm_new()/pcm_free()
  ASoC: qcom: name back to pcm_new()/pcm_free()
  ASoC: renesas: name back to pcm_new()/pcm_free()
  ASoC: samsung: name back to pcm_new()/pcm_free()
  ASoC: soc-generic-dmaengine-pcm: name back to pcm_new()/pcm_free()
  ASoC: sof: name back to pcm_new()/pcm_free()
  ASoC: sprd: name back to pcm_new()/pcm_free()
  ASoC: stm: name back to pcm_new()/pcm_free()
  ASoC: tegra: name back to pcm_new()/pcm_free()
  ASoC: uniphier: name back to pcm_new()/pcm_free()
  ASoC: xilinx: name back to pcm_new()/pcm_free()
  ASoC: xtensa: name back to pcm_new()/pcm_free()
  ASoC: soc-component: remove pcm_construct()/pcm_destruct()

 include/sound/soc-component.h                       |  8 ++++----
 sound/soc/amd/acp-pcm-dma.c                         |  2 +-
 sound/soc/amd/acp/acp-platform.c                    |  2 +-
 sound/soc/amd/ps/ps-pdm-dma.c                       |  2 +-
 sound/soc/amd/ps/ps-sdw-dma.c                       |  2 +-
 sound/soc/amd/raven/acp3x-pcm-dma.c                 |  2 +-
 sound/soc/amd/renoir/acp3x-pdm-dma.c                |  2 +-
 sound/soc/amd/vangogh/acp5x-pcm-dma.c               |  2 +-
 sound/soc/amd/yc/acp6x-pdm-dma.c                    |  2 +-
 sound/soc/apple/mca.c                               |  4 ++--
 sound/soc/atmel/atmel-pcm-pdc.c                     |  2 +-
 sound/soc/au1x/dbdma2.c                             |  2 +-
 sound/soc/au1x/dma.c                                |  2 +-
 sound/soc/bcm/bcm63xx-pcm-whistler.c                |  2 +-
 sound/soc/bcm/cygnus-pcm.c                          |  2 +-
 sound/soc/codecs/cros_ec_codec.c                    |  2 +-
 sound/soc/codecs/rt5514-spi.c                       |  2 +-
 sound/soc/codecs/rt5677-spi.c                       |  2 +-
 sound/soc/dwc/dwc-pcm.c                             |  2 +-
 sound/soc/fsl/fsl_asrc_dma.c                        |  2 +-
 sound/soc/fsl/fsl_dma.c                             |  2 +-
 sound/soc/fsl/fsl_qmc_audio.c                       |  6 +++---
 sound/soc/fsl/imx-pcm-fiq.c                         |  4 ++--
 sound/soc/fsl/imx-pcm-rpmsg.c                       |  2 +-
 sound/soc/fsl/mpc5200_dma.c                         |  2 +-
 sound/soc/generic/audio-graph-card.c                |  2 +-
 sound/soc/generic/test-component.c                  | 12 ++++++------
 sound/soc/google/chv3-i2s.c                         |  6 +++---
 sound/soc/intel/atom/sst-mfld-platform-pcm.c        |  2 +-
 sound/soc/intel/avs/pcm.c                           |  8 ++++----
 sound/soc/intel/catpt/pcm.c                         |  6 +++---
 sound/soc/intel/keembay/kmb_platform.c              |  2 +-
 sound/soc/kirkwood/kirkwood-dma.c                   |  2 +-
 sound/soc/loongson/loongson_dma.c                   |  2 +-
 sound/soc/mediatek/common/mtk-afe-platform-driver.c |  2 +-
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c          |  2 +-
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c          |  4 ++--
 sound/soc/pxa/pxa-ssp.c                             |  2 +-
 sound/soc/pxa/pxa2xx-ac97.c                         |  2 +-
 sound/soc/pxa/pxa2xx-i2s.c                          |  2 +-
 sound/soc/pxa/pxa2xx-pcm.c                          |  2 +-
 sound/soc/qcom/lpass-platform.c                     |  2 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c                    |  2 +-
 sound/soc/qcom/qdsp6/q6asm-dai.c                    |  2 +-
 sound/soc/renesas/dma-sh7760.c                      |  2 +-
 sound/soc/renesas/fsi.c                             |  2 +-
 sound/soc/renesas/rcar/msiof.c                      |  2 +-
 sound/soc/renesas/rz-ssi.c                          |  2 +-
 sound/soc/renesas/siu_pcm.c                         |  4 ++--
 sound/soc/samsung/idma.c                            |  4 ++--
 sound/soc/soc-component.c                           |  8 ++++----
 sound/soc/soc-generic-dmaengine-pcm.c               |  4 ++--
 sound/soc/sof/pcm.c                                 |  4 ++--
 sound/soc/sprd/sprd-pcm-dma.c                       |  2 +-
 sound/soc/stm/stm32_adfsdm.c                        |  2 +-
 sound/soc/tegra/tegra210_admaif.c                   |  6 +++---
 sound/soc/tegra/tegra_pcm.c                         |  6 +++---
 sound/soc/tegra/tegra_pcm.h                         |  4 ++--
 sound/soc/uniphier/aio-dma.c                        |  2 +-
 sound/soc/xilinx/xlnx_formatter_pcm.c               |  2 +-
 sound/soc/xtensa/xtfpga-i2s.c                       |  2 +-
 61 files changed, 93 insertions(+), 93 deletions(-)

-- 
2.43.0


