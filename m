Return-Path: <linux-renesas-soc+bounces-8103-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5363095C62E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 09:08:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6AD31F23DF2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 07:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0204F1428E4;
	Fri, 23 Aug 2024 07:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="CY7wFsVa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2072.outbound.protection.outlook.com [40.107.255.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9D213B7BC;
	Fri, 23 Aug 2024 07:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724396815; cv=fail; b=KKGehM1tgeEFsQFIb0ckjUFdakSpJXjemxL7mQ0NGZFNDa7OK6BKFCLN71+m5dlXyY+8JCYVuhiA8FuWVxhDEQTjq91WWE/3j1NmIyeJBTRT7xDyYcvQtj5Y6LdRRqcRLx/Yptbx+Ntqz++ZDA7xe9a57Dbg17o37Db8OTJqWWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724396815; c=relaxed/simple;
	bh=Y+fmIwBxvWxyVZfdxqKdvMSpZL8fqWlU3Zglug5ZJws=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EfRBjnyIAKNt6VBGnCP6pYLPNZb5c3W7hs2u6K0NxTEsyUuoON0wtAuFIK/Sgu9i8EPGqwecNTs1IrZNS9fYkypyRZLvTSmMo96oeSMS4oGL1saC9NK+FDGeWmDkKo66VCDxL+/1ymqayVx1iwQY+eKhKDR7i3VmT4ACDm+ADtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=CY7wFsVa; arc=fail smtp.client-ip=40.107.255.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XAoI1JIQFjo53gdlauzoMwNL7AM4zREgQ8wC57Te2xEVdIdtEpZbr64Mp59zE33NW010Tz1Q8vUBvcxecsyidoSmAvMLD4fQH2iOWa5XfZIilo3dYMs0PqVJtGRdOh4DlZNlKErqYfkp9SR3Dy5DPveuP24Gm9mRe74wfj5yZpCRZN4UV8j2hK9dSSnh9Ntnqz8EFD6y9ST5RpIlTJNGaRxQjZTKBYYSzLvQtJcVykLaT4cLmSXcQUtZLSW5UcTdM/iKpmQAKxhxw3vsCAwBlqfbRylO4O6dy4QdxP8K8VPax2VzKEEgq84nXwhfxPwN3wTebTiIp2BTbZtSI1eGMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuUwMHlqNd7/NeaZphBJIEMMm/qXldl22uDXxOIGaM8=;
 b=zOM2Hvaz43H9CTyzpNmJhkFhYU9MACkFDFNX1+1ZOx9jVNMFZDAV8+HHA4j95VZJVUmB+pogGKZuwlK341olOStQ4DCUCR6nXVzoqtbAAc0ScpRxnZJFQG6fogAtaZ5aJjujWgO6AtyiUqyU4ujISxJmktncJQuRUWP5loKNXdRjvBBF/xmoD8XJAW1K6YGiIm3nkWBHZjK+XxhR1/VVdyxmFaw3PsrdXj4QYBtIDW6yhuhcmuDL4BOm0jfOa7ctCUBCZkx0jDhu33mhFOTe1rYdd/3fH0vqe20slQSg4/ZALG/EE2Xs6PFPP5sPRvO9Gzp5YS5+Ilcw1LM7sQu9pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuUwMHlqNd7/NeaZphBJIEMMm/qXldl22uDXxOIGaM8=;
 b=CY7wFsVaKRTcGfUSwjCuVVjBtOvE1WTzC60BZrgwUj4EqQRglo1wc+oxFcANpaOKvNDhqUhWP4u03GpjVW+LrCDKEfR61jBV0KAQQt6pZGBwV5doNG+MTzREWpyGvedu37kytDaCUkV608EI5Wwfx8mQV0o1KWYmxBSWMkBdsOXC18rPao/xtB16wACD7348JB/bWr3uZgyz7CYZarYSVJDi75VqPVsuY0lVrexsaEZyTUqCM0jOYSIM5h18iWoVEnkBd8jaxBHyiITbVzDx+/DeVJlYBUQK4vtjs7M9qrEYeGA5qDq5WOGFnjswo7r6eCUZb9OqCvZBaUamEPTJdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB7069.apcprd06.prod.outlook.com (2603:1096:101:1d6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 23 Aug
 2024 07:06:51 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535%7]) with mapi id 15.20.7875.023; Fri, 23 Aug 2024
 07:06:51 +0000
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
Subject: [net-next v2 5/9] net: dsa: rzn1_a5psw: Convert to devm_clk_get_enabled()
Date: Fri, 23 Aug 2024 01:21:17 -0600
Message-Id: <20240823072122.2053401-6-frank.li@vivo.com>
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
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: e4c5aa26-61c4-4afd-0a56-08dcc34229d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hyEovmu30a4qZUt2Ern+Hhza9POi1iq7R+xFim2RNdxqnIuuG8ZlcWXw/DQd?=
 =?us-ascii?Q?8FT4cl2PlElLsLRyAQ3LknPxPT/yRNmHlYLhT9tDNNItvT0xA6S6dJE3M1H3?=
 =?us-ascii?Q?UMEeFmkyTEMCUkxCOPCeizIJVhOi2BwpFaYU4Nn4xzRdq4b4t21vMkBFRj78?=
 =?us-ascii?Q?Nwmkc731PdMcXyWkE5kF8fZMrQH/tgAjYvRFJolHdzGXXd89YoUHCoiFvfMd?=
 =?us-ascii?Q?zZe1hlsJLtiRDk35xf20a22CsD1r9UAyfU+MPHBed5gEU+qePVKgnik84Ppj?=
 =?us-ascii?Q?b9XXeDl65aUgAcwwSvAVdzNJTB0sfZ07BgA2rJvLT4e58Ka9oPfUZK5G4rPU?=
 =?us-ascii?Q?DA0K2Asr2J0SM9dSw5oKI9DYQPVYPw4NHNv7muQ3yn3PLR4i7EaB71HPGi4M?=
 =?us-ascii?Q?EKCcEymkM0qYle6nDkgATMH1as4OBw7tiPkvOj6g5ilFm7J+hp6gza8ghuIB?=
 =?us-ascii?Q?lt2/Vve+GdZvPGPsSRDpFARNn/v6j065miopKS2R/dths3iey+yyKw/bKntO?=
 =?us-ascii?Q?1OVK6nwI7rAdNHgSg6Y2Uw8wH9cdnsuCC2jr3gL/aYUO2VabDTl1DpYW+k64?=
 =?us-ascii?Q?ykzmdvz/NuasUwEl/NnDi50iKMbRWjIDwgsXXIVnIBBOy00fMmwuYuMGn9zO?=
 =?us-ascii?Q?CQqh2GZdAgkWc/tq2jphe3KKFqpRSzWJZFC/8/9NDwfhNUEvKbfVI4iWZ/vF?=
 =?us-ascii?Q?0CLQw0Q9809o83U3GlnSWW2rpOaceIAEh8dtObj8DDb0USqVCT8qi8ZwpYF6?=
 =?us-ascii?Q?DbKHS8rz0SyeTJDx01ila9SkbnG3P0D+WTSmfNNEkvKTvsgHvGXvtrliy9E/?=
 =?us-ascii?Q?USru8REtCa0b8nK3pTtQ0iCUQnsECLfDXWRnpwgHIGMl//2o9frV/hqJGo63?=
 =?us-ascii?Q?lfleSXB3s3pCFHfV2kKUm/TczrDI7wIbaCMjL1QHFfmXjJpWywBAX+t1yBl9?=
 =?us-ascii?Q?avR84q1czCRanuQ32OrloSg8rDvL51GdhZbv4OYhypv+VuSwbPiZeQ+ISyMK?=
 =?us-ascii?Q?CTu4SeP2Qz51uW4PBmVUZTs6DFT63/y80GlwhTJ8Grb9BiBUqUVt25Vcjpt6?=
 =?us-ascii?Q?fwL8tmJeGiGXVTprpL4aa9GiTT+hM/RnqI91xA+E95qfGmibrWjPZL0O1JS1?=
 =?us-ascii?Q?sCBsQLmxOVCII+ncMMg/nOWdmvmeqFKjzK48aJ/VM18P0pgkFyOWi3RUYRrn?=
 =?us-ascii?Q?Oa+KYm5rmEGvOSYmj5jkZK7IkYJL5Pu50uDVaqpRMX+hBjlkZwCS/LF0KvxJ?=
 =?us-ascii?Q?mZjOaQC9YlNNpV39+Kcsg/OLkYBoBRfJC/bqrnXKwJZ5AntT8pdj6ckpsxqu?=
 =?us-ascii?Q?Tq1fKFMHxqMSDU4911b6EfalDh2/bcX+ZIpUzOqKwlogdOHQ4wVEFLZR0B6R?=
 =?us-ascii?Q?qMOrfLraKjCWdLYES9gQ/2KTdlzG2Uv6dWfyOK4vjzaDouUCwzGSqmtlYZBO?=
 =?us-ascii?Q?jO2Oumh8/qs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MJGJFaAnVpfkiaoAdmEHBaAphCDHEmYaZxgCrrrcyZZtDUr2POm1oTI9v2DN?=
 =?us-ascii?Q?UFHUKgQhKJP1HRDUY/rlcMORvdjssmeel5zx+X09MMy+2reHzm4gEzaY8CIc?=
 =?us-ascii?Q?CvoWtiTDYJWu4fdZ8jK1GAPUHjhSQbzlX7ezWK6Ah/pfeSzDw3m64PMA0hWi?=
 =?us-ascii?Q?GMOO1TdioX8daMkZ0P0wGKBAyRxCEpzyNYorIMl3VBRfrpSYv/GXZLjAICgD?=
 =?us-ascii?Q?gjOiyXXywX3VO2X7Vjn+n19Q1D1WdWvQroIxrzKeQgnPJCxd6VTcCvuqIFWY?=
 =?us-ascii?Q?21wjfm2X+uQhvWpODkjWiwxbpIqXNB+kaSp775QSk2B8hslIJdK1fokmeKBf?=
 =?us-ascii?Q?Yw83BQ+KWgQXQCOG6jGktxrbspES5gv7w6WVwIzEqL/fxfyblGQiO++93x4/?=
 =?us-ascii?Q?F7JaYbHFZtQuUR8vGgAj9PmRFcoAe/uDx/DuZTAIzSfcXTPNc4BpeGBJ8Ilf?=
 =?us-ascii?Q?qkv/hb76OprGEQWD5QLuAgupLbByo/VrItCGd5rL/B9JU1ruFVb74H5F2xaX?=
 =?us-ascii?Q?rspoqYN86GuND4y+1yhh/QoZT/u7Fg7elfbTCb/FSaKE4fr+wvQH9h5l3F8/?=
 =?us-ascii?Q?c3XoN8QPF7kz09z5X87iw2h3clRSOwSSSX0mt+YGRJErfvfltPVA3DBvcZ9D?=
 =?us-ascii?Q?mypIdv1+yr3lUNsBw/ewVzDOIh1xVB4sEE5XcW398fq9I3e0yA1inrZMFm10?=
 =?us-ascii?Q?XsunJtLi+kRo6nOvHxmKF0zFzoPnKL5/ECEVmpIPOA/s1UTLViXMzbymStyK?=
 =?us-ascii?Q?Ythf1gLu2XeFAfo9Yxq79NSXVLRyEGRV0uQ5bwSxryYSmTbaE8xGDhfNZRrK?=
 =?us-ascii?Q?S9/n8DxwplmO/gWML3oSAF0wRNbEY93eQ9c3MsyvxTpQMmM/QXnG75y/brWZ?=
 =?us-ascii?Q?MZA01/HCnnXgZRE48CW0Mr7ZXGLOPABR3+cVjFOmWTgconDcgiJicr3S4GfC?=
 =?us-ascii?Q?4WxUKWxaGILZJzzqInf1T00LJ3PQgb7Kl/koHWUm3vkFoTLn9/IDXJZAteY8?=
 =?us-ascii?Q?zAf/zwAvCPkkFNQ/eUzthE2hwvLEGOsm6Qgx3pEUSOnRE1Mfl/DzSzVZN5Yq?=
 =?us-ascii?Q?H0GLfvHfodROyumkHLK93E7DfAxq4y94F2/9G5pYmTo8gH3Xkc9R5ZUrlMxq?=
 =?us-ascii?Q?gu0tfUK29Szerwwkivg96mcyr/9AnopvCIj/7yndTcznKvdHFgE2PnfgtUFm?=
 =?us-ascii?Q?6G3hQtQ0dEw9SASDa/KskiwIS0Y7GEQv1AU6nejXTLxXNr0XBGshlZ/P5S26?=
 =?us-ascii?Q?UvdJ73BFq/FTVtzy2DYS47GDfY7qzjUFRi/GMr3FAYjn8QVb4TBZvmRCrUtS?=
 =?us-ascii?Q?V9xvNADcCyWDvCOut3MExNMpJOJQcuTkS151jZ7b5XLtBWaOM4TAJhbsFus4?=
 =?us-ascii?Q?TNPbLXm+6ktbHJfAFzcU8Q+02quuFFdvGX1joNLATV/i+WnvF6xkyc+bAUlw?=
 =?us-ascii?Q?XP9q35UJsi5euJYM9FVAYHCLSoJQJNLfUbbAg0V7/HIbdkQ0x0s2IkaJlqId?=
 =?us-ascii?Q?C7FJWEiHaMjTQb0Bw8F9m5oQnN/wuBTm7lwlkkA8RYNNgf00Glxr+L9fT+eS?=
 =?us-ascii?Q?WSlfT4e+CmfbZkGnM3H3nMWEFkWAGXLVepyavrnR?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c5aa26-61c4-4afd-0a56-08dcc34229d3
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 07:06:51.8953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kJPSIg4MsxOC3ha9+hlvSVBesxlDCSnCITvIFWDZeZd3jtcauHkDoLzCUqvN3r3vb78uHAZBQJ3+q2klxgO0aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB7069

