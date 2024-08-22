Return-Path: <linux-renesas-soc+bounces-7998-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E5B95B091
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 10:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EF77284E01
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 08:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EBDC1822F8;
	Thu, 22 Aug 2024 08:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="Cd/RWGS8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2059.outbound.protection.outlook.com [40.107.255.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA95181B87;
	Thu, 22 Aug 2024 08:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724315592; cv=fail; b=toTKOdVqffnbOLDnCzQr+nJKhL6DS766UvUkbtNPaJS73gUIXAcW5vaCEy5PxBArd4HULNheGkgUu6WZdgJGRw9l5JIeFZFYY0ALDcqu8TfFDpIgC4a2wqHtZoylW34ZOYNWY4CrWPiAF57HpTyF04XsL8ogJ4s3xLwsdZmVgzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724315592; c=relaxed/simple;
	bh=8uiaS0FJhM1300wHqyaKvmI/6JCTX9NfFWu2KnGs9ew=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qUEU3X3/32htxWXqaBT2HsZYW7hwP05s8KhzEgBHvDff18DixzBDkRfSeEZXf+eHlOngF3gHP85vT7w2dlMOB+weS8Rf9hS/xiluSj8lbQx7aiOIcwRJH43qk3pobxxSp0majEdNanC0/xOsW8/oFjRNxqec8BUnBfEGsC/riI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Cd/RWGS8; arc=fail smtp.client-ip=40.107.255.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wpXH6mWv62WLbT/npQrFKUTVq5YRwlailJ+AzzSXLa/GnQAayYxrnm2HToQYV5fx3o8PwJNjXN43dT5VhzB8yZQntUV5H8EonVJ3q4tqcqibcCDPbpAutIuUt9lEqT/5VxnLUW/BG+AQW+MxQxIA4zxkNrWBAt4tmrWy+smdFScnIhaxjZfB67m6EU+BRcrbe+ZfNIacHUN39uIegD8rR18p4LzMz8Amt99WEhkVGPLpyDaqyzf/eDaAobPmC9Hns+HXoY17N7uIJOSSonIOGjFwQizNGrAA6gxXlxBfAFlF0QR7KsY1mAkgubXNtGbkKhocRdfqoF8xy6vXxg73aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2Se7WawwWaVcdt622wJpcgPKdfA2FV+ztQxBflOfc0=;
 b=ZeCjy4C1B1HA2Im/+qO6eDK6IQLMrrHdYLRnyNshFKEPduhiNfmDh8X1w9vljWvnGnT0spNNRsGVtpIuCRPboDO+IyoOvMGeWNl2xMvewlRyeE9JExInEyrW8kOi7UyYoovCFcUdYN5PQ4TQgd3mI8BlAQ7oSavUkP8HaYb/y1bS3snCSypvFLAG/RmbjErMl2aiuwcacfqi8AxiPj++xDhnnHAACb+aJQxe6tQ19xgyNSA9e1E9fSZYgjdKYoAQm7Xbmp8gAeFKAdi1EimcG3zoN71mPcrG9YGKC3k0SPqMwNjCXK93ZT7i1PDJ+0E+xMTYY9zlQaJuwhUSeNY/vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2Se7WawwWaVcdt622wJpcgPKdfA2FV+ztQxBflOfc0=;
 b=Cd/RWGS8cY0XxNP2/duxFR3H2F23ilafDCilM7ofrkCSbTk5XKwNYz8PqDn5P2sHVyrzsLa1Iu/PeSWiTSFkfCwsnHw+6OzbdbADb1Qcm2qcxGLbDeSqhlm7KckCBfRI8O8jDXmMGhW+BWZdjE7COtDyXP5oZ0TfUxqW8j3m1gJSmEZvvubNZqwNbkTpQCjkJBPNll7kkDJqD0YYe8cok6Hr+2VhBfbRTJIzfDe46orj5ccL14IgWeWvPmy4XEa80AO4sA12Lw+JvZwa/Us12CCoQOUMRoEAcy7ZXg3DOfITZL2SIqEF1ujAvHDou7C6R/kk1Oz4SJ7mxtvsoUKwYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
 by TYZPR06MB6114.apcprd06.prod.outlook.com (2603:1096:400:33f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 08:33:07 +0000
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::6257:d19:a671:f4f1]) by TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::6257:d19:a671:f4f1%3]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 08:33:07 +0000
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
Subject: [net-next 6/9] net: ethernet: broadcom: bcm63xx_enet: Convert to devm_clk_get_enabled()
Date: Thu, 22 Aug 2024 02:47:30 -0600
Message-Id: <20240822084733.1599295-7-frank.li@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: eaf995f6-4c7a-444b-1ff4-08dcc2850c0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ALqOZekPdtBqEgxTAdwfqtahYp635IieR0+tU0h0oQPXmfOvfzDY9OQjVA1h?=
 =?us-ascii?Q?zm3iNWoFWPdRDuTX14U+IuiK50P6gKFtgwWt+8z54lmM6u6xwCIU+ONoEgnj?=
 =?us-ascii?Q?KySC7v/vdyC1FVnZFu6kOdbR1sFLVhe9E4oUI/pv7eU8QtSMNgD/lVIKLDO+?=
 =?us-ascii?Q?sNHURtA1whcf8vAzrZ4+nm0gjXv2d50c2l60nZ2bFnSLCTdlLlV9rDk5rawl?=
 =?us-ascii?Q?5MeJZt/POD4iIaKDoXWJ+rg5MuU/4RQWGyaiqsdlOeUdKhBTaO2dGfTxoJPx?=
 =?us-ascii?Q?c4+wMhuJ3O+k6QR6uy47+nLjIIPVkEJjezefGScTT6R8YrpyB6+r6vnoQJOb?=
 =?us-ascii?Q?EfT3bi13t6378Bh9vCPS3IJfiffC15BLXOGVg18PTQqdElZsfU5POfWaOy8N?=
 =?us-ascii?Q?PsgVKEDmgcO85+HIKehIJ8OV5fQTRiiQhQtHw2Ec/rg0cMNpwnMDsZJC9dy0?=
 =?us-ascii?Q?dB3TdZxIKUzLoYjfh6uzEKHOe2UpLqvmymdqS6SlT7/Z+Ws2D5DdsburIvxP?=
 =?us-ascii?Q?1hzFiLh1E365yt9BOGlqOPQSlu46Ph8NOKI+5EZfp2k5C7Wg12IAfKmLDxQr?=
 =?us-ascii?Q?lA42NH1b8DcZ4Oubgjpk45iYPHl1wPPaEQgfq29bfctdmpNBkq6hrZkp6Q1e?=
 =?us-ascii?Q?zOaRAKmrO4ChyPv5VjdsqK//bzKWGWhHfVdLl+aOY/fiIR8uTiDI+5Qdi6t2?=
 =?us-ascii?Q?fHZk1KUJTievS/Kidz4rrsrUeMiToVxaEGSFXatefTi3iZFlxjLScKJICFoa?=
 =?us-ascii?Q?pe1n72RCqKWnndeKUDWp7qEgkd8k9qBweOmBPPvLAf0xyVkMmQse/i5azj/W?=
 =?us-ascii?Q?kGW1oX9f0N7K0Q7L1hrrE3IsUAAolsQ2u/6Odvn94N/Q28tX5h+IUAV9xRte?=
 =?us-ascii?Q?sZMgtMoJpzwm00lGFABAfVTzHrRr1BRgc3/SG67Hvv109XZ48+0DYv4WPtjk?=
 =?us-ascii?Q?NqNIn2FwRKjCliMhnzFDy90Wngchs+E6nsoOvfZ/amKbyugRni5Qi8hDHsyr?=
 =?us-ascii?Q?iHYdS0eotpvYOY0jrsfSEOxrKPE/fSMAIzYZwLEwPODLW5UBbByNm9ORTwE0?=
 =?us-ascii?Q?xQXbvnULSZL4dLp1ZOLoKF3TpG/pPBlMrv7D8rnyx84lY/acLxl8DbKbE47r?=
 =?us-ascii?Q?I8i5M+HdWUSD5uqfuz6p1hotoOoUWNEZ3CEjPMzIWhN/SbH875ygdIsa/Jyo?=
 =?us-ascii?Q?fP8WkcwfwWs6htZFig0VFKooGi2DMzzsBogd1TEPbbgrgSUvJU7l09QCKUh2?=
 =?us-ascii?Q?Et5qVDQywWZ61MXp0IPz4PfAy99xTJPg2In9UN1PJzFwREiR5wllVlGL+5Rn?=
 =?us-ascii?Q?nWRuy7RS4U019ZUjgrB0QUC6cGOXtZE8rFCeqZGnjuC/AzeGZ15ZHZl7C0ag?=
 =?us-ascii?Q?ddZmxmDYTHefsStHfII14j6iVBIlD02kAMzPeAEja6cJk0X3uYbJ8MOlycbX?=
 =?us-ascii?Q?Lzc8jjAKANA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5275.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WpAABnvwkGtn2QTO957FE0J9B2h67hDQLWi5V5ob+ee9g0lbuHeLayELZpEr?=
 =?us-ascii?Q?KVDb8LlCMSnmbRFupVJakkBSNHbKw2vt+V8i1zKQuOw4mVqqZZRwASu2mRzI?=
 =?us-ascii?Q?YYPaOhp0fsXdadNyCPG5RYRzWVI2aAVlOpW5RXm9FUgjqHkKoZRc/wcIjd3L?=
 =?us-ascii?Q?DoxBS6Ktw02jcwIOO2uH2qFfteGCD4fEgzoqOwH+Rx0hradd554u0TcRnRKe?=
 =?us-ascii?Q?tVWAh4VoNsDiAkBxRU1LlN0SNLdXxmhr59QaVH7x6nd99Q25iqlJ2sFtoLop?=
 =?us-ascii?Q?pciEEPePd9mxkhYXBrT9b5kmI7dfcaWAve5wE6NzqCFJYPwwEBGGlXiBRQdW?=
 =?us-ascii?Q?NbJLjjvp03ot5ArL349++yWm3oyCsaBs8g7QObJdDBzGWjmysQZLVC9fEQVW?=
 =?us-ascii?Q?GSlTfzp61Ef9zYShKOG0M7q7PLS3PF+uvZXeVg6zmVpYJUZhAItGGM7u1i+m?=
 =?us-ascii?Q?EZWap57RVADPTVBlR4d1Q1jZmjgULrtl1+da/xLC4IerZrhA/+IEnfo7cdSp?=
 =?us-ascii?Q?dyn0hL1QgYRe1fEet97zHa4G9qnaIsnG5h9EMMIVPGZBLxjXNjpEap+8AVT1?=
 =?us-ascii?Q?rlWIMic9Pv1LRm/nmi+MsURsiQswWmbqhHby8PfmKL3wYszHj8F//IU3ir44?=
 =?us-ascii?Q?L2ykAMmi+bNDwpayIbDLChuEkSfuEuIeUTBTItqz4sfADOPD1pel4G579y9N?=
 =?us-ascii?Q?22ht0fOg32+DmHqeSydTUUHnMs6neNyhm9b4wpO4M+mnqzgZyz0XtvzLSm+0?=
 =?us-ascii?Q?HxRd3W7JCZyA1CtCVM2RQiQ16mwkRC4TnyuPTcDpW6JmpZXSyweNpBg6pSF7?=
 =?us-ascii?Q?/yLy8nwNUxOZTPyGdyaOrCIt6j6fuZh6gm5ZwvWuIaG9fl9QuyIgDb+PuwSk?=
 =?us-ascii?Q?pwh0PXH6daeKIE/14jf2DGGmMUYwNAlMZvJZjDrc6uaGdOk02/4E8PjuEAv+?=
 =?us-ascii?Q?UuVRHFQhSJNOyy6+Oti5W5gkjJkXVnVibvQ1B7Sqb5HWVkB0e9NELhYmAtry?=
 =?us-ascii?Q?uGoV7NsBC4rlPEFBdTBTu+exNn+UdJ4keFX5gtviDPfmMs8AAW2kESaky5BS?=
 =?us-ascii?Q?TYk6IRkJpoUa0reoCOPt6eKkli6+8et8ANtrNJ1pbbG9JRd6DAB33f0bnk4B?=
 =?us-ascii?Q?mwxRLsI6wA15oA9gx4D+VNYTlsJCPXr4vPQOCJkB49V8eCsKSTQm8CRfzBSm?=
 =?us-ascii?Q?vB/3cP6FNOCeq71ZMGdORPQqYP1wekWN1xyMWVh2K3IjsapacjVkB+JFHj+Z?=
 =?us-ascii?Q?L/IxSN+OKJmS9eLQRrVnsodt2jEFay0/+CplQFS0BA7RW8uDB/8B9RYS70qP?=
 =?us-ascii?Q?xE6A4zETXchOXLUzNuKHWxRrSo4lEC2wZcm4Mq7Lo5IiqH5fJUqNoK0e8KLf?=
 =?us-ascii?Q?Zu5YQ1r3vPuuLqwbZVxNMS7s0eMqSLRepZkrBGfNsniNfVrIXaBzECneqVva?=
 =?us-ascii?Q?umSPbsBi9aCcwv+VKbdVwKzG/0B14pJmgk79cnSleSCe3U9mzp/IuHfd7Y4k?=
 =?us-ascii?Q?1ZGW0oUOPA2Ti5zcN6Nr9GjSGqW+LppDgE970ZWjleUZh9T5ZovtCfZPQDn8?=
 =?us-ascii?Q?O7bkvOND3oZPKCWdeXzua4PSLoJyeA32QJYhlST4?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf995f6-4c7a-444b-1ff4-08dcc2850c0d
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5275.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 08:33:07.0008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6JIF22XhVbfk+tw18CkDmwsDnSUKzijVtux+vNSExnWx1opnGCK+V5dUe8FDWbj5kGUSZ9TXMgu7KFqWftgvQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6114

