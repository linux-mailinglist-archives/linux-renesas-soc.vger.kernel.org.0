Return-Path: <linux-renesas-soc+bounces-8000-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 275D295B098
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 10:35:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B9081C23087
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 08:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B917183CD4;
	Thu, 22 Aug 2024 08:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="bXG0HzAl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2053.outbound.protection.outlook.com [40.107.117.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721AD183CC2;
	Thu, 22 Aug 2024 08:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724315601; cv=fail; b=PdA9M0UJPS8gSmL6kdMXj56cGdZrMhSZfsi+FvtKdGOV4r+DbH5KRcK9ZsmGiIrDLiEyB1Rwjv5nwXOkSFZpZEcX1Rok/VRA8iV+cXYbvptHdnpybnsFT/klqBOeoglCjKzu1v1ZbkL0j8EqpihxdFasfhITx+R5N646p5amOyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724315601; c=relaxed/simple;
	bh=0CzW6+guxWyRVFpa7DMQLSohHbKjwhS6yk/KodkS6B4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XZWF0egX53DF/ryLfcToFs5jH+uvS7Q/eNoy0kJS43RWeNYMMwqYQyJ/IOY9CtgSHm/rVmxt0ykM5v5C6JATGLBWkfXejvSuHQF2hMdSID+AAnRaRPJXnylpBGW7fuDA0uriNjkkkXqujvQ4eTnWFFm4B3mnbxP4qI/kbxxEyiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=bXG0HzAl; arc=fail smtp.client-ip=40.107.117.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SjpXFaQ765kXbCPFdYxUqyfgqFkblfRz0WL3WAukdT8dSEQCI8TuPZgp+DIEinKR4UEIJUHaSBc2fTg7befo7gDD7n4WxUklUvuy09b/0mksIx6qdzZuVZ4b+GyQYFo7mT5Wd/4wkX94Kh1YaWjU952Rd6x6ZoS9ZjxHW4q1utzAjtfHIK25GKp4GcA1jAX5wKMiVPVp+he1S1KGncBtbaXOY8qQq1jcmw41CB10GpeHy7ipBJB/78YnxOBOswoyfMCnYF5gGM3mn7kvR/esi157ob2H7Ub/4zpgkbIFffKEktWPcDssTa1wkzt3XdSQxrXg1DzxwEkpBmZi8ZH8tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iOgCG3VxnHRR710nCpxUh/XIt5vKoizKYTcHSiG3Gwo=;
 b=VFkwzm/XwjLbj4tOs9p80YE586aHMM04WlFfS4xW9Z/IjK/1H4lhWoN+zumQXGdfJVkKkfNVpvdzilqm9Xyrnrf3FgXr8FsBXLaP8vKOuddRYbnl5AVtBmiQ0RfkCpPF6vBb/aeOOhPYT5KeM8RtUvH/jy3atJVXRjOtN3axdl+xhHfmLJ5iyXLRj3K2UyE2qUJU6lxzfxGTK/2p53ky7UFDzCHKKO4Y8ye7JwmwpVMWGR2nj+67593lrcj4BNkQHZCOfJoSwHhRMDLuV3iMn9cB5N9rG5yFqvfgTGqvDR0WqYd3i5oRFlSZN3om1N55D8tsvAORNw8vr1kulRWlhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOgCG3VxnHRR710nCpxUh/XIt5vKoizKYTcHSiG3Gwo=;
 b=bXG0HzAl9F8p56VuVzdw+0r7qq+gKF6BS3AyM1Y7VivaYDzci+cKXyb7JYcDE25V7W2DJVhsxnl35/nB2KiaQDGZjhGZ0bfMI29CwqTFZiu0dhbhWzelkeBsvbyfdNb5ursFcZTMRJ+rwwHKr0rJzgkqKLFZTXW+LV40Od4NpZvoAAQ+WuAx7VEbdkrWzKWSsIP9uq0MPujmag8oJP6NUmgrHlwbnKD4VNuQ28MnrBcSsxI6rsXiuawBJV6VuhkZ4hoLZcxbj/I2cT1yeKYfj7iJXKuOohq5wyCh+eYteWAJxFM8cA8j5uIxUeJnnUp7by/zrDW6Bo9XWzZDFaszpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
 by TYZPR06MB6114.apcprd06.prod.outlook.com (2603:1096:400:33f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 08:33:16 +0000
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::6257:d19:a671:f4f1]) by TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::6257:d19:a671:f4f1%3]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 08:33:16 +0000
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
Subject: [net-next 8/9] net: mvpp2: Convert to devm_clk_get_enabled() and devm_clk_get_optional_enabled()
Date: Thu, 22 Aug 2024 02:47:32 -0600
Message-Id: <20240822084733.1599295-9-frank.li@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: ed6d7ca2-8111-4299-25d4-08dcc28511ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zM1OmJAqpeFGmHGlo4vOo60GAsfFFLR8/2tehSMWfspzjvWTz4I/rpqy7xUK?=
 =?us-ascii?Q?ju9TGhns9H8RfpuzTzyN4hQVKc2gtX3dVnRXwth/mqY851ooikSg1apiGyrM?=
 =?us-ascii?Q?E2v7X9wRTI435O7pQhOUF6OYuDi996sw1hEvUZAnhJ0KJuyCUx84pw1I1k6e?=
 =?us-ascii?Q?WjLhWWICKc/9HV+WDjUmklKSjgoccxhwZLiAjdLEZ9ks+A840RVSrzo5g0kC?=
 =?us-ascii?Q?iYdZGuApi1VnkxwjBlVaNXmyE7ukFFQkBRixU6JhjWM2I4TFNdbABat8D+Zg?=
 =?us-ascii?Q?YIuCyyFifGk1R/V6amwy1AMjXym+49rjNhB+pXGCn4/lBBBV9Ezb11iW6ZdQ?=
 =?us-ascii?Q?vMFLYWnfZh3CL227olW1JoT5r4K0Ciedj8vLWsfGhSepKVP9CWcA2AYnint7?=
 =?us-ascii?Q?bdCpToQzw7ojt6286eZhe7w1zg58ue+1xv81NAK2gqy23StcgnHCSqfuD9wC?=
 =?us-ascii?Q?K87FuacLepHWprdkpygc+b/JKqRUMwJNkMLlsm++gzToR7L7PP+6Mia5HQf4?=
 =?us-ascii?Q?8UHbVzWMFybhYLUxADpBJue7kfatxMvZ5C5HnJ0r30HUEq6aR4C3T1T5oPGN?=
 =?us-ascii?Q?adZAjztLQ5XEsOFP6EJtA4OuOHiO4e8oee1KOVfjCjG8z6JUL2ar6ZDyaIPf?=
 =?us-ascii?Q?wWV/cZZZEBfWylIit32g5MyvEaPMcWdT5p+9yhpMWYWpUGqizVnz6HLqH0K/?=
 =?us-ascii?Q?1MMbmyc38x3MOgdcw+OJIHJZztr8wAVKb+w68XDKcOvkCZ7Sd1XbEBQh2nyb?=
 =?us-ascii?Q?7aIZZ+OZNHcKegQI9FTDcaruOQGcKeQw0yQ4ujY1M3Xx3XKueW4fEvazku1T?=
 =?us-ascii?Q?4RgQ+sSmwZPen1OjBa3uoWbbAmW+vRYyJUOEqi/xV3dmGuFD6EVjDyb6b+wC?=
 =?us-ascii?Q?IIrqz7flWa6iQA4ALxrGteQhZv903FW5oihPAAF1z8RqFS+auE9s/h3YT9j5?=
 =?us-ascii?Q?31rg2u3yM4yC1bbv16kP/0fJFnG/jXjakthi7p2VXdpoU5Q4WffJbkFeNWZ5?=
 =?us-ascii?Q?kN6Qdacy0nLENc+aSgYKSsExmRjFItABBZVD1q3U9PSpqR04p1NEUtiN9Gm7?=
 =?us-ascii?Q?h0t+pnYXoGXE7AXVQgHx9K3z/9EZrz1hMysc3rTU9arfRu24nAqECe+QQHlj?=
 =?us-ascii?Q?swaRfg/OBGNg1M6tBMT3fuqGVyDuWnIKMxudn63Geog/2/SoAFYr/lX5hhdt?=
 =?us-ascii?Q?HTPpUjTmvAZiomEoTD3aezQHibQsvWJAZ9ZlQ2+39q3z+c0GiriMX+5HAcgw?=
 =?us-ascii?Q?8SS+PXzGr4amhLWi9jQt1LUuwC1KDue3XVRaYsaeGdu9XIbP/ARp/ijGz3j8?=
 =?us-ascii?Q?mPAReqAumJAyA1DFXrUbgZtVszI/c/pSo44maRSF0TEnQF5BERnUTeDDOJl0?=
 =?us-ascii?Q?FJ5TF8I+mVHsNugPqPkJvkNaTP6AVz53vcKBqMyzSZ5zNunOKSny4ogNfZ/z?=
 =?us-ascii?Q?xEodWftj3Xg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5275.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GJlsVvS9xFzFcIMg+JlqOxJNr3Fks+Cq+jf6laf13DrAc9Mwg646HmhYnTEX?=
 =?us-ascii?Q?3obsEYgMqJ5D8LAS26lfl4ZncYCN2exsZ1/VfoartAa3CZ+05zZisnlar/uq?=
 =?us-ascii?Q?wNy4K6BKZodZjKdaCSGbAd0ed3747TrSmj0V2wFQBBhRnCwfjjXutMsJToJc?=
 =?us-ascii?Q?yxB0rS7x2LCW3/6h62jjDbU5XYUEnVnNS+pGqebOxJEwZ/EJFi65x5jSq7Lb?=
 =?us-ascii?Q?3RPCGrApr9Y6MLWhCzTHG6evT7ean1bEXCv5y1PoScurzQQdjC6TA7uMPEth?=
 =?us-ascii?Q?uvAKNb3M+YXe9wu3yr47bW3yLiyMB1lBUqwGavsLh/v4DIIjBTXjIfgbJ69M?=
 =?us-ascii?Q?jl9k8f8a8uM2T7R6T9FYnVVor+K2jEx3XUHfD/yzP5nf1QQGql3uElU0D1ow?=
 =?us-ascii?Q?m1NyeVGO3LxpJeSSKu0flk9Hl+uM6k4CG5wrGNCSsTPal3s2NC7uDCSn0htO?=
 =?us-ascii?Q?DF/RvTJtOWYzQSKvXSGwXE0c8R8AS/AVdhNJN01DZ1YdZbLkFXvLJ+y+PfOs?=
 =?us-ascii?Q?UmkC9zxQVgbXdcNElQFZ9dAx+3sYyeulzJfQvLKDy/kPYNd2V7vEcPHfQQq7?=
 =?us-ascii?Q?QMhzJdA/BtKzoHAyA6dyJeFE8Xs+C3Mhawtc2x95yjxnLkur1Z5gu2hqv7O6?=
 =?us-ascii?Q?7aThIBbAr0oi608rXTTAA061FTGdjDcpIl1KCVbJW7VG1ygswHxrTIrY6cpO?=
 =?us-ascii?Q?7LeIAZdu8fQSvHmdGgI33yGAOQtdTsOMNMt/MP/WM0lO08LzHBeggqdlwvyf?=
 =?us-ascii?Q?fvZEydGDmTYAWVxhC2sfE7O1EX8TrConNzm+9e1aM8E57vQQnSFaScAukkT3?=
 =?us-ascii?Q?+m7nIrjTX/Z6scI6gJJH9m7AhciAuHOo5Kb3sv19zIo2O94cNUBQLQa5gu8X?=
 =?us-ascii?Q?0VxBM1vB50NaeEJ/TyDByUyer8nYkxt5tWGn9qdrv+sPFSrL+/ESQBaUIDDa?=
 =?us-ascii?Q?jyhruEHzBiNGk67/xid4SioAOPbzoylTBjejEda4rt3a0QHPOBTTqrXJJY8g?=
 =?us-ascii?Q?2nXDPbCqZtTTUUfJtjFlQ4LTDPz3RKB+D8yNKWR/AIQ2P3qaNUzr+CRewkWS?=
 =?us-ascii?Q?4LxxhzILp23R/dT7P5Adez7R2uNZOB7GGUaEkjJMh8BQo4jjC0tFmEnA39N1?=
 =?us-ascii?Q?t8uyOgMtDqgOWNO6Iq4mLuMvscvZddKq5H9AKIano7kGM12cftw1EhwM9+0P?=
 =?us-ascii?Q?dSjFjupmdPKrcocw7hUJtBlzoAeMaigb+MNTuo0MxcSmp5BG8d9sfIWU/DTl?=
 =?us-ascii?Q?15gtGqxp1Vyo3Cx4XiQ7xRdYiBGLvbq42hfXdCP7sYl04mANqD3wxKR9+MMZ?=
 =?us-ascii?Q?YA8jpyJYVls0dK89Tp+jSJuda0oQnGDiZv01yeCQA4akKmA+ltPHt2W+Wdl3?=
 =?us-ascii?Q?Ix/QkpB+waowbWIT/u4j0uGAQ5+BzD6gQF7VuVZUE29f1hxvqeIhAnJB1j4c?=
 =?us-ascii?Q?14Z2mp7we0/3mCd7i7eFbNhlK8o/PmifCI7cHqOrZg6M+t86HaGCtNfrwpxw?=
 =?us-ascii?Q?8ae58ESsaxVRo9KHLpwq63qCwouSk9m7cqnLqxajt856nS8wMDJHu34xZNsp?=
 =?us-ascii?Q?U/azmdY2sxUQOrByoruQSXMlSEKrTgDy+X+yx6c2?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed6d7ca2-8111-4299-25d4-08dcc28511ec
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5275.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 08:33:16.8225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4K0jxKpij4A6krqVd/iOfTWb+VbyBWlJbjCr+maAEb/V870ehxHkeygbakJKowJo6AuM32vJzqh4TeYob9OEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6114

