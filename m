Return-Path: <linux-renesas-soc+bounces-8101-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE7595C627
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 09:07:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 802231C21AD5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 07:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB3A513D52A;
	Fri, 23 Aug 2024 07:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="nRB2BpC3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2078.outbound.protection.outlook.com [40.107.255.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1876313D518;
	Fri, 23 Aug 2024 07:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724396805; cv=fail; b=nzAO+IfSwpe3fmXllY8YBtyFZctjXCSPwbo4GP5Ssyqg5DVjkdObHu9+MtzfKgt71v8L6GY8hhmgG2vbEKJ92/0gaRZyTeq1bOguUNHPYsa43GbOk1Vu4b1ULpMO+J2DqCP9BzpyGpeE7/C0eZIIlEEamQAC0RTMVIjNEtZq0T0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724396805; c=relaxed/simple;
	bh=sXreGL5RcW+LZ3HpEkMLm+V5Oer4/p6JeH2q3Fhre3M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BgOXAigzwQP3HX6Vqo2VLw9md/jKKmAuixD6Eadtlm/VtnsCqU6sxuQEOPcFPlHTWAz8y3K4e7nsbjl6fQbXPfindC6O4H33BWZAM07Dmtb6cHNGsPsD3L95B198qGl3zznfBV1E7ADipm9s1CQLzrDTcz8R2RTz3X0qEtEubTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=nRB2BpC3; arc=fail smtp.client-ip=40.107.255.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ItkxkJzlE55akrJ653K9uyxKKHBgWV/z76kgWpW96P2Gl8J71YWkvVBLJv5j4SJqox9qym6AXZ3V5Q2zqUBap0Vp1IPxbBf2hgSWgYb2/F6cBJyBCPEBg8YAuaBxXAuNGqanTX6XgcgGeMTsNuK7Jw06g5yH+SwXgquFugU6Y6TN+k3W6MUdV7m+y2pNF8enLTCAz08H0pbTSUmHHWJ1XZXBe0z6rskSy/lFK7reEpeXoNORqxgGgPySbx4w7eSgIZFuc9Jgpugk9aAFPKvfqaL51I1rGyHXUCfoPw+ahjm88FirAeMcjEM82YJ/+UujPPe2Yczyfjl1GRE0VNj2AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Emi0kjf4HGTSvNWAGhXGFzo60m4I3Bj17jnJOAE/QS4=;
 b=bQbw5YKkKuqvWR1fTwfkIiJEbpvO7IEN/yqaxNCErG6ayZiDyFSSPoJku0ZOGipaXJzHtqjqyezZW0hTPXfuSPs+4NSQOpkMLNmSTeb+3vcYjYfyNcEcKljUAnFRBBBnx+oFKxOWUXFj9EikZKDILSA3SPtUYUsJSo8qFW9bFBM7JLyGD3qelg2j0yOHYZVJnnL9ohXPTO/gqdvN39nFmrU+Z5VVHukWqbzJSd1xebQ3RXRwmNAAchuLvGSFNs0iyylKxHDZSC++C7LrqVFrepeagCvDKiIgAVjhsGgUV76HlRgGgPNxdfq6ecEOJ8A9jzW3dHMa0cACaNzimtphTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Emi0kjf4HGTSvNWAGhXGFzo60m4I3Bj17jnJOAE/QS4=;
 b=nRB2BpC3j4h/1CtH3WLCxbeLdpa8fK8AnW/GFG5Ff1EQEfp0/UQWyCggRbdAJWCEQR8ThYnCCXEyqWIfRDJ1CKNAd3NL7ouAVHa8Puf7wcDX9IaB5/9cKeWuKHzXRVDye5IYWtozajnpdpl4IsFahrVH4wlEUv3uCcn5znpATjqN7+Z9KYrmc98eMnjpXkOTGGlMsAJNfHIp9mSJPoMqh/j18+UDKct7vWYjtoT3BkZ77V60jvRrSflV3aCtsG84FV3kAD3qACbjdfRbccVeg5t8OLlMsNOa4mJDRL2ulkmsLmf74BsSCSlSh1UcYrlswd5k050/wvXS0SveeuzenQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB6105.apcprd06.prod.outlook.com (2603:1096:101:de::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Fri, 23 Aug
 2024 07:06:41 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535%7]) with mapi id 15.20.7875.023; Fri, 23 Aug 2024
 07:06:41 +0000
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
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [net-next v2 3/9] net: ethernet: cortina: Convert to devm_clk_get_enabled()
Date: Fri, 23 Aug 2024 01:21:15 -0600
Message-Id: <20240823072122.2053401-4-frank.li@vivo.com>
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
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB6105:EE_
X-MS-Office365-Filtering-Correlation-Id: ba5f9e1a-3a84-44ef-4e62-08dcc3422364
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j/7AKL9wgGm2EA7Rm2QzsSz4lUZB4SjfBqAsBmbOKP+DfvzHaAHTGqV8750y?=
 =?us-ascii?Q?Dz8mDi1i/Q0pAvzXcS56Jtt/l8L7sWPN3X8cTllcN83yQOGNbbJNix8FHLo+?=
 =?us-ascii?Q?et5TFlNrTejnVwXVUhrkGue4NL5ykWClxncIRuWrRDv/iwcDkQnDyTjY88Jt?=
 =?us-ascii?Q?xHUfs07tbF6kteL0hCgRfE1VtVNROi/qKaRsGKihCxhOi48lcxZ7jvEUy/m7?=
 =?us-ascii?Q?FPLJF7vBRTWvW9l9dfLKuzyV2GFah/GGGpwOvKDAaMZ+h5pjcbuL9069ETWb?=
 =?us-ascii?Q?6eHOe0QwbXZxe67H8HZrZXQfPwCfNvaDdHmm38WX9KckYzP4tJuzrYsCEIdT?=
 =?us-ascii?Q?4kqaRPhKQe72iqM904T79GvyUX9xAcLEkCUlxJSyfuMSuqVbAehS2el9pel+?=
 =?us-ascii?Q?YyjZ+B9LIirC2W71alYDePt0YBZ9AYVY/SrF5F0G+H8JoWYRdtgut2wyPqgw?=
 =?us-ascii?Q?w/J8tl6No3iW5Pn8/X5SBCue7Qx3Ak3NUwb2pH2A83coXRYmIYuKwX7DxjgE?=
 =?us-ascii?Q?EePLDK5fZ6eC8yzG/KdqtVzzWyYrv+8/sn9qjAF0Un5imEfL+fCGodHWD93/?=
 =?us-ascii?Q?GvtG8utPZi8PpwVfoe6/dw1jFGZeMM0HXWzdr9eQbi5v7f4Eh/166R2YZAnr?=
 =?us-ascii?Q?e7dfKQzTdByLxkM6TvDNk3lvOi9UuC9vMiMpcblfZqVLIaUYPETQjo2cvacX?=
 =?us-ascii?Q?K9ivF3mySamy6uHAbL0FjNalME4Dayj/NR+d/xCJk5Qo6gfAurgTzGPfcdCY?=
 =?us-ascii?Q?qBqwwcJ5nKnZ5McipWNu6mkos1yCK9RBM+lK6wdz/KXzRCmyZ8Lwo79Z9rQI?=
 =?us-ascii?Q?8gyhE0JNFbS7JCr/lhjtPO/lVA8sjNpp/gdbP4Y4I2APtAWe1ihD1mthM2Ff?=
 =?us-ascii?Q?H/VDo8grYWic6T/JnBpS3IFBhsrM2km2T8NRwMZYRWtHMOYvn1XGkslE7v2L?=
 =?us-ascii?Q?bOWfADN2OOU314Pi2sF576I8jI/gAlFwcy+6gfOObt+D5baz/w8gBj2gVRTc?=
 =?us-ascii?Q?/49J6jy2ZSw+cYeMCps1NBgs+gH1kEsS3vaIouvCeN6msNunNANw6Rk5UPFv?=
 =?us-ascii?Q?QpewbZoRv7dPxnWL+4ydowLBpkycZIm3WlnnjkA2l7E8y2SCjKbBieoyFLHc?=
 =?us-ascii?Q?zPOeyeazp9dmFU/KlBThAoX8TEJWPNpjMg/8GPOasiw5TkJJn+jfW3t42bgA?=
 =?us-ascii?Q?x24z+YXEnKOD/G6teEhFIG3F0oWvBSfdnrooeQ+0JfhKpo7ljcAvpx3ISjmN?=
 =?us-ascii?Q?gysP39oReNFVwJniTUhL5/tATQwSX3GBydb/xi2CVRHqD6gjQcaP9b7+wLEt?=
 =?us-ascii?Q?i6/Dq42lYu2hbrCrTdAv8a0K5k9DiG7rRyeXe6Rav66D90JMpp1I0wKekTYK?=
 =?us-ascii?Q?KhiPNNs1EsK6lA3sdw3vneuiO/j2+ARdWfTNPWiAvVRun7f/n3RYOcMKz2Cs?=
 =?us-ascii?Q?WhpczEHqEFc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fmeMO2AvgiYmx6wF8/xiOBElwUh7fmOlg4nd1Acalx10dzWzuWxuodTDAbzX?=
 =?us-ascii?Q?1IFxHQWz8a6CZV++64s2R0kk2oot8QVmWXn4rXYSU9qWMH7t3adCa9L1d1W5?=
 =?us-ascii?Q?XN8PbL7rhXsEbLZGdNPt2jgH+LBFgg+W/KjNuux3MUzWfiGLXkHetoGKfx5j?=
 =?us-ascii?Q?pcJ2PEiI7+G6uGR6u5KGFtrdqq59tiwEN2kCLqmJRDnOpeP0CdPQS+8CAOTH?=
 =?us-ascii?Q?PwDDv6wJSxeWRpVCpWpWZi/LklgQjJ57eInBBxeEfsQZakNKiuEZqfICKSOM?=
 =?us-ascii?Q?383scPYIaUUzt8DptQ3NSu15lQMor4u/4obOLiA65ArweWNWM+xNIyCHV892?=
 =?us-ascii?Q?FJxmPQs3BxwYu50YmtiENFaFQHJKaLZOAnre8szshL6hWdyBxybXrbekg5SF?=
 =?us-ascii?Q?tfc5cuM1atffXTXBccQliKidgQGhKentX/Bju7PQ0/UBgfQEwz6eVSUGUylf?=
 =?us-ascii?Q?hchy6CRTnxaiFfy6kqLBpWvS9S9AN1ymWWWvNbC9GWowOU9Lp64cFP8u02ty?=
 =?us-ascii?Q?EIiY3/g0/PcaO6QyhkiSTa8vXpzftsaWrJaJr4tuSnk1ckFu1h1sA3ur/Qkn?=
 =?us-ascii?Q?sXgsDDNbTgcYy5tJfs+o2bbXDVr587A3pNF+z+yuYCkHQA6cq3vyAFNtv+db?=
 =?us-ascii?Q?wsFgFjagZFnQI/xuPiCgiqPnpjxFGVuzHX8DqcIZQYJrRnJXW37QyqPJgOOP?=
 =?us-ascii?Q?0B3MbQPqNoxv9uNFgtk005TFB2+kY5nmwyDr11FocAIJi2DMDC2hsNEqhJTm?=
 =?us-ascii?Q?UIW1dZD5k3+XesnaA4skv4k9LKM525V8YJsnUSYPcGSfLvaT8Yg65N54m6IU?=
 =?us-ascii?Q?NGxOeVBZ3fujOxwd+2lPZfW21Fg8cdRVYnKLaaEKXoahxCseHYghkVvGsgZd?=
 =?us-ascii?Q?0N/T/UBZNJdzY2VnV5gFae+VL9Yka8J4CYGrAvaGYQAi44C3lG9XUgp+KcnV?=
 =?us-ascii?Q?aUAblUhgZjYw1rskQnMiKx4v/ECIBqbSqcW6XjYHQggr2ORTVwt8P2EL3c7B?=
 =?us-ascii?Q?oVM6VAYU8lF1pQ2pSuHDQDkPfCCjHkFtPuH/2CPjD/LgDKYk9hP1gLfBVWhA?=
 =?us-ascii?Q?GDH5Ksg5UJeGYi4yijTOjdgAsOoJbyq7zhJvfR749u5+OehNjRlhGkXvJvEy?=
 =?us-ascii?Q?KWYpf2w5cD0OjxLJCVbnDmVvX/++elb41p2CzHj7KNFuvkENvGaDEt7EYr2y?=
 =?us-ascii?Q?9m6wQypLihWE6AEgHkUntfWfcjVMRvIH38evn1hNGrSskeGnYwmrAngc4oZp?=
 =?us-ascii?Q?5dQrwJpQDb+7LsaFHYlLVCwv+NgnJSpdduwc6jW8sfVxmGv2HU75Iz9z0rAy?=
 =?us-ascii?Q?NQ2NJTQXRvZibtWl3Uh6t0fh45vqw5wfCNTIzr6pGGkfLCQd3FJtI+m3bUoZ?=
 =?us-ascii?Q?oQ91OulHtvqdLwnYF9oYUACa2bX7wc5NHx8E0oZn0tkaHfyXOi6MzAOztxLU?=
 =?us-ascii?Q?Clz/dVZvYmI+RConqus5darm/1uxzqkVCmsxjEOQvdL48KKAT+tN1XGTBcFa?=
 =?us-ascii?Q?HRKi3VJE0qwaAGsDpEUfMosay6IwBou8cWpDYUfiwVvwtqnkBwO5ufj/ZkGE?=
 =?us-ascii?Q?FvaWwMUtgcLh2HdTIr6n6AovtnCh1yRdY/wuw+wy?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba5f9e1a-3a84-44ef-4e62-08dcc3422364
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 07:06:41.0434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMosMSc6jy6ZCDlaimbLCZHWU6rs8vey7pyeUTJU1DLBpQrU9d4vUz8mnNaFes0y+YYmPpvqqOvdoLYv/NxXYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6105

