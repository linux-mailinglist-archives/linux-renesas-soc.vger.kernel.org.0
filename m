Return-Path: <linux-renesas-soc+bounces-8107-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE73C95C63C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 09:09:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CE31281845
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 07:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E307149C7C;
	Fri, 23 Aug 2024 07:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="jqha4XvR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2057.outbound.protection.outlook.com [40.107.215.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D70149C59;
	Fri, 23 Aug 2024 07:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724396838; cv=fail; b=KApzhMDbNB4L5nIsbP2FZDQdhcDY80FyBOxRY8xXim0f8e41yLFh5Dk2At/If+W6H+Q7cTDbAU/rHnMC/2eaWAkV9VzIbgQlk8pyDAQjOClQ++3O+KlgnNf6IY+trN3O21N23AtXWFMxA7JKJxV/kSocSAMbAekYCruWgZ5fKbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724396838; c=relaxed/simple;
	bh=zeX/YnL+vXc3rtOcLL7mYLbRFsPSV5CJbQZUVBOm3VM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X4iJ70Qkv6T06QsvqSD5w20tY0Q3tsQkkeo0UuD8YnNBhQoWsheOjuLdnZ7Rx8IF3RevzAo+2n0VWHI0m34QBv2e3t3Dfno0VCMMg3+ydL9P5eSOpidhfHFj/nMMCpK8BvSQHgYI0uUBSDW6yTR+O1XOM9IumOHewqFUwPaDhsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=jqha4XvR; arc=fail smtp.client-ip=40.107.215.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2D0KqWreQIbSwRFo19ORgXIfe0tYN0EVDkllfD0XJb8m8OjUsAeaPR9WHgTJck3Kftmtti9edg41bAf4Zl1fw6kIBH+ADajjSWXHtphycADvXhOEnBEdWlZZt5FTOn80CuY/ugz5ZSWbuvUuIZs03qaP9DnkELMnlhcIdt/XP2mOByu9ZgPAWmmVK/NPDKAFGvNjZ/oFwyBHwS9vCMTRJ12/vmdFuTnW7eeKnBGsdXg675EX1N8pW5pEvgtCPXieYkySv94d6HefiKoeAw5HX2+clen2zscYh1fs/mPARpqX8Vuzk55FeTbyjo8X2Bw79BahMIp5FjBw29xXK2UYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=loKZ3Jg1P258pXcp3YCt+6qnQHyeqRZ5FiyqwfFFhhU=;
 b=olPfDqzMDeb3SOWfwuIi0UyOmY4hpleHvOKQLIRDQSc7hV3k91RyUs6glUyNIim09RxajF4TAF/MEg22VOSVWRYEErza8KkJ5BDGWBax82XtzPWw1v2N+c9p3qYElSp61YxMU2PEm/DBydBbHzFbjk3CZqyJQ2L8mppuiS6j12tR1yHuFcKewOlSjwk5G38A+s6bPMNcPI+wuRb4Hf5dU9VplQUYsqzLYZDet7s4e4zF0w7JftORq4aQkWSXblXcLZRSdsIAaYYmvUKgByR3Nh9Xc8hS+eH9uUvxODm8PmplQBIGq0TTZCkeugJUBA/YYhkulK8kBd6UD+P9M8Xplw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=loKZ3Jg1P258pXcp3YCt+6qnQHyeqRZ5FiyqwfFFhhU=;
 b=jqha4XvRQ8O9flSPaRY17jW0G/MCRVcdrDhFJJuIUm00wXgTS1OnwKnboJ2eE9rD9rLbpNVmWnMcDwvL/XCNzlUhGXlJ1U33iJIio9ttf+nXxgV0UZ1r31iZ+m7CUMmsdiO6GnHpGHptjTKURQiTgxYBGbAyN8W6Bd6E1IPHJPXirHhoJcuSUBT9dtSK5p3yYjv/TsU2udKEZWQ+8jOtCo3siL+j9OoneDXmUJb731FWnAVNqolqVr6ZjO+JSKaZkzQQHXtDDNWS2dWNNfnAuPFGMTkU9ef9XEAm/S4uZXE6k69Z1bHZN3x4RiCBXRYOgRL3dWWV2Fm/Ty8jKTwJHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by JH0PR06MB6980.apcprd06.prod.outlook.com (2603:1096:990:6f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 23 Aug
 2024 07:07:13 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535%7]) with mapi id 15.20.7875.023; Fri, 23 Aug 2024
 07:07:13 +0000
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
	kees@kernel.org,
	justinstitt@google.com,
	u.kleine-koenig@pengutronix.de,
	horms@kernel.org,
	sd@queasysnail.net
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Yangtao Li <frank.li@vivo.com>
Subject: [net-next v2 9/9] net: marvell: pxa168_eth: Convert to devm_clk_get_enabled()
Date: Fri, 23 Aug 2024 01:21:21 -0600
Message-Id: <20240823072122.2053401-10-frank.li@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240823072122.2053401-1-frank.li@vivo.com>
References: <20240823072122.2053401-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0001.apcprd04.prod.outlook.com
 (2603:1096:4:197::12) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|JH0PR06MB6980:EE_
