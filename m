Return-Path: <linux-renesas-soc+bounces-8344-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C052E960615
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 11:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 781302829D3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 09:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E39851A08A6;
	Tue, 27 Aug 2024 09:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="GyYLYFFs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2055.outbound.protection.outlook.com [40.107.215.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C23145A07;
	Tue, 27 Aug 2024 09:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724751779; cv=fail; b=YELgb4CyTlo8cB1AxMXfFkNuGPBwsjD00nqtRBTBK+VpCp2zma81sBn+jwQYGcmuWcGeOgaCpEp7uVY1g/ZkTyvHIrgV06rmGDdOajScYO5hYpUX7YAQ9vZ5JYJP7U57hogM/qD37Mw/CDhk4IpdxoFa67a6RxUZwkzL4VVfd1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724751779; c=relaxed/simple;
	bh=zeX/YnL+vXc3rtOcLL7mYLbRFsPSV5CJbQZUVBOm3VM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c2Y+23V6PHHnOacLziXVmm5j9J12YJxO38RAz6D7BiOWtaM8eRR6d5VwzEFad6lx36tJvHLt4edXti96nEhDLfz8HQUO6z/lNJu3O8jvGfTBy+aRz5kk80zmO1TXcie8/2tECfEP/CTcBEWAaNlYG+p+lUbF4+pgFR6diu5yuKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=GyYLYFFs; arc=fail smtp.client-ip=40.107.215.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hwHk+GqvtI3HEVAtOEpovTFa6tzOkOfoiQNiVWu4wvIrebJflPxcq+onAxDeD4ezkBk0P2G4OsBTobAtzL67HTla3KFzUmvYM0UzQL4oCWArCmmPnZxrz5ENsyL6eZUe9qbygFFNlA/TB2DeO/1s5NzeSDkmNGwPfTGfIXfhTHgI4idzXM3NwQfoA7ZmEqDVTKP7Ub1qHf2vSvYYe14Uo7iXWl2pxm4eBiMjoYqfPOQTRJtXIK9PCyAgfVf/9mnd57zLkAHSyWjRsETbiGosb7/OMXi/nEfVziYYIRuFGeudV+d1nGq/hL86lwfyShgzae+znvqpfFA6N5xyoHGsSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=loKZ3Jg1P258pXcp3YCt+6qnQHyeqRZ5FiyqwfFFhhU=;
 b=AntMXu/Hxece4NyI6wiHCbixUdHM/A7N8Zf1ggffJU3HUtMb0xQWnMGWuPa+SB8qgQEO7E10yX1Zl0PfUw4WGpawawy2byyY5g+qmsjkRbN1JrjBLGuSTxwO9eYd0/fjUjxXNOsVw02mR343vm2Dr3k+WXmesrJbIF5xWGLgattar1MZ60Tbln9+eJYWSv0xnJfOKnkTT/9WoFPJ6Tb4bau2aBergVz4XILi+o+I0e6tHern03dP3EaUD7yoRcbOrPaQxnQAOXngFbZSrQtrVFPV/MfgPRoxX58HrYfK5icAWczXYABoZLGiaHdnrdpLc9Qf3R/eTIAmyfJSz01QGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=loKZ3Jg1P258pXcp3YCt+6qnQHyeqRZ5FiyqwfFFhhU=;
 b=GyYLYFFs2fYub5IdVSNekgcJcn5yAnqd96V0a7zDqopfYoOmYw44IkQl0omWTmdw8xN8tkhbLqV4mN0ZvkZGDeqazfc5rNH3cO4dkRylNhBLHlQduAph0ZWaSLgcebQknVB7qO58j3byUa1ZPJaKMv9Uo5J50hTS60NTwdRxvoOS1NeuCMnXoU2I5lUbVSYWKZ4qNU/8MIkW7//tDAwuUjSrhxUUQUOKn98LM86pU0DV922iPt8pO61qxHWIATkkO6LzhtABb+13monTnnR3RLtIAFTc+MfH58+xGGzN7A+yfJW/hOUCCj62UMAsPJrdeDfV/bxyrgk1ECdnvB+Elg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB5734.apcprd06.prod.outlook.com (2603:1096:400:281::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 09:42:53 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535%7]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 09:42:53 +0000
