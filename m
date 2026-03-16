Return-Path: <linux-renesas-soc+bounces-29423-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SG4UHN1qt2kYRAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29423-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:28:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1740E294083
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:28:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A43BF30CE6EC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 02:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F8A30C61B;
	Mon, 16 Mar 2026 02:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZNNvKj3n"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010031.outbound.protection.outlook.com [52.101.228.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90122263C9F;
	Mon, 16 Mar 2026 02:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773627906; cv=fail; b=RYGaHKwWBEuk5o47pqhJdwd51uPtbhM25yp2Cl7bIOlkSwrzkOKOUA1wcsZd77kscQ9RZfl4mFs8UaqPMcinh4xlD+NgNrS6kTCQVVhBKt7F6A3pWk8GRkRa5lajcXIHmSPVFzWTNWgm3qoBleLRTJ8Y+Y6xYdQEfp23dCrjHo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773627906; c=relaxed/simple;
	bh=wXR2dTGcQNU18ZFOljiWWTIYT4QqRWsRFKPp5lMTWyg=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mm353l/WLGVWC73fbjPG8/1ACDzMOwTpsQhKzdvH0x0r4dg2VHHY/S7i46yU5vsZfTB3A5cD3f3+tOjLV+PNE52S85kD9AqslKA9G38xTcoKQu/ViBBC1ep5JEpO7BbLXc+wkUT2ap2jBEeYEjRHmDO6SIdvjSO2vt6qKhMAThc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZNNvKj3n; arc=fail smtp.client-ip=52.101.228.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mkulZmZyPcfwmvo8GxdNkZfy/IM9XmGPsAUVqT8v/HZXxpjsiqgs31iharvfngoPspnnfLRzORr1asYoIvc6sNGSlHnZ661NOk5rHUX2jH0t1Nqb7/ZmWpvB92MlDCWoNSCvagifHrMw3zDh04XxbDOs0sCgeUNtqrUXYdKei7EO0s5FGDthH51Gb6mdPNrCOmVrpg0HSUyGo+NgLbNMkRE5LX47f7H3FfzmA1BGNkhHIdfYwzmBVdKEYiBiQwgCkNpjsJJ2UZ24NGM9V3/aSgJO4Kj695TTNNhVva3gysfj9wiMtuGEAzPTXZnHqiPCRJI/MgVvCDwEEp9HBtT2wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arAGbQXx1vt0sOdblogjSzM1JjhXZbhkT87OVJhiWEg=;
 b=xd+YdWibNc3ud3DTrV0KZTap84f8dto6VhI46HBDDSqDplMtY+pY3sMqDSeCySl24o73P4ECAUnoop6E0JSClNEjZmyiypRyVypDuNsQKiYg1nr2V/aG3Xv9Km7tcXEs2X08mUtjZBAa2hO2W9dx5v18q8/kUJN8idDqkZpdkebMRumPVd06QfpIAfWSE8g4z6HsPIp4jDoUs1pfOpSMwtJLpSQwLgDySI4wy37fKICuPHa9OJOWdOIF9Av6wtuLRSk6RZX+QTZA1g7eDWysD/Rm9y50WmkFNBQ/mDNIw8MsPBZFVwB0C9OverfRhMSUzGB7JJTXJyTQ+hG73j58ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arAGbQXx1vt0sOdblogjSzM1JjhXZbhkT87OVJhiWEg=;
 b=ZNNvKj3ny0aVy/V0oMTG0UPg/i+mGL7KKyxqKPxgbelUzlr+wer2haM0nbHhpHr7t+rCoNcnh5RRYoj8Yg6mCRIwsfz17y6RuRsB9uglb3MsxTM8/RcaPJdkrYrJhM6JqSGYolsTeA75tgaRK8FgiVp/UejVJZJ6XHS+dsCIGnk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS9PR01MB13205.jpnprd01.prod.outlook.com (2603:1096:604:30f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 02:24:43 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 02:24:53 +0000
Message-ID: <878qbslddx.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 02/29] ASoC: amd: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 02:24:51 +0000
X-ClientProxiedBy: OS0PR01CA0005.jpnprd01.prod.outlook.com
 (2603:1096:604:24::10) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS9PR01MB13205:EE_