X-MS-Office365-Filtering-Correlation-Id: b5ad0c70-d0ca-46b1-0367-08dcc34236bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wub3cS4t2MQTIT8vSRdjk9BRaoViw9TFYXhNPtRBdM8S81eZ9SpZhrz65iTl?=
 =?us-ascii?Q?vy/9GKAlTKSFXjTUL6TEsrtvaO1HCBnHTp4kdp+uGEVGnG+YTs8mCZInHX6t?=
 =?us-ascii?Q?hfG/Aa1C3RN48CRzPOYBdn7j4lcqGFEM6cxL9z42ZR/XRx5wM8TblM7kSGbq?=
 =?us-ascii?Q?/u1+P1gvejrqxw/NhlIuIsvs9CHSHu4r1sYbh0Wq81oIGx3yS2/OaYh0XIdF?=
 =?us-ascii?Q?/ctt2IkAtpIlH9qD7fCZjtC7bfKRuHrSIaix6sYmjZzlsoEBDW5elz7S+zEH?=
 =?us-ascii?Q?DEnHB7lzAYpmIdA1FQjRmkaGxgxMRushri5oj8TnvT++N1bpVMDU2ptvKAoN?=
 =?us-ascii?Q?xwYjXCaxvkMqw3/BPxfGSNeiozmXKv+ah/6sSpBHwDoBYpiQiwjYzPKtEboi?=
 =?us-ascii?Q?kYFuM0Iae7Vqr1bQh++GhLZ14z6n4d8kdR33pSJYNjFeM955w+87z84Nqc1f?=
 =?us-ascii?Q?n2/s8triWe7xuL1uJQEqe1ibUzGX/7ISYg62IFo1Pg6i73vlIiF0/tjsHJlr?=
 =?us-ascii?Q?ubDe18tyFR3dfqU2KeW8Mhhv6/HDD0vK5+B9fuFOcwMj07OnFWcqweR56OuD?=
 =?us-ascii?Q?mhdOmdU+IffPMmcQOWGf0CXL9te85GTJ683UoAbBNXSLGgVZnzgIsoME540J?=
 =?us-ascii?Q?xPC4hHQm9w/xb/gpy9ffEjTZrMU0I2rwveUkR2GUJ92MKevOL5wBlhFSgtHm?=
 =?us-ascii?Q?KHUYZ9fn/25YADD7abbnDrtmDFiSVlRfXvi0w0poFmVYh424S1GwVvdwBdkz?=
 =?us-ascii?Q?TTgd6fRzfUOuMUuJsT+k5nFVEQopF6YSKaNOnGOVQSteqbQnnt7O6Z/lvhP6?=
 =?us-ascii?Q?Pwds5RFRsuqGI78WhkyGt3ZQLClyJFpxiBeThrZHdMTybXHYixdaTmpKqhb4?=
 =?us-ascii?Q?tlCLuQBbFHzHNJRltrFFp0QqgTmLhk+BgMwb7Ui7QNZJcVVfZVd2az9c6mmw?=
 =?us-ascii?Q?JqZvpc7kBEvozcsQgkNtz69Xl+DCJd34AlAo45/GPBSomkqOYM34oDew5joc?=
 =?us-ascii?Q?oTC7fkiZftyh4kyqS4ASRBU0peNbjeZNrZbfbEf6ce3cGsoTdCg1/rZ5twBT?=
 =?us-ascii?Q?+7mtv3gyrZGAC+aLBy5yxgxqo4jADM1YC0Q4idYHj8ecs+7UEdA8dXhJqYrv?=
 =?us-ascii?Q?cP5txwonF3ISSbYrGoESd90MM2YbxXMYiTUxlGpgBxpzvrPW/gcSCI0kEDwf?=
 =?us-ascii?Q?qS7F5fgfjLngycD0MdkAE3CCveW7m1MbqRrbxwkTGOI6G6ekMEi3v6mNaTt7?=
 =?us-ascii?Q?/rt5SYshv13HLULpvQnAlxzLhHfo8uDmfX5fG+ZkQ10m40YOghJd0fq80Ooj?=
 =?us-ascii?Q?E5Ploi9SRH702UyCTP2EQRe9XN6ogOSniQ1btr1fewC3vfyOJOUiAD+qyNFr?=
 =?us-ascii?Q?C6DmpDLXVAL6nY5LamHeqgf7rvbuK2kmXMP0yTiWD7Oyr/wHbJLDtgn1fMwX?=
 =?us-ascii?Q?8Ui8LjoXqEg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gHcQydh16iDY4IDqdEJah5Zpj64N5wIPcIocgMe7zViQ8E12YruuV//b+u5o?=
 =?us-ascii?Q?ugKo4ZVTAhG9DxVWyA8zWU7/D3x4RlMxsGVEwiEamSFYTLZ4ToAA0QpISiie?=
 =?us-ascii?Q?dzUJu7uflTFNUezRCnOj1k1zXFsBoh3cZZc3NdT8gOHrr659oKy0Eby/IpnK?=
 =?us-ascii?Q?iuSK2tbpkKC7zI6huMVvdC4V3gpv1AwntEryTYeWFnmumrtEdh7wrw48crry?=
 =?us-ascii?Q?pWPQF2TxobYrFCY/kfAuzLcAzOqiFj4gq4pAAewztVFxq/r4tIIugA0fbzDo?=
 =?us-ascii?Q?OPCzURriOFftlJB5w1JzfTtM+MAA1Jd5MhEu/5k3OT5Wqq8xKKTeXeCUt6PX?=
 =?us-ascii?Q?qyJ0UDbBuBtBYmvq+LxtqRp+TFE7ev6B3xzGrli4WD/D+Bg3OgEyPbVo76D8?=
 =?us-ascii?Q?SxOn2uLowp5cmN7S4IgWrrgjmQZCK81pWyNnwHGIkylicW8f6gS5vUPvZTBF?=
 =?us-ascii?Q?zLDn3nSC5JRRWmganOm3r+4KDm2RxLu8ekafnrRdR8FxV8sVjyY2/hp6rE6L?=
 =?us-ascii?Q?LMmiwnHZXEbvVfUkIUpum8EmEkUGuJ1eDCb/IyWWqrLZbcy/3yNrtqH39WNQ?=
 =?us-ascii?Q?Y0PGTEq5/pB635YhTcTDDitYOVCjjuzqDbzGLq3j3WUaxVOi+aJQvlv08Ior?=
 =?us-ascii?Q?0nY1tk9qOgWst9GUJcrMs0ghOcFO+T/AzlKxqxJEuG3P2VcuNVfuMVTtofad?=
 =?us-ascii?Q?8hu+Imrmrc4Pw06OZ2Z6NbH2QCPpcihp1Lhe14/uE+Z4A3L6kT7e4tBtHJL5?=
 =?us-ascii?Q?pOrba7LZxVk5zBFbWq6PwSLAS32lHFLV5J2FvIVm/8ehgxU/SxP9tizxKeJO?=
 =?us-ascii?Q?JydCV2LLhBmUWsp5klf9zQQAmFgQ1iIQ3mEOdK++QdgMi8IC82aJnP6YeQmC?=
 =?us-ascii?Q?sXcwUCQLEDRf9cKnJ8ES4T0VgELopjUAn2hYQlwhcLmqbajXv2i089ntqqZ7?=
 =?us-ascii?Q?tY5hQvjAw7IVT56dMkTEEsu+pdTneSvgOnBm+udmbbELXp/lc13S8lQGqgNi?=
 =?us-ascii?Q?9Jlyz64zNEpiN0t3ArtBW1igaJ0ntHDjHMN5iJmqGImBc8z0cILCc8fgLpRY?=
 =?us-ascii?Q?9X5mQ0gzdGvTxR/lcmakhWFIJirMtM13ndbffpzWQFF6X2E90TVe16QQBluJ?=
 =?us-ascii?Q?gXpSI/hy1+ZAF/6+F39Na0JlO5KqjRanTxdTs2lKV0Z4fBdZf/j8ORmZx1Jv?=
 =?us-ascii?Q?D+TxBPyY4Z1KM8yg8yYBv28pu6NIGo+/qowQ0LS7PAbz5Rb6O4tEWoLtI+cg?=
 =?us-ascii?Q?l0Ot/4iDZTnEHkLyXVB9PcWr7ouPMXfhRS240WHaGRzWajvoD55cLvVeQ3zJ?=
 =?us-ascii?Q?uKSN0Lac7cYYna1IstYYWlynL/MUuv3c270UfDUWJvgcyKHEAPR+RBHzxQvF?=
 =?us-ascii?Q?3i2v7AJqX7H1jjDjDB+oN/rxGecUinvtPLv043aBd3cOUSiPI39gHd7FgThP?=
 =?us-ascii?Q?0pn3CvVJ9cj/n+hBnbbvpAST3t9QJOlkH9Q2BdtyIxfWmZtFzpPu8u32tIc9?=
 =?us-ascii?Q?ZEw3WcahdBYOsZLBKIiP1AG/w9lIdLVNzobqUfSRgQF0wCF/HC1mT5ltp6S3?=
 =?us-ascii?Q?J0AiAV/GN9Ix29ijRqaJeQjTmEUCukmRzG9CS5WH?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ad0c70-d0ca-46b1-0367-08dcc34236bc
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 07:07:13.4831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ZXwq+EYMG0Pv2dU/Ep7T8ND5DHlI0Kzt1ugjIhensAjH/1rPrcj3deCnd4uH8iy8NlNQMvPxKP0Ou/Tubjkjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6980

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


