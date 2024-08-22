Return-Path: <linux-renesas-soc+bounces-7996-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB62495B08C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 10:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8C831C22E55
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 08:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39DC317E01E;
	Thu, 22 Aug 2024 08:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="jpVePH4o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010062.outbound.protection.outlook.com [52.101.128.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D58A17DFEF;
	Thu, 22 Aug 2024 08:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724315582; cv=fail; b=mS/9YeKtqWCKzx52Tz5MQVLNxdp7yfdnj+VZFGl7x17VHeyuugGkQb0EOlQiSNl+cout/l1jmhlyPRfViaK2dQnOZ02Xd+50RhGhRqz2NCCoQnKkE2b5p9QPqnJxZfa8AituBS018v/0gcrlCWmeqrPce7sY8pbriSwiwIIe17M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724315582; c=relaxed/simple;
	bh=N/tUcxjy1xJBFZ5NzpV/baThbpne8L5gs9MZqUQ50go=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tvCqojtP2woqbFW7weP3LcJxlj/Z1OZKv3BIjFXQF19vi5rXHCPI2ASJPXTIktPGt+O2Low1jM3HkIoaM31GrhJJjMdcPmcV2Ko773YpjUdUgr3DmJSmUk5YbCHJnel7mWuDoDOz3bfNaPPUieyPOOwQ+dUbCprGej4g/A80Lp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=jpVePH4o; arc=fail smtp.client-ip=52.101.128.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wsq4N61iPF8ysh/XZmvoYlMc+rQsnKgHNl/Vy+ZwNzDp+UC57wAkSyy6yaEvUc3IvqIvTLS9UFsYkgVDT3TzoM8JZEDlT17iwmu1rCSZkSkWMQlf1Aoiur9caWMjdyx38DyPhyin8jx8SGmCJuLpbHM8MgRvyYx/KPiD0j8s0V5+29Z5DlhlZGlKbr4iGqiD6uDenF3pdmF3fENS3C6NdEtF6KxtV9mtIc90u6kb7huYD4AI93Y/rYog11iV2IMd5t2uS4A6e8ddeweBxRODVwTYchXHbDmVfM9WZjSedoycqfq+wxXS9NyQ9OsYF0GEXnXstPuXFK7mlf0LPtvgBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0wKdpf+etVGbdks0u7PTUFK7xQGU2Gc9tVtz4VzV9uM=;
 b=akFwcMhVH2aQQYc+Otnat3FntSmJ8kc14st/2LQCZUE21RZT2OWtDs75wWIERVTSq/4fh6MX54D/FGEWbiaLjyFdaOigMIM6jhNPWVRbUPFuz89h3veK7Su43LZaiFAiueEUgnv2sXNJz/CIOZTAk3qHUec61sYqnXifG5V2X0vmNXaOAmvQLcJ/p3UP/0O3y+RYjL7Fsbm8Qj2XhnwfdP85Dcng/3d5bRNAtkONNolhBVzbJd6GGLNapTB5LWKckfIO02yBwr18CbHxmRLaW2zagTOcPr/S91KyivvTOrs0jt6oKBcosrmMDxIZMmX6qOi8U+9qeCeNUGWpbLsLLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0wKdpf+etVGbdks0u7PTUFK7xQGU2Gc9tVtz4VzV9uM=;
 b=jpVePH4oYV/e0ucbMNSKUwPZuOshhn7EmssIVeMB/Kgn6HU8wOUOAq2p5MRE4viaL8vZqlXXKLggATpQgLxKR9Sw+1tqOU16qA9Qi5TMJXD1wpqD9vExmAf6laLCtubFXj0JsJMKGD5wiIQl/q4ho7yXJlaJ9xBmG8O/cPs5M/r4+WtaMChty3t3bFK7qE3tQoxeAnrsPYaB6WSAQb+bSdUlcpUairZ9JpYZPaHfbQUn/nR3e8mbrRTFU6lhBxPmJlGSNl8EnllN5RABfWYxwS+ZT3SwnS2+WcaZn2kULwf2EeNBRB/mdgVO1OgcbZqrodBAMCwU20ywMTJYn7+w+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
 by KL1PR06MB6259.apcprd06.prod.outlook.com (2603:1096:820:d9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Thu, 22 Aug
 2024 08:32:57 +0000
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::6257:d19:a671:f4f1]) by TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::6257:d19:a671:f4f1%3]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 08:32:57 +0000
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
Subject: [net-next 4/9] net: mdio: hisi-femac: Convert to devm_clk_get_enabled()
Date: Thu, 22 Aug 2024 02:47:28 -0600
Message-Id: <20240822084733.1599295-5-frank.li@vivo.com>
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
X-MS-TrafficTypeDiagnostic: TYZPR06MB5275:EE_|KL1PR06MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e7000f9-eb8c-4b8c-90cc-08dcc2850673
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d8NvzooUORwCHl5sxVspFI7cIJMQ4+FipsVF/OFCjTO1Jqt3j5HmTGda6jNB?=
 =?us-ascii?Q?XHhZde4kVlV220HMuaLr+aKJfxVnMSEDeo63IwsAuXIb4DVFmpUbiI7L0FkH?=
 =?us-ascii?Q?u+XiSkTlIN51q2rUZUzCa5m37KK6FwidM0JJbcOZcBY/y4pnfksTjWs4VYK8?=
 =?us-ascii?Q?m7L9MFU9OVy7Yc0uZDR48hieYphE/EMPMFGNWo9ik4REMBJarvMzAKTBgchC?=
 =?us-ascii?Q?Z6kyzNqNmRyYRCEWF7dFCZmiT5tIH7mB+GPI+BNX7YJtzlf6aKafa7ooDUfE?=
 =?us-ascii?Q?lZbB3WLWA0GGGl/L24sNk5xannuS8XqzhUfIXNcmpHQvBpnFun5vQxx/CftC?=
 =?us-ascii?Q?EO3qsrRxCHFEWTHqtS34TbTPuN5Dlbo4F7Uv0dk5m0yYpI+RVAoGMs90sgAc?=
 =?us-ascii?Q?os1HzpwNFOxYyPNopDvhbZqtxrrdpSelh9KwvZVKeq8cdKNZ+nU0W3m3vYJO?=
 =?us-ascii?Q?05ZKx7E+EmCtfReH2CqclXTIZLt9AhuOhq+ICpUkXt0E7l/AaGWS2d647ay6?=
 =?us-ascii?Q?or0+TUXqqWFFsi5WqKSaUKd8n27aED+PRdP5FSXFxjqhzhyYVrVDSTvTXivt?=
 =?us-ascii?Q?U8kyxkMWypbuMnLYzx43HSpcZA5yR+XRN2JUVCW1cFk8f3OCDRityLAySux0?=
 =?us-ascii?Q?lCLp6dUd3wKyWIfbRBH/t2X+SthdkdX86xGK+gAV5K+PwEzJxGNgBKXgD2r3?=
 =?us-ascii?Q?KsDPTuaLbRqqPjyfx0EuhjG72FiaDVxsd7rYG0mffcU3TznXurOBe1+5q9lL?=
 =?us-ascii?Q?0XcWEvzslSt0WDngZiV2VssJ07rYf6zvd1LrCa8ROFNGbu+hHgrgfUX7QFoq?=
 =?us-ascii?Q?4b3rSuNeGfuNQC13QIYEqedc2dBFA413l0MUG3evgSoRCOnr0hpD1SpW6Pq4?=
 =?us-ascii?Q?GQdlE7x3TyevCGkClRJ1J1/MfnoCqUGc8xUClp0U9oYg4y9RlcgcK97tGC1O?=
 =?us-ascii?Q?Frh2yEpDMxw12j2o0Kr1vfNXz8cQeQ3xnmpwV1f5E2IuWKg8bnR0pfl0cB7L?=
 =?us-ascii?Q?Cs54vCLhSkdgxPWTzHBuBb4rbK/NmCGqVvlDu4e4k42EjHoeLYHvkpy2xUk/?=
 =?us-ascii?Q?qaBLluTL3EQEMS59qg9OocSxTmXzaUXQWd9Mp65pVmiwM4xSkovOYDt1cN+d?=
 =?us-ascii?Q?2ULi0XD/rPOpnz6sVBl/Wq/yjesHiOOz/nNFZY98TpC7oSeyZ41DkPA19Z6h?=
 =?us-ascii?Q?EUhJeR5lBjL1rSuMIZ/0UGy526VSd9/1dzzsYOCrxAO4w0PhqNEgWy3cauVL?=
 =?us-ascii?Q?5k+3jW4zdGeaui1zXAzXYebI4/SbJGHJgU5nTv2KisHwNecTZ5/JO1OQ/oJn?=
 =?us-ascii?Q?/vREaMfB8ebA2DycDcXSAUDU1/REC656Z+sE4vK7dlHcuPZeTbj1RcFAllhf?=
 =?us-ascii?Q?F2sQRjcsyUkIOZ1wJYI/h+y/Hi59uVNSwU1F0ujqRfIupU5iYz8v2RegAd0+?=
 =?us-ascii?Q?BpH8eTpxXyE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5275.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3Fa33FhFusabDWLBdfUEImdCLqc4fw+Rg7zpyGgYOa5YFHNWo16zgie2EtQs?=
 =?us-ascii?Q?zZUHzmz35XWzdzM9dLBbPo4Df2wbzphmaK0Tu/+W/nfJDNHqnUbpfzRdEpph?=
 =?us-ascii?Q?d4++melNfnxbK12wtR0IgiA57j5dMH737B/XneCJOi337RyakdRf4gIeMvcH?=
 =?us-ascii?Q?bPq68eQsoAdgEhD9FN8++9OLDjDAif3KkkLFbV6LIwEl+Jr30hrahi9JyozD?=
 =?us-ascii?Q?wQJ3g2MKx1ie5n3k9myvctWpM6T8SjngIspQGcJkJUlnYteCTEM5TqTPPNGl?=
 =?us-ascii?Q?GW+llthrNE836mNxIINPWZkSTJ5sF7CBnm4YYBjNeu5HUdXFIymtUSZoYidk?=
 =?us-ascii?Q?uUacDv7EEhJ0ho52xFuixNPHvc+HpIkq2rD09IWd1y2oFBGYpdjiIqyeq71L?=
 =?us-ascii?Q?C4oL3/o903vndMUGtwC5h7Q+diMdP81LZI5aqQzBoiqFHGmC4DZHPOiWXAs8?=
 =?us-ascii?Q?jJeC5uYaNLVRPdp+yChZr9PLB/sqPg8dfwBvDNTudMZ5F0yOfOzDdJE4rgmk?=
 =?us-ascii?Q?CN2WDv4aPZLJSgShVx6dUO9jwfMefq1M6jttBwLZ3GejoDBPIvr3G05GIXpp?=
 =?us-ascii?Q?DUJjIPvwCXLWiGvKgQTtBWjPSbQ5R1SoeHatKxxQM217vA+HiFXwAi294ZLZ?=
 =?us-ascii?Q?npxEJ47lxjX6E3y7BJlobCyM2BADaVRj/Ybl5Q705Hp7anuAkQTmkmjjWY3l?=
 =?us-ascii?Q?uc1Zjx9ZgL0zPSrmuJtUcjL4OM+1tniCmVMj2vgcF46vPtZZpIiP3KymawSL?=
 =?us-ascii?Q?yZF2+CtKFSWLPe1ocrMTFYjMm+oy/63hrbiB9WoqKzdYS2GOvbCKnmQaujxx?=
 =?us-ascii?Q?H2k8Sy2MaqY4k9SM4LeOvhykfhcth4RhRkXaWCtyDFEOe/rZB0mmL4FhHSnK?=
 =?us-ascii?Q?EhOO2luZPvwFy/OPsbnxr8YoN7VbiojbzSvkDlq+vNrp/VR8ck1pCxLxbcrJ?=
 =?us-ascii?Q?3KtOBrTQ9biGSWyY4v/BR4viCZ0LO8PCtEWTSINCYDoaheUHeAUI50gZiMWS?=
 =?us-ascii?Q?t4bafXs9uvydIy43FsbHBlz6q9fqTJc8oP8IXymOD61CiC33O7810X8UzFfm?=
 =?us-ascii?Q?vO83902DgEelrzY5RV+LcvwTsZ7NXiccoDwxhG19lkqSP20jCUkR8zuAz1lD?=
 =?us-ascii?Q?NeIrbLwdC7xzemBuEIsBaweVkDZqF0iTkycftqnf23xcjR5okDZs7CTr/90L?=
 =?us-ascii?Q?HbZNH+IO2Y7W1EQeZh5jgVR80Zhht/CzalfjvXomajuwo4WFlP1u8vbOI1EE?=
 =?us-ascii?Q?VPXIrShFrJhB4m6dBrjoalWELNG0SBTdnRj0r7G3hD/eEbDakVsSNeBOqVqt?=
 =?us-ascii?Q?irWe6POUne8viEEx6EboPDlbMF0FrPpFff/BkYfUC1ljqQy9nL/n1GA0JYcf?=
 =?us-ascii?Q?PZk8ZFdTUuvTXKrqhYkACnyDNgnzfIrbbnGt9CwLjUCJYTQtI5AORMfWbOmz?=
 =?us-ascii?Q?wSolgFLKXi+o4PH0tuKDFhQ8cuWwJ+C4XTFUIcKDWMEV8r3n928lXmxrqyyG?=
 =?us-ascii?Q?plb/CU/j2XEtLQA+c8+0Zo2jv39u4XyizIN36+v2h+KmbTvadvKQ/8sH7Y/L?=
 =?us-ascii?Q?fyqFcFXlnnkKz9sgYKVvmWjaQRhKlQFMaoZNiiIl?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e7000f9-eb8c-4b8c-90cc-08dcc2850673
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5275.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 08:32:57.5808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PnHfWdDawmZwymNBbbH2iMvYuMjFFRoY0wFk+b6R8Uv3wddNvZqz1tggdWw5YGRtSYAREop7UEfA5XkPuzuexA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6259

