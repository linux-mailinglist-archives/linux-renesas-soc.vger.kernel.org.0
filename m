Return-Path: <linux-renesas-soc+bounces-29435-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIUrJGNqt2nXQwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29435-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:26:43 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30983293FF1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:26:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0C66300D94F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 02:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F23430C359;
	Mon, 16 Mar 2026 02:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NXRuaIMG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010004.outbound.protection.outlook.com [52.101.228.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CB930B501;
	Mon, 16 Mar 2026 02:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773628001; cv=fail; b=E2BcY+j/iOFfLpVdNcFDDmS1I5y3L04nbV5sOwfrmuDjzMtviMfClPWe/qBp/OlXZ4A52BXV55yF8WwHYmF8n2U9SliTkC2v4xVowwkRLu2Vpm7BtDaVDtbOQTKwLY+PTyW25HPq5vvdahY9JUISq+EJBu7JmytBZvgrhTvJUeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773628001; c=relaxed/simple;
	bh=qRjNU1DUHsq8Vf6/Vn1ieC3px1Jh1Oxig5EGtbol804=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=CPKI8KMGoKmCd1JPPj1OaKP+fb2LytYhNeg7Dazap0fMdgqQUtFRyZjqqjeQhYqqIWji22VGQOlvYB/jD4PVtbczgLx+xBWM1bMbsJZwLFYedInYBe7VmHEpJLNyv48TQJeWfn+S6M4G/FnvSNPZP81NLaWo7uW0Fg65VykO02o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NXRuaIMG; arc=fail smtp.client-ip=52.101.228.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qxhq2YQmFJoBpWvfMZKXYOdXowAxnrZqfr8thk/FFiHLBZJkEIIDApHgkff2VczXDVzmnemaI7qLbnOkExpvrX1/IIravoSxHtRvza8LqsAMFRRHY6QWu5YeC7+smzbilzXIcfnwTo40K6NavAhs5qjkTTdNl31NFKSB3+0kFSP2qeezf/bBzSdjeoaLaQj+Voa7OcNTq+t3DCnwzbui8elK/tON21lnNROHKL+funBaoSR6gnR9RarWsuhTYgMhp7oUPYgZwD39MRUL+i/afFnCI72YG4hypGeFanMBdMWhXyXZ0ylaImB2BBaf7/ltSnI4NhlU8FvlDC6BQ7GNuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ln8QyjgalqnRpZzXrXOAqPMhEfmvJb9VeyAZ4MM55cQ=;
 b=qJnW00JsIGUe7sxcBP0OjhRRazfy+yYSwPVfFPdWWPdH3pEej6YEuxCN4LOatsVaYSAX/M/yQoRMMG1JFd4FJpc/fit6xOsmbqbk78Q503WbILJ7RtH5dz9u96Jl191LX+f16nv/NLUxacoiieHFYrKoXvXNSLkbI32+RZGPIfzg3QNDywLcFxSPF3Ogq+JHC7c7fjuCKhKdRksU3yJJ7ZCF4q6Ni67jOZwGjUVT4uaFc/IWyJi6KW1bxJp6SXE08p+YM4pK8HaN+iBnblz8SB+JpybpZFvLygf6/WuvvdYrrks8HZPzwCNw9Kgxk10sdaKtb7zK8lYdaZ5oRAC+7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ln8QyjgalqnRpZzXrXOAqPMhEfmvJb9VeyAZ4MM55cQ=;
 b=NXRuaIMG2zPvhqjtcMIXP1iNghK3YeS5mc5PSyf42kuU/R6i/Oa+GWDJXqes84nMjONooPicpqlH6k8L6V0jRdp3Jbd5VAlaD0Hwu5xat8sbMBCXeBV9cjuwsZNaTYsrmSxwx4i1DSMdAgZX7MqxDwnfkvJvcMM8l1YrBUzKLuE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS9PR01MB13205.jpnprd01.prod.outlook.com (2603:1096:604:30f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 02:26:18 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 02:26:28 +0000
Message-ID: <87qzpkjyqt.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 14/29] ASoC: kirkwood: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 02:26:26 +0000
X-ClientProxiedBy: OS3PR01CA0002.jpnprd01.prod.outlook.com
 (2603:1096:604:dc::7) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS9PR01MB13205:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a936630-80f0-401b-d0ea-08de83036d9f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|921020|56012099003|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	jPHQhh7f9jf+y+qAnModxMiLOX7fRq9hpDlKapVM/d0JKqwjPTiLRRK3X42v4OmYJLQa6IwT4Klvizey+wtyDyoDjyKRmmTwvUR6JnLgiBNA89/YocSKPNDNmD30dJkoPdx94/ED3xG5nltSnd5Z/1NikPDnoAfxlepa5B3gGj6d/49a1Lx/Duh6s+YrOnKzPoO4aCwWN0JaR9YL7aSrJ2g2I9qGNbwHS0rTSPY189J+4tWY3LRc5fEFCS51EHgvuol/Rr+m+DYGppPjRz/J7OD7rlvxwVYN3zwemVlIz8maApmKFLDOhDuyl+jUD4VGkXu28PSwARiCjLtIBbxxXj5RxlItoPQXC+sLCMewdJLiOJRrOkhSphjcQA2C9uZ7GqbHG+b0aTut2v+IwjCH9uoXKP53U7npbvl30JNHJYr7f6zhn1b4ueuFJbIUqrzeAHsnpPZAuFtvpwM6qZGzGIndHxSvrOyvebho+E9Pl8wdRCBPFchZlP19+jelvisHmge4CU9T25Cr23Tl1GVV90QJ7AlTSnmgMhBGfdO3/fZRi0ZpdPKrIvfbgID5OH9gGQazCbiWTvVJqKtOFRptLJYqaEVxUx/be5ALdLOrR9uGuRwguyXg/iaPP/AezW3JhDtHJbknGb+xMzdeaTCnkdKn3zarJyk35ax5d2SP4wFIhqa+zDK9dyvyzUdP2d7gVuSgDJkaaOujGBOYeT+sSAhSLHA/TvyaT8iDTfoypQnYU1U3qXkof5iYtlfvsxt0NzMZMd09SraaURMXYw7zIEph7XDVKEIh3aVfsNqDjzz4lxJB8WHKDdNkY6qHTPeTjrb5vX9gB0hopxDuIPTSrA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(921020)(56012099003)(22082099003)(18002099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lv9fqXZ26jYGq9I78R17uz8K5xSKncbnuDsvb/2rND3h/F+8HT/tx4onADmA?=
 =?us-ascii?Q?AV432VtfJ5mcyELA4KY/jkoMfr4fUa9fT8vwHnJDr4Thi2basXimnJcuUPOw?=
 =?us-ascii?Q?TgXcOZF2nSvToExVMvzGGBNJqYJdou6EoV6E/8036VR8O5CN1J8YoWeoKF8m?=
 =?us-ascii?Q?YrsKyzQpqmNkRYdVGToRu18m0D9YhTFNFgJXBtXBZ8/B1rd7mLbJNP5IdYVv?=
 =?us-ascii?Q?4j6L9dSQgsfXU6T6E2W1ZyiTVQivm39jOXJu7+GQHQrFYPY83D/3JLfkviRp?=
 =?us-ascii?Q?ahfMNtSmu2wVzHJL12g4tM/3adK4JKT7pGEn4HFFNV3ZRC9/gqgLioR6xun8?=
 =?us-ascii?Q?2vteGmWWQ4W4FJHfNgy3gAX+nnkCI2m+b7JyJ7vbNoeG9AMYJnyGydzpSeYs?=
 =?us-ascii?Q?OQA6ptjgcFcZwaVnoO+dvSBk7r2nTU0oh2ZASmo8VVobiYx/3t0SqUjEoCH+?=
 =?us-ascii?Q?azzm8Unw0UjBlHm9XYRgkP396tXNVCpa4WYZlIEtKUhkeHnIvpABzedXI5uJ?=
 =?us-ascii?Q?qRFNq+DlWjt/ekR0BhEnMXfzOR5jVmmfYjq0zps6rvxbZrQMV/fgGA9mBHuG?=
 =?us-ascii?Q?oEyVaDhL2V8EHl0PmPEZV9Fx0URNzyWFlNDHWhn1kxBeU0YGfKdDKyfbIcXu?=
 =?us-ascii?Q?/AgLZCl+PX9HVB4VdXLkiC3GY6RuSdh4cWCZ72vdiIE7D11tsMfWMHSvJRSN?=
 =?us-ascii?Q?0WUDlcID+eOU802KgCiZbhOno6SOUJ2ICoqqwCNDDLuR4tmsVJ0oTSmeebvy?=
 =?us-ascii?Q?yvlfipkqkdbxIQbcbcm8TwQn4/fq2cYojDV218egCwekSVVza8hs8D4G6HIJ?=
 =?us-ascii?Q?6ulb6nwIAEm5SZu3fThbnNjOpJETzENebWTEIsvODe1EzE2yFWd8qIrd0UBo?=
 =?us-ascii?Q?3Sy+DOhHSar16uALF/y2iBn5aW7jTuHr8VZLIf33V2hdl5STMMsLW6fVQsYd?=
 =?us-ascii?Q?z5MudDx/2BeKiq9Qd0tXCvI5Aczv4kX4DWV4Ex+Gy3KY9m57voo0e9gMiXtj?=
 =?us-ascii?Q?02WhcEx7uBNL/RTEjGYB0U0+VjRsyj4JIGpzB27VDcs80OfaadgIIdOqy6lj?=
 =?us-ascii?Q?xXpPbbHCn+ezk2sqH6V9Rrqvsdjas1CNAa6VHtFFAk6mTcVjMMgjBZvxKP87?=
 =?us-ascii?Q?ZxyCRSqf/W92hl/VkmNEul6pVFW3XuGF/KfbzK8GMpUizkpiZlL8qNuo3s+V?=
 =?us-ascii?Q?84u1ZlfiFvSF24dSQYbWsriTSUZMmJtQ6AfdYx+jZG7xHFkjFQxayzfBlpee?=
 =?us-ascii?Q?eq8+dm4wLwrXFOcf3tzeptwinJIeuErNyN7c/IW/6DskgkEOrCGQQq5Lc4Mg?=
 =?us-ascii?Q?Yf+2Ygj+vuUJaPOAoZgXymqp17bPwPMKstcj0Ib9v9oixuHOaLeU9X2ksxgr?=
 =?us-ascii?Q?pO8ZkUy4DFZpA5fqB5UBGbhWzDrT901iNrTHEYyFjpdGMK8JUgFX58B/wc+6?=
 =?us-ascii?Q?q8+SQ1kSE2kTF3lyK3hcWkGxXj2AA7KExFQxoTKg12nc5MjJFePue1tosWjb?=
 =?us-ascii?Q?NoT07+4JJ5WBVRbFlzJboKkIwUbv4jQ32Xk8V/vDHejakN1/zfn3q6Cg0uCt?=
 =?us-ascii?Q?/lzfZ+wrTzNlHjEQfCP8FfeIa2s4Z58Emd5C6nEvdVTlf37gB3+2Iclvii7o?=
 =?us-ascii?Q?Yo394O+ciQqRHjCkgKQhSXgZjtTVhrCJroLgI/2xaId+KnCrh1ugE4k2glby?=
 =?us-ascii?Q?XP+/z4Ac8eBSfrr82qA0GxnXdPa/i7KNT//zVEnREHcqszGS12GNNSjOh7vy?=
 =?us-ascii?Q?2AY8VhrC08+IgOKzUNaoahaYoh8fULHT9DOBbgdcYGpaFlLn7zEA?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a936630-80f0-401b-d0ea-08de83036d9f
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:26:28.1953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 18qxO8YIILw/arWYI0W3Xqn4j0GQQhxp2EmF3aypVQWimFJstg7ynx8X4BwwiuPsPj28jJOzzGVFyUBtWO0mWpr9xY4NKlWz8gFolpIokC/Ra+fPEP86CJUytr4xr1uY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13205
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[cutebit.org,bootlin.com,foss.st.com,microchip.com,collabora.com,linux.alibaba.com,linux.intel.com,chromium.org,bp.renesas.com,intel.com,gmail.com,tuxon.dev,mediatek.com,linaro.org,nxp.com,zonque.org,glider.be,perex.cz,nvidia.com,socionext.com,metafoo.de,kernel.org,amd.com,realtek.com,linux.dev,broadcom.com,free.fr,pengutronix.de,samsung.com,suse.com,sony.com,arm.com,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29435-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:dkim,renesas.com:email,renesas.com:mid]
X-Rspamd-Queue-Id: 30983293FF1
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
 sound/soc/kirkwood/kirkwood-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/kirkwood/kirkwood-dma.c b/sound/soc/kirkwood/kirkwood-dma.c
index 036b42058272f..bd09cb163e655 100644
--- a/sound/soc/kirkwood/kirkwood-dma.c
+++ b/sound/soc/kirkwood/kirkwood-dma.c
@@ -261,5 +261,5 @@ const struct snd_soc_component_driver kirkwood_soc_component = {
 	.hw_params	= kirkwood_dma_hw_params,
 	.prepare	= kirkwood_dma_prepare,
 	.pointer	= kirkwood_dma_pointer,
-	.pcm_construct	= kirkwood_dma_new,
+	.pcm_new	= kirkwood_dma_new,
 };
-- 
2.43.0


