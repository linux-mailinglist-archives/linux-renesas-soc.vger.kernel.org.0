Return-Path: <linux-renesas-soc+bounces-8337-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 296E79605FC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 11:43:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D784B23605
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 09:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510F819E7D3;
	Tue, 27 Aug 2024 09:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="NBEb07pm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2082.outbound.protection.outlook.com [40.107.255.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E8219DF9E;
	Tue, 27 Aug 2024 09:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724751745; cv=fail; b=oVYmysc/sTyl0WOwEJHFBqWIKa3bcbyitNUU+aEycnGoQKpsRcbnsoZaHQtkup916VOSFXkeqLV5PwglG1/Hug/LL5WLu8W/3EVFvxL7VESZwLklZycOfZ7UrhqSZh3NsS6vwV/ZsfZfT5B7gemvZR98JKZlzt4HE0XKYhOQx/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724751745; c=relaxed/simple;
	bh=+yl3wY+Y3//QW1QVJNi8d8JWyl/OXne4Vv48283jx+o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c0JleW27V338D57ijGq45h5/DOZI0C4yFqo0/7d47WHcvIJKnLDwpHYNUVKUEEsphvXn7AlZXpgPFJkIGk8l3rN0N/j4syg5qnHHpAL59NUS6Bt0+qpNHzovpLp/WUm6mdRrnIXvhYjPC7X6u+8WflmribH8R6jL0h3rb9XpL60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=NBEb07pm; arc=fail smtp.client-ip=40.107.255.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nPcg01vbY0EicVUsndhEU5/eDSdjsMqv887laLnFLeoeXeX0OVD+umnCDICxf6UeneCTvaMT0re59PPQaDc7AO3uOM1uKycIocYff70q7Xc3zJ1BBkRrBDM+dMSuNfnpfCovO71FzVhu2nQvGzOC2PWcxGUR6B+dmmGYZ7x5pB4e5wdJkfMcTH/EkYiXR67IDt4FLyAuMvLb/E3Zr/1n9X4MyQ+SX5zSu0jJlcLLvZUVj5lyUgqYk0RXlvP0bqQGueNJNdAt7unTlke62MDotC7OQxelicxMN2CN5w331g/btn09WE4aaGnT7DWZ2ghBP5x1SO9EM03OlK4sJSe/Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DX76DWkqLyJ4WRX+FaO0CYX54Hi+W6eU3EBLAexE2KU=;
 b=dyaqzSuXNTWTSjrH4n4i3BMZLps3Al+G/f1doJ6rqxIvEhf5Ay2nn40NH5LqsfnN4HyGJW20v1akv0RPcq0M0VKcjh6+h8sGo+BnEeHU7AZM1flPN0CTcUZoc2px7IrJII5taXDsqkXChx3RyF85RhTAqNoK6xDReWM+WBTHZwjdB8LMxM5pbp1czphKZ17kQKM7bYcTZATdyMP+SNJRoaR5bhZVguZD3KI+GLXDCEA415I2Q1VzapwhtE4zrsq6KFTJM09BYA/n9xeYo2CcQi8vOdchart97hkJijsnBVp1nx84z00vzo+A357BB8rzct2fObiXgBW+eO0cZrpfRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DX76DWkqLyJ4WRX+FaO0CYX54Hi+W6eU3EBLAexE2KU=;
 b=NBEb07pmSt6/8gdur7ZbISsG956M/v7fMBjS6xbGKOQba3zhhmR3T/Xv0nbCLXnSrcMlCk1Od1rIpm7XnZSbavFGbMFYvKtnmwUAinhNOtkjfQxzq1SU5+TjKcgKYTKCgoaW9kRI+sBSCAGWDiyO65qk6P5ikGxt0oXCBq+tQsgbV798bD1WzP0ooBF76F02dsx4FgL/18Tl8XUhg7Cr1B4fes7jZD8WfB+jtL2gGUoriOE0cIgeYUVn+LeQQ//cya4r0ZT05tNIUUx32mLyXyO1k1WjH1OLpG/zm3l/Eh3qZms8mG1Q32ekk1ZGt9XAghBT4lDlCNyEt6DZF86nqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB5734.apcprd06.prod.outlook.com (2603:1096:400:281::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 09:42:20 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535%7]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 09:42:20 +0000
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
	Yangtao Li <frank.li@vivo.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Serge Semin <fancer.lancer@gmail.com>
