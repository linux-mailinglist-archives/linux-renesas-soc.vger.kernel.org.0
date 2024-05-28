Return-Path: <linux-renesas-soc+bounces-5551-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8910E8D1FA8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2024 17:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 434B828345A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2024 15:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C67178375;
	Tue, 28 May 2024 15:04:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99EF01DFEB;
	Tue, 28 May 2024 15:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716908657; cv=none; b=J9vf7npGuwIaOFdufu288+v496PyBNZ+afvzjriDpabybsSBwXwYXIl8cOrFAXzbqgFnS9aP7mos/cWQctCRKs5h2lEdX40BjYZSV5NUy9WHorqioSyAIPaJBN8yp9iRNcrZdbA2xzr/QXntLGi45bBOtDTiZHY/vlDKUBJiqNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716908657; c=relaxed/simple;
	bh=xQ12ylFC5WkFHpA9uHUWTrEbaIL6DTbR2GcoZ/c3Vqo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ps/ECJlYQ+2kd1w+EWx8Pv1odJGugWh+9djXysclois4AFngTq09M5DhvqKfyomJFEG4RZuDCQTlWRaZ38fuFBU3Wg1YiEdAGQBKStMPHOwFK3PtinPM9cK29NLrbsuFLFL9+07a2I9kROWgHtMHc/32L6RbL2U/P2aqtJX+pHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,195,1712588400"; 
   d="scan'208";a="209903753"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 29 May 2024 00:04:14 +0900
Received: from renesas-deb12.cephei.uk (unknown [10.226.93.69])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 54357400CF19;
	Wed, 29 May 2024 00:04:10 +0900 (JST)
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next PATCH v4 5/7] net: ravb: Enable SW IRQ Coalescing for GbEth
Date: Tue, 28 May 2024 16:03:37 +0100
Message-Id: <20240528150339.6791-6-paul.barker.ct@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240528150339.6791-1-paul.barker.ct@bp.renesas.com>
References: <20240528150339.6791-1-paul.barker.ct@bp.renesas.com>
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
Changes v3-v4:
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
index c9c5cc641589..e95e0b6e1fe6 100644
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


