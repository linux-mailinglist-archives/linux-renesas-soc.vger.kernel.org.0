Return-Path: <linux-renesas-soc+bounces-22545-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61062BB1D35
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 23:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 861211C3399
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 21:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C4183126B7;
	Wed,  1 Oct 2025 21:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hxDmW1Cz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010058.outbound.protection.outlook.com [52.101.228.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660683126AB;
	Wed,  1 Oct 2025 21:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759354121; cv=fail; b=VXH+RwacNClT/AbkU/UGWoYxOyriWaqaM9d0pj31ipvaL3szLUwKFRb81qUMncxEc79//B+DSAoxO0dNsg3MUM5/74+PphthoOerOL1vhyVYFRguvSH/UaR1K/JnraiGjXs4cJGi6Wag/GMwmMuLxa+W2WMavLA8A5Zk6zyp3y0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759354121; c=relaxed/simple;
	bh=7TNDTxO9nYJ/3pBbVaH3R6WZFLa/2KkdokX8U8Is2O4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VG79x0Iw/7C3A2ZQwp46qdVSm+6GUkHixbkRxODp+U0tOJP5uoQNALeVoozoW9WDb4pvQKCTA8y4iuGf0VSXGDSTsmjRHv1g5Tvc8MdG1twLJD1AaSocp4Cy4aKWzrIBf45HavrJLypep1cmvOM9l06bhEkd+0IfPk6RgdlMRx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hxDmW1Cz; arc=fail smtp.client-ip=52.101.228.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j4bhd3Yl0CJVcksLpDgRkxUHJ4RU4lbq8XN4S+L9Hqx+N8FZ4yyDZd45IWmgMgCdlDIE0iFfOthR4PXNlW3qFIAu6yClnNbgzkBdoJ9sTipI5liynRVvLF3vAJ22UlI+bt7UQkHH2pg2zdkKPnz7962bQCh8P/UkaES0kzl4gJBvtiJ/ux8wjeERJzV2bF5dqiKeSJTzFz7Nj892dO+jveim3x3KdIwHi37UiLB+OvvLsy7zaGv0eBWmw6b7MSRn6fJ83ETEBDkayIO8Zo6Uvy9461uhz20Rwkqjw26iMOfHqHGjuethtd8fxCCYXqp1gc7v0RGLIczzEYXfwif68Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13PRtF8GSgfi2dpVxWeJRNHJGcfIaYU8wo/4yptgzTM=;
 b=Apyrw4FFBIXWfGK02K+97oqDdWl0SQJUFVM9dS7bLj20GlRl24gpDfZDQpLYTp6q+a5WLZFl50jSJqBt9S93lDe2qtcRlXKK+RxrtoaI1ojX1InUkbWHcQ4cBQTIAz72gwrqPXcs2sWPqG4dG7obTMFP55xlo0wbbsJ0t1+ay+S1Q7bJA24/srnyCT9HHUZC7OA76xTHKTPdN2Bq8BzhLTtfXpydgoY05ZhgMuyRLvNE8raSQwwylrJVf//jmllhuUz+p55foiPT2AiDV1bluU7neQzXFGzW80r5aaeaw59oQzYY02006UKnQAvy8SygJl6X7oAxNJCHUMXQ9/vnjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13PRtF8GSgfi2dpVxWeJRNHJGcfIaYU8wo/4yptgzTM=;
 b=hxDmW1Czwk/Pt2Y3F4XbO0WK+JahutbfTqBSqsGL9mO736subA453nerxuiCepDZxrdshQh5PsmqpCJJYCjLTYoyH+8T4XbIKp5UHL/r7kdqGKMvVvHLYA4WykPU++3t8uRHhoN5rUKUnPJUE1NTG0+b/M1KDO2dV9sBVZ38MCA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB8332.jpnprd01.prod.outlook.com (2603:1096:400:161::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 21:28:37 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 21:28:37 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH 09/18] clk: renesas: r9a09g047: Add clock and reset entries for USB2
Date: Wed,  1 Oct 2025 23:26:53 +0200
Message-ID: <20251001212709.579080-10-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>
References: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYWPR01MB8332:EE_
X-MS-Office365-Filtering-Correlation-Id: 7932a28c-1958-43e7-c718-08de01317b43
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bRV7Rz4vdz0xms1kfP5uqLDfnk2bktaa5RKVWJhVKE1A+xHWyNiieXFjpn+F?=
 =?us-ascii?Q?SIS/VB+400IMSs58dNuqm8GSOxnSqgTI3v6Mzgw3h0HnoSkv3XPQPXcznoZC?=
 =?us-ascii?Q?STdp+bEPi1zsLDgkIlUVr51Buv9X8n43cCpod3evwInfgREfc2Q6U3xfLLyJ?=
 =?us-ascii?Q?u5oH5NLXKtKJKUF9+Fyo2cHCcEpQ12wKGlB/Y4ZdszMVw6foyFWMCnPdLcAR?=
 =?us-ascii?Q?hCjULuiDfytBCB6Yc2q+64twsimQEc550wEjR32MTtsA9FrE0eObjzSq9oGb?=
 =?us-ascii?Q?L3sm9acyu8LBjXmxsZXA5ILhtNGw6hnsxdO6Or/0SDE1o8ChUsRryEaamPLq?=
 =?us-ascii?Q?03Aw7k6Jz7lT6HaJ5gyuyzDyXiR8+SIk66F1wQQl1Y/ScwGdvjIyGisYTL2O?=
 =?us-ascii?Q?IdbYLFGPSSpkirDlJnsMLUtvX1RYTBE3VHMne2YZTbQRzeJtVBGOvNrwMYn3?=
 =?us-ascii?Q?XalvlmkqckklKN2z22U8tYmJkczbxq4DbpCWkVvFpCQsTQBPwjdpVfmMoLyW?=
 =?us-ascii?Q?O2n9Emu5rQbGNbeopTfvSciKm/rt5Jh7Wp0i4uYxNXEkMtBrf1rqI9c5blh3?=
 =?us-ascii?Q?HC8FbsMZyBrwMV5p3Ttucm2iF6oHnFOrvRL6z0JWSScDvDDjynzJyT7h60Mm?=
 =?us-ascii?Q?nDnVdIEf5gS75G1FonnVar9ID/7jEVa4+RLklyqu2pE9K2rwCHzKKWkLTzYQ?=
 =?us-ascii?Q?AWbNTQ2EujMMqXrgMZ6ZqRyAPOlGRvS8K91f/+LvBHnVCr/wzt/yG0cly/ww?=
 =?us-ascii?Q?eoKFgP3+Vnf3mY4RiwOpX1GZhIWPlPjr94ZPM+p90c7sN1vCZYj1KMmOmgcE?=
 =?us-ascii?Q?tpx/b1IryHeDY5ksi9Hzic3hvmgvi16uzyY1AT87YWouB5HuKcFSkiM9Rxtp?=
 =?us-ascii?Q?qyKZZ3292L1hF0Qtg4kpJgODy6PhRSgN4evZ6SksTxXzyzar7FkUKKDUyA+r?=
 =?us-ascii?Q?J6RTvPY23NlwgJVJhTIcGBkKNPAWpL5RlfNxiNhG8n7lgtLSwHUmQ07CPiHY?=
 =?us-ascii?Q?hbzYpa20W5wYWz65DhVVXyllm6REiNeqo99smO+o+xv2iUgZXM5AAih/69hx?=
 =?us-ascii?Q?Z9MJNYoZ+vKOsjIg6w1/eyocQ/lu2lwFh9oJ8otcDDO/2FlB8Rf69y1xHbXD?=
 =?us-ascii?Q?qFIdhzFjKDTIek35cKUAYJNsSjLYNQJ/F/ASJk/LWgU3NlTeSCEesT5inVSH?=
 =?us-ascii?Q?fQUfhQDugIBRvta3l9dnpTpPYn0bmfLCPb7k5hWy9E1rpa1DnCSa0ifEm6SL?=
 =?us-ascii?Q?r9eSRL5n+EQlc2xRXq3V8BUGQ4HpfKzI+hroG7s7AyZX9cPRMoY7TTdoC3Pj?=
 =?us-ascii?Q?av+TyblEMnyqljlgpdeE0VksaDychzVZfcGSESSjPt5njIkFTXT+7wGiuZa6?=
 =?us-ascii?Q?DoDRrQDCXaixLP1ktiGPr55+vqN5XOFB9j1Lrsgwk5d3Qu/ZpFHoqK9TwH9a?=
 =?us-ascii?Q?Y5ZLWn4bQoA+8qtL9iX7uoiIHPis4TZHpM4F/dOgP0xsqparbcPICal0E4g9?=
 =?us-ascii?Q?TfVRUv0SYIXH4pulczcojw+pe3N61ttDEQVw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?skflMvhHAnNBVHY/h75LDbMfN31vYDtvbEwe2SqMt1BNPSU/MHhHVRoQhnl3?=
 =?us-ascii?Q?MRwrE9dqylLObY+8DbjOhjL78fb0S7q61yRGs5uRg9jcqJKT5BLejLIqv7sj?=
 =?us-ascii?Q?18BanGuBU4HBaW4g3N30N7jz2Y52zMbvRN/21OK6KuktK9TYOOIbtrJ5DCnZ?=
 =?us-ascii?Q?o1J8Rxznp2iq3+h351pgd8v2P8p9R/7t1ir2zhikLZaUiP7jlEQ3A+s+5qDp?=
 =?us-ascii?Q?vziStaa0Et5lBquzX9gRVFlc//TSZr49zik8qUwXqpLzic99eUtJkXhvmN93?=
 =?us-ascii?Q?PDwafTdsH3nEQMbAah3ALX1jV+spt+WYXQ4IVEVgl+3iWnlLNZbdoM013WsE?=
 =?us-ascii?Q?BQiIXOIhgm8eIit5cht7lmG9+6dcm9dhFxn1Kx9lLLNlm5+y/xlW6bJ9/zYN?=
 =?us-ascii?Q?VgqKlLn9DXh7abcD/1ebzW68kt3kQEn47yXpcl6yCCsQ0OVSvm6upnzcRkMe?=
 =?us-ascii?Q?do2wGi6Woc7D09bn7zIDEWQ2ux3KYle/ABsS/4qo0UhUlO++uVNOWopajD/v?=
 =?us-ascii?Q?wyZoFRSU89W1l1u3fhp5XTdOIVm1JcztC2QIBswSCuk45nWb/2dltY8xjWdY?=
 =?us-ascii?Q?trwq2B1o4D8vBwfBX4VB29f+CSLmL9hXv6tWXpcI9rAKRY9Z7+vb12yJBnWf?=
 =?us-ascii?Q?ATy8oFYduvCKRCqLqW5DmKW2fOmBTpgNNzS9qlxfdhH3Xi0bROp9U2BMeKdq?=
 =?us-ascii?Q?NOLMegA3lSOEHV/9ZhUiZOEXHsJn/kHajR2OjwELCl4BpZfqG9jceYuLYRkk?=
 =?us-ascii?Q?f0tQvPtC9v3ylqMwQSMJeKGH3VifQfH2OqUSmUMdtkv6zUbkT/4eJ5bd0vzj?=
 =?us-ascii?Q?S8F5/7OnuXtIOIuUy9veGlLs6YA+n6TT5PDdJ6Z6pqxPKDUordPSW6p72QpG?=
 =?us-ascii?Q?Xm65oxJsG4R1nz8GyL87D9U7M5wlIPD4l2UbLyYrGSdzZZOEXfvgeN687Kha?=
 =?us-ascii?Q?zSSwwunxW44Idz2/t7nGx8Ti8zeC6TNrZQFUtlvk0G4xCK/sgnz+m01b2UxP?=
 =?us-ascii?Q?eqffmDKvPDfMhqmqsLStNUsvsGQs1yMkPOca30NqwiTh9YcRZOfOWHyL0623?=
 =?us-ascii?Q?tnd3W3bUU7aLakBSQMXqOX7wGCmfk5Akst4g/jdpnkFW6oTiARho2XBb559y?=
 =?us-ascii?Q?apamVlS4A+sTtMWl/nj+mPvbaWeD2f9tzQ4474rT94eck6BorFKS+Ci5cD7G?=
 =?us-ascii?Q?1wA17bIJmURC/+OmGIMKyyUrh07n6sczzE1FDF+wkdE710hw0/IYQ2MPSxBm?=
 =?us-ascii?Q?5gkatUG4aGBvYTOhVQhgkA+WtjqvvhT3z8GDrS4fUf201gkfo2+9ajRx88yv?=
 =?us-ascii?Q?N9jblqVkmOSqt7mwkZXPQ6qDF3EI/lGM1MvTGAGgbx8vdjIc0PxR7zbn5IMd?=
 =?us-ascii?Q?WCHewt4PVDwdmF5meMjwzbT/K5h3EZG/+TJJ4Yqckt4O7wXpTRDsQ8SUcJSq?=
 =?us-ascii?Q?eqm++htjaRGo2VVDCJJaHM1jVcU1D8McvM6XRA0O1dqJiGeQd0XnGHsiSFOa?=
 =?us-ascii?Q?z5VcItOU08UcFnAN/t5nN0Su2r1F9e5202shhBZhD1KsgJ0RUX7Itg04szAp?=
 =?us-ascii?Q?3L34ynsMEivb2nBR7fcG+DaltVavm0FOKRNHt/ErolKiwNWt5nyrGaSxZT6C?=
 =?us-ascii?Q?o6kbMz2CwfTwcpgFq/6PX0I=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7932a28c-1958-43e7-c718-08de01317b43
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 21:28:36.9726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JVAw1Y1oigpnPIqh3AWmVmqOPDl9w6tBY5ev1oRpUwF4+eO7lWOMhz4Wh8+QmpLQKuN1UB0VUXx4dWO1CK7JqMAMln67QNW3TBIZ01MIf09TFMvR2oW8YF46yxfNQWPu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8332

Add clock and reset entries for USB2.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g047-cpg.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index ef115f9ec0e6..68f8b08bd16f 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -16,7 +16,7 @@
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
-	LAST_DT_CORE_CLK = R9A09G047_USB3_0_CLKCORE,
+	LAST_DT_CORE_CLK = R9A09G047_USB2_0_CLK_CORE1,
 
 	/* External Input Clocks */
 	CLK_AUDIO_EXTAL,
@@ -177,6 +177,8 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 		 CDDIV1_DIVCTL3, dtable_1_8),
 	DEF_FIXED("iotop_0_shclk", R9A09G047_IOTOP_0_SHCLK, CLK_PLLCM33_DIV16, 1, 1),
 	DEF_FIXED("spi_clk_spi", R9A09G047_SPI_CLK_SPI, CLK_PLLCM33_XSPI, 1, 2),
