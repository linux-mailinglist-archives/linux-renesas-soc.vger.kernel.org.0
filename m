Return-Path: <linux-renesas-soc+bounces-9219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3180798A969
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 18:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB4081F23F6D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 16:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77641991B8;
	Mon, 30 Sep 2024 16:09:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5084192D84;
	Mon, 30 Sep 2024 16:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727712579; cv=none; b=ghA6Gy3nSBfMVfTGUnbzHcykybx85j1Uv7E6cwnSH8bYMtDl3j1S8mg/7O32SMo+w+K/8eJVvDh7mWepqaYqzn+QNIG8CXS5QHNxGTrvXKVIy2lcmys796rWh1HHVnyW0Qb/OE0tK9VPlKXyHauTkKRVpUlYl5nKbWugvTmJhJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727712579; c=relaxed/simple;
	bh=sae72RfWlDAO3Nw+OnMZXDZzXG+S/tHXJC641DiN0Ek=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SO8mu1aYx+K5cRNpjuc3mM7jrSvhs4Di672Q/uFHz5/W89hCpzTGD1mF9E6HW9bfkhfsjIiZLpc5vkSu7DMKj/DdCZEWOwJGJPKpCswBKNgTJR7GGFSoa1VMJLSQHP4sUfumFjyu7XLqOoIPDtEPcRlxVFhcijTFUM8yMab5qLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pbarker.dev; spf=fail smtp.mailfrom=pbarker.dev; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pbarker.dev
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=pbarker.dev
X-IronPort-AV: E=Sophos;i="6.11,166,1725289200"; 
   d="scan'208";a="220371963"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Oct 2024 01:09:36 +0900
Received: from GBR-5CG2373LKG.adwin.renesas.com (unknown [10.226.93.43])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4AE2340156C4;
	Tue,  1 Oct 2024 01:09:07 +0900 (JST)
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
Subject: [net-next PATCH 02/11] net: ravb: Disable IP header RX checksum offloading
Date: Mon, 30 Sep 2024 17:08:36 +0100
Message-Id: <20240930160845.8520-3-paul@pbarker.dev>
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

For IPv4 packets, the header checksum will always be checked in software
in the RX path (inet_gro_receive() calls ip_fast_csum() unconditionally)
so there is no advantage in asking the hardware to also calculate this
checksum.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
 drivers/net/ethernet/renesas/ravb.h      |  2 +-
 drivers/net/ethernet/renesas/ravb_main.c | 16 +++++++++-------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index 4e1e0a754cd9..98496aa39f3d 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -1014,7 +1014,7 @@ enum CSR2_BIT {
 	CSR2_RDHD	= 0x08000000,
 };
 
-#define CSR2_CSUM_ENABLE (CSR2_RIP4 | CSR2_RTCP4 | CSR2_RUDP4 | CSR2_RICMP4)
+#define CSR2_CSUM_ENABLE (CSR2_RTCP4 | CSR2_RUDP4 | CSR2_RICMP4)
 
 #define DBAT_ENTRY_NUM	22
 #define RX_QUEUE_OFFSET	4
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index b53f6062a106..f1b487152555 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -749,13 +749,18 @@ static void ravb_get_tx_tstamp(struct net_device *ndev)
 static void ravb_rx_csum_gbeth(struct sk_buff *skb)
 {
 	struct skb_shared_info *shinfo = skb_shinfo(skb);
-	__wsum csum_ip_hdr, csum_proto;
+	__wsum csum_proto;
 	skb_frag_t *last_frag;
 	u8 *hw_csum;
 
 	/* The hardware checksum status is contained in sizeof(__sum16) * 2 = 4
-	 * bytes appended to packet data. First 2 bytes is ip header checksum
-	 * and last 2 bytes is protocol checksum.
+	 * bytes appended to packet data.
+	 *
+	 * For ipv4, the first 2 bytes are the ip header checksum status. We can
+	 * ignore this as it will always be re-checked in inet_gro_receive().
+	 *
+	 * The last 2 bytes are the protocol checksum status which will be zero
+	 * if the checksum has been validated.
 	 */
 	if (unlikely(skb->len < sizeof(__sum16) * 2))
 		return;
@@ -771,16 +776,13 @@ static void ravb_rx_csum_gbeth(struct sk_buff *skb)
 	hw_csum -= sizeof(__sum16);
 	csum_proto = csum_unfold((__force __sum16)get_unaligned_le16(hw_csum));
 
-	hw_csum -= sizeof(__sum16);
-	csum_ip_hdr = csum_unfold((__force __sum16)get_unaligned_le16(hw_csum));
-
 	if (skb_is_nonlinear(skb))
 		skb_frag_size_sub(last_frag, 2 * sizeof(__sum16));
 	else
 		skb_trim(skb, skb->len - 2 * sizeof(__sum16));
 
 	/* TODO: IPV6 Rx checksum */
-	if (skb->protocol == htons(ETH_P_IP) && !csum_ip_hdr && !csum_proto)
+	if (skb->protocol == htons(ETH_P_IP) && !csum_proto)
 		skb->ip_summed = CHECKSUM_UNNECESSARY;
 }
 
-- 
2.43.0


