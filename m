Return-Path: <linux-renesas-soc+bounces-8106-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7499695C639
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 09:09:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBB561F2508F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 07:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EADDA13D24C;
	Fri, 23 Aug 2024 07:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="Fe/kAmpf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2057.outbound.protection.outlook.com [40.107.215.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED42513D244;
	Fri, 23 Aug 2024 07:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724396835; cv=fail; b=uxv1cM2ERKKtX1FBMyoGwy96j33t4Q7ScNVvj55CR2ekSZRvAg1kaYfSXXXzohBKXJdY5zKf4q/TBZ84wE8ep6x2jNBGy30RQA4NMEwyDNXgQkyW9QFXaHJULy5yt8l4Di34sH045jLzRuMh48T29jNEXpzFboAvZNRuI5Zyzqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724396835; c=relaxed/simple;
	bh=kUk0jxtRZVFPLqs7hmTHthd0frHqrpJgFBgoVf/8HpE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ecFiMx5i6r22SD5QteVZ3LyT4/ckDNzl+Z4y4to5BGNofEbAY+6k8DrlB52oTZ56zLkNwZVBtboyP8rWjOa4AfdnbcIUdJRlbYxf5mjQv4c+c7UUhnw3+/xIXS6kdewueN5/9SsjTuqpgHiStk/7pfNrtsgIRBmsX/7MLFx7zzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Fe/kAmpf; arc=fail smtp.client-ip=40.107.215.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lt+n0YtniCQqZx05xP3Ddtnz8KDfnaTVNyKxJa+y56l/oVSLGqT1hAYp3vZgbRXMjq6IRCxAQXSzVQ+PVPTHUi1n7K/octy/FhZpD+7ar2JlI882d/CrfQ38+SLvnhCeMTt6KUwJgcFbjYGqL3ScxLOFdDdi0Trg//2KkYSB6uTQ2YqqBZ5SHrLSgQQpO876lOvQWGrrT2VRNvh50xEgpszTUESIYam6LAizFhPZfSnx7jds2VN+kz0VeTxc4YnyWdktuCOpMLmTZUksZovuwfJOuLRHcBINN6K2CZixfoiOBUfkxn7ocRBYe19bpfyih1TJ6uMun/t5gRBDuSVa9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJmtD863T3kxcJbVXrhCIFngJj7X2M4d/uZuvnSe5YY=;
 b=TKh3YGqXCxNjyUIL1dcAGlmfmymiZ0q6iZDzyo4UaXrzhYOvsXH29I4ePBG/JSU2JpNE7DeDCEV7es1oHJDxeZdTzqbvR063EmUwAS/CEw7HYtZ+8qHljDiwdfQl5BI/WWbqXFuniy8LVExoE9i7ryRlL1hEK4ThVwQaCg3XqoFuyRnt6NW9xD0exMDw5HW+Z7aMH8Do3NEQIz0N5iA0oA5hbRlMrr9qWZ9dex1s2QiyDPQbk/NPfabQjxI1xRAKrbxfGbIn90tA584ybJVPBopbYiDZbCr7ijweuD3cyTssjNK2ENhbkfF48Yo5/xhiWUkS/WSusPgnRQ+0Hhd7mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJmtD863T3kxcJbVXrhCIFngJj7X2M4d/uZuvnSe5YY=;
 b=Fe/kAmpfteckRfGjy9nYAzRzZdqMe4f2tN6vPdqHaIDd6G2D7KSGG5Zo4bQtW+X101UvsLgJdvZJPk8OuqkOogUP1NRxoLFObSVfsLRxdT1Z+z4+wXwcM/eyrkUSdREjL2xaMmLfUSJEpbfu3aCMdFhh5iOW6pDpDhh6hzlpMTXdAkzauBlS8fi4cygm+hlJDFTlQoYQG7g/HNTFhTKNfXlizuzGleYY/Md//y50hOLGTg8n1GuhUSPmq+kiQNe2otdFmzZ0m35QemyUf8dqebrH95gdY8Bv5JV0IK1YKAX3gin1p+NlhAYqPvJQIkp+xGUg6WxmLczgcMNuZmV2Yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by JH0PR06MB6980.apcprd06.prod.outlook.com (2603:1096:990:6f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 23 Aug
 2024 07:07:08 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535%7]) with mapi id 15.20.7875.023; Fri, 23 Aug 2024
 07:07:08 +0000
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
	Yangtao Li <frank.li@vivo.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [net-next v2 8/9] net: mvpp2: Convert to devm_clk_get_enabled() and devm_clk_get_optional_enabled()