Convert devm_clk_get(), clk_prepare_enable() to a single
call to devm_clk_get_enabled(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/net/mdio/mdio-hisi-femac.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/net/mdio/mdio-hisi-femac.c b/drivers/net/mdio/mdio-hisi-femac.c
index 6703f626ee83..f6fcb9e11624 100644
--- a/drivers/net/mdio/mdio-hisi-femac.c
+++ b/drivers/net/mdio/mdio-hisi-femac.c
@@ -21,7 +21,6 @@
 #define BIT_WR_DATA_OFFSET	16
 
 struct hisi_femac_mdio_data {
-	struct clk *clk;
 	void __iomem *membase;
 };
 
@@ -74,6 +73,7 @@ static int hisi_femac_mdio_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	struct mii_bus *bus;
 	struct hisi_femac_mdio_data *data;
+	struct clk *clk;
 	int ret;
 
 	bus = mdiobus_alloc_size(sizeof(*data));
@@ -93,26 +93,20 @@ static int hisi_femac_mdio_probe(struct platform_device *pdev)
 		goto err_out_free_mdiobus;
 	}
 
-	data->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(data->clk)) {
-		ret = PTR_ERR(data->clk);
+	clk = devm_clk_get_prepared(&pdev->dev, NULL);
+	if (IS_ERR(clk)) {
+		ret = PTR_ERR(clk);
 		goto err_out_free_mdiobus;
 	}
 
-	ret = clk_prepare_enable(data->clk);
-	if (ret)
-		goto err_out_free_mdiobus;
-
 	ret = of_mdiobus_register(bus, np);
 	if (ret)
-		goto err_out_disable_clk;
+		goto err_out_free_mdiobus;
 
 	platform_set_drvdata(pdev, bus);
 
 	return 0;
 
-err_out_disable_clk:
-	clk_disable_unprepare(data->clk);
 err_out_free_mdiobus:
 	mdiobus_free(bus);
 	return ret;
@@ -121,10 +115,8 @@ static int hisi_femac_mdio_probe(struct platform_device *pdev)
 static void hisi_femac_mdio_remove(struct platform_device *pdev)
 {
 	struct mii_bus *bus = platform_get_drvdata(pdev);
-	struct hisi_femac_mdio_data *data = bus->priv;
 
 	mdiobus_unregister(bus);
-	clk_disable_unprepare(data->clk);
 	mdiobus_free(bus);
 }
 
-- 
2.39.0


