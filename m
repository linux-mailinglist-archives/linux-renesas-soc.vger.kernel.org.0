Return-Path: <linux-renesas-soc+bounces-34917-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id osuDMREIT2qJZQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34917-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 04:31:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE2A72BF42
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 04:31:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vivo.com header.s=selector2 header.b="KwFXQ/xV";
	dmarc=pass (policy=quarantine) header.from=vivo.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34917-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34917-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C2B1E301D615
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 02:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5CB337BB5;
	Thu,  9 Jul 2026 02:31:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012052.outbound.protection.outlook.com [52.101.126.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2469A14A60F;
	Thu,  9 Jul 2026 02:31:38 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783564301; cv=fail; b=rIxBJgKQB/IxUd9Yu9kRAWzYBWnKueGOrb1Rq9IrkNwcRrXOlJlp3kjtUk1rOxt9AftNKuQbJXwxfbTEeNmihhnF/wUjZ6tTETQ7XKYv+wdFF2uebGYRnUGQXufAG7lJMzTS69bjvdBgYudyKyAC1f4WfftEvDWfZqqjUSMnDW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783564301; c=relaxed/simple;
	bh=znMPjn/4IGaBlCiq5LG9W+TSBq1Cl6QNqKV8sEHd2mM=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=b5ezmZxLsOEqBdVDqXEVta5o6/3+sElK/cwiBJRGQQHa19RoQjr2gJpraVWq9wJhD15fqXJB3W8L6TNS96HcuZRaWpdPw0veAHy/5S6Ffh7q7TpD4HtvpPNo+CBKDt83ocCt2EJWwODHvjuVR1BPiY3LC0U9RiwVWIySxM9BGF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=KwFXQ/xV; arc=fail smtp.client-ip=52.101.126.52
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qHu5emWwIc+uGdLMCWmtc+HuliYBqFQFj69Eb/6qip/xiZIhjPJcoivwGM6/E45cIQQMhcypwwvdUMIcLZKdGKaoB6jMwtCAHYw/fs4+53IM+cLDOEWjkfYUvs/iVPA0HGtGhmVIgUwXj8AnL+2udtEhSPH8wniQr0mGPNI+Jast+ovKwI8XQG5o40SB4wRIW2SSLGgGUYqFxXsphSIDuhjQSOHAI2v7EDhpIQk3/46YPVGX+3dfmNIAxT6Se/SWUd4s6CgROFNAKzbo6Av4Pd0kdJsn9/hiTSFVsfbRSw0pbFU5c4FKcauzZz/nalWucMGD2oEZpTvix58+iFEmvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zb15SH/XYFa+RyS0cTGgR/gZagBNPGGjTMJKmIURz8M=;
 b=xtSAF7ki0R7RdTyVNixnHBgVXyiFOtg4Wk+qbVQjzlIc6yqTM0JLgBye52Q+YLPH2pe6DekT8hj0FiXF27nDZvO6mcZlqkep3v5KI4xX1YeMAP+Z+U2vQOPc7+lOUkIdXaWAVU5EOIstFWYJA3YYcvG0DGFWukPVZsOejZw3fvce7kGM4s9SlI8j7j2LckqFFhfzwpqtQ7aemEVCGtcMvPDkDZf9hHjzzxe0CSRuOKZ3XpAIzrE7L00btSa9d9yYSN88142UiFAiPV5TdSbinP0KuX6Zrkdzh+3oAIMRsx2dv0jXBSxKENYnBQlJmB2Zbauhoy6Ax9bP5dGb6lalQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zb15SH/XYFa+RyS0cTGgR/gZagBNPGGjTMJKmIURz8M=;
 b=KwFXQ/xVozptnhlCLkFe+wIw8eifW3MDFgXMgUgzoA1tU1ReYPmC6D/8adYynMvVeDEwa7iRT8ZPAxTLv5L/H3lkXtLz1of3gA+zOZuESdkLh2HPTggQpmF4IpOS3uClYI/iVBxSdTsdQvB1zp0TK9ZcVjFrCrS/qZi18LzVubRZFk1KY0imE8N0XRDTfX7w2hr0mRL4cuGZ0A8JHgaVvbzjmhLtX+7gk5zhAFDYdLnL0G8CsfguMVZxBqi5zYaEnA7DOoh883TL4yftoM7zxreInxXSu/bi8mTo2lQEw6fHhBlZ2sZnsq7h7yWk4byuEf+tqAd7HiJZs8bU7fq7Wg==
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by KUZPR06MB8800.apcprd06.prod.outlook.com (2603:1096:d10:c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Thu, 9 Jul
 2026 02:31:35 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 02:31:34 +0000
From: Pan Chuang <panchuang@vivo.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Markus Mayer <mmayer@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	zhanghongchen <zhanghongchen@loongson.cn>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Pan Chuang <panchuang@vivo.com>,
	Laura Nao <laura.nao@collabora.com>,
	Mason Chang <mason-cw.chang@mediatek.com>,
	Fei Shao <fshao@chromium.org>,
	Frank Wunderlich <frank-w@public-files.de>,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	linux-pm@vger.kernel.org (open list:THERMAL),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-msm@vger.kernel.org (open list:QUALCOMM TSENS THERMAL DRIVER),
	linux-renesas-soc@vger.kernel.org (open list:RENESAS R-CAR THERMAL DRIVERS),
	linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support),
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek)
Subject: [PATCH 00/18] thermal/drivers: Remove redundant error messages on IRQ request failure
Date: Thu,  9 Jul 2026 10:30:03 +0800
Message-Id: <20260709023048.599150-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0019.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::14) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|KUZPR06MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: 70fb9282-7ee3-421d-4ce6-08dedd6231bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|23010399003|366016|1800799024|7416014|376014|38350700014|921020|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	6etLwCHUEWhmfC31D/Bu8QoyAGLR6iL1slE3kRDmYMOlGHhf3zB8PKFtf5+LC/RoQo3o2vspywARwBPknKqsAMv5/toUka3eJGCIh+EoZSQEGmN1Jug5EbVlfaPGRie+cSwuzh9vGI/booIw1LKcFquoTPIn+rku0G0GqXU6PJLlNN3Px1i08P5jKmrETRvISRmi7+H5J7pvW1PxofYRjKFun/T3AgvADk2fJyxeVJtPdu3XD+gbliUBrRHccg7cfSiPn7EcPrz2LZUyduRdgbWCdqiWzb1s0twg3dxkDyTJCF1faJeR6RjaojvT0BlQJyCxqKG3O1kRGWdlWWZnINVF9NJFrx0ndfYhliVDN9FZu87UFx2W9foaxtEP0jzXZDQqotOswge7x0vObC1YHAhlW5NJZSEpIIIL83JjcO1evYaURywCme18NxU0XJzYRxZisncnZkjj31+AJtk/sILkARtCrRRbHm9It2urggNYpsUD3hsWBbt8mIMvYovJ5xl/rsxSu8EWl5YoNATxqG5mtXKBsfmQ6I9YH9CPWliIHqnYgvLfBUj5ZnLDZsiD/2MA8FuZgZ0fcY+FDGjpbj8KYOMtbO7QErFvbewLPmM1WipG2TdaMTzUFKMdnu2Gv45v1VNjLPKab4IvfMPXX6fexzLk6SYWdKO22zypoG9imL5zDwFtWMVZ7uMCleKp+KHmQw6PMjyBs825ARhFHgQBoaNM8s0/fXkI8y4ryXU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(366016)(1800799024)(7416014)(376014)(38350700014)(921020)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nLU2s9FefGR5lZlr/WpM/N1cHMI4MOnLXQSGkAnzYUixx89gYPn4qpM4aTkz?=
 =?us-ascii?Q?YWud6ZFpIeBNAO4uKP5nJ+8sEeGtrDFxv+XkRWQa/pG9R4E6O9xFTkwLApD5?=
 =?us-ascii?Q?nWhIBhHnwLZY0pIvqsqPE6EjwJtIWoDeIN7c+1lat0DY+EREf5mdWKFS8xbC?=
 =?us-ascii?Q?MvMfQloj4iCuLe1DYG7hq5kwptcyq9CDnm+QD7R80p10lQdRY0LHRBxx1meD?=
 =?us-ascii?Q?EzHjknX5y2H2EwANrebn7/zPHimqcbUyqRo7wZTELexW6uf3pYvnnw+Vbptj?=
 =?us-ascii?Q?7IedyeKme5xf/2Vk66qT0UEcpayTl+PdCw6MAq6Sm+FAoFa7WZyMnQL5FbKe?=
 =?us-ascii?Q?+GyB+yNWE9RrO8wEtNYAbmhT32ceZ7ilM2+wUsfwbC9bw4rYLqOejejhL9BK?=
 =?us-ascii?Q?nc1Li1351CaDu3wfaYJWiR6dqpPHokheeaToDQHwXuLB0+gRFQnGjH/LUEFw?=
 =?us-ascii?Q?jY5D5NMva6b0sf9Z0fhsMYpMr/NYuAs3YJTSwtaxrrHPZvWlz8jcSgigo67i?=
 =?us-ascii?Q?GxNshuHtP4DHfnx8ujL6OcwJ19pxIokKpTny1U8g3DH0xMvGPCcVup6se7r3?=
 =?us-ascii?Q?7uGvExkIu+MpZR9jIarqXxBl0+LZHmLqdU9lrAuh8yNshcqF/wBNX3hyFZH3?=
 =?us-ascii?Q?dz4s9Z04uL3G2aWZCXiHtym2Tqa+Mnshi68C74cfPG+g0QqBJbXqOcMfHWs0?=
 =?us-ascii?Q?3cyzfO3cMIXkH5gJeactkMGn/CYydqo5qVzghAjMH9oJyaiK4NpPwnN5tqpc?=
 =?us-ascii?Q?fmFiyeZxDygFK3f20iyOI2tJt+cCd0jbvFq/zU0J0B9r3JIolZBAVTljgRlB?=
 =?us-ascii?Q?5EtMW09spAvevNikDidRCsLw8OtwpSnud4HYqiE/Sn1ObWZQ+AMS0cU1W4w6?=
 =?us-ascii?Q?JWj/cgKrLxjwt366NAufQCU5Z6inru56dIBsBWJN6FdLYZAlcrhfH+Y0//47?=
 =?us-ascii?Q?qqrcLfLTLtqPAK8oa/mdW8i8SpE8SEnk3fYw1EQR6NjAoO2PXJcPYGjIQXbP?=
 =?us-ascii?Q?7oPp2SGrS0/0Bf7CUKqdeo/Ek0YJwBKWJ2Z776YQa+E9I5DZRSgVmE9DrVzE?=
 =?us-ascii?Q?se2wjdwsmg+Y2di04qbXxAbGdO3QF7s4m1FTyNPWm1NmfDnZannl8NMy93fx?=
 =?us-ascii?Q?LUeBCQFljrsYi5PXvjkJXU73JUKjwIywIVcVY31fc3+l/RQp4FsmdOD6hDWq?=
 =?us-ascii?Q?x5G30OzAOvqlfw5UO1n8hA9awSITgr6Nl3Rf9sgp6bWBf2qLyyO3S6giNhw1?=
 =?us-ascii?Q?w6zaDTDam6EWHErEfs3YAUotZKmcQ+QK0jm/Xss2eSJI76l2t/cd3PI/nIt3?=
 =?us-ascii?Q?lViEBnAyKpJdhDu31p9XAAxa7omXozms8li6znxWahXqYmJW3xDdF0DnAvOk?=
 =?us-ascii?Q?xsJoUS0/JPFJXbAQJj2ukD2SAXHpOrWe+a+SJ1pKcpwDV5kvInjJtG+VWdrv?=
 =?us-ascii?Q?yS5Q++dY/GzXWbfTqpIRwgTyHMpkPbexaIdCkI1aGDhZsA2AaPctjeXwzUSG?=
 =?us-ascii?Q?z6LCkK9qLJ1hVl+1ywT1c2S2WMf1I6kvd25y3BUE0xkyu0jmJbzDbQm1YD3s?=
 =?us-ascii?Q?L65e3Z0XBZkq0CVtl7NWzL5Oehmn+Zw6rsNH4avYsMCeigDfcB4d6ifHuYOV?=
 =?us-ascii?Q?GwR7eL+uXpRcr37V10erNYnBfiJUDB70MJpZTAkJVBaiPUd9dWRaIo4MpMRq?=
 =?us-ascii?Q?BhNzTP+UNxzxExIjrFfB8Ika+iXJwR/cl3VKgFGn89eiI+VLgaAllYMr4+vx?=
 =?us-ascii?Q?i/+or4t1nA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70fb9282-7ee3-421d-4ce6-08dedd6231bb
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 02:31:34.7865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DVhgkewTd2EN/hIfgnq+yD75CFZFnXJmCw8ddwRZLcc/GekWLNki6edKlLUpUmotdedMVsXx6nTaxfXo8bZQmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR06MB8800
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[vivo.com,quarantine];
	R_DKIM_ALLOW(-0.20)[vivo.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34917-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[panchuang@vivo.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:miquel.raynal@bootlin.com,m:mmayer@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:florian.fainelli@broadcom.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:zhanghongchen@loongson.cn,m:zhuyinbo@loongson.cn,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:niklas.soderlund@ragnatech.se,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:john.madieu.xa@bp.renesas.com,m:heiko@sntech.de,m:bzolnier@gmail.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:srinivas.pandruvada@linux.intel.com,m:panchuang@vivo.com,m:laura.nao@collabora.com,m:mason-cw.chang@mediatek.com,m:fshao@chromium.org,m:frank-w@public-files.de,m:jiapeng.
 chong@linux.alibaba.com,m:andriy.shevchenko@linux.intel.com,m:jirislaby@kernel.org,m:clamor95@gmail.com,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-tegra@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:tharagopinath@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:mcoquelinstm32@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,intel.com,arm.com,bootlin.com,broadcom.com,nxp.com,pengutronix.de,gmail.com,loongson.cn,ragnatech.se,glider.be,bp.renesas.com,sntech.de,linaro.org,samsung.com,foss.st.com,nvidia.com,collabora.com,linux.intel.com,vivo.com,mediatek.com,chromium.org,public-files.de,linux.alibaba.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[panchuang@vivo.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[vivo.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[52];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vivo.com:from_mime,vivo.com:dkim,vivo.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4EE2A72BF42

Commit 55b48e23f5c4b6f5ca9b7ab09599b17dcf501c10 ("genirq/devres: Add
error handling in devm_request_*_irq()") added automatic error
logging to devm_request_threaded_irq() and
devm_request_any_context_irq() via the new devm_request_result() 
helper, which prints device name, IRQ number, handler functions, and
error code on failure.

Since devm_request_irq() is a static inline wrapper around
devm_request_threaded_irq(), it also benefits from this automatic
logging.

Remove the now-redundant dev_err() and dev_err_probe() calls in
thermal drivers that follow these devm_request_*_irq() functions, as
the core now provides more detailed diagnostic information on failure.

Pan Chuang (18):
  thermal/drivers/airoha: Remove redundant dev_err()
  thermal/drivers/armada: Remove redundant dev_err()
  thermal/drivers/db8500: Remove redundant dev_err()
  thermal/drivers/hisi: Remove redundant dev_err()
  thermal/drivers/imx: Remove redundant dev_err()
  thermal/drivers/loongson2: Remove redundant dev_err_probe()
  thermal/drivers/max77620: Remove redundant dev_err()
  thermal/drivers/rockchip: Remove redundant dev_err_probe()
  thermal/drivers/brcmstb_thermal: Remove redundant dev_err_probe()
  thermal: intel: int340x: Remove redundant dev_err()
  thermal/drivers/intel/bxt_pmic: Remove redundant dev_err()
  thermal/drivers/mediatek/lvts_thermal: Remove redundant dev_err()
  thermal/drivers/qcom: Remove redundant dev_err()
  thermal/drivers/renesas: Remove redundant dev_err()
  thermal/drivers/exynos: Remove redundant dev_err()
  thermal/drivers/st: Remove redundant dev_err()
  thermal/drivers/tegra: Remove redundant dev_err() and dev_err_probe()
  thermal/drivers/imx91: Remove redundant dev_err_probe()

 drivers/thermal/airoha_thermal.c                          | 4 +---
 drivers/thermal/armada_thermal.c                          | 5 +----
 drivers/thermal/broadcom/brcmstb_thermal.c                | 3 +--
 drivers/thermal/db8500_thermal.c                          | 8 ++------
 drivers/thermal/hisi_thermal.c                            | 4 +---
 drivers/thermal/imx91_thermal.c                           | 2 +-
 drivers/thermal/imx_thermal.c                             | 4 +---
 .../intel/int340x_thermal/processor_thermal_device_pci.c  | 8 ++------
 drivers/thermal/intel/intel_bxt_pmic_thermal.c            | 4 +---
 drivers/thermal/loongson2_thermal.c                       | 2 +-
 drivers/thermal/max77620_thermal.c                        | 8 ++------
 drivers/thermal/mediatek/lvts_thermal.c                   | 2 +-
 drivers/thermal/qcom/lmh.c                                | 1 -
 drivers/thermal/qcom/tsens.c                              | 5 +----
 drivers/thermal/renesas/rcar_thermal.c                    | 4 +---
 drivers/thermal/renesas/rzg3e_thermal.c                   | 4 +---
 drivers/thermal/rockchip_thermal.c                        | 3 +--
 drivers/thermal/samsung/exynos_tmu.c                      | 4 +---
 drivers/thermal/st/st_thermal_memmap.c                    | 4 +---
 drivers/thermal/st/stm_thermal.c                          | 5 +----
 drivers/thermal/tegra/soctherm.c                          | 8 ++------
 drivers/thermal/tegra/tegra30-tsensor.c                   | 3 +--
 22 files changed, 25 insertions(+), 70 deletions(-)

-- 
2.34.1


