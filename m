Return-Path: <linux-renesas-soc+bounces-5808-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4729F8FABFD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 09:30:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB5951F21A4E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 07:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3DFE1411E0;
	Tue,  4 Jun 2024 07:29:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1D5130A68;
	Tue,  4 Jun 2024 07:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717486149; cv=none; b=TRq1G4crEPjpBSNHq6VSRRyFJrU1ucH3sE4H9WTGoe3xfFpwiyEeU9tayMyZ/xcVHq8mPK8f9A6QjBOgK0UiS5U++nAAMLpeAV7GHEpGKW0elFFTnMJAA10NXu7WesKiiHyCmj/9yaTTn/4RE1U+XDehTyXPwTIAuf4r/PhZRGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717486149; c=relaxed/simple;
	bh=3gEZCTL28/ZgT3H/CqmcdTDxG82gz3LtvnvdDELxE4w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jzsj9tDACEuKSCUcH0o5ycCloOCKZqunrdMR7GDMk5vgbdvxBkuf10KZCmicHi5XSzaPp0e1WAwPNtLZzW0ry+/XrvpXBBNGPf0BtEZXkLcwm3/GINNpSbyQLLdsKBqlkEr99WKSvRejiqqa6d87E7y5PEJINASkiAwJCRrqg94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,213,1712588400"; 
   d="scan'208";a="206651367"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Jun 2024 16:29:06 +0900
Received: from renesas-deb12.mshome.net (unknown [10.226.92.239])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id BF8E741FCFB9;
	Tue,  4 Jun 2024 16:29:01 +0900 (JST)
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Simon Horman <horms@kernel.org>
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next PATCH v5 5/7] net: ravb: Enable SW IRQ Coalescing for GbEth
Date: Tue,  4 Jun 2024 08:28:23 +0100
Message-Id: <20240604072825.7490-6-paul.barker.ct@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240604072825.7490-1-paul.barker.ct@bp.renesas.com>
References: <20240604072825.7490-1-paul.barker.ct@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Software IRQ Coalescing is required to improve network stack performance
in the RZ/G2L SoC family and the RZ/G3S SoC, i.e. the SoCs which use the
GbEth IP.

This patch gives the following improvements during testing with iperf3:

  * RZ/G2L:
    * TCP RX: same bandwidth with -6% CPU load (76% -> 71%)
    * UDP RX: same bandwidth with -10% CPU load (99% -> 89%)

  * RZ/G2UL:
    * UDP RX: +4200% bandwidth (1.23Mbps -> 53Mbps)

  * RZ/G3S:
    * UDP RX: +425% bandwidth (1.23Mbps -> 6.46Mbps)

The improvement of UDP RX bandwidth for the single core SoCs (RZ/G2UL &
RZ/G3S) is particularly critical.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
No changes v4->v5

Changes v3->v4:
  * Renamed needs_irq_coalesce -> coalesce_irqs.
  * Added Sergey's Reviewed-by tag.

 drivers/net/ethernet/renesas/ravb.h      | 1 +
 drivers/net/ethernet/renesas/ravb_main.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index 71de2a7aa27c..6a7aa7dd17e6 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -1054,6 +1054,7 @@ struct ravb_hw_info {
 	u32 rx_max_desc_use;
 	u32 rx_desc_size;
 	unsigned aligned_tx: 1;
+	unsigned coalesce_irqs:1;	/* Needs software IRQ coalescing */
 
 	/* hardware features */
 	unsigned internal_delay:1;	/* AVB-DMAC has internal delays */
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index e8c3f48b213d..2c24cb0271af 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2667,6 +2667,7 @@ static const struct ravb_hw_info gbeth_hw_info = {
 	.rx_max_desc_use = 4080,
 	.rx_desc_size = sizeof(struct ravb_rx_desc),
 	.aligned_tx = 1,
+	.coalesce_irqs = 1,
 	.tx_counters = 1,
 	.carrier_counters = 1,
 	.half_duplex = 1,
@@ -2943,6 +2944,9 @@ static int ravb_probe(struct platform_device *pdev)
 	if (info->nc_queues)
 		netif_napi_add(ndev, &priv->napi[RAVB_NC], ravb_poll);
 
+	if (info->coalesce_irqs)
+		netdev_sw_irq_coalesce_default_on(ndev);
+
 	/* Network device register */
 	error = register_netdev(ndev);
 	if (error)
-- 
2.39.2