Date: Fri, 23 Aug 2024 01:21:20 -0600
Message-Id: <20240823072122.2053401-9-frank.li@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: ed409a36-8604-4570-4ebf-08dcc34233a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RzVHFbg3s3lODcUP1Gv/RXNoruaSbvgH7ApYitFmJFtAPyeN9JvcXE7SN52R?=
 =?us-ascii?Q?lbPmkgSR8pZjoINQqaBAml+gJqM9PPDYmr2Xcu2FglXZl1/9tdS6tLK9tjTQ?=
 =?us-ascii?Q?QkjNXlj5wrICdiJ4djWpq+iEGyUufhloqBNFuay8RUttNwDsZnHsqFWtF3r5?=
 =?us-ascii?Q?odL5lbp8sgdTt8rnCYroeDWRTo3obs0kwV5ogr28UJZZ5dF9MRsjjt9oKS34?=
 =?us-ascii?Q?al0w3HyI3fTAgjh1PQx57eBGGyPdJ9EaSxIeoMm6R5ewxx5nQqEdeuwpMCsq?=
 =?us-ascii?Q?W/9/GquzPrI5bh3126G8KhXRCf2H2jQysBB7HEfg3rTlbDSdbrLK7Wzx7aQb?=
 =?us-ascii?Q?i/VXYc+IlpHJIXYyI01cpl1P/buPaiyTPEuGI617J9jp4xexqJ/DNM2gFlXm?=
 =?us-ascii?Q?8fwt7edoW3wbYroyy0SHBGW00IxxdM5X2gIPFxx7sLoUdamapsJIiqdNrG3x?=
 =?us-ascii?Q?LTxW4tPHXGw6YQgjvQMlAf1BxGkwmfcBSDMxTyCfh2A9Cp7HPr5NoAq8Qboz?=
 =?us-ascii?Q?/GbD3UkOzqdzpLSZCyX0HcJqJNb6bbwRy2vudEv0hU3PryvlzMIe2k4x0VrE?=
 =?us-ascii?Q?OjIpYu2dEiHeCNKjHbfU8VHe1Yf3S3Auq4+0bdtPFZig/I4WGBadxxC5P+dY?=
 =?us-ascii?Q?YaJY+VSzCpZfWBzRnQAugJl78ABNWMybInBGwyTcWADys8vmpQqj4srUD2CC?=
 =?us-ascii?Q?es2PW4m+4/DmALRKhbGpWRqaLV4UCqR1xem0J8uopamt2eHDnUkYZAhR628o?=
 =?us-ascii?Q?L51wrZqr5e0itn1AZ9vdvk/tBEbGe+fdK21je1MYiknwfw3s5f1fw6RP1gS/?=
 =?us-ascii?Q?yv0uzbbv9qKo0SJGtSmDS5Jdntctsu9z5Uz8P2yld0PFlYMOkRskGqJf+AFw?=
 =?us-ascii?Q?Zn1poRnpK7j/Y6iALNKBsrL7+hJBw0is1CwOmtXNzAlSP2+hSMiBOAz8Tkit?=
 =?us-ascii?Q?kjfEzwZR9Pg0FnwXIAFEC4pHKdkZOkvp2kwpjmKzBD0kyvx0QeYAoBGm2kVY?=
 =?us-ascii?Q?rCMQ80+vG+Ii3zQvgCsNub4Gi/t0F6lI31faerO+Bw45z4NE/Ey7qA8MSDHl?=
 =?us-ascii?Q?Xi2UZHRsb4/Wg6Kqo/H5fl7ntuRLzgmHnaJR/3lydLrIx0sZJTSd6UFTk7Rk?=
 =?us-ascii?Q?Hu+KIYXfSLnX+8jDv2rg9ibU+cfRyRyO9/2KP4cP/+FPm69jU14FDxeSXN5V?=
 =?us-ascii?Q?j1HGAmZQAlK1/ZFCxRJwUjYOAkx+oc4RUzHwci2559C1eR5EzPYINhxtRRIX?=
 =?us-ascii?Q?dxkzOzwTn5DfUJrfnyjWADU5ROikl9clliMduC0h5DL0H+auQ4c1LQkZ3rYM?=
 =?us-ascii?Q?DfIK4PtWWQL3CiAnSbWyGDScijBCtr56gw/ZqrVb2MEEg4oQ4is9G1B5LYfd?=
 =?us-ascii?Q?i043EpkStwBr16DVNDMyxGKTZILSI/aHBQ65rm4GhdTJAH1VHfFn2z6Vqg3z?=
 =?us-ascii?Q?ITxE1sz3tcc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lcpVoX0WR69qUSKeCYQDoQPxrc6MlUTlroEOMhOx0AzwRjdRWk4Qfln5jyI/?=
 =?us-ascii?Q?XfchpiuLuxo8e4R7UfQxp3PQ73BR7KlwKOE7ciqNqQMtJWfYtpPV4NL7gy+E?=
 =?us-ascii?Q?rPv7yDtpH43WwPnYMbCms4k8QHt+hbHB9Z5LLeUlTw0Gh8wjqWZN7rMkMDfh?=
 =?us-ascii?Q?3vVBGKfO8JWbA7dTwCRXdAhBy8UALywFlAFG7iJVfxV+zgyGtbBpGEo90pWM?=
 =?us-ascii?Q?DZNwdIt1Pn5JHVwTTp3eKW9cKU9jW/fFewVWhN3hNJhmoUquUBxl8pDJgInU?=
 =?us-ascii?Q?5SB71B0RQ+1NLm3magw610yJI08MCFChBxb8X7GH90X9w1CnJQUUFII9pbMq?=
 =?us-ascii?Q?KHOIcLkdP08tA3EjoWkKvjL8nH1NVtgxKWWD5n07FiLIQ4ikRzwMcLZLklrJ?=
 =?us-ascii?Q?plSJsKyOB4GZo1sB8D8LUq7lJwkyrrZmXLHDjSReXrAvtRsGN3mhGdY8sGtL?=
 =?us-ascii?Q?Yj/C5tSx4axK1885P4/qRVue2xoo3mpUqsH0T/8OAih+82mZ5RzVgGAAHHbA?=
 =?us-ascii?Q?zTe2YuPCLDYqN59okC2eaesGhKjggLbKDYk7ypxc4fjTozdJvGOA/a2dn+lw?=
 =?us-ascii?Q?uxuyq/Nmqtdmu4veAisBLyNkWpdJd3AzyvVID5ENwmr8EQRm2LyCOi3tYnRM?=
 =?us-ascii?Q?AzhDK4R6J0l4AqQvhxBqSScTPz0ay1IhpkS02nwNnZ8jSCS4xxUsGyMGbp5x?=
 =?us-ascii?Q?EPi5P1CYF7D6JPBTyBLdCKUOxmKXkXdlNnTXaAzVTM5rX6eZp6TO77eYm1dW?=
 =?us-ascii?Q?ihC610ttNa/78omy9q67zeXeXJka0yoOOGFbnFvTsocpEbK36IYO3HQBY1nV?=
 =?us-ascii?Q?yaizZ/pfEuJCCrkzb8v8Zotzd1k/tPAGV4g9UScLPtI2pFeeeFlJo9KEdenM?=
 =?us-ascii?Q?Uhgvs0VZFFfoFhZfAgxHBXHi/yZMDRmFe1vN8Sss+TmmE6eMxDtXHGgYI53n?=
 =?us-ascii?Q?0YQCFL5i+VwjsVTASHutbOeMQbg6zLT58whF0SxKDDWKUaiIH+VBcS5+0AKV?=
 =?us-ascii?Q?j7WqrC5IbzAHRntfYBLC42ud3W4ePjipJ/VsZylV/89zK5gIWcmjNtHX5qaQ?=
 =?us-ascii?Q?Rv5CYZ3eAzNzSaeScllDsFhsvnjy/z9JBHW9vkTBhAUU033f6FPEXdwmzwwY?=
 =?us-ascii?Q?aE1djHwB3ynxiiorecI4cSyDHNi/B4VTJQfM2cWkdKyjGbF4Ktnm1qlVmIe1?=
 =?us-ascii?Q?GwM+RmhZgQDo/UsldJrosSYKeD4Yt+kB7nvuXDaLpdQ5DjgBgZJe8dcHnvOI?=
 =?us-ascii?Q?W0X4H6ejVlV/h/jRQYmXdIQ/p3itc0FV6sDTK3AYfKMS+lldPUPOP+R8obqW?=
 =?us-ascii?Q?GvyhBLAp9uJxySr00soJCje5pocvNeH5HWK6auRLudc93vaRBN4+Hox9O66r?=
 =?us-ascii?Q?DhuZJKz5SqWMvMnWIOJixt2NeMOxljvYF8HdFpSnsIt/jGmfq+Zn7UHD3GHu?=
 =?us-ascii?Q?qODIFpwEYi1HS3CecUxEREIehQXyXITSiQNf4JXoOTOG7cLJFj417VwlGWv4?=
 =?us-ascii?Q?UFItaeMlskRNj+Ufl5GPXG0LPySafGwARPh48XhAu5ioYDxoEiRIJbT4zijT?=
 =?us-ascii?Q?9NYwbNE3tjmDqGIUgzIRZtFKEsV1Um6bkWymgA+s?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed409a36-8604-4570-4ebf-08dcc34233a7
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 07:07:08.3811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: imLLe8Oq6QcYkessuiP1+e4SCViVG9GPKXhArL4cUgu1F/nzSUNqYJIivxzF48vPAfU7u4ZtVMxv3pJyUA+6Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6980