Subject: [net-next v3 2/9] net: stmmac: platform: Convert to devm_clk_get_enabled() and devm_clk_get_optional_enabled()
Date: Tue, 27 Aug 2024 03:57:05 -0600
Message-Id: <20240827095712.2672820-3-frank.li@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 333c5851-47d1-4d17-37b7-08dcc67c8be4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vfZlq+TkNOd+mMyduRZPeZ6kCTDGeA6NXxjqhb/+I0HzWj5wkiTV6rsyUoF2?=
 =?us-ascii?Q?IBEQcKRieySIUUSyTiGrJ1Tc9K/UNdRt7C6qP2k/0QSHwC/C5024kD9H103q?=
 =?us-ascii?Q?pmTFs7j3Sp+8O13yH0EakUirjAwIK7zlWTF5JS3BSM1zvd5GFBEbeQZkQ4Yr?=
 =?us-ascii?Q?QLXaH4+8f/NwihL+hYdnTAZor5EMIyP7dmLBFasmIEqFjSCO/ppzVoTnFCtn?=
 =?us-ascii?Q?KwACuOfabt6ZEPkDobDE/LQuC4I9/nDac/jG9SQkaU8cnBb/UsJ6msJXW4Pr?=
 =?us-ascii?Q?wgBYYKAe4yGp00v9ejk3abFLOe4xpqgg42EoA1fdiJjJtZ+tS4jUX8Mi60IV?=
 =?us-ascii?Q?+WVvhOLjZUaU591yLTGtfFGbH8cuSOwlnid2GKVirPRFy1JfROL5NpUqVae6?=
 =?us-ascii?Q?rskWyZ0LmdOJoiSIhie19HVs5BtbYyutjg2GleRAZsWRg/8gMV8TMBnX/eGB?=
 =?us-ascii?Q?ppZSxMxTTqeali7dS7gy5bjMMIZAqE66Nlp+w7FF8xR1HCbkxJWoo3Abwlys?=
 =?us-ascii?Q?5JeJ4tOK86VjdZC4sRqlSkZdbJvrOtsC+a/DCH3e6Pnu6cC4OKwPp+ZqnqSK?=
 =?us-ascii?Q?Z6H9JApidkSdJ8CHWmukzdmGMtz4Wx7oAT7Ve7137ElDj+OfJ1CMOtz4joRj?=
 =?us-ascii?Q?4HMkbU668jM7AtjJiMpQ3tYGC3AK3WbpVF/eI4WKcBqO3GgZHO8/qg9guqrU?=
 =?us-ascii?Q?dv5rhUkAupZl8n1P+CTVZ2be0yCr3OPMgIMHg1smGt2HdfTa6hziZkNuWkgV?=
 =?us-ascii?Q?5SKzvluQK5RamKvXELPNtM67x+mm9fe6iVoPUuyhD+4eFIGL5mdbT0i7xolh?=
 =?us-ascii?Q?+RSUWb2yV84egCqCv6lpr6xt0ufKJ0XHRPs+rrMiYQp8gFkRlnDMmjTofZ3O?=
 =?us-ascii?Q?YQwM2xiUQNPNyXJLBq0TAe/+xRI7lfKE742Dg6u8+3rOPNvmtN5J9aaYmx9Y?=
 =?us-ascii?Q?C4d0GCa1prUGQYR6mND0icMVnyVQoPa4nQ9jw6FzJWvyo9uPilNcrS4sOQUO?=
 =?us-ascii?Q?lySYrxejBagqeNKJ/RCwfsYfxTwMylVNLicy8DLaGRm/yEpC7M3xRvn839lk?=
 =?us-ascii?Q?67jD6tmChrz0vXVRuparmeQgPVzf4dkQh2rMMpOYeAv02RmEtQA6OaGoC3lM?=
 =?us-ascii?Q?oLYnoMLh7FVO1Va4UGryESDGKgXGFHzWQWB2U2fpFbuXW6eKC1517czpjTRU?=
 =?us-ascii?Q?Lifj0XajAUaapHoD6ATcOrm8yW7hc4bUBsMWVEpwbKZZXyf2bFXZGb6afkCd?=
 =?us-ascii?Q?G+gXn3boNkmt8gqxB+6pTLyiFxUCMcIgfzIjML+W/05F3Mx/KRh5c/8zxLUi?=
 =?us-ascii?Q?CbdZZ7kwFwqUMRVpRTcx7UDT2eLMlyF/p51FfVwGHlvxoqnfXKg7O4zNkPYp?=
 =?us-ascii?Q?DHdwEknYPaFSpbhSrHhgk1JmLn9vpOmQgiA1L22DPousW98sXsbRFV2/LiVN?=
 =?us-ascii?Q?Z2FVhiftE+o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Pe2vHVmnplCW/RQVxiQD7jrvKS+WrOU8uzppf7TsS9hly/owsR15tPlKpevr?=
 =?us-ascii?Q?YlsP5YiLHhgAmiWl5HwKjm/yLqtkny6gyDxFU2iocX+KoDF3uc/Qjs7ri2IO?=
 =?us-ascii?Q?y586Wox1XytMeQz1XgTTFCbCtyhgQ+8eRWfHAb3CbfUebjXYA2A2gN31tbJ/?=
 =?us-ascii?Q?H2kf54kANGMrZkyjAKLLfcizIjWjraPWGJGDI0nvCrKS6dqWAQOM2w2zBmeS?=
 =?us-ascii?Q?UG51j54+ET8pQjlTv3r9sdorQXV7gZhLTO9RgkcIjVMBs19ffq4YciPUkNKG?=
 =?us-ascii?Q?ictzGW+hPNM/ytKn/z4Rys2YTSwiUV78wDjuEHw5nddri5lSuILa2wbFl90i?=
 =?us-ascii?Q?fXmVYip/acHhN8r0qgnxpUG0m07T3gSK96oZd9BOWWbxRHNPs/IxcXOOZcmo?=
 =?us-ascii?Q?2lYaX1xhpzrDwa+8DtA6rjHKCoFTcSyGqCcYAXRXr7GWB+lqB2LQhcHiGbaH?=
 =?us-ascii?Q?YT4gUd75TB1eiA/SrEihpUMu5qLEx+6IQWfx1xeQvmEYCcddfggTWyUvP/cf?=
 =?us-ascii?Q?e8FTemMaAobq0YrXfBcbaIwaznRWO9S5A1KbYMNKjjaMStCfeOCJU7ZtWYsH?=
 =?us-ascii?Q?RMw1EWew3sdRRzgMVshNV9cwnsjqRQxSXwiwbS+kC0H+h7y6wMsezPK+01zV?=
 =?us-ascii?Q?lknaSzD/uYc1jQJG5WsGTghEPWUZuGLUIaKYO7wr50JYa7tMKy1h2EvZaQU6?=
 =?us-ascii?Q?Zt45Ag8RIMVAxwYVCsJ/moe5YG/VcI6ccoc+1RigLrzZhT5eXMVkU9Sdk9nV?=
 =?us-ascii?Q?mrjQcMDd8sL6X6Po36/dI9LDcbtjsqkxolRFtcSPNevs2o/hIvc85qE8ex0q?=
 =?us-ascii?Q?3ISUC9soKSiR31o3o06YxdJU3Ak3Su1Lf4i5QqgSYwN75Rsv+zUinXSqoxgE?=
 =?us-ascii?Q?7epXCL2+MgcyUSgcV1rKu5mhAYPFn5eWtkSXw+A6hKlk6IV4NnyhO6amjj6n?=
 =?us-ascii?Q?w+zedo4o/J/kJJnQEoYy8m9/4wG4nMQZKg/uyeYlx9+2ly4MyTsukSL1pONR?=
 =?us-ascii?Q?3y2jCORuOidkCpmDrSKWfHbSe8J0+NQIBk78rJIevRA5moJ6EyAZDMBAMLEM?=
 =?us-ascii?Q?J1qgpd/LCkm3PiRWbq+8WDPQbxS6xkev31C+iuR8CtHoXeBw3+1dE9i3KJYn?=
 =?us-ascii?Q?PP8RkEnw9234FvTVc1X/P+DCPrnyvt0aCUFa7qRs2ZRq8N6PVG4OH8APkaEq?=
 =?us-ascii?Q?njjV+T54JLqA/NJxl9tnpqh51E+smShhCytOecrfPPs7yT+y1At/F5ANznIE?=
 =?us-ascii?Q?MdDmCEAOs/UPbQSPsIySgVixP0PNpdWhjevyZC5P/FfczOOF0/rt9YrDCVq/?=
 =?us-ascii?Q?66M1SHpkrvs12YOKPPpwaMd/i3cq6ghLi8Juy+ChYiWt+B2JPWa6W/QYw9fp?=
 =?us-ascii?Q?LqZrdJGmrbOwMEi9hBcThPjxK0km4mZ1IKcDu+5ji3yl0vqSHFvnrarpcvEK?=
 =?us-ascii?Q?xcewl6a5UzwbXbGej/N/WHtXerILHCmDyXuQm9KkyEiWeqIqKMa3XqnHKpZA?=
 =?us-ascii?Q?kRqeaaDVGUvq/ji8l75JN4g6npgHn3TBtdJOkAH6oVsDeLuxXauKFmMJoAaO?=
 =?us-ascii?Q?OnV74snAinRRRq9X1QLDVlupR8xirGv9QGM6hcjx?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 333c5851-47d1-4d17-37b7-08dcc67c8be4
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 09:42:20.6693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NjZZmpvdq6/fwTEvuo316YGq8y0EOFZ1BP/GItu2aUaL/9Yy036sTSD49HL7YtTHgOOCKWUCsUtyQJa+0e38CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5734