Convert devm_clk_get(), clk_prepare_enable() to a single
call to devm_clk_get_enabled(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/net/ethernet/broadcom/bcm63xx_enet.c | 47 ++++++--------------
 drivers/net/ethernet/broadcom/bcm63xx_enet.h |  6 ---
 2 files changed, 13 insertions(+), 40 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.c b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
index 3c0e3b9828be..6e288cee2c35 100644
--- a/drivers/net/ethernet/broadcom/bcm63xx_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
@@ -1718,6 +1718,7 @@ static int bcm_enet_probe(struct platform_device *pdev)
 	struct bcm63xx_enet_platform_data *pd;
 	int irq, irq_rx, irq_tx;
 	struct mii_bus *bus;
+	struct clk *phy_clk, *mac_clk;
 	int i, ret;
 
 	if (!bcm_enet_shared_base[0])
@@ -1752,14 +1753,11 @@ static int bcm_enet_probe(struct platform_device *pdev)
 	priv->irq_rx = irq_rx;
 	priv->irq_tx = irq_tx;
 
-	priv->mac_clk = devm_clk_get(&pdev->dev, "enet");
-	if (IS_ERR(priv->mac_clk)) {
-		ret = PTR_ERR(priv->mac_clk);
+	mac_clk = devm_clk_get_enabled(&pdev->dev, "enet");
+	if (IS_ERR(mac_clk)) {
+		ret = PTR_ERR(mac_clk);
 		goto out;
 	}
-	ret = clk_prepare_enable(priv->mac_clk);
-	if (ret)
-		goto out;
 
 	/* initialize default and fetch platform data */
 	priv->rx_ring_size = BCMENET_DEF_RX_DESC;
@@ -1789,15 +1787,11 @@ static int bcm_enet_probe(struct platform_device *pdev)
 
 	if (priv->has_phy && !priv->use_external_mii) {
 		/* using internal PHY, enable clock */
-		priv->phy_clk = devm_clk_get(&pdev->dev, "ephy");
-		if (IS_ERR(priv->phy_clk)) {
-			ret = PTR_ERR(priv->phy_clk);
-			priv->phy_clk = NULL;
-			goto out_disable_clk_mac;
+		phy_clk = devm_clk_get_enabled(&pdev->dev, "ephy");
+		if (IS_ERR(phy_clk)) {
+			ret = PTR_ERR(phy_clk);
+			goto out;
 		}
-		ret = clk_prepare_enable(priv->phy_clk);
-		if (ret)
-			goto out_disable_clk_mac;
 	}
 
 	/* do minimal hardware init to be able to probe mii bus */
@@ -1889,10 +1883,7 @@ static int bcm_enet_probe(struct platform_device *pdev)
 out_uninit_hw:
 	/* turn off mdc clock */
 	enet_writel(priv, 0, ENET_MIISC_REG);
-	clk_disable_unprepare(priv->phy_clk);
 
-out_disable_clk_mac:
-	clk_disable_unprepare(priv->mac_clk);
 out:
 	free_netdev(dev);
 	return ret;
@@ -1927,10 +1918,6 @@ static void bcm_enet_remove(struct platform_device *pdev)
 				       bcm_enet_mdio_write_mii);
 	}
 
-	/* disable hw block clocks */
-	clk_disable_unprepare(priv->phy_clk);
-	clk_disable_unprepare(priv->mac_clk);
-
 	free_netdev(dev);
 }
 
