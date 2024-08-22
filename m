Return-Path: <linux-renesas-soc+bounces-8001-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3602795B09B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 10:35:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E08C82848E4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 08:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 939AB184546;
	Thu, 22 Aug 2024 08:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="LkaAHOwq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2081.outbound.protection.outlook.com [40.107.215.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB17317C21B;
	Thu, 22 Aug 2024 08:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724315608; cv=fail; b=dZYTtQYdKvMwt+wMo5peA8zmKW2iO/zz2Wqyb0uM3TXmCLKaAsYlIuV3GaYiw0NnZvu3QkETFKglHYwW1UwcoYxs7A1/yI9D76t3EA5ysnZXllUctDd3Cmo9y3KGpaKPupOUrfH6l9OfllfA2TdynSKdj+/lQ6O5ycULQepywwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724315608; c=relaxed/simple;
	bh=zeX/YnL+vXc3rtOcLL7mYLbRFsPSV5CJbQZUVBOm3VM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GQFwWFpgxw6ZAsXpNFhfsFlJq70stEKZVbh9RakTD+OaJhn2cZQmrxzxscEWX2fGx7yHCPuk9jQn8avH9rHPvqJV5qNYHx0AoC0NF9KTT/s0hVp/c6QzgBUE0KQSf6F+jE1o2JSi6g3RQee3zD99gzALWxjyJ8rinHKVqGnTptg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=LkaAHOwq; arc=fail smtp.client-ip=40.107.215.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HboOP7w/9T6qO9DzT3K/riyoHX+AcItpajsGwiRZYbXq0pMyfJmO1t748HH4l8mWCUs2lNfeQMrdJbhb8N6qRYaEy9vQXp6w/JDgJNK0dxI6FZGuodLhzJgZePcIbG4lPSzxZRI4fdRxMfY+SrBqA0gJJVK3LvQV8SLmhMOpP6XZAvnTGsY3/EAE9BhHLzfs5oahOGxJhUk7AjElOn2rzegoyY3lMM2QHPIKHWcqdLYacU00YXAFMtKkfgkDMQhw7cr/fOtPnyL9Sp1pZxCZvGDwfn7sbkpQHfhG9YGOvWxa/EBrF+UpalpEuDPdzxp8boJggRcWxv9KAY5SXl8yRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=loKZ3Jg1P258pXcp3YCt+6qnQHyeqRZ5FiyqwfFFhhU=;
 b=JhrheUEqbj6J8Oa0KRmjQ2HoVaVILVd52x0GHmKxfWIo/oFA4+K+7cCD2fd0tJfiFBhGB9EmkHAi0YeptjtzgFhqGfh3lZMSMKav13LVYR+Lu2qxUm5ILhxyzDiEVXqNtaJLToeJYqbbqF2ZM155KX4ER8cs5IA7VpUCJczWreN8KXOk85hQuo/HTX4VpgaKQEAT7c4u6na4k5S/l8Z/IYMMFaUqx6lWM8Njv+xq7kC6v7ci+iVZA88rCX3p3DNR/DELIdLAx/JTf889aQWF3bBjfnERXIrxNbWjqxgtICUuzNm3y+3AKmP5UUVeJofhbkE0OWS5Wo13WoQk+4fwPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=loKZ3Jg1P258pXcp3YCt+6qnQHyeqRZ5FiyqwfFFhhU=;
 b=LkaAHOwqIQk5n9K2J87RptvM/ecNsPdOLhC+Gjy//DLdLEBUIoUsFviRG3FevQLwAP7ABENlhYnjOy2ygd2mTQFQnfijA/FvSFfP3JIPeldb6udWecwnTYCuZd865NH/c2VG888rBHg/hpys8VOLWX+Je/0sonD529EFqJ5UC7pJVZq7G8pTkHMqO3hDY2Ilr8WsuBlc0JMGjJuVDqUNv9ce+vWpY3K2EHZXqvLexQ2H4lUnpjUDJ+KDBIQPbqhnCdpn/a9gB2nJKR1NwtnOTKcMN61uqkmz/HjG7r3xVmI8KlWbYWbq0lUGYIgtYsWQv9ovXyIpti3fEazfSh/nvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
 by TYZPR06MB6114.apcprd06.prod.outlook.com (2603:1096:400:33f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 08:33:22 +0000
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::6257:d19:a671:f4f1]) by TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::6257:d19:a671:f4f1%3]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 08:33:22 +0000
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
	justinstitt@google.com,
	kees@kernel.org,
	u.kleine-koenig@pengutronix.de,
	jacob.e.keller@intel.com,
	horms@kernel.org,
	shannon.nelson@amd.com
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Yangtao Li <frank.li@vivo.com>
Subject: [net-next 9/9] net: marvell: pxa168_eth: Convert to devm_clk_get_enabled()
Date: Thu, 22 Aug 2024 02:47:33 -0600
Message-Id: <20240822084733.1599295-10-frank.li@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240822084733.1599295-1-frank.li@vivo.com>
References: <20240822084733.1599295-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0005.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::17)
 To TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5275:EE_|TYZPR06MB6114:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a712ee5-f4d3-4e60-3fd3-08dcc28514fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rdryva4G0kNzhtAeTQHh7nP6hBf7uwypokt/lY5pj3aS+X4B6RyEU3597H9O?=
 =?us-ascii?Q?kUDm6c6lNztpqsC+K7Fww7dVLLD6fznLq5dTRK4FukM7iMrjjPgJ4Z2M6ocm?=
 =?us-ascii?Q?2BV4axq6mcbfmXoQFeGZn2l3SPxpRJIiu9WIbzr4vIrJ/As+1TzGbzlwtjVH?=
 =?us-ascii?Q?ntJUVp7omOmPMQ5PlHcEDaW4sjUu8jrXFTv2ljkc3uaHRQ1GUinR4dLPkKPs?=
 =?us-ascii?Q?vAOuPV8eJQmYZa3Jj8R+63i/AjOY2mYYOvExlL45UYLPqqca4p0bqPrC1x8z?=
 =?us-ascii?Q?L1/yn93/XycrS1UkfSI6mQXzNtEqxvOF4jFAMcQGMDYVwqL6zwzf74nv6/Lq?=
 =?us-ascii?Q?r1m8dHL8HYD+vkBNXWcKi/4n98xu9LWiDU7JadZLlNOvOz+By7CEjsB/1yJW?=
 =?us-ascii?Q?rwRa9K/nQsN4sPXa0e46sqRyGvT+3ZNzU/yHC/IxdKwvIRguatqt8thbWm06?=
 =?us-ascii?Q?KXJZnquZ+C7fnG4iGKjpFrHFg33N1rGZIiLv6hxCwqheluE+Ns+nVXYKybI4?=
 =?us-ascii?Q?DRFm6S/ASOKe6mZZL78xyI1ElioHF+SlyX0kGM5EpONhCT+BVHnf+xTQkLMd?=
 =?us-ascii?Q?SbOQ4zIROQou9ndSK4LoMUqDpEW+YJDh08GvGEkMfE8fxcTnW6unIPah0Bl+?=
 =?us-ascii?Q?3WYHLslP0huQRqSZ2RxuOC4Ef0ZcPuxQs3+EyhPaQv7pmdDftQasgmMcTyDt?=
 =?us-ascii?Q?bi1emwRWT45E/76t725MP/k/Yy6q8oijLeaQTKsDJlTr9aAtFJJICgKxUkNC?=
 =?us-ascii?Q?vBrrZCntRsOO2xXziYBziXKIBLzAHROu2f2l7YimjXRFp7UewPICriXY2TRe?=
 =?us-ascii?Q?24hT9WogWYHyNFyNi+arXbOxSFEDW/m9A8DJ8UTAO0oNBEIlhhCYAkQebTsZ?=
 =?us-ascii?Q?eR/QP1A9mT886TRaa+Nhx48B3Hd21A52Pa2NwV/igyNTcKVoh+dnzOoR9ZLJ?=
 =?us-ascii?Q?u4bP7MW469LlfmzqrmOf3F3P3LBJFNeLHR/RGcLkBxYxt2M/QVEyLwQHYVqg?=
 =?us-ascii?Q?Mde0oiXuQ1ZlmYycC67n1JarA4VU8JYqpsY/F4A9QDuv4S/c0cuy5p0cMOdw?=
 =?us-ascii?Q?ZQVR4kAdu3gYQhGhhvugnN1FPZfXBUKSPHb74ThngM915skTh5R7jcNKe7LQ?=
 =?us-ascii?Q?uEXBtxeoG8AMbgY9+7T2NtRG7iVOknjN4mYoIg6UzPuU99KRoHTsENOKxdJT?=
 =?us-ascii?Q?mYP+/QqAmOKJKJ6YcWG10AXLQ7M0Ohy5tk0Iia1Ym6iAsSSoWENEBcuElRJR?=
 =?us-ascii?Q?OKr3HVIJIXPy4AYVvnTpKUP7VvMXQRIJ9c/AnV9pN9fe3wAZG5Qtjv6Jeqlu?=
 =?us-ascii?Q?Zs2US0OZLYr4fPzH/cBB/yJf2w4xMeUBzJBMDTKSTKIb8pmW1U7ZqeOlDSR4?=
 =?us-ascii?Q?D6ToAE/kYLfM4TD28ELLwgjs8m5jujgiCvbVi1Kv+ma9JKBQvyCL7BWq0nZy?=
 =?us-ascii?Q?ryMajlpOv5U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5275.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AUJdUAi2K1q26PpAFhijnVXigNU7CDx8AfmAgw0BPT+1nFfuCP7miZCwYdoC?=
 =?us-ascii?Q?zRpKOsSSCb7YAAWpjXxusJwKSbb6WwTIw6q/9ZaifMPtAKplviWwimXDIBFt?=
 =?us-ascii?Q?zllauoEU6lWlbDpV9nqw4vp5rLiVIsK6Cf9/Q6uAYk6PIHw5P2/QQcapz7/C?=
 =?us-ascii?Q?ShTVwGLMGJT+nELcgR1dVcMeS9XAjtvg4UsGV7Ae5E4GLCCOon0T5EtFXxgn?=
 =?us-ascii?Q?xsAA1MM69MTfJK6VjOXpSnahBYfAMWCL0y+DcBdvPG6v3cDl+UjR+Jkgpm+w?=
 =?us-ascii?Q?cpS2TD9aST0eX3DBzZpxndNLkjlvtZlG32oXbTtqx7WZCjoRHGaQlomyGH9S?=
 =?us-ascii?Q?aJk8/EjeePxVgI2lbzoyUX+0UeQ6y6dFLC/njXN724yqN2XACh7+2Vej0FOB?=
 =?us-ascii?Q?tXsdz6tiCet5aKFNwHMSScf4TaFxsJkJscLyJaqa8mHuJoprQt1yh1jTy/MW?=
 =?us-ascii?Q?nVPKvuGBpU3k/YUoH+TnQ3C11eyUsnepzhAYIUHscuZTP4G7U8VhMqwxOPaq?=
 =?us-ascii?Q?KdvbVMHI80Rpf/TvGT5PvYyGzudIvytAXdIwiIt8FPktkl6z/X79yr7MEWI2?=
 =?us-ascii?Q?EB6ofibNb1+Z+YpqKXVRmWXL2wkGHCBaMkl73MUoOEkeVtTpHZ1z/vcp8VDX?=
 =?us-ascii?Q?6/WduxqdM3XdKJBSBCHZYRtzMge47oe4VclH4b8TyKfTKWOIaibfVH75xGis?=
 =?us-ascii?Q?iVudocvOP3fUVwj2FzYrnjLQkxPLctO6qfzosLuryWZOzLPC2b+d9q8dX0GO?=
 =?us-ascii?Q?J+LXL7FCzpWQ6vIJZ8HMTxj4rQhmbmwJSrPLK1ZZuNc228W3yRNKY0Arwchr?=
 =?us-ascii?Q?YgV58+GvbBTYUZQXfimkDaSUxrjAHj2gfwQIveBuNIAkRr0fCrHjQNw7IhIm?=
 =?us-ascii?Q?WS6ZgATRVFlO3s9S4gKkf4kZvXFA5ti5q4Cf92FWCJJHYf08/+DTUJwNWvaj?=
 =?us-ascii?Q?MOCuNLvgskp+VzMOHW8OsV2jBzNNfmPpVzwyel/kIeIewFltC2shbdvt94BY?=
 =?us-ascii?Q?MxFHpqGTbNjNVNaLo15XBkVNQE4SoiYhrpccQPJekGv/QLAqvbYd58PhRa34?=
 =?us-ascii?Q?VYZAh/5ECfihHjNexcm8z9T1rT27Ef7liApGobxAkkoXNv4IbU1ZBuX0Gb4H?=
 =?us-ascii?Q?RRs6hw3qHLk8A9ETf/akbJyeDGLTQ+ozSzKRdvIA8U26k9laEPiCQG4pA2St?=
 =?us-ascii?Q?IacdlDswd8oQOIU2r6jQDuAXmt9WObolDcBX0yHQlSEZ5KS3Ta2kUljUYweo?=
 =?us-ascii?Q?YveqrV1nMiR1eQCLxxd+pFX8FqBsjR51wE4z5F2elbzbEagj1jESHG4e1Tke?=
 =?us-ascii?Q?0lGbrxd6tIKvNsnrxzCC+uMy9SMynYhjGNP2xscLNEUj9gD0+v2JDfs4LyW9?=
 =?us-ascii?Q?6cptU60Mk1EqgRe8wxU2fdvqn9gybioJGChNiYE/vVbvcKubk2n65uiuBv2G?=
 =?us-ascii?Q?cYNfWoLnnxOd1IFRFfNYZr0zNNJ0Fu+X8tqAbtdPA12E0l19IlPAFMVM7iRV?=
 =?us-ascii?Q?3PVGpw/sf+mE0ebDItWYVItlL3d1/Tw/M4uXVrduZniMW1yaXWPzkxsn7Fsm?=
 =?us-ascii?Q?rGpC2inO0gNGK4BpeK+MicXoCD4/NKPZlPlBC37z?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a712ee5-f4d3-4e60-3fd3-08dcc28514fd
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5275.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 08:33:21.9508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jcEkGWRkZm9ZewMI63vUCEeaTZb5FxEU7E4X40M6T0Hn1803tk4aqJvP2IiuVzO8/6tuCSEdkD41C5TyBbbkIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6114

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


