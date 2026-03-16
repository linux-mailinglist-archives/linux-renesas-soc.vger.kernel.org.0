Return-Path: <linux-renesas-soc+bounces-29426-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uICCMOZqt2kYRAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29426-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:28:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 66269294098
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:28:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8F3123095E62
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 02:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61FFC30B53A;
	Mon, 16 Mar 2026 02:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Ll4P9UTG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010027.outbound.protection.outlook.com [52.101.228.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C268430BBBC;
	Mon, 16 Mar 2026 02:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773627932; cv=fail; b=MoIv9aJMS0awiJstaslSftSJogmQpAGyLx12d1ofyNor+FZiwKsaCHMhV4FOE4CcYWXH23cIdn+xw9pfdmJJ0n2cK7++uFOgaLPzdol3LfDTe7ZtAtDwoXNZ39vNgITva3so8JOOzG3VSbJkrvOIZbXvnDYHNNogfgSAEnGDfRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773627932; c=relaxed/simple;
	bh=QFml8fHQNahuy6YrLUD6v3kWMDjQZoCTOrvyNLIXKaI=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=iozrz0rfFIYRd737qezlB1JPK5cw9edQcysOGXDVYS1xoseiAHqfVVx58NMNx7fXUW4nFRGupwMxDZwQHOb1Dzrg0F6OadzcnbCdGJQM83wg/YhzgEAib8rKuVqui/u3wHNFwt+0pkHKhGqxAi6+txr74jRx8hZ7eJR1lTargII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Ll4P9UTG; arc=fail smtp.client-ip=52.101.228.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PWN/UO/RWuQ4GzNnogzLa09nj4BvSfXNBUWfaCD1wnVyapk1VFONyUgnWvVrIYbopQbUFI4h14buGCrEIMUsHtPf6YF75ohIibLZq9DqQBDgxfIkaA3eNN9Ya2RibmI5Vs3RpJesDnQcohtmDoSW+bhNixbj2QtGTBr9W44IG6iVvuxxn6y04kAkPgHy2WDMpzeIIhdLJC/aUOarrL6+Un9+BzrnPQSBwHNx+AQgZNsDpMvLD+obsnNY6xyCbcJCg2bVNyY513SMj9GKSlwwTk/YQ6IpWsykVTFwyuLFTzCmmEVGCDhzNZ2PUU3hlFTNsjt8ybSsvo+pIfuTwOPFxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mf+mciFQeb+aZK2GRdc3fY4cD0obBgqM+Y2DkAFEsv0=;
 b=E3jr9Nao3PxSiGNNi2rMmhQuglCj7Qj9JloayI8wx4t/y/NnFT8cl6e55bVVPLL43rLYYJohcmtAfHFk96DSUuBOO7ddiOhuezD0PFLYNUZLaTytNLv/5RwcjiMw2ImutD5THcK7XDyo2zP0rbgH/fqcf/ctAT9YEc/rXbbXOf50oVIr+wzUGxKug5wx5/GaLHLGZKIne50eOqEhXIf88B/Sm0oLI7pTiOBYLE4tR/Z9Sk618ZrHkPoXyzUBIaXqsx5UsaLlt8S00sYsRg6t3vULLoahQaQwID0EJu2vz0CF+XFyAc+anZi4i3VC5RuzBZX3v2GCNWKqotpriVdL9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mf+mciFQeb+aZK2GRdc3fY4cD0obBgqM+Y2DkAFEsv0=;
 b=Ll4P9UTGlj5aqLdu/rdQQviMKDuXbi3xVr5v1kTDg4ETnGQvoQqB+jBbBOFZP4PpQrhkP8yppCZCf4LgMuX4Cmf+/CEkczbab9VYAQMjY66KRFxmvyFWELctszCJXQ1OCniwxQHmoKV1Gl3Z17qocPY4BNGfbupHlm6xHB78Qu8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS9PR01MB13205.jpnprd01.prod.outlook.com (2603:1096:604:30f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 02:25:10 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 02:25:20 +0000
Message-ID: <874imgldd6.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 05/29] ASoC: au1x: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 02:25:18 +0000
X-ClientProxiedBy: OS3P286CA0080.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:1f6::9) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS9PR01MB13205:EE_
X-MS-Office365-Filtering-Correlation-Id: 9096faa3-c3db-4324-1fac-08de830344f7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|921020|56012099003|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	riCtjVovQBKSp+BTGOaOvll+il2stQtmiqtbUzGCKoAKVoIB7PU/MLS9jgYJsOe279b3Ug1bKaXnMVo/bt18Lf4Q1r7rAfE1BGlIwxROvyz3ayxB+6m4HnqwmZjiI5BCHJp2L1vxU8L3UZKiUQrm+uDvCBwTnCCzoRPiftfQYD2gakSZkGduv5H+MqrLrk2fBy88g5/byehCRO8/1Zfr0qB7q8QNP1Tk+n+055MndY7p3buGSVAWPsic79B6pAAOyHI7CPFLLF2GMiBssjRaxqgMNS/oHEuePUwJJTJHvLIzq5FezwvcVOldFxK8g1hX8fchf/oyi/TIPsF/V4fw9QCUwfze58rNKsxMwdHsNE2byK9xtalxm4yPWNg9wLn2e2zAhzOewejZK5MLnL55SbGrDExvodmEm9Tj+0bRYHjaV2Z/vadRj9UUp5eU1jdL9On1jR0PTQ9R1pvhdSa0P/AgkfAa0h1NTMV1M5oPUjkD4n+pqMwbxHHUpSQEp1DLvUiQO8/eRJ3uQYxpiEUf6S9w0SLidBKCx3sCXbaL/J46P2UX5A24B0bhQaRvoPXJpPV862rkQrAQOh7hBSkNYT3uC3Z0fT9jTxgXvhtqYjYZxjmeg7MgX8B54YrSIt+0hTvHaSkLcsow0zX+6GKRPNmfbihVpE/OYqGj/RYjyZwqSJMMJSeRL9lpNrh6tySgfKrYBWk049VIYoWQ4Ck4TxSDOIWGO0ff9ZPsDpOvOJ0xSZ4bkjbZpaOvlCjm8e3UFnLcSGcQic4T4SQxOlRPauPzYh69ex+jyGoDn5n8Ph5nzjgXiG5DlFMpytA/pJeJ/Uek+5HPaHliAyVcWt5L7A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(921020)(56012099003)(22082099003)(18002099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oZXQ4tYysgM9/WNlUGjj1vPm0gt+Df9IuzE1EyWSseORaeJ86SXkt1GNizTK?=
 =?us-ascii?Q?49cuo7oL9xb4FwSKtKL6rov3BN45P5YA2JHaVq99oFNqEhHt7GhgHnUp+ApU?=
 =?us-ascii?Q?NXh74P6K3o38Q8KxVQIiycrraJjdltdg3O1wPb/HYAf3CvioWLpPJXN3bI80?=
 =?us-ascii?Q?r+Uqwesj1y0UubC/ByFcOMrYfqBRfBgX1Cl9s2d0tGTCaqAPmOVgxudiygYn?=
 =?us-ascii?Q?ibRo3AJmN9/lqN6AlWOpUG/d8uziz45WbLffAQ1qJybrOoHRzvTjGf7gBvtj?=
 =?us-ascii?Q?zSsOl6bHGe9a1SbmB6wpC7AZjGaDEoNv4XmEkhYevzL7y3kgnNp8wGt3WiDb?=
 =?us-ascii?Q?5AwVHApZ+2rN9jOpHzKHoqRdYsxuV5bw7xHft+LLqGO8LMp0ZbN6rTigttBx?=
 =?us-ascii?Q?nNxpaMIZygfto7+0TYyUFlFF+fwlMSpbuPhvyucVQ/ZJf7AKh7t+THVriPq5?=
 =?us-ascii?Q?wsW+MAjqK9E2fv1HNnHpsyZgApvXhaPVZjRTrggv3Vc2cSVHGZ9d7vAfkovP?=
 =?us-ascii?Q?v2QGwOA4nLZYRwBKEdumYLqVH3nGhfXv3pPjzyY+ZM7uGm1eo4nvNCm8VXDJ?=
 =?us-ascii?Q?2Blc5BRp2xv8QGCVhInR7mtI3BifimhXR+11w1H1liR24cV7hvwk81pgd0To?=
 =?us-ascii?Q?I878Y9/vGoJ0MspuHke+Ikn9PVGXCKcAtSKTrPwJZnQ6PJFrbIgbfnaw/13u?=
 =?us-ascii?Q?moyuqFi3QBLjWv6psWXuo1gs8jfFWs3dwOkNcAt6qR9wKUrajdIwBAXNA+Ql?=
 =?us-ascii?Q?DZwETrCFYVL6T0CBJOTT4lMI7LQcgOWwXgo5frUdCAx5XpiHAcM255XuncPK?=
 =?us-ascii?Q?QeQhMlH1fzBnuDSMJMHkBrols536tb//2vnU/BVJUcVX9/IKKh8iQ6e6eouO?=
 =?us-ascii?Q?1iZFeOpt+zk5uJuadxeCmw4n2/TN8LJOSlfm3AmwQvyxXduwMG+dViixmnMB?=
 =?us-ascii?Q?lwNZikmTb+ERpm0wGwMXpc0KSi8JBrDTOxKTe2G5yI4vk6dxDIeHhjY9dBBx?=
 =?us-ascii?Q?WFMUvEcvypDtgooSdgr9WpzpTWyxRSIbTXUI7Pg/+2ZIuGa4HhyfJ5ZjPXfX?=
 =?us-ascii?Q?OS23MauEH86kcnsMHrSRv8leVwb5dS0NA+bNztsocDIo+5uAEBCshg5oKbF5?=
 =?us-ascii?Q?M9SJ/slk/K9PhZSVg7cI0a8r2S6d8fGyif6G62kBHI+hmzqGIPg8vkLdFqVM?=
 =?us-ascii?Q?0jd9HAUZxt1l4CR4OIjvTQuyJM2mKvwgsxbalPNE5nqUc+SkhWi6ckEbM++0?=
 =?us-ascii?Q?87Cc0aloikSxDmh3y068utguPimqM0m6/NJdau9SoRDc13AH9Ajl9VqWSrTH?=
 =?us-ascii?Q?neYyM5UnRbke4KbkwUYHXNsleQdBDHp70M9vdBMA+/32mfU8is6vuvAX08V9?=
 =?us-ascii?Q?Lum+OnYkNbNZ65bbMpmkCYdNMUmyFd/rjBUvAyzpHpK13Cm/6E4QMpP2WeFR?=
 =?us-ascii?Q?D+gsTb+cW+T4Xz62DplgYUjHxA8VkiN3Qscox3+aLNs2hRXfocoUMzMCGMah?=
 =?us-ascii?Q?Qkdh6fxn+VJrEkEPzNg47D9aAispFJxz9SsZyohsVe/9ONVgJYQzEi+Doymn?=
 =?us-ascii?Q?HYMVNWltLSEIUVwqSsjN0tUXDrNzym4RMmkOd84p8hqJVh9Tv1ZuyKYxq2Jc?=
 =?us-ascii?Q?WsCgqspJdZIMT+ZxyrglIl7gXwuyMqnGDWXlP7vOx4IohgXT6krTSCdpaIv3?=
 =?us-ascii?Q?1JrdKIPzCEGuo4d6CidO+xJkI934AASZjgNLtNb8rFibJ+MulxfneODGWFvm?=
 =?us-ascii?Q?/5d2yLsyPDJBGPLZ/ennwdTah/eOP8NW2Lvvl9tPEgzPyg3kd3S8?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9096faa3-c3db-4324-1fac-08de830344f7
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:25:20.0098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZBP7bsO4JolV6V9PGeISr7xf82fbDx7laLqe32vBI1Clu3MREnyALPBBVZe9/FFnX/gmFNXE5s3bFU0FkDGYc8aGjCicPsRarTFg06LlvLoC9m9wlNqV4a3zRY/7eYCS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13205
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
	TAGGED_FROM(0.00)[bounces-29426-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 66269294098
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
 sound/soc/au1x/dbdma2.c | 2 +-
 sound/soc/au1x/dma.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/au1x/dbdma2.c b/sound/soc/au1x/dbdma2.c
index 3392693faeb93..3d10d64604727 100644
--- a/sound/soc/au1x/dbdma2.c
+++ b/sound/soc/au1x/dbdma2.c
@@ -319,7 +319,7 @@ static const struct snd_soc_component_driver au1xpsc_soc_component = {
 	.prepare	= au1xpsc_pcm_prepare,
 	.trigger	= au1xpsc_pcm_trigger,
 	.pointer	= au1xpsc_pcm_pointer,
-	.pcm_construct	= au1xpsc_pcm_new,
+	.pcm_new	= au1xpsc_pcm_new,
 };
 
 static int au1xpsc_pcm_drvprobe(struct platform_device *pdev)
diff --git a/sound/soc/au1x/dma.c b/sound/soc/au1x/dma.c
index 8d91a0e0f112d..026d9f36db106 100644
--- a/sound/soc/au1x/dma.c
+++ b/sound/soc/au1x/dma.c
@@ -296,7 +296,7 @@ static const struct snd_soc_component_driver alchemy_pcm_soc_component = {
 	.hw_free	= alchemy_pcm_hw_free,
 	.trigger	= alchemy_pcm_trigger,
 	.pointer	= alchemy_pcm_pointer,
-	.pcm_construct	= alchemy_pcm_new,
+	.pcm_new	= alchemy_pcm_new,
 };
 
 static int alchemy_pcm_drvprobe(struct platform_device *pdev)
-- 
2.43.0


