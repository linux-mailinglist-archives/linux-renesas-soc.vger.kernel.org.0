Return-Path: <linux-renesas-soc+bounces-5550-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E1C8D1FA4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2024 17:07:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2B7A1F24318
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2024 15:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5EB6175567;
	Tue, 28 May 2024 15:04:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB0B2178366;
	Tue, 28 May 2024 15:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716908652; cv=none; b=QzyV+rw18mqGxxZ6BYMZcOXnsAqrTYPP8KXLete84qN2CY7JoCYjs6DFtk5S/Ay1cj3Bavszgw9wa7Lc09F5UtvK3fiQ1nED2sgVzQNJBzMsgm1iIgR+lS7S94b2MAib8MVJP+mjFSamms02fGZ+DmDU71kq3E6F0jl0NsyqfOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716908652; c=relaxed/simple;
	bh=sWGKmu8ASdPFfq8tc+XcJUTwK7fQaboV4PSwnXO22rc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B08vG522sNshMvldgEVG/HejHzBJ5tH8zEYkOYa2EQZAhJwM24gAJD2JLNGgB9SRvt33xV0UrkSJ6Ee2wkRru8O/lvwD4rODOFhRiSftX43USzYXr01bi0+mc05jC0oaJNmmqkeH6PWVcoVVjuzteKNtaQHYpVkea7kM9gFxxyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,195,1712588400"; 
   d="scan'208";a="205944545"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 29 May 2024 00:04:09 +0900
Received: from renesas-deb12.cephei.uk (unknown [10.226.93.69])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 20D26400CF19;
	Wed, 29 May 2024 00:04:04 +0900 (JST)
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
Subject: [net-next PATCH v4 4/7] net: ravb: Refactor GbEth RX code path
Date: Tue, 28 May 2024 16:03:36 +0100
Message-Id: <20240528150339.6791-5-paul.barker.ct@bp.renesas.com>
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

We can reduce code duplication in ravb_rx_gbeth().

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
Changes v3->v4:
  * Used switch statements instead of if statements in ravb_rx_gbeth().

 drivers/net/ethernet/renesas/ravb_main.c | 73 +++++++++++++-----------
 1 file changed, 40 insertions(+), 33 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 7df7d2e93a3a..c9c5cc641589 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -817,47 +817,54 @@ static int ravb_rx_gbeth(struct net_device *ndev, int budget, int q)
 				stats->rx_missed_errors++;
 		} else {
 			die_dt = desc->die_dt & 0xF0;
+			skb = ravb_get_skb_gbeth(ndev, entry, desc);
 			switch (die_dt) {
 			case DT_FSINGLE:
-				skb = ravb_get_skb_gbeth(ndev, entry, desc);
+			case DT_FSTART:
+				/* Start of packet:
+				 * Set initial data length.
+				 */
 				skb_put(skb, desc_len);
+
+				/* Save this SKB if the packet spans multiple
+				 * descriptors.
+				 */
+				if (die_dt == DT_FSTART)
+					priv->rx_1st_skb = skb;
+				break;
+
+			case DT_FMID:
+			case DT_FEND:
+				/* Continuing a packet:
+				 * Move data into the saved SKB.
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
+				/* Finishing a packet:
+				 * Determine protocol & checksum, hand off to
+				 * NAPI and update our stats.
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


