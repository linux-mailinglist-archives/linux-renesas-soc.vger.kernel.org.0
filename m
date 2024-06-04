Return-Path: <linux-renesas-soc+bounces-5807-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C70E68FABFA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 09:30:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83CBC28259A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 07:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD6B142912;
	Tue,  4 Jun 2024 07:29:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 606AD142900;
	Tue,  4 Jun 2024 07:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717486144; cv=none; b=LFnHr6aasUdpZNGdnCPwiKHo5SJrVfNcR+OAoWcE/KR39ywOFP/YjWFZKVwOb5Tk8amWcGbfBxGv3f/h1hYZqOxTa9DkA4qdu+w3ROXg46Hb5ZqceL0SwH65nBJom90NS7eZyZGshDIVclRFvNKKDc+SoHi/8T2Xxw+X/ycgWNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717486144; c=relaxed/simple;
	bh=S9rcrkNCIr3Jy7WR55wdfEGflMtmySEn/dQxylxKq+I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VTarzdkiwYaNdILtY4TaxzUo83CYSvtPg1Iye1jMDwRlkOvAFIHjTNMGfiOjHkInBZsAJ/6wrrdoSMTTO/Jlw0F61WIYajZPeOcN2KYEblQEUECQoJp8ZLygToL7s7TAdliCUUbvlaUdd6r21SgjpODwuLqZTiWO3stACd1HYi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,213,1712588400"; 
   d="scan'208";a="210610445"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 04 Jun 2024 16:29:01 +0900
Received: from renesas-deb12.mshome.net (unknown [10.226.92.239])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5042B41FC779;
	Tue,  4 Jun 2024 16:28:56 +0900 (JST)
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
Subject: [net-next PATCH v5 4/7] net: ravb: Refactor GbEth RX code path
Date: Tue,  4 Jun 2024 08:28:22 +0100
Message-Id: <20240604072825.7490-5-paul.barker.ct@bp.renesas.com>
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

We can reduce code duplication in ravb_rx_gbeth().

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
Changes v4->v5:
  * Re-wrapped to 80 cols, except where this would significantly impact
    readability.
  * Use lower case `skb` consistently in comments.

Changes v3->v4:
  * Used switch statements instead of if statements in ravb_rx_gbeth().

 drivers/net/ethernet/renesas/ravb_main.c | 71 +++++++++++++-----------
 1 file changed, 38 insertions(+), 33 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 63d03929e3f5..e8c3f48b213d 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -819,47 +819,52 @@ static int ravb_rx_gbeth(struct net_device *ndev, int budget, int q)
 				stats->rx_missed_errors++;
 		} else {
 			die_dt = desc->die_dt & 0xF0;
+			skb = ravb_get_skb_gbeth(ndev, entry, desc);
 			switch (die_dt) {
 			case DT_FSINGLE:
-				skb = ravb_get_skb_gbeth(ndev, entry, desc);
+			case DT_FSTART:
+				/* Start of packet: Set initial data length. */
 				skb_put(skb, desc_len);
+
+				/* Save this skb if the packet spans multiple
+				 * descriptors.
+				 */
+				if (die_dt == DT_FSTART)
+					priv->rx_1st_skb = skb;
+				break;
+
+			case DT_FMID:
+			case DT_FEND:
+				/* Continuing a packet: Move data into the saved
+				 * skb.
+				 */
+				skb_copy_to_linear_data_offset(priv->rx_1st_skb,
+							       priv->rx_1st_skb->len,
+							       skb->data,
+							       desc_len);
+				skb_put(priv->rx_1st_skb, desc_len);
+				dev_kfree_skb(skb);
+
+				/* Set skb to point at the whole packet so that
+				 * we only need one code path for finishing a
+				 * packet.
+				 */
+				skb = priv->rx_1st_skb;
+			}
+
+			switch (die_dt) {
+			case DT_FSINGLE:
+			case DT_FEND:
+				/* Finishing a packet: Determine protocol &
+				 * checksum, hand off to NAPI and update our
+				 * stats.
+				 */
 				skb->protocol = eth_type_trans(skb, ndev);
 				if (ndev->features & NETIF_F_RXCSUM)
 					ravb_rx_csum_gbeth(skb);
+				stats->rx_bytes += skb->len;
 				napi_gro_receive(&priv->napi[q], skb);
 				rx_packets++;
-				stats->rx_bytes += desc_len;
-				break;
-			case DT_FSTART:
-				priv->rx_1st_skb = ravb_get_skb_gbeth(ndev, entry, desc);
-				skb_put(priv->rx_1st_skb, desc_len);
-				break;
-			case DT_FMID:
-				skb = ravb_get_skb_gbeth(ndev, entry, desc);
-				skb_copy_to_linear_data_offset(priv->rx_1st_skb,
-							       priv->rx_1st_skb->len,
-							       skb->data,
-							       desc_len);
-				skb_put(priv->rx_1st_skb, desc_len);
-				dev_kfree_skb(skb);
-				break;
-			case DT_FEND:
-				skb = ravb_get_skb_gbeth(ndev, entry, desc);
-				skb_copy_to_linear_data_offset(priv->rx_1st_skb,
-							       priv->rx_1st_skb->len,
-							       skb->data,
-							       desc_len);
-				skb_put(priv->rx_1st_skb, desc_len);
-				dev_kfree_skb(skb);
-				priv->rx_1st_skb->protocol =
-					eth_type_trans(priv->rx_1st_skb, ndev);
-				if (ndev->features & NETIF_F_RXCSUM)
-					ravb_rx_csum_gbeth(priv->rx_1st_skb);
-				stats->rx_bytes += priv->rx_1st_skb->len;
-				napi_gro_receive(&priv->napi[q],
-						 priv->rx_1st_skb);
-				rx_packets++;
-				break;
 			}
 		}
 	}
-- 
2.39.2


