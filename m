Return-Path: <linux-renesas-soc+bounces-29433-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULjlKlRqt2kYRAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29433-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:26:28 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAD3293FC4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 03:26:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8357300B46D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 02:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C97D30BBBC;
	Mon, 16 Mar 2026 02:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ck/FccJY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010024.outbound.protection.outlook.com [52.101.228.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F242DA757;
	Mon, 16 Mar 2026 02:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773627986; cv=fail; b=X7HZurXUPs6ZmfBgkFsxebF3OdQNvtT5hiOPN8e7V0ESgYJH4MgTk7bhEom0CT9m1I93AjEfi9zSba+MCG6KCKUjQuFqzoIprAZM0NFfgb55acWhiYNpSRSwp7f2HbOlARf8OdyqMs+8p4Ez1CKWkUZhegiyXV9r21a1iOcBJmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773627986; c=relaxed/simple;
	bh=WuUw04zVmxQY1F4dGg+QNOB1R2R0XMpT2Gih8V9iAsA=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=p+r5yY//fXVxjEbKwPVoaio3lFNLUFa+iMCYCwBURA34uXwxMMNMYdYc4GxaLmdAUB46gfEgEynG47xdkRNn4jMmk/orN6hZzyZpsfkOng3qQaPC0qz1JH0f6yRlhf3RapatZbmfkc4a0fmtpIS+2veeI7nUXAmKaSJW3gB1UdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ck/FccJY; arc=fail smtp.client-ip=52.101.228.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tK6Lta07SQ9PFTg+I8Z/MV2JqP6gjdXj4p2fe4fpI4DgPeBkZjJS8i22eBfVD+vqEyMg73x7oY9kWCVilwwrwmqZvN1fCAMEP5rfQIBOFAVE5cLLyZF383q4aLnSd+mCJmmi7GOpZyoebpvjh5nybRg1zbWYZRcgFAIwo80dQ/cRWD6hWirAGqKsL2faAqnQXxeZzJbQuELFpAScp5OgrTwK6kBAVmOrbt4CcV9LIV5SI6iYTdYPPPs6M83e4gFXpZe7NZgp7ABhJJ8CcQijlI78lc8ZwXRzPxXvj4zzn+6c9UDhP0WRWt9TbFZZmFpLZn0KhJXOeF4YIJH70TrYlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSKejLoYWhxaUICxD1/Pg3RJNkZbAKALeD8ZWewAV3E=;
 b=LjV/O0VGe+fe6lYvHvVFpZ+x+cDQKlFbN9Fi1xQo038W5YIwIo/yg8P7JTOTphauUu/nir3GBY07VcjcA9gM0vnt7S0u1SGY/jEziY/sE3AGdS5WBTxlQ3DbIz9e3V3l1LOjoFXD7CkebLss5TR+2g1V7UZP526bYuy3sgOLemIf3T0h7A3zSqZ+zG2KlRQNZP94N6b7q5/RglTUkBpv9p+ywCAR2dU7DzYqgHNPB/ZXrT5ZH0sJKln8X4om5Bu/0LAXtsODHTYMwbr+pmuVPn/9cGczZOuOSE0PLwC4W6XmIsQreUaAcxgu3YkJ7IQOrH2RcfKJMR4jTDzQtuwFbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSKejLoYWhxaUICxD1/Pg3RJNkZbAKALeD8ZWewAV3E=;
 b=ck/FccJYxqS73LqZK2kosoeLeZli78XRBm6pn1qpB47Jm84BrjPoZqYKkzsW42TKBC5/8UYtTtobrOpO9mQ3FCcgMzvuiT2x2Wswaa7yHVIjoDy2lJm0J680k2rIC+qbEErPHRGzaiRK521+RUj14i1MPXi5Zqy1msAL8EZsMt8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS3PR01MB10123.jpnprd01.prod.outlook.com (2603:1096:604:1e2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 02:26:17 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 02:26:13 +0000
Message-ID: <87tsugjyr8.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 12/29] ASoC: google: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 02:26:11 +0000
X-ClientProxiedBy: OS7PR01CA0178.jpnprd01.prod.outlook.com
 (2603:1096:604:24c::20) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS3PR01MB10123:EE_
X-MS-Office365-Filtering-Correlation-Id: 314b3c30-a804-43b2-c36f-08de830364b8
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|921020|38350700014|18002099003|22082099003|56012099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	H8/ZBY7WTNMNzPwnKaCte+rQXsWuxnxfZfIRLsRlgvJMgTR8+7thnQy056a1ihNWK9Yl11k83+6QipPambP4q7525mZGy3Ok4ozRgEEQfs/JRhfpW9oJXrdNuu2AxWDCrC09baLuB2LEH/TyMSs5Up/1kgDiE6RahyWM0GVQhmMDUBcd1uYGzNAFzGzmk6xGK2IpYxqHqvyMkhynGfb67Xi5gQBcr0/1SSBYolyrfWM3eqP2FqjP5EeGo0XSQ/ph1kx364xAz1vTJRTWtCOMFPHnFmhXpWMyd/7JvpSOrrgcR+Kv3cOPs9Qiko2L5jKzY9A+sFrw/31DI1jR8Uwq6b9bFE1JonimDxHVD5VntExkH/xwqbD2Wf713dhVvqLlkH0hjZH5Lea3car/gmKltL8tx3bYxFI1eQhB6m0CePMnUSzxcjXM8vyVEP6MZ2HIlb7OsNJ1BN2u12KihKAqx3JAtdbKezycmbW4o7w009acsSJYiIclh/IEP6jKviq3wRPl6o2v/anPgeNM45HWjd/rpgnMdDIdHhHEjNDyi1ceCmVgZayXNYj/5wxiZyH9oFYwiFd2ycK/wqHDHgoxKjv+wQ/UGjIBNLA3ZKZv0SL127RupNo6YzeMHFpLSi+qol/iwVrsGgpu10BilL3w/pvmqtztJhIXhQovH6FtVyq7dCmMTQX9Mool6Tct7JQD5tmEQDnGQunsg8jTa+tf3yp9wQ/JxIWKrVYm9OmUq4CCCPL6XgX2vitx74I7+EDdRLP697d9VIaaBBKYhVj/7pJTxyf/BFcprybZ/2eyn/5uiSxBd516bDBajEFuOEO0TMk5HTB7q+zlQkjILUrvKQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(921020)(38350700014)(18002099003)(22082099003)(56012099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KcBw/ZAORAcGD23VGmU48jr5iuPMNS1+1WD7MpnxZnAgFYXBwSl6lSEROIqQ?=
 =?us-ascii?Q?Dbu876hmfpnwplUtp1Ls/hqLdpRuH2BCqCP787nj9aHikPhYnIi2J655IxyB?=
 =?us-ascii?Q?yOZYUojn24CK3nYbzxNHU3h5VNx8IzC5eXESzGtXXvMiBpnChPZv01CQyoGr?=
 =?us-ascii?Q?0T7MW0LVOOGQTJ9BAD6m52gvhbY+BTEG6i+0gUIcGAmn5LBFvwTlp+l7XkZw?=
 =?us-ascii?Q?yL0+k94ceeCJgK6vWranusZdAXfJ+7YR6wM3IwfTduKFAgWDwBRw9IRkgH0I?=
 =?us-ascii?Q?UNVhimyTRjbzdj0tPhMrzdJgcrndpq/s3l7nzX6IHHY2At0sjEmsRyLdnsXD?=
 =?us-ascii?Q?Xf7/9Q7coxAZ+CklXdX8N2+AlxJVLqJs3v49+bl95Xl5/9Xu1yNm4e2DHxAA?=
 =?us-ascii?Q?om64j8EztjhZNJGcpA4JikX6hgtSMzdunzDNN/nXTyYFkf6S6d00+bP3rXiv?=
 =?us-ascii?Q?wV4MbPdZbjMb46u3PZJJn+ddQT+J0Bv4DLuDK2/OTwxBCfBLkArDHuxxP4Yc?=
 =?us-ascii?Q?oySiG1+g9k83mjKgLVfalZeVi1cAYzJ91bvAbBqdjVlaz/z3pGkgiobmkUgu?=
 =?us-ascii?Q?JDg+2rbKPzZQjIFSgttLhomk9oaw4svbw+2PiAFeFlyVcCeH2p0cfBsok3Iv?=
 =?us-ascii?Q?YRux1VKUdAPGmD4Hvo4JPBkBmgihFI4LE8ZE6a5rjpnQ9VMzV31Xj+EgRR6R?=
 =?us-ascii?Q?BjWmwVPIumWlLlKVb4QeKg/zTKm7nexwNFR5DWMZsysBV8O/0Ema5Afu9402?=
 =?us-ascii?Q?NWwqdfHWZdc+n3XM1G0XaqCGmEPm0t6xiY9FtC5xOjehOxS3qykRejdIqZMt?=
 =?us-ascii?Q?7EoeFnQ70Xf/SlFZaAivDknc7306eiytaCnyNo1WlcYNfVfO2IB/qcLBGI0A?=
 =?us-ascii?Q?LUCYlZGfZdEiXFwlPwlc9xK82wn7d9OMhcAtWhzTUOVic2o1goMDWOB8/TSB?=
 =?us-ascii?Q?oEeCN9cYeADixiJCUGxsi8qpRlPbRHrqMHdUVDQsE7ZTOgM5ps5to4R/NWa1?=
 =?us-ascii?Q?C9B4wXb1wTpS7U7W7LbRpcp3LUIhXCeb0yePCbsne2O3/1K/bmEgFqxxYbh2?=
 =?us-ascii?Q?tGf5iWq0lrtDShZhO2MbYfwT690oYc2ik1cbKbRMp24wot/O19Q3IdmhSzev?=
 =?us-ascii?Q?6thjUwQb5ht/qymoE0obBDo0RLAW2Op0IhNEXX0tPdGQWO/TY+qKEY6q3Irx?=
 =?us-ascii?Q?Ib+Zv0RbxwmUxf3rfIr/kmiXPx5KnyemLDb8m66HUF+YNRZcJ97BFipKcoA6?=
 =?us-ascii?Q?kFDl5ejMXMiLEK59FWsJfqg4ggAHQfHGjoEG2WrKFYxmX5FXqTNc4g0lDztF?=
 =?us-ascii?Q?C+1z4DFI2YuID1dsoaXbLJb3CBQhJRg/xFt2yCMMP5GtqBDG38bIB7SA5KN3?=
 =?us-ascii?Q?tNlxX3CkKd8UyLan4ZTkKs8wceC72+l1f9IXH0JOvAZgNYZHnvm4stmg0e+F?=
 =?us-ascii?Q?LCF5LTO1yq+ESvj6cqilIg148xjnIxnDSOG0lB2FPup3SfWi+odFSKOQIju+?=
 =?us-ascii?Q?7vhxmZ7RbzbwVlkPdvJtC/ASGyR/7p0PnRXW/by2uwt4LyYqC8RoNifalx9s?=
 =?us-ascii?Q?KQQh+v9W0uJ2VHu+LN0MRbFl9JwjB1jV58lTpDwZcwlPFMe4gz/aBfCDPh4I?=
 =?us-ascii?Q?nuW5ruyNCzo4WxiibKxo90tfDqlYa6oOpz9C5lb7wxNWl+RHtsNTa/imbsWA?=
 =?us-ascii?Q?lyVtT4KG50G+UEwHCfjOvMdkHQAIpNXycuoKyfd3MyrjueAWGKpA3EqaSWGh?=
 =?us-ascii?Q?DyfrSWSvC5stfKsnsn0gUz8OXTLzlr3AnjhyYUZf7qpSGMi/SmTc?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 314b3c30-a804-43b2-c36f-08de830364b8
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:26:13.3692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NCzIkyOoosxnNkOzJM6AILEeOchKCRfinOcP/OgYydnvFJIwkvrGFMb6//GTPJOXZVxydKDPuccYFfM8xn3i6k1KIMQzJQCI1rjmhJV5yex0rF6ZMoyg2+Mx6WnlW4SB
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
	TAGGED_FROM(0.00)[bounces-29433-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 2DAD3293FC4
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
 sound/soc/google/chv3-i2s.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/google/chv3-i2s.c b/sound/soc/google/chv3-i2s.c
index 0ff24653d49f4..fd12cedfe1c9e 100644
--- a/sound/soc/google/chv3-i2s.c
+++ b/sound/soc/google/chv3-i2s.c
@@ -163,8 +163,8 @@ static int chv3_dma_close(struct snd_soc_component *component,
 	return 0;
 }
 
-static int chv3_dma_pcm_construct(struct snd_soc_component *component,
-				  struct snd_soc_pcm_runtime *rtd)
+static int chv3_dma_pcm_new(struct snd_soc_component *component,
+			    struct snd_soc_pcm_runtime *rtd)
 {
 	struct chv3_i2s_dev *i2s = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	struct snd_pcm_substream *substream;
@@ -271,7 +271,7 @@ static const struct snd_soc_component_driver chv3_i2s_comp = {
 	.name = "chv3-i2s-comp",
 	.open = chv3_dma_open,
 	.close = chv3_dma_close,
-	.pcm_construct = chv3_dma_pcm_construct,
+	.pcm_new = chv3_dma_pcm_new,
 	.hw_params = chv3_dma_hw_params,
 	.prepare = chv3_dma_prepare,
 	.pointer = chv3_dma_pointer,
-- 
2.43.0