Use devm_clk_get_enabled() and devm_clk_get_optional_enabled()
to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Suggested-by: Serge Semin <fancer.lancer@gmail.com>
---
v2:
-remove unused 'ret'
-fix incompatible-pointer-types

 .../ethernet/stmicro/stmmac/stmmac_platform.c | 35 +++++--------------
 1 file changed, 8 insertions(+), 27 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index ad868e8d195d..4365afabf3c4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -415,8 +415,6 @@ static int stmmac_of_get_mac_mode(struct device_node *np)
 static void stmmac_remove_config_dt(struct platform_device *pdev,
 				    struct plat_stmmacenet_data *plat)
 {
-	clk_disable_unprepare(plat->stmmac_clk);
-	clk_disable_unprepare(plat->pclk);
 	of_node_put(plat->phy_node);
 	of_node_put(plat->mdio_node);
 }
@@ -436,7 +434,6 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 	struct plat_stmmacenet_data *plat;
 	struct stmmac_dma_cfg *dma_cfg;
 	int phy_mode;
-	void *ret;
 	int rc;
 
 	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
@@ -615,21 +612,16 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 
 	/* clock setup */
 	if (!of_device_is_compatible(np, "snps,dwc-qos-ethernet-4.10")) {
-		plat->stmmac_clk = devm_clk_get(&pdev->dev,
-						STMMAC_RESOURCE_NAME);
+		plat->stmmac_clk = devm_clk_get_enabled(&pdev->dev, STMMAC_RESOURCE_NAME);
 		if (IS_ERR(plat->stmmac_clk)) {
 			dev_warn(&pdev->dev, "Cannot get CSR clock\n");
 			plat->stmmac_clk = NULL;
 		}
-		clk_prepare_enable(plat->stmmac_clk);
 	}
 