From: Yangtao Li <frank.li@vivo.com>
To: clement.leger@bootlin.com,
	andrew@lunn.ch,
	f.fainelli@gmail.com,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	ulli.kroll@googlemail.com,
	linus.walleij@linaro.org,
	marcin.s.wojtas@gmail.com,
	linux@armlinux.org.uk,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	mcoquelin.stm32@gmail.com,
	hkallweit1@gmail.com,
	u.kleine-koenig@pengutronix.de,
	jacob.e.keller@intel.com,
	justinstitt@google.com,
	sd@queasysnail.net,
	horms@kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Yangtao Li <frank.li@vivo.com>
Subject: [net-next v3 9/9] net: marvell: pxa168_eth: Convert to devm_clk_get_enabled()
Date: Tue, 27 Aug 2024 03:57:12 -0600
Message-Id: <20240827095712.2672820-10-frank.li@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240827095712.2672820-1-frank.li@vivo.com>
References: <20240827095712.2672820-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:196::16) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB5734:EE_
X-MS-Office365-Filtering-Correlation-Id: 2300050a-1963-451e-acac-08dcc67c9f7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EmPvyhko7dfPYZb8SeFkqpfCgWtq4VkejUzPjSWu/EnXwBIJfXIg5zF339cc?=
 =?us-ascii?Q?m2VZdWlQ2TKgBZQBJsFmwlEC3mRP9SRj4IdOjG6W7Dm9rXXgOfIo03spaUdD?=
 =?us-ascii?Q?0X2xsZvlDjrrOXoP0mvEkos1qCDMEzM9VNaiQ1fRgYsvkcnW8q39JJC6f9Id?=
 =?us-ascii?Q?SrXjd3EipMHOf3g+0oFZrq7m1uv6Ux5ZwbSjn+ZUA4uSoz/f6Tzk/E41zOH2?=
 =?us-ascii?Q?NJiI+hAsM763H6NRKoHkSzZf+sysQKWNLiCCoNw4oWBGiBrkgosPpXUsgmh9?=
 =?us-ascii?Q?WbwsBWHL/cRq21P4wiVme7zB9I8USBYA3cwD0cABnPW6WFrMsaRtIQROY8sI?=
 =?us-ascii?Q?oZGABwxZ0+6phDT9M/pcvcgDDCTAwkgT/C3oHYG4poqquzjQZ7XiIWTxwmfq?=
 =?us-ascii?Q?oRi4kjFMkROZCbu88pBryaEcC/7S4/sb4v3SKcmFHiA1BHNFBCqIA3PznJ4e?=
 =?us-ascii?Q?1aCsN/3oDyo78crSBVWIgLS8x+f5wDKsUKT8ru6/aw+Bm5Lr+NtWrNP8Xs96?=
 =?us-ascii?Q?IiAnKViA82pMCCG48+aXKxVIcKLvWJnRVIyMaYajAuXzumMDctq1T6RAt7Ns?=
 =?us-ascii?Q?mvSBBJkNAG3IWklWMPobFaLLBn/dZ6lTFnsCKIB4ZFnBj6oGDcj9zSD6iVPb?=
 =?us-ascii?Q?sK69m2QY1tsXxP8VEj2AJm57EAeDtMbOWR88Lb5r5MpxzaVLfOwL2fu4TzOU?=
 =?us-ascii?Q?tZFFjD1SAXgBA3mbXFRI67ZKK7gMCvi8dwQ/AOPyk5J5hOz+2ev4/lxFhgdd?=
 =?us-ascii?Q?NZiHhbAtqWoM4kZ83cQa6chpxZwwCjk2eHoJSN0iV+o87V0WIqz/qZe4ALbL?=
 =?us-ascii?Q?xQQdZd30nObUc+UdxV2sIafq2p8YhQ15MHe9jqq13sdsBCVTREZqzA/U0c2J?=
 =?us-ascii?Q?Tx8/ayPR4xXpwWiQK3JPLHcIdXYw8FBb2VClYKl2WnBk25Zq+C0OhaXBD7Iz?=
 =?us-ascii?Q?bDM7FwqF+l94OEPEmVEH4QPSsmnEpKqVlyNIIeuOTGbDA9kBEzEpgd5egriI?=
 =?us-ascii?Q?U104VdjRhvfAcXy7jwacpJPH0MOJkCCVDPs5gRwUYO9oB3yJtTbVGqLg3Sh9?=
 =?us-ascii?Q?nFJPFEBXq3MyVFxeQDFLkn7rurOcJn2VVpLHOZU8IA90sjzbD3gbU5KjBcek?=
 =?us-ascii?Q?Pn4h/0uq5yp16C1URRIYD1L7IrF8vmNNTbWeS3pcQOXerSSK+WwQ7bxXPBTQ?=
 =?us-ascii?Q?3SyWv0x9sx5kzn0EIUWBOo582ZAmcGyg5VoxcTSnWAWmEuL7LDhlutnnPz3N?=
 =?us-ascii?Q?ZPG1reHSYLeuAzLq+Mg0aWQw0o9LAr/q2QDhdY3deo3/RyYoDz8BBEmjQz6+?=
 =?us-ascii?Q?NLSkIrIXsfgMIwelCfVasxrT2A7T3TEiRlWJEZTzefpa9PAaJ7u6PZ8Qt2VL?=
 =?us-ascii?Q?a+QT33oQVV5Z9jZCBgQp59ySG0AQNRvvutCvLoogCi6XJY1+xPj+w8vgc4ty?=
 =?us-ascii?Q?cb7m+7ijoZY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YIDQB1GhOUHvjOuGaDZNgZVExRU+pc+OxHOkTv34zXoR9uXKAsQyDvOwqYlT?=
 =?us-ascii?Q?Kv74xdPNFFGiNzxxznZ0V0rJcb/z8G1Q/D82W6EnGnBNSkYUCRzLhbh+51aL?=
 =?us-ascii?Q?+i2kvfAPrLag9pYPgyn61EUbwHqsGIg/KGimqsenMsWn96NrYmr51yUAqkMg?=
 =?us-ascii?Q?GfhtyIUBZbeHUxzwljtoVBhw9n1cXRoUVvnNXU5ZKSlSNGKz3Xb1FztlfiqN?=
 =?us-ascii?Q?VlBQR1dpKTws2sgYf+WbALCyOcy9OIdUaFPXCI0QDHFaQ7GvP6OEs0jpKvwF?=
 =?us-ascii?Q?xnT0IASj4ApRjfzs7lX/zO3beACHF3BJOS4Kr2hnqGKMtFsXq7oft1FnBv+R?=
 =?us-ascii?Q?qYUUdUPupE6GZeSf73/bHswhiXiYQGeY087qgfr+Z+kNEs4jlCtUTBXiAxq4?=
 =?us-ascii?Q?EzE+sbDD5WLGoOtENLKtLJzbIRIO5adjPTumBEpWYg5jHyBAqbnjSJl6q6FM?=
 =?us-ascii?Q?PhL0KizgcsYjXfKn+R/bF+r9o6bVoRcZHHlEiqw6EWfGDQvRMPSf7qJ+ZEMk?=
 =?us-ascii?Q?oqu9+Bq3xLzFcCB/rINS5lwsKNq7nXEOUbeVPBpFA6cMqpErzOn4OE3ugAfA?=
 =?us-ascii?Q?USMM4zxvapVaKihLb9XHh18ixquB5lamiGDgEaVoq9RH4Cwir8q9GSkfc1ss?=
 =?us-ascii?Q?pwhflR8t8NZFN12uiN21lxvGr1DzXhxmWlvtcFnsC2e2l4Mzweg3SOzGbBC7?=
 =?us-ascii?Q?Wa/nmlQnVF07SHPPEi6OCDqiGjT1DF8V3ufVfLBPQwrKHmcqqO9Blfu7+IcA?=
 =?us-ascii?Q?xncG5H6T+Ac8vFhT+CaVA+KI1aEGqwdhACBUS7RYizB7sVhlrHTzl1P+cunF?=
 =?us-ascii?Q?g/UjFWuzGh5QLAVvSiuDEuN/6REJUD23HYWSbU8neEnh7HRiwqqD6y7SXXe9?=
 =?us-ascii?Q?VPO9gQ3+xaocv8AtpN86XCFxBXRxwoZ55Z2DMRkFST/70SLIXY86U2GiCet6?=
 =?us-ascii?Q?cf8BJ3Zr5px2cptKHxEipsgliUHaYdtwaBkbIIC8oFe+9rgD+XHtAcG6KFEP?=
 =?us-ascii?Q?h6ypV3aW+nsxCB1mAcKOaJmlp+Ty2xr1Rgm7grkbJKrtMYxieKLvtXKU4K9Y?=
 =?us-ascii?Q?daG/wI/fN3XZ4T9mipHDMbZ89lr63j0AQSvGl88G1S0pPVLaSnJ/h0FjaYfO?=
 =?us-ascii?Q?nxT552ZipwV1iyrCw3z7bRxYiZ5stVasMd/EGklgdBJt6hJ12SSJUKE+9X+3?=
 =?us-ascii?Q?SkGFbE4/a2bVQb4aeA9/zSSqwhKgWewWFiXJ8BERDfoYTUNeFzX69wjg/ONm?=
 =?us-ascii?Q?F41o8FaAY4Yir+zE+HqNIsybH7g8Dpxf5gvIMXeIhTJKX5Hy0YSW3skU+HR6?=
 =?us-ascii?Q?Mr48GiAIw4ikZAUGVBBFlcp7Dkn3Pc/OICPx44Fyme0NSyn8DtwAP33A2DXk?=
 =?us-ascii?Q?T+aYidx39jeN3Uq5MZgEsi3NS6bEJxK5dRI7U0o519hbGsoEAArzNiUKnT6o?=
 =?us-ascii?Q?by43SjOlAAWdJ8srHfFXvxww2W+s9IhRLyY5GVmeHabpylVVF8Vj9Qw8MIRg?=
 =?us-ascii?Q?aMskr7CCfpf7Nh99K17/IJC9n14DOCalJdfE7fh5OgZLT519SD+tqIzbLygo?=
 =?us-ascii?Q?dlJpS4J+9tnqE2BOjHtyGy/G0WtzzlaKYgnchBJN?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2300050a-1963-451e-acac-08dcc67c9f7e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 09:42:53.5264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KnQGE2Og8283HW4EoODAnKWWEx2eM67AUosbCNvqNoL3mB27Zr+GR1eXZOoeB1/vLC5Ngon2r+bya+nK+Fv+/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5734