@@ -2648,6 +2635,7 @@ static int bcm_enetsw_probe(struct platform_device *pdev)
 	struct bcm63xx_enetsw_platform_data *pd;
 	struct resource *res_mem;
 	int ret, irq_rx, irq_tx;
+	struct clk *mac_clk;
 
 	if (!bcm_enet_shared_base[0])
 		return -EPROBE_DEFER;
@@ -2694,14 +2682,11 @@ static int bcm_enetsw_probe(struct platform_device *pdev)
 		goto out;
 	}
 
-	priv->mac_clk = devm_clk_get(&pdev->dev, "enetsw");
-	if (IS_ERR(priv->mac_clk)) {
-		ret = PTR_ERR(priv->mac_clk);
+	mac_clk = devm_clk_get_enabled(&pdev->dev, "enetsw");
+	if (IS_ERR(mac_clk)) {
+		ret = PTR_ERR(mac_clk);
 		goto out;
 	}
-	ret = clk_prepare_enable(priv->mac_clk);
-	if (ret)
-		goto out;
 
 	priv->rx_chan = 0;
 	priv->tx_chan = 1;
@@ -2720,7 +2705,7 @@ static int bcm_enetsw_probe(struct platform_device *pdev)
 
 	ret = register_netdev(dev);
 	if (ret)
-		goto out_disable_clk;
+		goto out;
 
 	netif_carrier_off(dev);
 	platform_set_drvdata(pdev, dev);
@@ -2729,8 +2714,6 @@ static int bcm_enetsw_probe(struct platform_device *pdev)
 
 	return 0;
 
-out_disable_clk:
-	clk_disable_unprepare(priv->mac_clk);
 out:
 	free_netdev(dev);
 	return ret;
@@ -2740,16 +2723,12 @@ static int bcm_enetsw_probe(struct platform_device *pdev)
 /* exit func, stops hardware and unregisters netdevice */
 static void bcm_enetsw_remove(struct platform_device *pdev)
 {
-	struct bcm_enet_priv *priv;
 	struct net_device *dev;
 
 	/* stop netdevice */
 	dev = platform_get_drvdata(pdev);
-	priv = netdev_priv(dev);
 	unregister_netdev(dev);
 
-	clk_disable_unprepare(priv->mac_clk);
-
 	free_netdev(dev);
 }
 
diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.h b/drivers/net/ethernet/broadcom/bcm63xx_enet.h
index 78f1830fb3cb..e98838b8b92f 100644
--- a/drivers/net/ethernet/broadcom/bcm63xx_enet.h
+++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.h
@@ -316,12 +316,6 @@ struct bcm_enet_priv {
 	/* lock mib update between userspace request and workqueue */
 	struct mutex mib_update_lock;
 
-	/* mac clock */
-	struct clk *mac_clk;
-
-	/* phy clock if internal phy is used */
-	struct clk *phy_clk;
-
 	/* network device reference */
 	struct net_device *net_dev;
 
-- 
2.39.0


