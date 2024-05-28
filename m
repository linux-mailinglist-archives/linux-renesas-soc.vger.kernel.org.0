Return-Path: <linux-renesas-soc+bounces-5552-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B07438D1FAA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2024 17:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6898B284C10
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2024 15:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E3B2170833;
	Tue, 28 May 2024 15:04:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4949716E86B;
	Tue, 28 May 2024 15:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716908662; cv=none; b=AY3hcDunsxLvi7u3YpikIiwhcLGVd7Wa1BEyYLObQW0q+9S8aNgCziTWpFwQFB4Ud9iCB+S8cUjlQQbfw++g4VNGxnxl7F+IVIAjhJeUaQARcX7sV9r00/9XncydNFhqcVCzgNMvAQSVo8ENT1ZrGYMHvmHQ4v61g6oheNk2Rvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716908662; c=relaxed/simple;
	bh=JJ1kS+65yLC4QFiraFR+FaHio7QvvCTFL570K0Kz+4c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g0BKPR/8YlIPcut0kpSRM+c/7E/gyDa3MIgrBBZp5+Snb6bsKZr4l2lkLjEbks8bq2AC82545FBIQGNlgxfRM/Ea4H6NJjUG9UDy7aGQRHqLlGauuY3wnpBq5Yp0xujcTBPYCcthYX4o8wbAT1BDElvHeCTeeQsZK8O2NJYDkGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,195,1712588400"; 
   d="scan'208";a="209903757"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 29 May 2024 00:04:20 +0900
Received: from renesas-deb12.cephei.uk (unknown [10.226.93.69])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7F390400CF1E;
	Wed, 29 May 2024 00:04:15 +0900 (JST)
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
Subject: [net-next PATCH v4 6/7] net: ravb: Use NAPI threaded mode on 1-core CPUs with GbEth IP
Date: Tue, 28 May 2024 16:03:38 +0100
Message-Id: <20240528150339.6791-7-paul.barker.ct@bp.renesas.com>
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

NAPI Threaded mode (along with the previously enabled SW IRQ Coalescing)
is required to improve network stack performance for single core SoCs
using the GbEth IP (currently the RZ/G2L SoC family and the RZ/G3S SoC).

This patch gives the following improvements during testing with iperf3.

  * RZ/G2UL:
    * TCP TX: +32% bandwidth (638Mbps -> 841Mbps)
    * TXP RX: +8.8% bandwidth (667Mbps -> 726Mbps)
    * UDP RX: +104% bandwidth (53Mbps -> 108Mbps)

  * RZ/G3S:
    * TCP TX: 29% bandwidth (529Mbps -> 681Mbps)
    * UDP RX: +1290% bandwidth (6.46Mbps -> 90Mbps)

  * RZ/Five:
    * UDP RX: Test no longer crashes (0 -> 20 Mbps)

This patch gives the following reductions in performance in the same
testing:

  * RZ/G2UL:
    * UDP TX: -7.5% bandwidth (594Mbps -> 549Mbps)

  * RZ/G3S:
    * UDP TX: -5% bandwidth (625Mbps -> 594Mbps)

These losses are considered acceptable given the benefits shown above.
If UDP TX bandwidth must be maximised for a particular use case, NAPI
threaded mode can be disabled at runtime via sysfs writes.

The improvement of UDP RX bandwidth for the single core SoCs (RZ/G2UL &
RZ/G3S) is particularly critical.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
Changes v3->v4:
  * Added Sergey's Reviewed-by tag.

 drivers/net/ethernet/renesas/ravb_main.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index e95e0b6e1fe6..dd92f074881a 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2944,8 +2944,11 @@ static int ravb_probe(struct platform_device *pdev)
 	if (info->nc_queues)
 		netif_napi_add(ndev, &priv->napi[RAVB_NC], ravb_poll);
 
-	if (info->coalesce_irqs)
+	if (info->coalesce_irqs) {
 		netdev_sw_irq_coalesce_default_on(ndev);
+		if (num_present_cpus() == 1)
+			dev_set_threaded(ndev, true);
+	}
 
 	/* Network device register */
 	error = register_netdev(ndev);
-- 
2.39.2