Use devm_clk_get_enabled() and devm_clk_get_optional_enabled()
to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Suggested-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
v2:
-get rid of amount of variables used

 drivers/net/ethernet/marvell/mvpp2/mvpp2.h    |  7 --
 .../net/ethernet/marvell/mvpp2/mvpp2_main.c   | 89 +++++--------------
 2 files changed, 24 insertions(+), 72 deletions(-)

diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2.h b/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
index 9e02e4367bec..643a645e8097 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
@@ -1044,13 +1044,6 @@ struct mvpp2 {
 	 */
 	struct regmap *sysctrl_base;
 
-	/* Common clocks */
-	struct clk *pp_clk;
-	struct clk *gop_clk;
-	struct clk *mg_clk;
-	struct clk *mg_core_clk;
-	struct clk *axi_clk;
-
 	/* List of pointers to port structures */
 	int port_count;
 	struct mvpp2_port *port_list[MVPP2_MAX_PORTS];
diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
index 2fe8bae4eb3c..0ca2daeb0f90 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
@@ -7561,56 +7561,32 @@ static int mvpp2_probe(struct platform_device *pdev)
 		priv->max_port_rxqs = 32;
 
 	if (dev_of_node(&pdev->dev)) {
-		priv->pp_clk = devm_clk_get(&pdev->dev, "pp_clk");
-		if (IS_ERR(priv->pp_clk))
-			return PTR_ERR(priv->pp_clk);
-		err = clk_prepare_enable(priv->pp_clk);
-		if (err < 0)
-			return err;
-
-		priv->gop_clk = devm_clk_get(&pdev->dev, "gop_clk");
-		if (IS_ERR(priv->gop_clk)) {
-			err = PTR_ERR(priv->gop_clk);
-			goto err_pp_clk;
-		}
-		err = clk_prepare_enable(priv->gop_clk);
-		if (err < 0)
-			goto err_pp_clk;
+		struct clk *clk;
 
-		if (priv->hw_version >= MVPP22) {
-			priv->mg_clk = devm_clk_get(&pdev->dev, "mg_clk");
-			if (IS_ERR(priv->mg_clk)) {
-				err = PTR_ERR(priv->mg_clk);
-				goto err_gop_clk;
-			}
+		clk = devm_clk_get_enabled(&pdev->dev, "pp_clk");
+		if (IS_ERR(clk))
+			return PTR_ERR(clk);
 
-			err = clk_prepare_enable(priv->mg_clk);
-			if (err < 0)
-				goto err_gop_clk;
+		/* Get system's tclk rate */
+		priv->tclk = clk_get_rate(clk);
 
-			priv->mg_core_clk = devm_clk_get_optional(&pdev->dev, "mg_core_clk");
-			if (IS_ERR(priv->mg_core_clk)) {
-				err = PTR_ERR(priv->mg_core_clk);
-				goto err_mg_clk;
-			}
+		clk = devm_clk_get_enabled(&pdev->dev, "gop_clk");
+		if (IS_ERR(clk))
+			return PTR_ERR(clk);
 
-			err = clk_prepare_enable(priv->mg_core_clk);
-			if (err < 0)
-				goto err_mg_clk;
-		}
+		if (priv->hw_version >= MVPP22) {
+			clk = devm_clk_get_enabled(&pdev->dev, "mg_clk");
+			if (IS_ERR(clk))
+				return PTR_ERR(clk);
 
-		priv->axi_clk = devm_clk_get_optional(&pdev->dev, "axi_clk");
-		if (IS_ERR(priv->axi_clk)) {
-			err = PTR_ERR(priv->axi_clk);
-			goto err_mg_core_clk;
+			clk = devm_clk_get_optional_enabled(&pdev->dev, "mg_core_clk");
+			if (IS_ERR(clk))
+				return PTR_ERR(clk);
 		}
 
-		err = clk_prepare_enable(priv->axi_clk);
-		if (err < 0)
-			goto err_mg_core_clk;
-
-		/* Get system's tclk rate */
-		priv->tclk = clk_get_rate(priv->pp_clk);
+		clk = devm_clk_get_optional_enabled(&pdev->dev, "axi_clk");
+		if (IS_ERR(clk))
+			return PTR_ERR(clk);
 	} else {
 		err = device_property_read_u32(&pdev->dev, "clock-frequency", &priv->tclk);
 		if (err) {
@@ -7622,7 +7598,7 @@ static int mvpp2_probe(struct platform_device *pdev)
 	if (priv->hw_version >= MVPP22) {
 		err = dma_set_mask(&pdev->dev, MVPP2_DESC_DMA_MASK);
 		if (err)
-			goto err_axi_clk;
+			return err;
 		/* Sadly, the BM pools all share the same register to
 		 * store the high 32 bits of their address. So they
 		 * must all have the same high 32 bits, which forces
@@ -7630,7 +7606,7 @@ static int mvpp2_probe(struct platform_device *pdev)
 		 */
 		err = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
 		if (err)
-			goto err_axi_clk;
+			return err;
 	}
 
 	/* Map DTS-active ports. Should be done before FIFO mvpp2_init */
@@ -7649,12 +7625,12 @@ static int mvpp2_probe(struct platform_device *pdev)
 	err = mvpp2_init(pdev, priv);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to initialize controller\n");
-		goto err_axi_clk;
+		return err;
 	}
 
 	err = mvpp22_tai_probe(&pdev->dev, priv);
 	if (err < 0)
-		goto err_axi_clk;
+		return err;
 
 	/* Initialize ports */
 	device_for_each_child_node_scoped(&pdev->dev, port_fwnode) {
@@ -7665,8 +7641,7 @@ static int mvpp2_probe(struct platform_device *pdev)
 
 	if (priv->port_count == 0) {
 		dev_err(&pdev->dev, "no ports enabled\n");
-		err = -ENODEV;
-		goto err_axi_clk;
+		return -ENODEV;
 	}
 
 	/* Statistics must be gathered regularly because some of them (like
@@ -7698,16 +7673,6 @@ static int mvpp2_probe(struct platform_device *pdev)
 err_port_probe:
 	for (i = 0; i < priv->port_count; i++)
 		mvpp2_port_remove(priv->port_list[i]);
-err_axi_clk:
-	clk_disable_unprepare(priv->axi_clk);
-err_mg_core_clk:
-	clk_disable_unprepare(priv->mg_core_clk);
-err_mg_clk:
-	clk_disable_unprepare(priv->mg_clk);
-err_gop_clk:
-	clk_disable_unprepare(priv->gop_clk);
-err_pp_clk:
-	clk_disable_unprepare(priv->pp_clk);
 	return err;
 }
 
@@ -7745,12 +7710,6 @@ static void mvpp2_remove(struct platform_device *pdev)
 
 	if (!dev_of_node(&pdev->dev))
 		return;
-
-	clk_disable_unprepare(priv->axi_clk);
-	clk_disable_unprepare(priv->mg_core_clk);
-	clk_disable_unprepare(priv->mg_clk);
-	clk_disable_unprepare(priv->pp_clk);
-	clk_disable_unprepare(priv->gop_clk);
 }
 
 static const struct of_device_id mvpp2_match[] = {
-- 
2.39.0