Convert devm_clk_get(), clk_prepare_enable() to a single
call to devm_clk_get_enabled(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/net/ethernet/marvell/pxa168_eth.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/marvell/pxa168_eth.c b/drivers/net/ethernet/marvell/pxa168_eth.c
index 1a59c952aa01..bad91cc705e8 100644
--- a/drivers/net/ethernet/marvell/pxa168_eth.c
+++ b/drivers/net/ethernet/marvell/pxa168_eth.c
@@ -237,8 +237,6 @@ struct pxa168_eth_private {
 	struct timer_list timeout;
 	struct mii_bus *smi_bus;
 
-	/* clock */
-	struct clk *clk;
 	struct pxa168_eth_platform_data *pd;
 	/*
 	 * Ethernet controller base address.
@@ -1394,23 +1392,19 @@ static int pxa168_eth_probe(struct platform_device *pdev)
 
 	printk(KERN_NOTICE "PXA168 10/100 Ethernet Driver\n");
 
-	clk = devm_clk_get(&pdev->dev, NULL);
+	clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(clk)) {
 		dev_err(&pdev->dev, "Fast Ethernet failed to get clock\n");
-		return -ENODEV;
+		return PTR_ERR(clk);
 	}
-	clk_prepare_enable(clk);
 
 	dev = alloc_etherdev(sizeof(struct pxa168_eth_private));
-	if (!dev) {
-		err = -ENOMEM;
-		goto err_clk;
-	}
+	if (!dev)
+		return -ENOMEM;
 
 	platform_set_drvdata(pdev, dev);
 	pep = netdev_priv(dev);
 	pep->dev = dev;
-	pep->clk = clk;
 
 	pep->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pep->base)) {
@@ -1523,8 +1517,6 @@ static int pxa168_eth_probe(struct platform_device *pdev)
 	mdiobus_free(pep->smi_bus);
 err_netdev:
 	free_netdev(dev);
-err_clk:
-	clk_disable_unprepare(clk);
 	return err;
 }
 
@@ -1542,7 +1534,6 @@ static void pxa168_eth_remove(struct platform_device *pdev)
 	if (dev->phydev)
 		phy_disconnect(dev->phydev);
 
-	clk_disable_unprepare(pep->clk);
 	mdiobus_unregister(pep->smi_bus);
 	mdiobus_free(pep->smi_bus);
 	unregister_netdev(dev);
-- 
2.39.0


