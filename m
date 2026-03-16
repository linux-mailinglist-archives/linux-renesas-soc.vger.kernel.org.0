Return-Path: <linux-renesas-soc+bounces-29444-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SK94DTRst2kYRAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29444-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:34:28 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4F5294248
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:34:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97ED930F6F80
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 02:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6528C30C37B;
	Mon, 16 Mar 2026 02:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dQy6hT7S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010067.outbound.protection.outlook.com [52.101.229.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0ED30BBBC;
	Mon, 16 Mar 2026 02:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773628055; cv=fail; b=YsKM/HRn8tgBonGZ4UyTh1U6O7HGW/Hbc8Z0+LXTY9lOr+QfcJemYWyKWvWzeaw0Uq9rMMzCf4yEJn7S6EEMhF/oiryuEU2oW5l5EDElt2jQmC4iJuMi/YPwirFp4Sb3kT42jMZbkRu8W5EgPiAMfm2sPRgiUYrwSEA30/r6odc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773628055; c=relaxed/simple;
	bh=MN8TaRmA/RNHtXeHza7eS/vNwT90Zqd1kxIaNvj4JXQ=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=unUNKMjqBhdyiALG79imOMeyS2K8jHmPZyVaWuxdAKuGmrdJWofB/JLb1YV0JKpNFCh5eJ/e/GFQ/mZu+NmfuZIDyrfS4sCmcBXAmkXIyuJ3L+ruBynSnLUQZHy+Gx+dQvbAbb0BZCIC8k1ETtR5FRNGugsYXUKDKqNcmb0+V6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dQy6hT7S; arc=fail smtp.client-ip=52.101.229.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cPXHRJ9m0f59M/ZAWljUXWBrdJRUJABSuLEW3zbQMCPwli2Bl2/2aoOJkvQm/7pz1Q6IbwBHcy//VO/AMXlN2UVY/IyarBOInnlwNwqDQnxcrZ7m1e0EZ9bphKRhjbekK+HVQ59bBnMBC7dLgfBmrR4nwphg0zsuKGkosC3vlDoqcliduehB/VX8fiPWku6pIEih78wvmJ75+Yh961dPw/3ko8AzGxZ/InRMX81kC+E+HgbGd4UUCo7ym2SLB17UGhhy+6Z5cKlwGdygLtvo0gwJJahk09BrRd298vAWL9q1shT5xYrZLGWeOiQq0VkbWgwJ8vky8oy4DYn9uTYA3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FldedDEYnea6+ow3O8R+8w2HpVVPYgRklaAlqb7PE80=;
 b=g+qFiyURQI7DAx+d60IWvVntUEPdfpRpA9SHLOBLUIAyZr9PMB2b/PGX6YzbC3M5tPbQNVaGitOpcZEFT3jfGehv19vw3fa/8/N8rLEk431w0yxEV7Pqm66s82bkdRvGqw3XIpc+F7g5L4Bkrdlkv0XlFRA26DuVk26JCXgLu92vs3Dsyy5S145FjDpYjIz2R4xdiTzeRY8NUmxIQuEj7HiYnFzSK2U82qLAs2Mali698J4YMcoa6WXdG+GQ5MwnCoX1uWAQ0OEt9hxfiXE7rbQWylcdSB8XfOA1xDtdug/xNYk8/1fE2GFfAIBIgJ1EZDbwRt/ASvWSVsoYLKFwHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FldedDEYnea6+ow3O8R+8w2HpVVPYgRklaAlqb7PE80=;
 b=dQy6hT7SX540w3Rz6nFLNJnxdUQnkcwnB95B3CIRJY8v2zUomKvT37GYZwOGkgxC9QZZEppjskHqQfML+c9KPonj182fy6DEv7znL4XdQITNK6dI/lht0ZBeNJLESEaiuvgx84gpZjkkw4Kfj74ecNwiD3EJjkQLmdSpqGvO6YQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS7PR01MB14729.jpnprd01.prod.outlook.com (2603:1096:604:395::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.21; Mon, 16 Mar
 2026 02:27:06 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 02:27:22 +0000
Message-ID: <87eclkjyp9.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 23/29] ASoC: sprd: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 02:27:22 +0000
X-ClientProxiedBy: TY4PR01CA0071.jpnprd01.prod.outlook.com
 (2603:1096:405:370::6) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS7PR01MB14729:EE_
X-MS-Office365-Filtering-Correlation-Id: 288d670f-e5e5-4125-a933-08de83038e20
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014|18002099003|56012099003|22082099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	+pkaDC8cxNjEmOPm7+sD+f6km3mKSjiisec6Y1yNEbIuAsdZ5b36Nll1Ny1mC4MYuYyuZKzwHG120v2ffOIqGToigpVHHPZ/jJaW4PDfWrycPImJN+v3/Uh+/3etOUlNcx2+u32eASOo43fyH6wiJem7kghUWmJI0AU9PoMToSsGK8K3N59dnYaBKRDRRcL6j1pTgWntsz+FmuJppqaLDK8lwMc5C8aJx+T8d2g8WP6dfllsXSOojZq2YxY3xwmewpi2pILStb7IaeADU9BvUA8XjG5t4Ub0yTrJmPWvAwtzKq5+RkIfhfUEcNeh3a1kuI9f+d5fpNZohSqroud+xWaEZeXyTEeGV/fj72TUpGQf3fZ9ILi3FvXfF5/IBrof8GQB3Gu0j+cEaB0E4I1xx/Vio1Z6B9G4aQ3bZ0pKrEnt3v9Q9KxjNeo7XNN47xDZ3R6kiMo0X+aQhiYGv6ZUdAqyvIEXswOHrLSsGD6be1p2RXqr9KISN67HtzrqYeXhLCofVaDvQF2BPZUpYGuVt1U68sc5Q9hh9Bz1Y5NYex5EVVoWBWRp312XSs0XNKGcwUX4EDpzv7SXj9vGu7I8xeDO8Cick87i9mJ/owvRdfVnR9OXjD1olLfy1NE5z2IgoGV/wAOA5SQDgOfUEt0VSuKeMhapnvQIcmNLn0m9xzOJJCq/O8kNf/6DGUdbOA8Sb0utSZObNcShfuh0NBMTBV1brnKQYm5nCgSIZox4JCOH/0vPDe5GIm3aEWstE2ZKCfbRSOi9TlcNyVJUlyVIoLG0iCkKxv4dHSccT3UYzHJQYAsAM6g7j3wdKYUibT3Mf7TJn9SEPz2w1z0delq3iQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014)(18002099003)(56012099003)(22082099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZVHqdsK/U/YcpXa6ziCejrP1qhhoxvNWnXpzJ1PtB2CBHsAEse+Du1H6QRBA?=
 =?us-ascii?Q?8YO8dZi9t9Jt4gmOlMFsKQykxSWmG6y/YX9VHwCWl+MVQodVRDg+JNehEs7s?=
 =?us-ascii?Q?BElzOtaqEaZds2kABhSRy4lmjRAc1+Uof8QYHJa9ME5q5tsWNP9267tEeH6V?=
 =?us-ascii?Q?F3XSDRDTzDG/UrP+OG6wEp8b9ye7IbMKgutKeo0zFAmURnhRPuUFn8mXO68b?=
 =?us-ascii?Q?PgTWK5xRemTu4R+nQEg6rKBoub/DVWMvzmbhDNSeMfEsEJASIlt9VZ2GvZS6?=
 =?us-ascii?Q?+q2Ksa9fCiQtSevnWXe/YjNAHbOXx+xx2x2uvnwiNZUF+mttlv/T/BsGu9qL?=
 =?us-ascii?Q?EdTjIMPUq4qiYPqgkQnydZND6rJ6EBCgak4/b8/RNjlESIV8hI9DbSZVzNlF?=
 =?us-ascii?Q?xRq3g8oNNOpxmqbn/KW7hfjpTST07rcoYnAjAOqg2v3rKfXbS0CZcqd5WSL4?=
 =?us-ascii?Q?Fm+eIwbDH0H80fVuECc+KIYmO/v34gtIWMYwv9DqCUCLjUH9Tkv3amMYp3Wm?=
 =?us-ascii?Q?Mzg6imnbKK3wYWwiAZ5r4ZrnkA2X+kUQLYYs5UzOCvm7BkDFQ5xqGpEZB0jm?=
 =?us-ascii?Q?5rWPRTorp8I6aHgunneuF1kgdo8UtOt0VVmPBTttNaRDUs+lYcTEzfe2ZTJm?=
 =?us-ascii?Q?qeCWfOxKcDrAVNCxhTJvFxdQs95jP7EXP9l9dv87b/3LDVo/KFwCGqSJCw8S?=
 =?us-ascii?Q?HFqfPN6H/9mLRcIVTB/WFvyHrMatAdF/PddR57lFRNC1PNN8U/9ZbNW4zdS3?=
 =?us-ascii?Q?BhfS0NZmWR8twLgWD8ZM0f7BdptN4GKd177dzoQkcavpyGFTRLdNohsGDKgV?=
 =?us-ascii?Q?jN1k9+hXnsVJmVJ5EOFaVmD4BfTQCPbCkSTl46E0MPe1ajNDUUtQYRuEqqUC?=
 =?us-ascii?Q?uWidoBcC2Iyor5ggGbF/eOLHzY07jfkgZbUYV8/jfSFVh11wsv+QBskZEDCt?=
 =?us-ascii?Q?5auR6iESVXESdx5+K4+NrlCFhmFMzdY0H/Wot5p13GMhRyk4EHYtYK0NzMFR?=
 =?us-ascii?Q?GYXrgX1zDutyt3Mtqfu7HRVfJNS//lf3cdj3J2tW1ia68NNK5p+MxzBJ7OHt?=
 =?us-ascii?Q?g+KzTv6s2Z10K6xI72pD2fBYw/VLjWiRoYR9qE3xap1gzZLmfJZdnbyzUsxF?=
 =?us-ascii?Q?EGj4AD9kMtiDpDLtFlnUrJLo809ltg7EYgZMt2YFctiVmpUSkjYLf2guaO7X?=
 =?us-ascii?Q?+awI4Koi59QmIUvaG1ZYXsYzPaTBPVwcRV3Zjem6shuiHEzRbkAeu9011eIy?=
 =?us-ascii?Q?/b53fH5kFiDHw5XaJjFsO8fGKY8wMqPMCLzUzSUmEkVj08eAs2sIVsyTQ6z9?=
 =?us-ascii?Q?yiHr8kp92IHFIbO3g5e7isC+ZSciZOJXwaWrn0a7QCZlXLOskb9gx3X4B1kR?=
 =?us-ascii?Q?VxMkQNEKagp7jeZcSZXQJyXPfgedNEKNdyiDRWJyHxiY+Cxz51r+W5LWVfnq?=
 =?us-ascii?Q?l0qdJlzqIrGAG0tourg2C4Y5lOGpf0MPeDuXu7RSrfhDkd7GPOsrjXVB/B01?=
 =?us-ascii?Q?1vSilYJUxVjegLRNe1lchJr4viQfBXM18UXs2+PvfVHtYoC0MEtT45fyNlOv?=
 =?us-ascii?Q?3qS2qPL/e5Ur6J2LfPHNfgF6LbCEId5awzBxnIR28xSasCmASbrIUQldFq7W?=
 =?us-ascii?Q?CGtH63HRlR3WHmVGzvYA02jklUdeGLcMBDnj+eYAkh09JsN07b1W5tNDGMMm?=
 =?us-ascii?Q?miYpDDqF1W7GyGiysgB2xd8Ag8FeujP9Gl+Iy9Zy7alOTHJWbbdmEGbcDW19?=
 =?us-ascii?Q?f8fzO7A6jXGuixtAhtEZWAJcvESlVmL3ooZiX3pqlEsJ7wzgCHWE?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 288d670f-e5e5-4125-a933-08de83038e20
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:27:22.7271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Svle0gTeEJC9OaRegFpTcIc6MtjAJWdFpzR7kycJhaRwhhTGOS9F3UNLL5I8SGkD7NuqAkII+wbz8D2vOd4LxxRrmsWH6hiN6B2jHiY64ui3R19abMYPiX4hesf17iLt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14729
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
	TAGGED_FROM(0.00)[bounces-29444-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:dkim,renesas.com:email,renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DF4F5294248
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
 sound/soc/sprd/sprd-pcm-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.c
index d6b96cc2f7087..cbf5bf82d96e4 100644
--- a/sound/soc/sprd/sprd-pcm-dma.c
+++ b/sound/soc/sprd/sprd-pcm-dma.c
@@ -453,7 +453,7 @@ static const struct snd_soc_component_driver sprd_soc_component = {
 	.hw_free	= sprd_pcm_hw_free,
 	.trigger	= sprd_pcm_trigger,
 	.pointer	= sprd_pcm_pointer,
-	.pcm_construct	= sprd_pcm_new,
+	.pcm_new	= sprd_pcm_new,
 	.compress_ops	= &sprd_platform_compress_ops,
 };
 
-- 
2.43.0


