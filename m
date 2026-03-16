Return-Path: <linux-renesas-soc+bounces-29434-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JXRDF1qt2nXQwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29434-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:26:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC61F293FE3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:26:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F246300DDFD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 02:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D6CA30C35E;
	Mon, 16 Mar 2026 02:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SawhZffo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010055.outbound.protection.outlook.com [52.101.229.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA54230AAD0;
	Mon, 16 Mar 2026 02:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773627994; cv=fail; b=Vbo/A226WVU1Z/75Q1cKULuQFoYOuEvfGg3xYX7emsJ5qOkdf7UckzvG2w+8G6ay/sP9vkwhpSvC0c3BXSzBoiZotpidXR9AhGpmFdUVOVt/dyW3wLL3kusJ35kCQAi8KBx37fGr8zpdCuK8kirbyPyGK/WvvD8WGGuJ5iwPlV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773627994; c=relaxed/simple;
	bh=uwHi8nmNtpkvDyrr6MpBmj/YmSqcKztlwTZsDdE942c=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BZbG+7cNHKSstrodr0Jg5yzPvnElBOrI62XlxlO6aWO9RwZmKFJD+zgN49zUwPWmo/b1nwn6F54gGF46/vE+s3Vthhqw4/NZO+FddS58gShdC+lZI3rVpAbbf34768C+2C99061Qunz1ZZ4345ZK6KY/B2RUIRrU32F9pGx45B4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SawhZffo; arc=fail smtp.client-ip=52.101.229.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uhufCrOSvHuGMasCDDaibme6MafVkCkjnG5pNWFR17ngaJ3DxRBMMw4xMcfPlSlBMJCRvtDT9lWhxbAew2Va9NyMFjjA2XMax4L8RHPqcceFpoE9qqqQScgvitZ52pkN4ctVm9cqqF2q3xD976m673CObVeQKsGMAsYP/qIP4b/V3M4y8LYXYWa3/DGUX7KltDfWIuJk7scPGB+ECg7YwN3gpaIWAEdqEDQWkYSwYtBcMqrcvKOICnZg+kzZx48fw/hi6PXAmCkUkBvYaCShDu7aiKc/dW0ZcPxJ5athnIzcUZhqWav1GiRjE9xR/p6aKJ237o1ay2S92Z7nsJDmmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jfHP7FwYIkFzx+7ApW0QAgrDGeGZNYTWJhQua9QtW4=;
 b=GfzbPyHVwi8IJGFanjHEh8MwKWZApfoRdg1FEvyNNzm9vRHFUBEaC9+NyUqHF1V6S1jawLZtfRiYlhBZkvkHA9zUsavRCYN8aTVSzU8ZuPZyPEAwZyO39vpk6/PJJqL3eEKnfpnCZT+LP/VLqrXK6zUANRAUNqZS1zUOAm9sPKCd/ukBRLC6dAwCpcwuF7Oa6tiHPedTd2ZMOt0sNc2IcnZZOZgGTpiushsZlt9AoNcqXmYzLdE/LZHSB2fTmG2vPQAXYRsiuN6Pq2uwoG7+sA1YUvvAdpIlRoQ1Dci8EMbyAN+mQlEGD81p5tST9pu/02Chh0u4wF91SPcNujcV5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jfHP7FwYIkFzx+7ApW0QAgrDGeGZNYTWJhQua9QtW4=;
 b=SawhZffotzr3rwe4u389mBD3zz7waTzgY/yPUYGk4fRuLyYs7pqaMBQzy3P92qHRm7urYQmz5ascllbbnEYh4Kdc1Tf3xwlkHJI9l5C1IbQ1y3G8QP5yDaYPGc/weX2GCRE6W2ggw/9FsFa5BaARcjmwU7AWNimsF6yRZ5tN8gk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS3PR01MB10123.jpnprd01.prod.outlook.com (2603:1096:604:1e2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 02:26:26 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 02:26:21 +0000
Message-ID: <87sea0jyr1.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 13/29] ASoC: intel: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 02:26:19 +0000
X-ClientProxiedBy: OS0P286CA0002.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9c::7) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS3PR01MB10123:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fbff69f-269a-402c-1930-08de83036941
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|921020|38350700014|18002099003|22082099003|56012099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	Id4oypC1E1nVJgNH7uI4hIhNPpEwELHKQdKhU6WoIRE58Op6qzDEW8aRuRMGiXYPekaw1L2SOGbyMPOC2+Blt123g2LM416E+P0ir4LeQtTe/kSV51LfCD4soOVWW5rQ/i95bWxYemBKVDg0VTpwa3iY3Flaj9wAeHH5YHhDY42Qp/jiS4oCMTYExa7PKRkn3X8vF53UaggYLR3RIGR0RP3vtTkFkcTj45i9NF/1MqsAowRHIRZM7J1sT7MoH5mPoyUmfE9rCsCOw9geDQHDwZgtzXNoLZOxoUtnn/7XxFlH5XTwGm8miNNF1NMXNK2RClk0JmN0vZa6K0tvgy3MQQrfVlfQtooKx+TVW7DswfZ1xBhL6XY/99fGrr9umhcTTvIQOju/8bFRb+PU43edDuSqAa1Dl8uefZeruYCvQ2Q7F3PpzsQdVEmp25vaEmaXTX/FVCWaL0RmDyMBkcEuxhckV3rK3j1tS3b55r0/RW8cWGrc5ijUkHKSD3ascZiGfG5vNNFNt0KDP8FBQ7L4vtHXkYGp9zxnDSG7owgahkvZ1/2DV4Sw3bH2NHT5cs6NPHwtbQkCYHc4sMVL+O09gGjE0Piaaf/Z2lDBRrbk6hU9UPpA7yuV20piWro/+fPXGyPr2buxDCA8qTJoZFeMUKZAOk12524f0x0KjnqAjJ+vdyOZpcYJLfhfCRZmCKUUzz2VN9xue/olxZwjTQ8tKPKfjd6QVb1ybGaGR8RaXaY7aXe6DA/j+7Wc7sUsaeUI8ga3UHtodp0fRyJZH/cmsePtoGRYXAqDW/NwOSZvAdOW+W/22k4Ktg3g1GggDfzSwGWKz0HcFY6clJkNDY3PxQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(921020)(38350700014)(18002099003)(22082099003)(56012099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5ajel8b46g6ZmkIT1I2DnfZULLe0+0IhFZ0jZ84ZStCWI9Gny+HQpslxSTXE?=
 =?us-ascii?Q?m4Q7nCUz82SzoGGsOwPNB/VnDZ7TnucbGXAHbLqleqofaGsy0+R4WD9jlOui?=
 =?us-ascii?Q?ybJ2f8Sq0U0/nN22/cP3LD88KYAikmrNccr4z3CmpAMaF7i2aYDmiuQrxwLp?=
 =?us-ascii?Q?pp+hWN2DSy/AzPZI/tuJKXcEixqrqJTn3Ffu6WPtwI786nj1yiYtwY/wfi+5?=
 =?us-ascii?Q?SRS9s5KKn4e85LKCofun1Y3vWCdSEi9R6oULGcZjNhSbI8as+cCYFqvkH0b7?=
 =?us-ascii?Q?HZJhAABUCBXmRfCDO2J8IBMAK2Ls1rAXkxtRzt2H667L9AEGj4UUpzi8EM2I?=
 =?us-ascii?Q?Im/KoegXX//y83vDjopCMue3fdVPSyWcZ6CyAkgZ9yKYLFDIIjSBozfLv23K?=
 =?us-ascii?Q?lw9ZLWH9MffE9666V4Wi9mQjG/WR6WKGS/+9ao9fa8/6QyJe5cvnB02Vmo6a?=
 =?us-ascii?Q?U43/R0Umfhwf5GT2txH79eEpAVELxCtjwfBk7Evj1KDovyOEbIty7IJMtaoV?=
 =?us-ascii?Q?8hgcx33lWnS6e/KsMoNC/ldwubj1jM2clWVv8z4XLXJqz8cEBB0BewJ/9bpA?=
 =?us-ascii?Q?Tm3wHU5ur+MMwHsk/di9v00ZtR0zWLyvyLGU1C6lNGgg6YPOkNNt2O5BWXXx?=
 =?us-ascii?Q?HB8WP2kL6bv6/WEDPbsnrhOO5ZzJ+sC51CvoWPPGXKZh6liO0qFP89fnd8so?=
 =?us-ascii?Q?S6qtobJRBnrGlT/PtiSh9TLBE7CZxW2Lt+sS9M25VWg8Zk9dnqFl2v9b1wIU?=
 =?us-ascii?Q?nR4hj57SZVAoEfCLyZxz72TaaOQlhepbLyPNoDt45OyuTqTV4SOvldGibdVE?=
 =?us-ascii?Q?jZ3zgGBqzPI3wCr9AVc3slONE+jqMUzU3exP4sfxC0m2yMXHC+BGXR3RUtoP?=
 =?us-ascii?Q?ChC95pRYinXgcxNC5iom1odqLPFTLOFZE4yAMGTyn3JYaSwpvmyqNqTH9TDz?=
 =?us-ascii?Q?BYD3FNG97cpJ+QFDF2e902w0L9r9sKfbBQKSXVURlaO8KsEItwwzE1fAJ+k4?=
 =?us-ascii?Q?s/XEwpOnVkF0lY6dmA6fJpvAXAKwEZo03YpANe6vRIP7pI8gTl972eflOHe1?=
 =?us-ascii?Q?zxDwR/dPylBFhMRqa5UBjcoVEH5wtE+JO0c6erfl5/cwnwkoa5nIgdsbj8jT?=
 =?us-ascii?Q?aeRKbxhj8vQw10w4F7XS7Kt70mIoOIKGIPZDgwUver8HuvFq4IvTfwnR6S3E?=
 =?us-ascii?Q?z6pZs7K54w4MZ4yxpfqivF21emBmbEzesT4jBrdOJhc/jG6s8PJPnL9hSIQr?=
 =?us-ascii?Q?eRxRkC/ncLBKoCfMls/2v6ANR1qeS2CoOFydB0h5lxopRMVwqAloSRTX7+dv?=
 =?us-ascii?Q?gEiptS+a/7cxYNzWg3jZmJjK8TpQTSR4YS5idZ49gUY0y818ktGzzcCge4H3?=
 =?us-ascii?Q?+sKxvqR/0epnt0QKQOU1R4TMgfPiuzYfiD8TQYndkyscxlP7xs602mTmejEq?=
 =?us-ascii?Q?Bv2puZW7w1kFtcP2PegzfIY4cqRtv3HnZOF1I7NlPvkDzbLpJ5kH+wDOsQOU?=
 =?us-ascii?Q?Nx1uSW4aRWCegy2PZy5Tv5g+t6Ok1IZVHmdWwWIibwzBiX6nvmYmlP83xPyo?=
 =?us-ascii?Q?3ZyTTgURFRIx+ANQE0J3Keod5eMruby1synSUPFisnPE0sEPYBYIcO/IhAhI?=
 =?us-ascii?Q?59409aXcWOm8O8G6vH5YrAEGwLVUek7Pnm5Ae2sJehv4fX8TqZAygaZ5bK2D?=
 =?us-ascii?Q?KuFoa6WRDYMBE+pj8NeMxwND3s76IlJQwc6aw2uGPb/tMpSmDcYhG2pfdGWS?=
 =?us-ascii?Q?TbzD4YNeg9oisjyE3KGyQSSehsH2JtQVL7YzNUEQ1pZf3CpxQGkQ?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fbff69f-269a-402c-1930-08de83036941
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:26:20.9114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gxc+nF3nPcsxFa5gHB4NN1SANT9isejgbebBTIqq/0pjVu70hO3xoepZSQ+JXHV+5dBm6/IAHwUB9A5lgzO+gKUCE9/STBc8LUJWE8rCy3+5ExejQBsN2s9IY88X/FCO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10123
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[cutebit.org,bootlin.com,foss.st.com,microchip.com,collabora.com,linux.alibaba.com,linux.intel.com,chromium.org,bp.renesas.com,intel.com,gmail.com,tuxon.dev,mediatek.com,linaro.org,nxp.com,zonque.org,glider.be,perex.cz,nvidia.com,socionext.com,metafoo.de,kernel.org,amd.com,realtek.com,linux.dev,broadcom.com,free.fr,pengutronix.de,samsung.com,suse.com,sony.com,arm.com,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29434-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:dkim,renesas.com:email,renesas.com:mid]
X-Rspamd-Queue-Id: AC61F293FE3
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
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 2 +-
 sound/soc/intel/avs/pcm.c                    | 8 ++++----
 sound/soc/intel/catpt/pcm.c                  | 6 +++---
 sound/soc/intel/keembay/kmb_platform.c       | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index 67caea39b5570..f074af2499c83 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -707,7 +707,7 @@ static const struct snd_soc_component_driver sst_soc_platform_drv  = {
 	.pointer	= sst_soc_pointer,
 	.delay		= sst_soc_delay,
 	.compress_ops	= &sst_platform_compress_ops,
-	.pcm_construct	= sst_soc_pcm_new,
+	.pcm_new	= sst_soc_pcm_new,
 };
 
 static int sst_platform_probe(struct platform_device *pdev)
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index d53c2f76fcd40..797b9c9163b49 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -1349,8 +1349,8 @@ static int avs_component_mmap(struct snd_soc_component *component,
 
 #define MAX_PREALLOC_SIZE	(32 * 1024 * 1024)
 
-static int avs_component_construct(struct snd_soc_component *component,
-				   struct snd_soc_pcm_runtime *rtd)
+static int avs_component_new(struct snd_soc_component *component,
+			     struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dai *dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_pcm *pcm = rtd->pcm;
@@ -1377,7 +1377,7 @@ static struct snd_soc_component_driver avs_component_driver = {
 	.open			= avs_component_open,
 	.pointer		= avs_component_pointer,
 	.mmap			= avs_component_mmap,
-	.pcm_construct		= avs_component_construct,
+	.pcm_new		= avs_component_new,
 	.module_get_upon_open	= 1, /* increment refcount when a pcm is opened */
 	.topology_name_prefix	= "intel/avs",
 };
@@ -1755,7 +1755,7 @@ static struct snd_soc_component_driver avs_hda_component_driver = {
 	.open			= avs_component_hda_open,
 	.pointer		= avs_component_pointer,
 	.mmap			= avs_component_mmap,
-	.pcm_construct		= avs_component_construct,
+	.pcm_new		= avs_component_new,
 	/*
 	 * hda platform component's probe() is dependent on
 	 * codec->pcm_list_head, it needs to be initialized after codec
diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index 8356dbdb2809c..7b2bab12c7075 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -603,8 +603,8 @@ static const struct snd_pcm_hardware catpt_pcm_hardware = {
 	.buffer_bytes_max	= CATPT_BUFFER_MAX_SIZE,
 };
 
-static int catpt_component_pcm_construct(struct snd_soc_component *component,
-					 struct snd_soc_pcm_runtime *rtm)
+static int catpt_component_pcm_new(struct snd_soc_component *component,
+				   struct snd_soc_pcm_runtime *rtm)
 {
 	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
 
@@ -1056,7 +1056,7 @@ static const struct snd_soc_dapm_route component_routes[] = {
 static const struct snd_soc_component_driver catpt_comp_driver = {
 	.name = "catpt-platform",
 
-	.pcm_construct = catpt_component_pcm_construct,
+	.pcm_new = catpt_component_pcm_new,
 	.open = catpt_component_open,
 	.pointer = catpt_component_pointer,
 
diff --git a/sound/soc/intel/keembay/kmb_platform.c b/sound/soc/intel/keembay/kmb_platform.c
index 4ed71d11ad778..6659e8060ef3a 100644
--- a/sound/soc/intel/keembay/kmb_platform.c
+++ b/sound/soc/intel/keembay/kmb_platform.c
@@ -388,7 +388,7 @@ static snd_pcm_uframes_t kmb_pcm_pointer(struct snd_soc_component *component,
 
 static const struct snd_soc_component_driver kmb_component = {
 	.name			= "kmb",
-	.pcm_construct		= kmb_platform_pcm_new,
+	.pcm_new		= kmb_platform_pcm_new,
 	.open			= kmb_pcm_open,
 	.trigger		= kmb_pcm_trigger,
 	.pointer		= kmb_pcm_pointer,
-- 
2.43.0


