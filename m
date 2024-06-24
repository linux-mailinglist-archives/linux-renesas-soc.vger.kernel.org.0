Return-Path: <linux-renesas-soc+bounces-6689-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F9E914E5C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 15:25:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E9F81F2301A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 13:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37190136E3B;
	Mon, 24 Jun 2024 13:25:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8FD13D62B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jun 2024 13:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719235543; cv=none; b=jyrCBBVxabrBbKRbITmU05qD3FX4lsM2mnpx34lGhciZXiBrCEGo/vVt2EVcNlLdnPn7nzoC59Z3Gi0ut7vNf98TZdfhWjDSN9mZy++d+QlXMergGeFCg0CpLc9xOWzwfF7yZvmsCXSQtphefcr3/H+drEAZewkBwNZLmEGzT0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719235543; c=relaxed/simple;
	bh=A6DLatiCi/InAVisv0EQ+ZUL0qiw5alzKOdy6kn2SdE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K75zXvaufXVBhJLtqfXOI0GzcnqW6/n76WKUOgyGerhdVCXjoGIIDTTtndN/wCrwlwNW1s+2P1FxQlt3JJ6x36ZyltCfyD5f+2xNhsVxIFkuFwY3srplfqQsiwPq0ofU30Fgoj18CrqfNI66BnaD2px3fWMOjbfB3AdCxNJ8yow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:d11f:2bfd:8d32:701a])
	by xavier.telenet-ops.be with bizsmtp
	id fRRT2C00R4jBKfC01RRTZQ; Mon, 24 Jun 2024 15:25:32 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sLjhF-000HSW-7C;
	Mon, 24 Jun 2024 15:25:27 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sLjhH-007u9D-Nl;
	Mon, 24 Jun 2024 15:25:27 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH net-next v2 2/2] ravb: Add MII support for R-Car V4M
Date: Mon, 24 Jun 2024 15:25:25 +0200
Message-Id: <3a21d1d6680864aa85afff9260234c2b8054020a.1719234830.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719234830.git.geert+renesas@glider.be>
References: <cover.1719234830.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All EtherAVB instances on R-Car Gen3/Gen4 SoCs support the RGMII
interface.  In addition, the first two EtherAVB instances on R-Car V4M
also support the MII interface, but this is not yet supported by the
driver.

Add support for MII on R-Car Gen4 by adding an R-Car Gen4-specific EMAC
initialization function that selects the MII clock instead of the RGMII
clock when the PHY interface is MII.  Note that all implementations of
EtherAVB on R-Car Gen4 SoCs have the APSR register, but only MII-capable
instances are documented to have the MIISELECT bit, which has a
documented value of zero when reserved.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
v2:
  - Add Reviewed-by,
  - Rename ravb_emac_init_rcar_apsr() to ravb_emac_init_rcar_gen4(),
  - Restrict MII support to R-Car Gen4 by adding a new ravb_hw_info
    instance.
---
 drivers/net/ethernet/renesas/ravb.h      |  1 +
 drivers/net/ethernet/renesas/ravb_main.c | 37 +++++++++++++++++++++++-
 2 files changed, 37 insertions(+), 1 deletion(-)

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
index 974e0bb9da1947f2..6605e4f4af538106 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -579,6 +579,16 @@ static void ravb_emac_init_rcar(struct net_device *ndev)
 	ravb_write(ndev, ECSIPR_ICDIP | ECSIPR_MPDIP | ECSIPR_LCHNGIP, ECSIPR);
 }
 
+static void ravb_emac_init_rcar_gen4(struct net_device *ndev)
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
@@ -2699,6 +2709,31 @@ static const struct ravb_hw_info ravb_gen3_hw_info = {
 	.magic_pkt = 1,
 };
 
+static const struct ravb_hw_info ravb_gen4_hw_info = {
+	.receive = ravb_rx_rcar,
+	.set_rate = ravb_set_rate_rcar,
+	.set_feature = ravb_set_features_rcar,
+	.dmac_init = ravb_dmac_init_rcar,
+	.emac_init = ravb_emac_init_rcar_gen4,
+	.gstrings_stats = ravb_gstrings_stats,
+	.gstrings_size = sizeof(ravb_gstrings_stats),
+	.net_hw_features = NETIF_F_RXCSUM,
+	.net_features = NETIF_F_RXCSUM,
+	.stats_len = ARRAY_SIZE(ravb_gstrings_stats),
+	.tccr_mask = TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
+	.rx_max_frame_size = SZ_2K,
+	.rx_buffer_size = SZ_2K +
+			  SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
+	.rx_desc_size = sizeof(struct ravb_ex_rx_desc),
+	.internal_delay = 1,
+	.tx_counters = 1,
+	.multi_irqs = 1,
+	.irq_en_dis = 1,
+	.ccc_gac = 1,
+	.nc_queues = 1,
+	.magic_pkt = 1,
+};
+
 static const struct ravb_hw_info ravb_rzv2m_hw_info = {
 	.receive = ravb_rx_rcar,
 	.set_rate = ravb_set_rate_rcar,
@@ -2751,7 +2786,7 @@ static const struct of_device_id ravb_match_table[] = {
 	{ .compatible = "renesas,etheravb-rcar-gen2", .data = &ravb_gen2_hw_info },
 	{ .compatible = "renesas,etheravb-r8a7795", .data = &ravb_gen3_hw_info },
 	{ .compatible = "renesas,etheravb-rcar-gen3", .data = &ravb_gen3_hw_info },
-	{ .compatible = "renesas,etheravb-rcar-gen4", .data = &ravb_gen3_hw_info },
+	{ .compatible = "renesas,etheravb-rcar-gen4", .data = &ravb_gen4_hw_info },
 	{ .compatible = "renesas,etheravb-rzv2m", .data = &ravb_rzv2m_hw_info },
 	{ .compatible = "renesas,rzg2l-gbeth", .data = &gbeth_hw_info },
 	{ }
-- 
2.34.1


