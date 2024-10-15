Return-Path: <linux-renesas-soc+bounces-9755-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 206DE99EDDE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 15:39:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDFC91F242D5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 13:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D191E7653;
	Tue, 15 Oct 2024 13:37:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA921C07DD;
	Tue, 15 Oct 2024 13:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728999446; cv=none; b=BtaWkxNmEZ++FwR1BELBkAGFF+2TOjRSdIk+rWZMmKxF21ga/M2XQAG7G8Ssu4gjDOTARte2K7dq7pg5m9ub8g2Ev0yeWdABD9knZn44N0h8q7hLCkhkIOqX8sAPE7x5ClWU4kyn8D8nzukdcoFJJ0INPJtOx1MQqmbGBn4xjSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728999446; c=relaxed/simple;
	bh=16GfyLirqF8+j5oLgvAk3nHhNGDQxQO8vfgC4gzQQ4s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qe2rHAu9nIaxmd4RLcQpXwxEWnCNfKeSUqXcyERmFmNY7Fi0rsAw2UEu8gYClIMeHCb3T7r61NSpWA5Tdor8v8eqqhEcR1qDkYkGi6N7QQZ4FgHJOXW0nfeXQq+fj2K6HHlTAuZ593IQbbv5RYPy/4A79Tx6rEyYWS2w+gJl/3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.11,205,1725289200"; 
   d="scan'208";a="221998689"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 15 Oct 2024 22:37:15 +0900
Received: from GBR-5CG2373LKG.adwin.renesas.com (unknown [10.226.93.176])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2A39E4005E0C;
	Tue, 15 Oct 2024 22:37:09 +0900 (JST)
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
Subject: [net-next PATCH v2 05/10] net: ravb: Simplify types in RX csum validation
Date: Tue, 15 Oct 2024 14:36:29 +0100
Message-Id: <20241015133634.193-6-paul.barker.ct@bp.renesas.com>
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

The hardware checksum value is used as a 16-bit flag, it is zero when
the checksum has been validated and non-zero otherwise. Therefore we
don't need to treat this as an actual __wsum type or call csum_unfold(),
we can just use a u16 pointer.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
 drivers/net/ethernet/renesas/ravb_main.c | 26 +++++++++++-------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 2f584c353c78..ca8f785b96b4 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -749,11 +749,11 @@ static void ravb_get_tx_tstamp(struct net_device *ndev)
 static void ravb_rx_csum_gbeth(struct sk_buff *skb)
 {
 	struct skb_shared_info *shinfo = skb_shinfo(skb);
-	__wsum csum_proto;
-	u8 *hw_csum;
+	size_t csum_len;
+	u16 *hw_csum;
 
-	/* The hardware checksum status is contained in sizeof(__sum16) * 2 = 4
-	 * bytes appended to packet data.
+	/* The hardware checksum status is contained in 4 bytes appended to
+	 * packet data.
 	 *
 	 * For ipv4, the first 2 bytes are the ip header checksum status. We can
 	 * ignore this as it will always be re-checked in inet_gro_receive().
@@ -761,24 +761,22 @@ static void ravb_rx_csum_gbeth(struct sk_buff *skb)
 	 * The last 2 bytes are the protocol checksum status which will be zero
 	 * if the checksum has been validated.
 	 */
-	if (unlikely(skb->len < sizeof(__sum16) * 2))
+	csum_len = sizeof(*hw_csum) * 2;
+	if (unlikely(skb->len < csum_len))
 		return;
 
 	if (skb_is_nonlinear(skb)) {
 		skb_frag_t *last_frag = &shinfo->frags[shinfo->nr_frags - 1];
 
-		hw_csum = skb_frag_address(last_frag) +
-			  skb_frag_size(last_frag);
-		skb_frag_size_sub(last_frag, 2 * sizeof(__sum16));
+		hw_csum = (u16 *)(skb_frag_address(last_frag) +
+				  skb_frag_size(last_frag));
+		skb_frag_size_sub(last_frag, csum_len);
 	} else {
-		hw_csum = skb_tail_pointer(skb);
-		skb_trim(skb, skb->len - 2 * sizeof(__sum16));
+		hw_csum = (u16 *)skb_tail_pointer(skb);
+		skb_trim(skb, skb->len - csum_len);
 	}
 
-	hw_csum -= sizeof(__sum16);
-	csum_proto = csum_unfold((__force __sum16)get_unaligned_le16(hw_csum));
-
-	if (!csum_proto)
+	if (!get_unaligned(--hw_csum))
 		skb->ip_summed = CHECKSUM_UNNECESSARY;
 }
 
-- 
2.43.0