+	DEF_FIXED("usb2_0_clk_core0", R9A09G047_USB2_0_CLK_CORE0, CLK_QEXTAL, 1, 1),
+	DEF_FIXED("usb2_0_clk_core1", R9A09G047_USB2_0_CLK_CORE1, CLK_QEXTAL, 1, 1),
 	DEF_FIXED("gbeth_0_clk_ptp_ref_i", R9A09G047_GBETH_0_CLK_PTP_REF_I,
 		  CLK_PLLETH_DIV_125_FIX, 1, 1),
 	DEF_FIXED("gbeth_1_clk_ptp_ref_i", R9A09G047_GBETH_1_CLK_PTP_REF_I,
@@ -282,6 +284,16 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
 						BUS_MSTOP(7, BIT(12))),
 	DEF_MOD("usb3_0_pclk_usbtst",		CLK_PLLDTY_ACPU_DIV4, 11, 0, 5, 16,
 						BUS_MSTOP(7, BIT(14))),
+	DEF_MOD("usb2_0_u2h0_hclk",		CLK_PLLDTY_DIV8, 11, 3, 5, 19,
+						BUS_MSTOP(7, BIT(7))),
+	DEF_MOD("usb2_0_u2h1_hclk",		CLK_PLLDTY_DIV8, 11, 4, 5, 20,
+						BUS_MSTOP(7, BIT(8))),
+	DEF_MOD("usb2_0_u2p_exr_cpuclk",	CLK_PLLDTY_ACPU_DIV4, 11, 5, 5, 21,
+						BUS_MSTOP(7, BIT(9))),
+	DEF_MOD("usb2_0_pclk_usbtst0",		CLK_PLLDTY_ACPU_DIV4, 11, 6, 5, 22,
+						BUS_MSTOP(7, BIT(10))),
+	DEF_MOD("usb2_0_pclk_usbtst1",		CLK_PLLDTY_ACPU_DIV4, 11, 7, 5, 23,
+						BUS_MSTOP(7, BIT(11))),
 	DEF_MOD_MUX_EXTERNAL("gbeth_0_clk_tx_i", CLK_SMUX2_GBE0_TXCLK, 11, 8, 5, 24,
 						BUS_MSTOP(8, BIT(5)), 1),
 	DEF_MOD_MUX_EXTERNAL("gbeth_0_clk_rx_i", CLK_SMUX2_GBE0_RXCLK, 11, 9, 5, 25,
@@ -359,6 +371,10 @@ static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
 	DEF_RST(10, 8, 4, 25),		/* SDHI_1_IXRST */
 	DEF_RST(10, 9, 4, 26),		/* SDHI_2_IXRST */
 	DEF_RST(10, 10, 4, 27),		/* USB3_0_ARESETN */
+	DEF_RST(10, 12, 4, 29),		/* USB2_0_U2H0_HRESETN */
+	DEF_RST(10, 13, 4, 30),		/* USB2_0_U2H1_HRESETN */
+	DEF_RST(10, 14, 4, 31),		/* USB2_0_U2P_EXL_SYSRST */
+	DEF_RST(10, 15, 5, 0),		/* USB2_0_PRESETN */
 	DEF_RST(11, 0, 5, 1),		/* GBETH_0_ARESETN_I */
 	DEF_RST(11, 1, 5, 2),		/* GBETH_1_ARESETN_I */
 	DEF_RST(12, 5, 5, 22),		/* CRU_0_PRESETN */
-- 
2.43.0


