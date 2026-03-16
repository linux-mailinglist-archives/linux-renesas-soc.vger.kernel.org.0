Return-Path: <linux-renesas-soc+bounces-29436-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EG60IhRst2kYRAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29436-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:33:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 387642941F6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:33:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6084030254ED
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 02:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DAFE30AD0A;
	Mon, 16 Mar 2026 02:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="O/6gRq5T"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011047.outbound.protection.outlook.com [52.101.125.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300F030AAD0;
	Mon, 16 Mar 2026 02:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773628007; cv=fail; b=IRAgYf2Z/AQERtH85xfPapaeV78iztz+75hrArFIyb8Alw+VCfL7m3A7vh/RFn0V4+pd7Ic/Aku5kJ+k6b1Ji40df+jGHFmqEebNufqG5fsTdPG8b5i2xsxzl7yDsjBai4AwMoJbYtv3Cq2UIxVOzTtL3S9Mv0Dd5lurUOTlq8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773628007; c=relaxed/simple;
	bh=XjBzag0RIzKktYFi9C3PgREUgoGJth3kXXKLfkBHbrQ=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Nv0f9jymzjTZRbadV9jfi/r4kq28ELokQgAR10i/J/XxfAcL3Qu1+0aNzXhZTtMeBFDLAzDJZIGUBD6EYaLLskbR5VHPhS0IYoxVCL8Klu2MwO2HkFO5P8mSzSR2Gq7lkmovTikcYalZgdooqE3RdQzMeTYxmdvc8sCaJsPmQkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=O/6gRq5T; arc=fail smtp.client-ip=52.101.125.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=snUAZiAQK8b1u0ZaTJkGQCRfFbxriGP5CYrnDaYAcs6xxdNICP0uBudiCO3rDsrmOFZkEcJy6qabpwZJ1gUmN9cmX1XKwAAKxseoqDCEKP75JZF0MR4yjDdxVIFZxnLW4RcGI28KYzfOIBI0F4yoAU9DhS1ho+Vvs9vBAgxoQTtkP5k+bZj/ivuiBnwqI3W59LjGkS5hX5qjnBqAeGw1FhvlTLNTHESkNk+VfuJuseI63c18zDS6kiY0tAfamYyGBTq1yVpl9RHDC9b+rbhevaQVkZiQv8+GvOYj+lva/DEnrO4PvP0cho1ipS1kgVvzeu9IIcLtvPoBeMx5Geo/pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBwTQ0kU7Jlv3AGSkXQdYv4J/o6yQA7hFRxofX+fPgg=;
 b=E/nSGxX9JF05uI0RJJiNnsU7JnHilF9UI1GQwTleUtstglagzXuo/io1fBZEZaOSb1K5NqbK7ZCCipbLsmE1YJQmmHx4bIXZzynj8iHh4tBytGSS5/cGLPrwaDT8WOaa9QJVbv7rV0TdiP2XjIW/VLUhZp0USGytWw/KcfYh8WBBmPDWwInY5J/vaC0cEv7mhpFaVPrSC+hiF2bCu/U0kttCBOyGV1mMowkA7bn3nyJUv31iEds0n9ePMWK4u/BKOpcb8GK/50h53XfWOX7Xqmfv4+lNpep628E/BnYjKv+TSpre2uc2F5IPieSY3g3ZfIPsnLAQaWFfh+FL5SJOTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBwTQ0kU7Jlv3AGSkXQdYv4J/o6yQA7hFRxofX+fPgg=;
 b=O/6gRq5TWm/aDApv71A86zt/h3q0z7VcVfno3qRfIInbWcYF3XGAPdvMl8c2EzxQ7fTI6uHU8O1QsRoYkDjvXRj/cvynwGJuVJRNrXHPzQwLSDGw/dsNsYEELd+9A9tNG6Vfprw6WuH8dEb8BK13ak67VGuEuTbeUj/lWGJW/p8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS9PR01MB13205.jpnprd01.prod.outlook.com (2603:1096:604:30f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 02:26:25 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 02:26:35 +0000
Message-ID: <87pl54jyqm.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 15/29] ASoC: loongson: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 02:26:33 +0000
X-ClientProxiedBy: OSTPR01CA0048.jpnprd01.prod.outlook.com
 (2603:1096:604:222::13) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS9PR01MB13205:EE_
X-MS-Office365-Filtering-Correlation-Id: b2e3f46f-6317-49d6-abc0-08de830371c5
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|921020|56012099003|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	0ygHtYuAWrLDQJ8v7yLzPtOl9t3+Kpgcn97HCjt+NGKMOexth1WZEms+xTrm26y7wqxCrk039m0yEiJIv7lD0DmAy6TfOKJlF6w8Kh0F9qb0qYF/7kPwp9NHi8dQefqkrQRSMoJ7obrzcBlV9L4wVqjsNKJy0a6Ds7gH9s4h5pwDQJdLh+Vn7oXKnwbtZdM6v6QEwReotrV/k0PG3ptki3gucClRIYAk0Yivt3TT+DrBd6ETv1m8X24Ul5NiqB/a+NsFf4bUcumH2kDFL0j1gJqzttiQPYnsSVVafInXgkMopQgYv3ww4l+3nh0p5l6jguWTKJEJ7m6KH84vM5Di9jLemSpq1Ywx5rlPz2wsuBIxhy503kw+VIF0IDaH86oF+SARcf16B6y7HNYbIh3ZncJpBhh5M471gxBPITfIznQUowoGryWxo8LRLQWI9vefGIijnsFJhj99bGeAnK9EVoCYaLaeooUPXO/NQtMV9o7cvWqmKt9NbOBegIaJQBuKVICuKT8J02qh3oVXHZB+dT6bBzJFScLyo1Pea9mGo9rrmP0qJH11hLl1aNVt6ULwilBYCsMBBC+6O0NccuftIRR6lolrDH7r5HSDLx16uQXWaQSUGTwVDfbreM7ZPtxr9kqFzUOflqc0dYcfSih3vy7ACIwJlGtyg5L0974nf+GD3Zq8bTko+ubycmVcx3ZL2tBy12b7t1knGINz9XotUnuRQzdjuZYpHu3e1VgD9+Nucip8J7OA3cwWnzitnyv0G8IfeJdIGlQn3Y9FFzPVKdMcZ22Zpfmj0Zdd7bNpIacGyCjFTIEjNJQDIBopdWT0ldv8DOxfCX+mb4bL8cD3KQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(921020)(56012099003)(22082099003)(18002099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xvtUpYQ8cj3Fmg3+mqWmxpYUdEyJNPT00H/WS+Y9IINo26YdsHSt4kVYamVM?=
 =?us-ascii?Q?plTQLJcVqus0loguPjvaGInX2I7KIIyLDTMws4A7qgdtjLemjjnNfjS/acp/?=
 =?us-ascii?Q?aZYcXcK8Dg3OsgsWMp6s2daPigTmalKgVykEaAttLjfCbcyPyEQGFi9L4EwB?=
 =?us-ascii?Q?NcHetbCjbGfN5qPWuPILagtUqSMi/gcbVIGI3JwS1M9zZSyjD1zRU0glU9fd?=
 =?us-ascii?Q?TTO7XtZF9GCEnY6MfEAKE6v1DIi90GSCQ+cI+Oht7LcD0ihRaXZqKceONNTY?=
 =?us-ascii?Q?4fB2YkEeqylLmwrJXylYbgCK+eNpeuVx1J9CQ/gdMVkd+YIp2g6rOYgl6+db?=
 =?us-ascii?Q?gWWniwbGlrQSQJSoOfGXnkYR7Z5ijFWNLF9O48mTB0zO7WeN3Q7sUzfrD3QU?=
 =?us-ascii?Q?6GCNCenns4Wf+ZORhuFz0JxcWNQ3J8ePWRE5jmW+jvF/CHmt5VGMuOgX9hys?=
 =?us-ascii?Q?W2mjeugWFUS07jG6Z3LvYlhM8pedG+nVDNMzD6asjrjCcjHa8BcEFsRTw7FW?=
 =?us-ascii?Q?0FNuKn+Gv+/LpMI4GYvU5D/pjyAjtcWu1gFthRhI53pXme9/KchGT8UvjPEv?=
 =?us-ascii?Q?qFBlwVvt7TUtAfYfyKRcs+IQG8+85O+QkP0Hwnocl7duVFOINr/Di/HrvgiZ?=
 =?us-ascii?Q?37BSlsejubG9trthF2YPoz9a2EssT66O6v45TLZTuF7i/7yNf5RLWXvbVqms?=
 =?us-ascii?Q?bmsAOozMr/54jOaVPClPVZLLyqPipw/doqwV7pKpouwnEoWMCGazl+fNVWDK?=
 =?us-ascii?Q?ujJnRxu+IeZrk7MbJ91U+GGbKULvj3OEhVGaaDJE5QMTLY56+ty6d0IMKouX?=
 =?us-ascii?Q?W5LtI1suD+D0ug7egZrRnOOkM/r++9GCwuGjRYlQ+NhuyB8gjf3T1dGe8t+h?=
 =?us-ascii?Q?cnfvBMrmBKsLy7WhptIg5AvxURdsyEcEIAyRID9yAofC0t1bLeVbzuifhOZ+?=
 =?us-ascii?Q?iOpbv0zGGnLD7rjWmHwi66EjpNq+Y2LXpJeQ2HW7/t69Kamh4dVq+JRF+fYo?=
 =?us-ascii?Q?SKVolZ66E3cK80EfeRAvTf9OYVD2dSCi2bKogUN0FAHYltPAnFynUs0p507e?=
 =?us-ascii?Q?je76EUCMb850YwvRxY0r5M6yf5g7IiwwJF4Txq2YEzVK9EAEWYq2kCwdmD8a?=
 =?us-ascii?Q?edtvTWSX81X64eitvE+L5ZVwmWazhDhXEPKgWzTqvl29Tk5dP+kaYM+N9eYU?=
 =?us-ascii?Q?9Njkqp3IhxDowMJAgLJj6gGZPdEqt8jHnbbI8SyIRMMLIJbZCYh4hG1T8knb?=
 =?us-ascii?Q?beFq4wPeF1gtoXxWhI6xNI1FaOTtvyhQLSyHPD106QHrhjRdP5BX63BsKTDM?=
 =?us-ascii?Q?vGavfI4T7W7INx53UAcqOBwJR2zloSHqn+hYCRQ/TA5lJrJR1UBmNJzxfBo8?=
 =?us-ascii?Q?rKW16YftaKRehh/b82XGVCcWf19hcWy+vZhz1kC9ZFe3we/tiWBWhfXqTNq/?=
 =?us-ascii?Q?o+zXp3xML3aP3qYvZQDg4o4vOj0fDTUs/ydrHYzxqx6CO4uwZRjPGvAPO457?=
 =?us-ascii?Q?i4FSIoA3d6PDrPvg47nHzZMHM5WDmDS16QVzfaPwipUZZldlpI2ITAIgbvak?=
 =?us-ascii?Q?T2mDJAdOH2GhRA9ojPNo9ZaMlfo4N/KvwmXP0w11MDqQkuzfuGiopGaEknpH?=
 =?us-ascii?Q?COy+I1azQ0DLCiBUk6dy0NFjdulHW+ikoGjUAd9AIWGCDdSieJAkt7fzF+ZS?=
 =?us-ascii?Q?u0bzmPwSOg9bcsxJsVz07FF5vMJUwyT0AlvQ7a25n35KIwdtDy5QUmKY4Lbq?=
 =?us-ascii?Q?TbRVKteCg0wzHhZwIgBAYoeYNMgrrFkybKGxbN3RSSSbDtZZcso7?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e3f46f-6317-49d6-abc0-08de830371c5
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:26:35.3115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YjHMInI5HHlbTidQ6JWBfSDdVsN73MbyYHQw4bpPvO+Bi4dXRXjQcKjVjdln88Iyx9Nb2DKBRPS8WreaHrZpHiyYTyHkB3iZSRiPClFM7nVmrF+eMUsd2GXl6WWg23dU
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
	TAGGED_FROM(0.00)[bounces-29436-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 387642941F6
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
 sound/soc/loongson/loongson_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/loongson/loongson_dma.c b/sound/soc/loongson/loongson_dma.c
index f26b2951bc9c0..a149b643175c0 100644
--- a/sound/soc/loongson/loongson_dma.c
+++ b/sound/soc/loongson/loongson_dma.c
@@ -341,5 +341,5 @@ const struct snd_soc_component_driver loongson_i2s_component = {
 	.trigger	= loongson_pcm_trigger,
 	.pointer	= loongson_pcm_pointer,
 	.mmap		= loongson_pcm_mmap,
-	.pcm_construct	= loongson_pcm_new,
+	.pcm_new	= loongson_pcm_new,
 };
-- 
2.43.0


