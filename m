Return-Path: <linux-renesas-soc+bounces-29448-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJAoKG5tt2l+RAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29448-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:39:42 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A9C2942E0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:39:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 00961303E329
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 02:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B962F30C37C;
	Mon, 16 Mar 2026 02:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="J3nd1BOu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011061.outbound.protection.outlook.com [40.107.74.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F5C30AD0A;
	Mon, 16 Mar 2026 02:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773628078; cv=fail; b=AjzQPDKP8nP1T3Y3zCObJKZEClAksYzoyto0FP8YXtS1GJdgHk8ZrhoXMhIdOXfQN+xMzk2nJTxmrmFQN+PJrbnfwRyXAIEoDyOqElvQTI8T3RWdBa2Ojw1qeA4F2wjXyN4zsd5VsisUytLVb35Ta7n3lMbVbF5HZk0oR28r/e0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773628078; c=relaxed/simple;
	bh=AmAjs8Be1ryU2l3ivECWD8qKs/tGH0aMUC20HwkhdSk=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Pwu3ym/ikYxiu2pgxNW0rGDir7Q63xLcZmGOzp5BIKM49dsJFG/fw8AnQeUiVSe1RmjffWud4E9BLyJh/j9P2P9k/eHFcF9ocB35u2ht9Y+Yy1oQaOGtMCkuI5WGEGO6fFkq6g1I3o1HZp0JnuoiOqUp+U2xsA8daGeaJ9sLYnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=J3nd1BOu; arc=fail smtp.client-ip=40.107.74.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cSu3VgaLifCAMwlbsXuaFd+mqXgc1LeKcldOSL+3z+owEdvsJ80LqeHUGC8/VM/NFvLR0RY5Qzqk8EzWxTLZfU0Z8t9a/qWahhBjpTg9dlWobUhQGDKczoOhcKBrimPF94eZykgXlu5hhjWguxa5I2HC3PG9oPhFdY+PSEG5iacgdiktl1EJ/512oFq4bb1TAiTdkdh4MCV2UY2kMdk3EBDf0duBHZL1eydy240KtamOMac6OXj+K+6TH381Q0pEnPFf9E1A8k8XKsTcxEejc5+Sog3cDWaF5Vr2V+Ci7Hm/H4m4Xi4PRq2U6dwbB50PLRU7BOyEXaw/zaQzdGC+Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xv4olI6/ql7RK8xVM/SVmGeB50vptqSVaXOJrWId4E=;
 b=LCz2TmS4wMl199gAamU3rYcg3DxWaBZ55i4ti5A4xmRK4vqqUkTCkvLZYmARanHgoxTKaaja2kIwk08lpYlg0JHkxNNVRB+BAXs+7uw98KzuclTiTnPL2lmYw71uH6VzCI9HT25bwpC8zztjoAqPtRb84hHXI3i45WT1HaKj5gii3L4rEPZj/c4RgJRpY0ZEJwLnIkdhuo2M6g3odGCum/gr0tODl1bt3LeY6POAH0MdIcfqVQ0OzS98jMqD8N1/9SBzvXKYRyU9VcRNehbbykgaObc6P43KRRxLi+uJHQh7pCTExuBOoNEMtUTkZ3ivCjmpAoUuh2MA23HQp2XW4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xv4olI6/ql7RK8xVM/SVmGeB50vptqSVaXOJrWId4E=;
 b=J3nd1BOu+dAPKwyobsYTcXDmafjHjAdTKdbl2wyJUYaBPbonDpN1Thpk4sE1mX1ht+4tutbIGV5ym9aaU3BLKNEE69OHh15ka5mZLPB73BhXwFgKKTLIeP80XVP4CfyVfFkYgkYBbrZxYsLUoZDjkPdEmSkvZDxl2K3PSIiVDys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS7PR01MB14729.jpnprd01.prod.outlook.com (2603:1096:604:395::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.21; Mon, 16 Mar
 2026 02:27:29 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 02:27:45 +0000
Message-ID: <878qbsjyon.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 27/29] ASoC: xilinx: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 02:27:44 +0000
X-ClientProxiedBy: TYCPR01CA0153.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::12) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS7PR01MB14729:EE_
X-MS-Office365-Filtering-Correlation-Id: fe09703d-b1c5-485f-b2f6-08de83039b77
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014|18002099003|56012099003|22082099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	+DkQLmS9OKzvrpS6OHV05+iFEph0zziSYK+n/D9UmSmUkrGFe7/8kK5Ru408vdmQxje22QZdkcwYYcGqaSvDvsztdGvjBBrwg1O7x5FBikycyBQXAPp+gngoi0T8ldrC45d8WkgapExsJ5COFoYUgiaDAXf5oipAkyVgKZMxIWkJQURFQRbjDyFu3JuLksG7XFSFfmGmKU4hPHksc9dYjZxWJGoUSXZHpwzNbYtOlJHMyeIlOnX3GBUpwGxexcFqjyWFRhdnm2emVa3NWI2BngrwpdXZlNx1sprfiKVdNOqh9mehgnQ4Uan742RoddSuAoYgWjzspne8+5tJHahJejOOOXlvqFyKx0ny5rleTI4z5M7uk/09wfNwKnEFcSKbYU0Nf9BEkBysJ9c8ZZHgxTkcMsbFBnMQjaIO3FjhBIbp0fyFRk8zb7QYF7ge/R1/uAOz+RDUVBiQlwE63bFuO4cfBbh4HbZBAgl2PqxcTrt1WOb6oTPr4nfMH9Z4HvypFcBcRZEgWJyTPWGOKa4OJAXO+XMYuvpNpijN8sSG0wmAd/XXolCO89AiIv3D9e5xAF/CDnJ1AMzTVnCdGmFScOiBlM+FsSYO2cWNfRylFh3eDtBK7WpekDf8XE4aGU90kKuVPBeCwN86aTvzW4Rk6eqKf735/gHnhuypfbttBSjsikZCrlXg+yTMr/OpiqdZlMAEWGPZYwWJtGLN1AKbIQNP3jj0iYSuyzyP2essTD2OUNagf9v3QmXeqCpqcKWnpEpVtmFdYJM9A9WYT5+s83i0KY06dHfStjIoRLyIMfg3IT77OtTxw1mecN8lUEm/1CWImHfJ99qw0uJaKnT+1w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014)(18002099003)(56012099003)(22082099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ppNNzLG/rbSm6XuGFG4Oh3wCgW/lMLJYuZOI6CGDYvI9lboLo7Kwg4sbF//3?=
 =?us-ascii?Q?N582CVtzCwufPAdkJKyucdjNunybRIwnhcyEhgB5bC4WeV95S/rfFgt3A/9O?=
 =?us-ascii?Q?fF19H0ZrO/heI0IV4nHgKl3g8NNiCTNsmN2Hz03zyl9RN6GVi/CXOy1Dkk9X?=
 =?us-ascii?Q?NnhR20vYRhDslpVq8iDQc0sxTo5GRr+YhFqyy70nK/IY0sWkBfRwF9AbKFEy?=
 =?us-ascii?Q?T8gAE/rRxTU014b+Gby3u546eZ6TX3KkMwsYYgB+lN2gPBVOuN+A0hy4GSPh?=
 =?us-ascii?Q?Nfi9a9bdOAW1Ll5EfLYAXomtPk4ZsFduB+9/UPnvn9MRwUimPnQHx7DPJS+i?=
 =?us-ascii?Q?+z4dNE6W04Si3UVqdyrIaXEVlHoFPDZC+yYom5th0Q87sKdo/cv3FFRQEfUA?=
 =?us-ascii?Q?h+nOG09HhADH/78smR501f5pW8Ww5VlD1kZr6jasKBKz/Xg7O8mMp4bLLz96?=
 =?us-ascii?Q?3piZhXoUGO/KX4R6TUYpd3ubBMChCUGOl0/0MllsFuXHlthX6pcFdQjfRgA4?=
 =?us-ascii?Q?blZLlYFbJiBN35Q23JKnQ5aipLwsha7GlorzMI1Oscuw9XpFkDST+RFRrnRe?=
 =?us-ascii?Q?H8qQ1gy+DuK4snmCsvTL6WSjw+I2FGalaqD3pdYRfo8cXAQ1pz7ZO02VDcjT?=
 =?us-ascii?Q?8zoA90VTb9H/TfekyBcCCMBO/t8HykwjLKWLWyMAiK61Wp4nAljosXwlzuf1?=
 =?us-ascii?Q?fzobZsDkTa5h0LVUTq4qc2cqiAt1v/6yHh62OdAF5LxRSHHKYaDIO77vjRFh?=
 =?us-ascii?Q?7lto8rWpd8NhpqgI8BC1sgzBnYfxTwNBk/gIOo1+yG2fuJXdonhS4qrIkoyo?=
 =?us-ascii?Q?u7OyEL3jPs9bBFe7LKc2ziEK9qHHM+N00GEmtjdX3WG4YHxbMAa9XO9SDQLM?=
 =?us-ascii?Q?GHByFBKabklJk0dPcByV6QW29SQ6BDpdw13IgIdmmkOouTk58+2l3WkYgPiV?=
 =?us-ascii?Q?SnemhYYgFj6ijnCrTQADcjPnSxkIuajKoM+MmYs773AuBHYeP3xp9MoPo3Le?=
 =?us-ascii?Q?2toAVYAXLKk1lNtccrBJ154Hcy/O2qpYFaaw2eoW2nCd/ztkqV4c+7ffwCm+?=
 =?us-ascii?Q?vaMpxDb7O6nPsZl8Y81zXGHN1NXg7ClGKqjNKyeFBh0Kei84V+VaRRunoycb?=
 =?us-ascii?Q?JTahm4CtcG72dw837lH1hKRsPkdnw8twI32YGNr3ZFFzyVcY+RvHWNyX5N4m?=
 =?us-ascii?Q?7YaVDxOKD/fx66r1XolX+08uPGQd2hsqPtRoMuKSGphTCsamefllRhx95q3R?=
 =?us-ascii?Q?J7FDVwkb36Vw8e4rYe4sMbya9c+hp0w+s85UasR+nKeQk+32XYuI+4X9pUWe?=
 =?us-ascii?Q?PDUdWb8QEFkwSiTqVtWQxff80cJmctimeZvGkv0LeIG39+83Zouv1rG3UXxS?=
 =?us-ascii?Q?yOKCdnznPbzBf2rtX3VB06EjUV9dji6ieUdHRWs8fUv081vJHvvXysCrK6fa?=
 =?us-ascii?Q?aNg2RIDfxZZ3uranc3wl0DqxfFg+U1TTDcgj4y/UQS4WHoCSqyi/BZKar4qG?=
 =?us-ascii?Q?INkxDcXSXbR+ONYciCpYeUm/NH7b8Ytr/pYiB84PHZGX122NZXqBZat73yoH?=
 =?us-ascii?Q?Oxq3EKbgPHAc1+2P6R2p4sP7Y5lDIW+jv+2yOhvTbr6TZcrO4YXkL+naOoRu?=
 =?us-ascii?Q?mdiVsosFYgLifgRH6uo5nW7Se856m/LQtLXf3xmN/UhzYfajRp2XCS4LDdJd?=
 =?us-ascii?Q?1uvU3MucYnZLwR0Nog/cvPsPJxpxQDG2qmnUrS4ydJKko1QefvJpGhra2+Vx?=
 =?us-ascii?Q?+MXK8KZ+D2rRR3M6UOB6ZHzlf3UHc4tmj7JMyhAdfmUjQ07Yh5vF?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe09703d-b1c5-485f-b2f6-08de83039b77
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:27:45.1303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8+0RyWMU/nvO7gSN2lEb5biyrgEcCc1sBXy1sEEXdHJ3K8EwRbI2czIMlXjnNTBeOxaZDhu3jyZA68E7evMfLXAz+7EwZrPcxFAyZTFeg1COy3ZqkY9k2tuNEH/evm2y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14729
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[cutebit.org,bootlin.com,foss.st.com,microchip.com,collabora.com,linux.alibaba.com,linux.intel.com,chromium.org,bp.renesas.com,intel.com,gmail.com,tuxon.dev,mediatek.com,linaro.org,nxp.com,zonque.org,glider.be,perex.cz,nvidia.com,socionext.com,metafoo.de,kernel.org,amd.com,realtek.com,linux.dev,broadcom.com,free.fr,pengutronix.de,samsung.com,suse.com,sony.com,arm.com,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29448-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:dkim,renesas.com:email,renesas.com:mid]
X-Rspamd-Queue-Id: B5A9C2942E0
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
 sound/soc/xilinx/xlnx_formatter_pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 04a4eae1bc92b..8f7a76758535b 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -582,7 +582,7 @@ static const struct snd_soc_component_driver xlnx_asoc_component = {
 	.hw_params		= xlnx_formatter_pcm_hw_params,
 	.trigger		= xlnx_formatter_pcm_trigger,
 	.pointer		= xlnx_formatter_pcm_pointer,
-	.pcm_construct		= xlnx_formatter_pcm_new,
+	.pcm_new		= xlnx_formatter_pcm_new,
 };
 
 static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
-- 
2.43.0