Convert devm_clk_get(), clk_prepare_enable() to a single
call to devm_clk_get_enabled(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/cortina/gemini.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
index 73e1c71c5092..90a14e03a782 100644
--- a/drivers/net/ethernet/cortina/gemini.c
+++ b/drivers/net/ethernet/cortina/gemini.c
@@ -109,7 +109,6 @@ struct gemini_ethernet_port {
 	struct device *dev;
 	void __iomem *dma_base;
 	void __iomem *gmac_base;
-	struct clk *pclk;
 	struct reset_control *reset;
 	int irq;
 	__le32 mac_addr[3];
@@ -2326,7 +2325,6 @@ static void gemini_port_remove(struct gemini_ethernet_port *port)
 		phy_disconnect(port->netdev->phydev);
 		unregister_netdev(port->netdev);
 	}
-	clk_disable_unprepare(port->pclk);
 	geth_cleanup_freeq(port->geth);
 }
 
@@ -2403,6 +2401,7 @@ static int gemini_ethernet_port_probe(struct platform_device *pdev)
 	struct device *parent;
 	u8 mac[ETH_ALEN];
 	unsigned int id;
+	struct clk *pclk;
 	int irq;
 	int ret;
 
@@ -2453,14 +2452,11 @@ static int gemini_ethernet_port_probe(struct platform_device *pdev)
 	port->irq = irq;
 
 	/* Clock the port */
