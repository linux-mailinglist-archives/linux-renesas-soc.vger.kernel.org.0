Return-Path: <linux-renesas-soc+bounces-6255-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54551908EA7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 17:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 786FE1C202F7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 15:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3484965C;
	Fri, 14 Jun 2024 15:25:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E4363B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 15:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718378729; cv=none; b=BX0SJDzJLZnU5gwxScLWhCRzZFlqWVokUtBgIyoJQCF8dVlI3xRf70whxH0ZYxzUEhs3x8s49GXca6mYNMLwxd4C7CH3VGdJkCy7sEmCeFHdbiX8HQQ7Jwml+o3LCmYCGMsayLM4mV+0kJEl0X8IGAe4lcYoxmpnmBb9J5grLCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718378729; c=relaxed/simple;
	bh=AVCQJfUDyjy6LexGazLTmdFVv0SdjpkVm6cls25Dan4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WVwNdCG2BgSa3MP9j8gjLcTYd63cft1FeQ4PRGErFdB3pecZcI0wNC1j2+H5Isp6D3lZtc9K8AueoaOS3fHBtaal2EL1COzxPOuLE+N+V3ZJKv64B32ymBoolhhcU4c0vfyyNMA4JaR9u7iHhoQ4yxigOUaZBTgkaOUfkv48Cd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:be2a:f066:50f0:dff7])
	by albert.telenet-ops.be with bizsmtp
	id bTRP2C00H3w30qz06TRPKh; Fri, 14 Jun 2024 17:25:24 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sI8mn-00CdhI-6r;
	Fri, 14 Jun 2024 17:25:23 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sI8nr-00FqCe-N9;
	Fri, 14 Jun 2024 17:25:23 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] net: ravb: Add MII support for R-Car V4M
Date: Fri, 14 Jun 2024 17:25:22 +0200
Message-Id: <f0ef3e00aec461beb33869ab69ccb44a23d78f51.1718378166.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All EtherAVB instances on R-Car Gen3/Gen4 SoCs support the RGMII
interface.  In addition, the first two EtherAVB instances on R-Car V4M
also support the MII interface, but this is not yet supported by the
driver.

Add support for MII to the R-Car Gen3/Gen4-specific EMAC initialization
function, by selecting the MII clock instead of the RGMII clock when the
PHY interface is MII.  Note that all implementations of EtherAVB on
R-Car Gen3/Gen4 SoCs have the APSR register, but only MII-capable
instances are documented to have the MIISELECT bit, which has a
documented value of zero when reserved.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only, as all AVB interfaces on the Gray Hawk Single
development board are connected to RGMII PHYs.
No regressions on R-Car E3, H3, M3-W, M3-N, and V4H.
---
 drivers/net/ethernet/renesas/ravb.h      |  1 +
 drivers/net/ethernet/renesas/ravb_main.c | 12 +++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index 6b2444d31fcc3093..9893c91af1050fa1 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -258,6 +258,7 @@ enum APSR_BIT {
 	APSR_CMSW	= 0x00000010,
 	APSR_RDM	= 0x00002000,
 	APSR_TDM	= 0x00004000,
+	APSR_MIISELECT	= 0x01000000,	/* R-Car V4M only */
 };
 
 /* RCR */
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index c1546b916e4ef581..cbe2709e0ace871f 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -579,6 +579,16 @@ static void ravb_emac_init_rcar(struct net_device *ndev)
 	ravb_write(ndev, ECSIPR_ICDIP | ECSIPR_MPDIP | ECSIPR_LCHNGIP, ECSIPR);
 }
 
+static void ravb_emac_init_rcar_apsr(struct net_device *ndev)
+{
+	struct ravb_private *priv = netdev_priv(ndev);
+	bool mii = priv->phy_interface == PHY_INTERFACE_MODE_MII;
+
+	ravb_modify(ndev, APSR, APSR_MIISELECT, mii ? APSR_MIISELECT : 0);
+
+	ravb_emac_init_rcar(ndev);
+}
+
 /* E-MAC init function */
 static void ravb_emac_init(struct net_device *ndev)
 {
@@ -2657,7 +2667,7 @@ static const struct ravb_hw_info ravb_gen3_hw_info = {
 	.set_rate = ravb_set_rate_rcar,
 	.set_feature = ravb_set_features_rcar,
 	.dmac_init = ravb_dmac_init_rcar,
-	.emac_init = ravb_emac_init_rcar,
+	.emac_init = ravb_emac_init_rcar_apsr,
 	.gstrings_stats = ravb_gstrings_stats,
 	.gstrings_size = sizeof(ravb_gstrings_stats),
 	.net_hw_features = NETIF_F_RXCSUM,
-- 
2.34.1