Convert devm_clk_get(), clk_prepare_enable() to a single
call to devm_clk_get_enabled(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/net/dsa/rzn1_a5psw.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 92e032972b34..9627c6550a93 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1228,35 +1228,27 @@ static int a5psw_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	a5psw->hclk = devm_clk_get(dev, "hclk");
+	a5psw->hclk = devm_clk_get_enabled(dev, "hclk");
 	if (IS_ERR(a5psw->hclk)) {
 		dev_err(dev, "failed get hclk clock\n");
 		ret = PTR_ERR(a5psw->hclk);
 		goto free_pcs;
 	}
 
-	a5psw->clk = devm_clk_get(dev, "clk");
+	a5psw->clk = devm_clk_get_enabled(dev, "clk");
 	if (IS_ERR(a5psw->clk)) {
 		dev_err(dev, "failed get clk_switch clock\n");
 		ret = PTR_ERR(a5psw->clk);
 		goto free_pcs;
 	}
 
-	ret = clk_prepare_enable(a5psw->clk);
-	if (ret)
-		goto free_pcs;
-
-	ret = clk_prepare_enable(a5psw->hclk);
-	if (ret)
-		goto clk_disable;
-
 	mdio = of_get_child_by_name(dev->of_node, "mdio");
 	if (of_device_is_available(mdio)) {
 		ret = a5psw_probe_mdio(a5psw, mdio);
 		if (ret) {
 			of_node_put(mdio);
 			dev_err(dev, "Failed to register MDIO: %d\n", ret);
-			goto hclk_disable;
+			goto free_pcs;
 		}
 	}
 
@@ -1272,15 +1264,11 @@ static int a5psw_probe(struct platform_device *pdev)
 	ret = dsa_register_switch(ds);
 	if (ret) {
 		dev_err(dev, "Failed to register DSA switch: %d\n", ret);
-		goto hclk_disable;
+		goto free_pcs;
 	}
 
 	return 0;
 
-hclk_disable:
-	clk_disable_unprepare(a5psw->hclk);
-clk_disable:
-	clk_disable_unprepare(a5psw->clk);
 free_pcs:
 	a5psw_pcs_free(a5psw);
 
@@ -1296,8 +1284,6 @@ static void a5psw_remove(struct platform_device *pdev)
 
 	dsa_unregister_switch(&a5psw->ds);
 	a5psw_pcs_free(a5psw);
-	clk_disable_unprepare(a5psw->hclk);
-	clk_disable_unprepare(a5psw->clk);
 }
 
 static void a5psw_shutdown(struct platform_device *pdev)
-- 
2.39.0


