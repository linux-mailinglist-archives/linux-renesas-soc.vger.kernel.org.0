Return-Path: <linux-renesas-soc+bounces-9752-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CF799EDD5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 15:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EAF61F24877
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 13:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338091D5167;
	Tue, 15 Oct 2024 13:37:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0FA41D5146;
	Tue, 15 Oct 2024 13:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728999428; cv=none; b=qWXW6TAmDpgu8FV0dtPlKUn7XAH09JSHOawrzh3hs8hp7qeiuqt9MwG8ZyBBxiDmoV5zE91a8q020vC4FR+Og6yYqrFEyWvG8M+YmPIUDgUDpqFvnl1NgdLmWeUP0CzXL8F+HzmQe1y0iwtFibyEc1EDNnOQYiVpkq/WMyG+E88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728999428; c=relaxed/simple;
	bh=qduMfvyPHe2PDaTlXTgdwzk4KaEENNuQxzLZoalphkI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FQciF8+ukybK1C7CV3TBzA+MXxyGV4/VWeyOfKNHtsAGbKep6a6879oiM5MeP/ytU/pbyOA4lz5tAJ4Hh5+x+vvtNHqZ90586AMnQZwyszhg3irYCmSibmnf0tSPSGH9D9gHsAouFQ7vGS6Znfmt5qt8LhmAe71tkPq2AIa6k0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.11,205,1725289200"; 
   d="scan'208";a="225980126"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 15 Oct 2024 22:37:04 +0900
Received: from GBR-5CG2373LKG.adwin.renesas.com (unknown [10.226.93.176])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id E854F4007529;
	Tue, 15 Oct 2024 22:36:55 +0900 (JST)
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
Subject: [net-next PATCH v2 02/10] net: ravb: Disable IP header RX checksum offloading
Date: Tue, 15 Oct 2024 14:36:26 +0100
Message-Id: <20241015133634.193-3-paul.barker.ct@bp.renesas.com>
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

For IPv4 packets, the header checksum will always be checked in software
in the RX path (inet_gro_receive() calls ip_fast_csum() unconditionally)
so there is no advantage in asking the hardware to also calculate this
checksum.

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
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
index c8988c0c85a1..43db69d03684 100644
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


