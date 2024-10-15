Return-Path: <linux-renesas-soc+bounces-9751-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 091BF99EDD2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 15:38:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8BC11F24DC6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 13:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A599D1B21B7;
	Tue, 15 Oct 2024 13:37:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C5781B2186;
	Tue, 15 Oct 2024 13:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728999427; cv=none; b=bC8a7b/2s6DCeUOFXkJTO4zZIZ+S4KYAwdoUR20nnZaoIqTV2ubzQsb2M5sgN2h/KAHOyJli2h1ltjlj4+mkc27GHhFAKAG1LUtm7EElb7GiPLOlV/fjcfhlAvsQD8mMkdug0gOtV+8SOQ81aEDOIUMCaNeDk8sMFRh2s8B1idI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728999427; c=relaxed/simple;
	bh=cIPF8O6w578TCBywYCIAJCizeQZcSmWc+2nIE5wE4G4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uXwJzmT316tuTbNiZaNi2yfrivc6M9nL1qq9NKcE4hyGfXAXltxF5XXw3JV4nJKvb0ZVAIjcq3e8ESaWHtBh1W/sjsd2Qn0vcjiUkdQtXR/oqUod4T/aIke+XF+yMxqMR5u8TXxQC6Rik5psHACU91prm/lbSaujr055aIqIe+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.11,205,1725289200"; 
   d="scan'208";a="225980124"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 15 Oct 2024 22:37:04 +0900
Received: from GBR-5CG2373LKG.adwin.renesas.com (unknown [10.226.93.176])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 361FC400755A;
	Tue, 15 Oct 2024 22:36:50 +0900 (JST)
From: Paul Barker <paul.barker.ct@bp.renesas.com>
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
Subject: [net-next PATCH v2 01/10] net: ravb: Factor out checksum offload enable bits
Date: Tue, 15 Oct 2024 14:36:25 +0100
Message-Id: <20241015133634.193-2-paul.barker.ct@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241015133634.193-1-paul.barker.ct@bp.renesas.com>
References: <20241015133634.193-1-paul.barker.ct@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce new constants for the CSR1 (TX) and CSR2 (RX) checksum enable
bits, removing the risk of inconsistency when we change which flags we
enable.

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
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
index 41f88f8836f8..c8988c0c85a1 100644
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


