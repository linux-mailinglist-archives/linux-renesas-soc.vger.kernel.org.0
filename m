Return-Path: <linux-renesas-soc+bounces-29425-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFumEQRst2kYRAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29425-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:33:40 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BADD32941E1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:33:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5809B30DBE07
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 02:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FF5B30DEC4;
	Mon, 16 Mar 2026 02:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IyO65q4k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010050.outbound.protection.outlook.com [52.101.228.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C336D263C9F;
	Mon, 16 Mar 2026 02:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773627925; cv=fail; b=Sr4pWEys41OoT8AJCp7QzK2P53CpyTG5utTwEQz3cbtGklAyQXyVx9byQEvH7O9ZhMNkkaCuyWabRtSJNKtX6pX3SgR0c/T5L17P2lzrRmaIPSA4prDDTgikDmUDrm+y1mm+88NFFihpZEcj1f1jAgaVwLIYswDeqGBKsEBthZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773627925; c=relaxed/simple;
	bh=sGsplGbtaet8SJP9efQ8kkXK5rbH2kDa6x3afP7fnlo=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=a+VCWXVrkgKqfhxfLEfB4Uv/+4TjGO1pukFav6IMqacR026JHW/1NzhWcES4YTsJHqjVcUaK2xquIa4YW0uwBjIq9+vgki90Js/B49pGuyiLp5RQTpuiNBJccETzDQlO6skKcbo7pjcA/YS42OLsEq75YUYx0fxkIZZwiXra2Rw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IyO65q4k; arc=fail smtp.client-ip=52.101.228.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aEWOKLarAvra/nL7mvY9nB+pWPbkiLSr3f3KfR6VrJ1lpaNK9j+vqA26hddSXd0S6uJuA8Kpfg3P8NKna8utXp3bbND+DRG3ajUVwOQ4RQe9y41vVT8itW5ILA1G6RJmMM+YLO0qEjHwgQYzi4vo8GY9+ksUNGnDMUjeJfPwns9s+26YrPempQtZh5oYe1H3XAq8hVUL5/VwFoLUuqSP3SMjSyttAkeh3MhBMuUGtjr8lRckS2DIyd3W3RYH8OqB6xmZkkSzG4Nv5jiSw7LXylt/1cA6tzG4oqNXP+hDq3maZmyEq30/SVivPpEBzWKSyHK8zhhTbhLjkrASl3Vb7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gj7omZADvdtncvPoSt8xRBHHSQzBoja3OnItvF6AxKs=;
 b=c9z0Pp56ubf2/JWeMGfSx7pP/Mk4ZUZCqvt+265X08cwco2GQgJU6biiwXt2MTyC0LdLMqNaV727BcR0WJzIT9jc295QZgCwqTJaqLQAoU9STxLCzp4ZPQUTjLTj9KqFhMxd1xm0yaD+ACDrR3lSotaVQVPZse9d4t8caUQN72kwEVy/yAWIe/Tg7RODvpMVhiCAHgoX6i7QheP8PdNmZM9eyB25nefsYCgPKiNpNd1XLSqaU3UBNVRPl1oGL26fkcNfj0S58Zla4UcuJa73ytSFPn7Mm9fw52PNuJ5j1kgmXih5U1LcnbXdqC596TLEPePbrJP/Ns3kJCgIZOwv6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gj7omZADvdtncvPoSt8xRBHHSQzBoja3OnItvF6AxKs=;
 b=IyO65q4kiDVn9HIAPgCisWC47buw8DZfsOrkQN+urrqcaLPqA9wK1dFE17Eq7LtvOsmdV0kcy/fd/vwKQsEpzG7fMnk6YbpMPWAZljjUDKXerQZCqx/K2H67VWribOPAb8HNqtXZHy61NTrAxArz1JCbdG3YYWjIaWjA00DR+AY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS9PR01MB13205.jpnprd01.prod.outlook.com (2603:1096:604:30f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 02:25:01 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 02:25:12 +0000
Message-ID: <875x6wldde.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 04/29] ASoC: atmel: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 02:25:10 +0000
X-ClientProxiedBy: OS3P301CA0024.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:604:21f::6) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS9PR01MB13205:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c5f5a35-45ed-45ec-00cc-08de83034028
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|921020|56012099003|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	QfrtyzjMiEeCQCB02zfvURobRYXQCLm+N+FBVRDnwN05j60W9eREHfQSeMDc6VE81mqQxGgbUCyFyTA/VikmJHf3XgUABMTjg8TNTGcOh0wiNeNTMfqAN5kzIjq7rFZbI4hCpB6GmY/B9yOmvW6PE13uEZPmjxr7gL8UxD/QtccKzf+QVa8DRD4zf+YAcFqxJj0e8/39dAtwXPoTRMsie94PyPMYEqFJwZ+wRZY5hvCmqEhOnhH9OqDfZKccUjkof6U4zypB5AcR9dve1NPdfCYP3DMJ6ud7Mkr2EpPNxaIiCHsGc8inNUA9Y5oP4cAUSwmmYUVJ6uxn/3fukgXk19i2E+OUNz+G9no9ex4dOwYXo4Uw7oKBMsYSGXDL3ACZhu5rHzVoC8RHoC9CbzoZM/TIpEGUVakoUyZiyTsX8BqTcQGlxMwQ2VTP5OdxdzECcZBjorRt6DPn1IBfyqnDbOtovL3R4wg05y9VMMgS7BSnylguZJlzMGR6am2/ApWBP8lzObapmDfy5iYYFpULZJA40cLgmoIrwDQ2HZzs8zv688xPqPvueSRVRzOVIQCJXzPz05cr9Jnh7mO50j2jlAHteWQvguiKQXkQry3BrLmm0ukyr8hszDG87TKib0/nNCWAre0oK7/PJ3xSemmAwDuDsFsx8GSHvgliKaiJBSLzx5BWRebIkPUJiVS2fZqB/FbV1HJyStHoAxKd6HJtuTJ3ynQTpCrPW2N94dwtAg7v5BrkD2YZPKKUW7lQD5gyUzgz9KoD/PwRtKfStuxDIjV25tmIRqUNMpoolupm7wf36eGGxdGs561Re0Hc9vbCUsdxgZoPMwL1reIvKldHqw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(921020)(56012099003)(22082099003)(18002099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ja1ARSx2SlzZCILZ7oxTtpd21w9cnmXqwraijkh4a2J4wo4yyXLjCvoE5wJp?=
 =?us-ascii?Q?DdHXpZH9V9jF/mx7WKVku8v2uKUJ8a3x3KhB2jUrig99pPtNDheCS5ERM6gw?=
 =?us-ascii?Q?g8QDhGysSOdbcxPXtEOn9FhjDzN3LeaEL8z+0xVZh+jKjPra55b8lW1K4KAW?=
 =?us-ascii?Q?/DfPkEr3V0yi3AdNhr97uY8wAJWGNjT30JTAs5iVo+zbglP9my0wJSTUh8Rk?=
 =?us-ascii?Q?EZvZ7PsgRCV2iheRx9rij5HHxPkwQBepJ7P9eBisd2vTMxn4r97ZPImcxZT/?=
 =?us-ascii?Q?keVK5cepigQOoZkLLfesKA9GzibUHc8DQNThgtqmWxazQGZdPgTZg48HXWuO?=
 =?us-ascii?Q?Z1FFjkjhZcAX3P0rXTHBVdM8aaVD14bXWLF3yGvKrU992jr4Qo6giOCLA9Kg?=
 =?us-ascii?Q?3ETFdVs/4xRPsUWbO1YO7fe66ArsB1maOt5NKnM4I/L3xGufspzAcyKQxKh5?=
 =?us-ascii?Q?p41+qszyFl8P0DSg6eh3kcsElXZ7GHgRkbZssOMF7zAJM2oWgaObIhY80lNl?=
 =?us-ascii?Q?P4aMzt89JWGxG2Kdv21NLLnUN+V4oxVc1QoxDe2vTNY6Auy44FKWzG5Cpvzb?=
 =?us-ascii?Q?/8S963iAQ5lEGyeBQI98sEpDov2OpBMBh8OKKvIQ8lsndJ01mFLL3xOik5+g?=
 =?us-ascii?Q?T5B+hFcyeQvj/i6XxwGgm4gIDfk0c2Kourfs1i1wFGtkLiz9LGSI3y3yALw3?=
 =?us-ascii?Q?WOp9timnQnSl5EI7LtFMjDR8wCek0kxGXX1mzjbc3g9dcnQS2o6St2uSb0sO?=
 =?us-ascii?Q?kUkg3iLrOdAvoDtPzpAo5oxEU/1drgG/8JFUE80TulAIVQbmisLde5NYqqRe?=
 =?us-ascii?Q?+jK7/pcjEZFSPo5BHYy5rSU8ZqgS1WZ0Oof43QzI5wyb8CBKoGaNlJ7dzwnJ?=
 =?us-ascii?Q?fnxdIXpCRszUKB1LusRsjBT27WJyLJqrzKUVbaWKstFHk+BUAgf54/47gKsj?=
 =?us-ascii?Q?XSwc1akNROAfESA6gI7EsXpWUR2R/Kt9ZBG8a5mKSwDdeqLscPwixt7skIlp?=
 =?us-ascii?Q?8NR0FS5FWXBRJsZXhFKMqSwwFjNZRCmkiXsS7L970N14i8eKpwkMR4ro9Z3r?=
 =?us-ascii?Q?/zUpOhv+4Clkj4lXyn/GMpNKDKBIEJjwNKnQaOJ6cAzVq089cRnrhmjaG3RV?=
 =?us-ascii?Q?Do4hvU/Rz2gowd+xFzRzl+QPo4VxTxU4v2tjvx1VDnG7BxxzHVhBCnlYUpW1?=
 =?us-ascii?Q?t1qIyWKtsmAI4LKPjkqCJYjN2Sgp8tLHWLQJp+hWjBl5oWnlA9Kua1kaxBnr?=
 =?us-ascii?Q?z2rIyFdfPCPOKjW3QQN9IHQPDakGB5GjTk+q0zaMwHaM+j22TZNafwpaad7H?=
 =?us-ascii?Q?C/HPtq/ES9sEtCqkDZ+8FS4nsPz8ao04WmX5BFBoJ3sz2SVrpzdWfoPFoHJv?=
 =?us-ascii?Q?kjXTNsTsT4d7aXf1Aynt6k1xGT/jWyWsxNIlR+SOBJQh0UOjEzZWsUiHX7ME?=
 =?us-ascii?Q?NQL1kRX6S41Q1CDJyH8LAslCcRwDQ8Y4vgr4vZ88icjMgZmSStjwsRJuICjG?=
 =?us-ascii?Q?1iS9De54Xj/y4rgskXjgrm5hLFGWzExnG9OLOjxr5NF/Jacvs9kLO1pX0n69?=
 =?us-ascii?Q?LXCOoYPfq6keWsZLvTEBlIY+HulcHU6qeMCYn+G6NWbuaHsPypC7eZfZO8YJ?=
 =?us-ascii?Q?j93IZFYpQLVe77IkysS4AhVyz2To8xFolZLBjHTq9R46rTchhpC6VitkIKTZ?=
 =?us-ascii?Q?nePYi+3HlktO9yMHQYqQ3bUQK48xxA2zOC6LMIQav+5x3nI802XZhFjknRMb?=
 =?us-ascii?Q?81etFFei6C6KY3HJ234t8GKRzRIu5LuSd0N0nhvCjiHN65OEHea7?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c5f5a35-45ed-45ec-00cc-08de83034028
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:25:11.9594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kjMRhBmrr1wKag0rSGkZa+x/xT29Mb+Vw+hr6RvQyxX6vY64bmcPpUckZsjeRjPdQmB285uZjU/v5CYmzB8OJ32kk5bxXOjDieBzzvqVlsu2p2aY0VOGZVew3gx7iD+n
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
	TAGGED_FROM(0.00)[bounces-29425-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: BADD32941E1
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
 sound/soc/atmel/atmel-pcm-pdc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/atmel-pcm-pdc.c b/sound/soc/atmel/atmel-pcm-pdc.c
index 1a0c584801f06..374f93fa6e0b0 100644
--- a/sound/soc/atmel/atmel-pcm-pdc.c
+++ b/sound/soc/atmel/atmel-pcm-pdc.c
@@ -316,7 +316,7 @@ static const struct snd_soc_component_driver atmel_soc_platform = {
 	.prepare	= atmel_pcm_prepare,
 	.trigger	= atmel_pcm_trigger,
 	.pointer	= atmel_pcm_pointer,
-	.pcm_construct	= atmel_pcm_new,
+	.pcm_new	= atmel_pcm_new,
 };
 
 int atmel_pcm_pdc_platform_register(struct device *dev)
-- 
2.43.0