-	plat->pclk = devm_clk_get_optional(&pdev->dev, "pclk");
-	if (IS_ERR(plat->pclk)) {
-		ret = plat->pclk;
-		goto error_pclk_get;
-	}
-	clk_prepare_enable(plat->pclk);
+	plat->pclk = devm_clk_get_optional_enabled(&pdev->dev, "pclk");
+	if (IS_ERR(plat->pclk))
+		return ERR_CAST(plat->pclk);
 
 	/* Fall-back to main clock in case of no PTP ref is passed */
 	plat->clk_ptp_ref = devm_clk_get(&pdev->dev, "ptp_ref");
@@ -644,26 +636,15 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 
 	plat->stmmac_rst = devm_reset_control_get_optional(&pdev->dev,
 							   STMMAC_RESOURCE_NAME);
-	if (IS_ERR(plat->stmmac_rst)) {
-		ret = plat->stmmac_rst;
-		goto error_hw_init;
-	}
+	if (IS_ERR(plat->stmmac_rst))
+		return ERR_CAST(plat->stmmac_rst);
 
 	plat->stmmac_ahb_rst = devm_reset_control_get_optional_shared(
 							&pdev->dev, "ahb");
-	if (IS_ERR(plat->stmmac_ahb_rst)) {
-		ret = plat->stmmac_ahb_rst;
-		goto error_hw_init;
-	}
+	if (IS_ERR(plat->stmmac_ahb_rst))
+		return ERR_CAST(plat->stmmac_ahb_rst);
 
 	return plat;
-
-error_hw_init:
-	clk_disable_unprepare(plat->pclk);
-error_pclk_get:
-	clk_disable_unprepare(plat->stmmac_clk);
-
-	return ret;
 }
 
 static void devm_stmmac_remove_config_dt(void *data)
-- 
2.39.0