X-MS-Office365-Filtering-Correlation-Id: 11d66237-62dd-4ec8-56e1-08de830334ec
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|921020|56012099003|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	BuN+dKoHx5FJ9+iZ0gX+VN4wcnSb8UBso869KxMtKUGSAiRs+PKUPBYYESpDMFDKY9bw/o2X7zt2qW5r7IxonHJmkWWc1fHF4G23voi89rQNtRUla7bB3stF1M6N3gzVDXQj3HIAtTt7U/xNrV2TR+U478EoNu3deRiMjT9rvLrs1oTQNU/ZySmqyxLJ0qFiH3OOowUpzD7VFRO6JHmeo8UU4crSCuxOa1LtH5EigUzTGgPfhj4R8pLEcqg/yjT7oB0VulhBBLC82Wr54DX71Zabmc9B/MKAj1ZiUZyG/vfh5HkzbGswPbVm7ruNhiWa069Nir7zKER/AhYtbDYBQ7hBz7iSa1o66OeL9ZhCabDv6XtZa0zrnc4crW1+XqHDmOQAu1FOYOLVFl4Gcq4To8E/KfO+uJJWqVpJC2VJ6K3Pj2DX5vJjrJqZEpKYoR8vE7Dl2z8VNmdxZWbNrqw4lB78vaCmPDhv1OPCn+LWxyx7MJT4yZCEh9nptZMKjFGRfo0GKwooL1hDJDcMz7JpXZNOgzdNVDld3QLDDBScAiWY0J6F/UKjAH6WWQIU7l6YZlH/fxA8vLgfKquzvBSp+mmmAN1AfVMQ3utLUWPc3E3GZ7owGtUcXTlV9r0msW/r2e2MaNLFYq6J9sIl1h59dO4ha1ZqFdsmezbICcKNqiYfAJ7tdICYE6LyxmFrOoswCiehLJ3i9nfj75FGPavIFTM7Nn+EymTJWeLB1grCqrhsTYB1TYJAUbS8qnK2a3ck0XziAphZ3KxJf/Kmrm3ubMsS/3b0L2skx55agf9K/zSBeSIIYBFRUB5RqcW5OuhHr9gZC1IETjyY3bV12tp5ng==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(921020)(56012099003)(22082099003)(18002099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oVKAgFJP/fjZDYSj9wrqN4k0ECkFNRLQ/SqcVR1GkvZm6B/LGBNfStOy7u/7?=
 =?us-ascii?Q?/a1sraRxASkuirXAOfg748p7nNQOCoXle6WXPC0C9VNZV5L3hSZYx1zquds/?=
 =?us-ascii?Q?tIokfdHsigR4g734ipxLDIV36xwm4CZRn371FipGGVEApplZJbksH5XyDZl1?=
 =?us-ascii?Q?Wdj43SH2VqQIpY/rmIuklPlD7RnvSgIJ208mkDG5IfotbcIBcVgNrh6n090H?=
 =?us-ascii?Q?ONyxghmfXtt61wZl6lTTcVIL0wcjdAtuz3goalT/9+cuumIdjXZ5o5C9MG82?=
 =?us-ascii?Q?V5BmJvyUAS/hkcGbj8l2RMwZkhTD8ReKCqS36sXtkLTMlmf6zFkvMx/yafH3?=
 =?us-ascii?Q?ealdSarFZ+Vtl22vaI+o25frh22OvJgjIzJ0cZ0V7rwViqNjAw34/8Ua67Wc?=
 =?us-ascii?Q?dGDfdEP5XPj/G+ZhtDOr8JQ7dGSFvfN3Z9V7e7mZB1b2rgP5eKb96x4JdtKU?=
 =?us-ascii?Q?8SYyRv9rXJ/TVRvrgdOCn9kG98fjK7ktBWJxBjEnfXwtzuEpgO0g/Z1vhQc6?=
 =?us-ascii?Q?LKieXDrBxMpGWiUjxWO6JQVFKGvZ0l18p0hSbNclW4mNi95Qd7J2qIFDGBth?=
 =?us-ascii?Q?GbfJl4JhVEhabrqn56Lx9bJajFYJTEKmmp7QbN0MTcyadjlzRuHYBw6oPuHi?=
 =?us-ascii?Q?YxzxJVJYS20m5udls1qNL8vDTpol6ycwoSnrL6G8D43qco52jpbbBu3e7r8u?=
 =?us-ascii?Q?LJ4PcAkVdS+ZNVJMuzh9dtMCcVDgCq904btHZjEJM/fHZXReN9Ch4kgfCAXu?=
 =?us-ascii?Q?hAKJbEGzRiy0p3jpYw22OKTdntWuIUDjpuVkYVGrWtbd8mcpHfpuFUsA4hpo?=
 =?us-ascii?Q?zEFxKnmTY8IZNXcwWX0eTzXvyKrfLuBn7JHQSJjo8M7C8+u+ByXGoUDA11RJ?=
 =?us-ascii?Q?ATH4uIINiqHMolx0HuFXdNY/q/RJKFPH0f8T6lypBXJkFgftoKOyVFYcjdq6?=
 =?us-ascii?Q?Dxv5e4H0940JK+6ZfZQi6OtYUfMKTVoX+hcC0XX357Rr6ESi9tDSPl0veDdz?=
 =?us-ascii?Q?+VIruWHLUfo8B+sEVmSrzG5NA1Z7LZnYFFwc40G66WtyhmaAcHDU04RMq0nP?=
 =?us-ascii?Q?MEWMOZHdqqome8/3ujPb12tigi219jf8dEivvLgEjviRMSpRZoXv+SdGfs/y?=
 =?us-ascii?Q?bDXHG9c2Rjv02JUUe9wErpQlVTBw749EELE9QacZiL358pNHTB0EmGyvV6iD?=
 =?us-ascii?Q?790cXA75+HqTa5zBCRQDzqdjoV0oDnsb5nGu5Xl3ItLxZv4hkZyso9fw1Nti?=
 =?us-ascii?Q?/Ev9cLh1jdwEWgB/Bu6rKrEIUif+ljsI2I1cPJUVqn4yDJiAXCqWSRh6eNTg?=
 =?us-ascii?Q?YkDd0AG7dGsAZpIHL+IL2N0GGfN5G0JwJJYLvCwSf099UVmBk9l6SVbaWVlQ?=
 =?us-ascii?Q?naq8GStKa8v2otXGJ9Sj8T0dW+OoTQl/WIg3f09bZEzn9zQXJa7xg5jztG3w?=
 =?us-ascii?Q?cNazpN8LwV5Ko6QIutNhbeAiriL4u15McYT0irIWKyqJvuO8cqP9gqxH5vQm?=
 =?us-ascii?Q?IdZEEbzIikVEFkzFvrNhspxkCKW1oTJRaGKM5/ezW3MDoZr3+eqXJ3fWpbbP?=
 =?us-ascii?Q?qDWCUEG1XgLm55Pcte+Lxevt/Ol4GjgA1IRNZHB5vN9fb7mRNkrgdorsp4XN?=
 =?us-ascii?Q?mTItNNhFuehGAwrCG0tallrlsRh6588r4vO7aan82bfomLCuOAZLWNq3M/6W?=
 =?us-ascii?Q?C2KM9LTzdfZrW4m3aax9cfD92pf9phCeqc5pQVtxQNaotr87himhPaQtebEF?=
 =?us-ascii?Q?kAGFremDpZzjd7Wyj+36FkIromBtUZXUTaEtxRZAr5g9ndRQeo0o?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d66237-62dd-4ec8-56e1-08de830334ec
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:24:53.1612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jqFLV8loAcU4qqKZMkjJtnc+WZenqI5uPsXlSlGlIMkiVpzknw+2i0nPrOp5F439tP8Zw/HgbZlr0/B3yuMKALCROzFn4KU3/s+pcP6wYgx6CUwwNStS/xLFn6uMAi1x
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
	TAGGED_FROM(0.00)[bounces-29423-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 1740E294083
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

We have been used pcm_new()/pcm_free(), but switched to
pcm_construct()/pcm_destruct() to use extra parameters [1].

pcm_new()/free() had been removed [2], but each drivers are still
using such function naming. Let's name back to pcm_new()/pcm_free()
again.

[1] commit c64bfc906600 ("ASoC: soc-core: add new pcm_construct/pcm_destruct")
[2] commit e9067bb50278 ("ASoC: soc-component: remove snd_pcm_ops fromcomponent driver")

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/amd/acp-pcm-dma.c           | 2 +-
 sound/soc/amd/acp/acp-platform.c      | 2 +-
 sound/soc/amd/ps/ps-pdm-dma.c         | 2 +-
 sound/soc/amd/ps/ps-sdw-dma.c         | 2 +-
 sound/soc/amd/raven/acp3x-pcm-dma.c   | 2 +-
 sound/soc/amd/renoir/acp3x-pdm-dma.c  | 2 +-
 sound/soc/amd/vangogh/acp5x-pcm-dma.c | 2 +-
 sound/soc/amd/yc/acp6x-pdm-dma.c      | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/amd/acp-pcm-dma.c b/sound/soc/amd/acp-pcm-dma.c
index c76a4bcc96459..6ad70aa0ea837 100644
--- a/sound/soc/amd/acp-pcm-dma.c
+++ b/sound/soc/amd/acp-pcm-dma.c
@@ -1252,7 +1252,7 @@ static const struct snd_soc_component_driver acp_asoc_platform = {
 	.pointer	= acp_dma_pointer,
 	.delay		= acp_dma_delay,
 	.prepare	= acp_dma_prepare,
-	.pcm_construct	= acp_dma_new,
+	.pcm_new	= acp_dma_new,
 };
 
 static int acp_audio_probe(struct platform_device *pdev)
diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index 88613569fd64f..6b1e18b31c1c6 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -321,7 +321,7 @@ static const struct snd_soc_component_driver acp_pcm_component = {
 	.close			= acp_dma_close,
 	.hw_params		= acp_dma_hw_params,
 	.pointer		= acp_dma_pointer,
-	.pcm_construct		= acp_dma_new,
+	.pcm_new		= acp_dma_new,
 	.legacy_dai_naming	= 1,
 };
 
diff --git a/sound/soc/amd/ps/ps-pdm-dma.c b/sound/soc/amd/ps/ps-pdm-dma.c
index 7c529fc6ba997..c6cd844d458c8 100644
--- a/sound/soc/amd/ps/ps-pdm-dma.c
+++ b/sound/soc/amd/ps/ps-pdm-dma.c
@@ -351,7 +351,7 @@ static const struct snd_soc_component_driver acp63_pdm_component = {
 	.close		= acp63_pdm_dma_close,
 	.hw_params	= acp63_pdm_dma_hw_params,
 	.pointer	= acp63_pdm_dma_pointer,
-	.pcm_construct	= acp63_pdm_dma_new,
+	.pcm_new	= acp63_pdm_dma_new,
 };
 
 static int acp63_pdm_audio_probe(struct platform_device *pdev)
diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
index 366d7c4bb07e9..f27ebbd213798 100644
--- a/sound/soc/amd/ps/ps-sdw-dma.c
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -634,7 +634,7 @@ static const struct snd_soc_component_driver acp63_sdw_component = {
 	.hw_params	= acp63_sdw_dma_hw_params,
 	.trigger	= acp63_sdw_dma_trigger,
 	.pointer	= acp63_sdw_dma_pointer,
-	.pcm_construct	= acp63_sdw_dma_new,
+	.pcm_new	= acp63_sdw_dma_new,
 	.use_dai_pcm_id = true,
 
 };
diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 4529404ebd935..37ea5c572eb94 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -363,7 +363,7 @@ static const struct snd_soc_component_driver acp3x_i2s_component = {
 	.close		= acp3x_dma_close,
 	.hw_params	= acp3x_dma_hw_params,
 	.pointer	= acp3x_dma_pointer,
-	.pcm_construct	= acp3x_dma_new,
+	.pcm_new	= acp3x_dma_new,
 };
 
 static int acp3x_audio_probe(struct platform_device *pdev)
diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index e832c7c4b96fa..e60e3821703cc 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -376,7 +376,7 @@ static const struct snd_soc_component_driver acp_pdm_component = {
 	.close			= acp_pdm_dma_close,
 	.hw_params		= acp_pdm_dma_hw_params,
 	.pointer		= acp_pdm_dma_pointer,
-	.pcm_construct		= acp_pdm_dma_new,
+	.pcm_new		= acp_pdm_dma_new,
 	.legacy_dai_naming	= 1,
 };
 
diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
index 6ce82cd8859b8..831e30e9b0426 100644
--- a/sound/soc/amd/vangogh/acp5x-pcm-dma.c
+++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
@@ -357,7 +357,7 @@ static const struct snd_soc_component_driver acp5x_i2s_component = {
 	.close		= acp5x_dma_close,
 	.hw_params	= acp5x_dma_hw_params,
 	.pointer	= acp5x_dma_pointer,
-	.pcm_construct	= acp5x_dma_new,
+	.pcm_new	= acp5x_dma_new,
 };
 
 static int acp5x_audio_probe(struct platform_device *pdev)
diff --git a/sound/soc/amd/yc/acp6x-pdm-dma.c b/sound/soc/amd/yc/acp6x-pdm-dma.c
index 1c8aad8499164..710db721ffa48 100644
--- a/sound/soc/amd/yc/acp6x-pdm-dma.c
+++ b/sound/soc/amd/yc/acp6x-pdm-dma.c
@@ -346,7 +346,7 @@ static const struct snd_soc_component_driver acp6x_pdm_component = {
 	.close			= acp6x_pdm_dma_close,
 	.hw_params		= acp6x_pdm_dma_hw_params,
 	.pointer		= acp6x_pdm_dma_pointer,
-	.pcm_construct		= acp6x_pdm_dma_new,
+	.pcm_new		= acp6x_pdm_dma_new,
 	.legacy_dai_naming	= 1,
 };
 
-- 
2.43.0