-	port->pclk = devm_clk_get(dev, "PCLK");
-	if (IS_ERR(port->pclk)) {
+	pclk = devm_clk_get_enabled(dev, "PCLK");
+	if (IS_ERR(pclk)) {
 		dev_err(dev, "no PCLK\n");
-		return PTR_ERR(port->pclk);
+		return PTR_ERR(pclk);
 	}
-	ret = clk_prepare_enable(port->pclk);
-	if (ret)
-		return ret;
 
 	/* Maybe there is a nice ethernet address we should use */
 	gemini_port_save_mac_addr(port);
@@ -2469,8 +2465,7 @@ static int gemini_ethernet_port_probe(struct platform_device *pdev)
 	port->reset = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(port->reset)) {
 		dev_err(dev, "no reset\n");
-		ret = PTR_ERR(port->reset);
-		goto unprepare;
+		return PTR_ERR(port->reset);
 	}
 	reset_control_reset(port->reset);
 	usleep_range(100, 500);
@@ -2532,24 +2527,20 @@ static int gemini_ethernet_port_probe(struct platform_device *pdev)
 					port_names[port->id],
 					port);
 	if (ret)
-		goto unprepare;
+		return ret;
 
 	ret = gmac_setup_phy(netdev);
 	if (ret) {
 		netdev_err(netdev,
 			   "PHY init failed\n");
-		goto unprepare;
+		return ret;
 	}
 
 	ret = register_netdev(netdev);
 	if (ret)
-		goto unprepare;
+		return ret;
 
 	return 0;
-
-unprepare:
-	clk_disable_unprepare(port->pclk);
-	return ret;
 }
 
 static void gemini_ethernet_port_remove(struct platform_device *pdev)
-- 
2.39.0