Use devm_clk_get_enabled() and devm_clk_get_optional_enabled()
to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/net/ethernet/marvell/mvpp2/mvpp2.h    |  7 --
 .../net/ethernet/marvell/mvpp2/mvpp2_main.c   | 86 +++++--------------
 2 files changed, 22 insertions(+), 71 deletions(-)

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
index 2fe8bae4eb3c..0075499de29f 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
@@ -7462,6 +7462,7 @@ static int mvpp2_get_sram(struct platform_device *pdev,
 
 static int mvpp2_probe(struct platform_device *pdev)
 {
+	struct clk *pp_clk, *gop_clk, *mg_clk, *mg_core_clk, *axi_clk;
 	struct mvpp2 *priv;
 	struct resource *res;
 	void __iomem *base;
@@ -7561,56 +7562,30 @@ static int mvpp2_probe(struct platform_device *pdev)
 		priv->max_port_rxqs = 32;
 
 	if (dev_of_node(&pdev->dev)) {
-		priv->pp_clk = devm_clk_get(&pdev->dev, "pp_clk");
-		if (IS_ERR(priv->pp_clk))
-			return PTR_ERR(priv->pp_clk);
-		err = clk_prepare_enable(priv->pp_clk);
-		if (err < 0)
-			return err;
+		pp_clk = devm_clk_get_enabled(&pdev->dev, "pp_clk");
+		if (IS_ERR(pp_clk))
+			return PTR_ERR(pp_clk);
 
-		priv->gop_clk = devm_clk_get(&pdev->dev, "gop_clk");
-		if (IS_ERR(priv->gop_clk)) {
-			err = PTR_ERR(priv->gop_clk);
-			goto err_pp_clk;
-		}
-		err = clk_prepare_enable(priv->gop_clk);
-		if (err < 0)
-			goto err_pp_clk;
+		gop_clk = devm_clk_get_enabled(&pdev->dev, "gop_clk");
+		if (IS_ERR(gop_clk))
+			return PTR_ERR(gop_clk);
 
 		if (priv->hw_version >= MVPP22) {
-			priv->mg_clk = devm_clk_get(&pdev->dev, "mg_clk");
-			if (IS_ERR(priv->mg_clk)) {
-				err = PTR_ERR(priv->mg_clk);
-				goto err_gop_clk;
-			}
-
-			err = clk_prepare_enable(priv->mg_clk);
-			if (err < 0)
-				goto err_gop_clk;
-
-			priv->mg_core_clk = devm_clk_get_optional(&pdev->dev, "mg_core_clk");
-			if (IS_ERR(priv->mg_core_clk)) {
-				err = PTR_ERR(priv->mg_core_clk);
-				goto err_mg_clk;
-			}
+			mg_clk = devm_clk_get_enabled(&pdev->dev, "mg_clk");
+			if (IS_ERR(mg_clk))
+				return PTR_ERR(mg_clk);
 
-			err = clk_prepare_enable(priv->mg_core_clk);
-			if (err < 0)
-				goto err_mg_clk;
+			mg_core_clk = devm_clk_get_optional_enabled(&pdev->dev, "mg_core_clk");
+			if (IS_ERR(mg_core_clk))
+				return PTR_ERR(mg_core_clk);
 		}
 
-		priv->axi_clk = devm_clk_get_optional(&pdev->dev, "axi_clk");
-		if (IS_ERR(priv->axi_clk)) {
-			err = PTR_ERR(priv->axi_clk);
-			goto err_mg_core_clk;
-		}
-
-		err = clk_prepare_enable(priv->axi_clk);
-		if (err < 0)
-			goto err_mg_core_clk;
+		axi_clk = devm_clk_get_optional_enabled(&pdev->dev, "axi_clk");
+		if (IS_ERR(axi_clk))
+			return PTR_ERR(axi_clk);
 
 		/* Get system's tclk rate */
-		priv->tclk = clk_get_rate(priv->pp_clk);
+		priv->tclk = clk_get_rate(pp_clk);
 	} else {
 		err = device_property_read_u32(&pdev->dev, "clock-frequency", &priv->tclk);
 		if (err) {
@@ -7622,7 +7597,7 @@ static int mvpp2_probe(struct platform_device *pdev)
 	if (priv->hw_version >= MVPP22) {
 		err = dma_set_mask(&pdev->dev, MVPP2_DESC_DMA_MASK);
 		if (err)
-			goto err_axi_clk;
+			return err;
 		/* Sadly, the BM pools all share the same register to
 		 * store the high 32 bits of their address. So they
 		 * must all have the same high 32 bits, which forces
@@ -7630,7 +7605,7 @@ static int mvpp2_probe(struct platform_device *pdev)
 		 */
 		err = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
 		if (err)
-			goto err_axi_clk;
+			return err;
 	}
 
 	/* Map DTS-active ports. Should be done before FIFO mvpp2_init */
@@ -7649,12 +7624,12 @@ static int mvpp2_probe(struct platform_device *pdev)
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
@@ -7665,8 +7640,7 @@ static int mvpp2_probe(struct platform_device *pdev)
 
 	if (priv->port_count == 0) {
 		dev_err(&pdev->dev, "no ports enabled\n");
-		err = -ENODEV;
-		goto err_axi_clk;
+		return -ENODEV;
 	}
 
 	/* Statistics must be gathered regularly because some of them (like
@@ -7698,16 +7672,6 @@ static int mvpp2_probe(struct platform_device *pdev)
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
 
@@ -7745,12 +7709,6 @@ static void mvpp2_remove(struct platform_device *pdev)
 
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


