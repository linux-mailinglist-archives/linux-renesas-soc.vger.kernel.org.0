Return-Path: <linux-renesas-soc+bounces-9214-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F3A98A95B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 18:09:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 751BF1C2181D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 16:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F0C19259B;
	Mon, 30 Sep 2024 16:09:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B444C35894;
	Mon, 30 Sep 2024 16:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727712567; cv=none; b=Dpvch+3q26X7gwI9g1nNhmSGL68HaZr36jvlhL/Fo6Xz4q/btJhpfjAKlC/U2lZprOD/jSJU135MQpsKdw1W2iggV42wsZvBMT/SY4CtyxYSZofWjLNKkiesHacb/UHdomrndoAFeM0PKD3tNbsxN7C/6V2KZ7k7iighGQHaL8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727712567; c=relaxed/simple;
	bh=MxfAjJYO4xjkhmFSR4yEM0PrB7kjlaIka8hz0EfTdeU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GpS+r88em+A/EmNbpzWMJqG++IV15i43KxrUoGLYIL1wP+1/GbmwRo3ainQnjjQldeiCRg6uLOL0XWE1O3uiSL+uJD949rh6bgQMyTp9GnkZzp7qsSovGYWJHjtQ/usKoTZU0ID+rOO1BVe9qW9KwEIw2eylayIA/4AeQLrG8pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pbarker.dev; spf=fail smtp.mailfrom=pbarker.dev; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pbarker.dev
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=pbarker.dev
X-IronPort-AV: E=Sophos;i="6.11,166,1725289200"; 
   d="scan'208";a="220371949"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Oct 2024 01:09:24 +0900
Received: from GBR-5CG2373LKG.adwin.renesas.com (unknown [10.226.93.43])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 794D84015251;
	Tue,  1 Oct 2024 01:09:02 +0900 (JST)
From: Paul Barker <paul@pbarker.dev>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next PATCH 01/11] net: ravb: Factor out checksum offload enable bits
Date: Mon, 30 Sep 2024 17:08:35 +0100
Message-Id: <20240930160845.8520-2-paul@pbarker.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240930160845.8520-1-paul@pbarker.dev>
References: <20240930160845.8520-1-paul@pbarker.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Barker <paul.barker.ct@bp.renesas.com>

Introduce new constants for the CSR1 (TX) and CSR2 (RX) checksum enable
bits, removing the risk of inconsistency when we change which flags we
enable.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
 drivers/net/ethernet/renesas/ravb.h      | 4 ++++
 drivers/net/ethernet/renesas/ravb_main.c | 9 ++++-----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index a7de5cf6b317..4e1e0a754cd9 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -998,6 +998,8 @@ enum CSR1_BIT {
 	CSR1_TDHD	= 0x08000000,
 };
 
+#define CSR1_CSUM_ENABLE (CSR1_TIP4 | CSR1_TTCP4 | CSR1_TUDP4)
+
 enum CSR2_BIT {
 	CSR2_RIP4	= 0x00000001,
 	CSR2_RTCP4	= 0x00000010,
@@ -1012,6 +1014,8 @@ enum CSR2_BIT {
 	CSR2_RDHD	= 0x08000000,
 };
 
+#define CSR2_CSUM_ENABLE (CSR2_RIP4 | CSR2_RTCP4 | CSR2_RUDP4 | CSR2_RICMP4)
+
 #define DBAT_ENTRY_NUM	22
 #define RX_QUEUE_OFFSET	4
 #define NUM_RX_QUEUE	2
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index d2a6518532f3..b53f6062a106 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -504,11 +504,10 @@ static void ravb_csum_init_gbeth(struct net_device *ndev)
 			ndev->features &= ~NETIF_F_RXCSUM;
 	} else {
 		if (tx_enable)
-			ravb_write(ndev, CSR1_TIP4 | CSR1_TTCP4 | CSR1_TUDP4, CSR1);
+			ravb_write(ndev, CSR1_CSUM_ENABLE, CSR1);
 
 		if (rx_enable)
-			ravb_write(ndev, CSR2_RIP4 | CSR2_RTCP4 | CSR2_RUDP4 | CSR2_RICMP4,
-				   CSR2);
+			ravb_write(ndev, CSR2_CSUM_ENABLE, CSR2);
 	}
 
 done:
@@ -2531,7 +2530,7 @@ static int ravb_set_features_gbeth(struct net_device *ndev,
 	spin_lock_irqsave(&priv->lock, flags);
 	if (changed & NETIF_F_RXCSUM) {
 		if (features & NETIF_F_RXCSUM)
-			val = CSR2_RIP4 | CSR2_RTCP4 | CSR2_RUDP4 | CSR2_RICMP4;
+			val = CSR2_CSUM_ENABLE;
 		else
 			val = 0;
 
@@ -2542,7 +2541,7 @@ static int ravb_set_features_gbeth(struct net_device *ndev,
 
 	if (changed & NETIF_F_HW_CSUM) {
 		if (features & NETIF_F_HW_CSUM)
-			val = CSR1_TIP4 | CSR1_TTCP4 | CSR1_TUDP4;
+			val = CSR1_CSUM_ENABLE;
 		else
 			val = 0;
 
-- 
2.43.0


