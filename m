Return-Path: <linux-renesas-soc+bounces-9754-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 190B199EDDB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 15:39:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D197D281BFB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 13:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D0641C07CE;
	Tue, 15 Oct 2024 13:37:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172161AF0AE;
	Tue, 15 Oct 2024 13:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728999444; cv=none; b=J/mI+cb2M9XTw9L6/qVqMoaOBG+0qzuoOEVisOGWtx/+g3tzEja9RiADoAJlO4hxs8xcL8zHF3qHtqVUlqrvZm0JlRmk8z1/8Lqi94gcjXk1st9rTZNS6YKRYHrzQjMOVs/QIxxdKExSIXqK5HtTmak80Xxt9DJazBO7n9Nzuy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728999444; c=relaxed/simple;
	bh=8SMBbbqWMUC0bk4bj1pzbRGvz1lhMyzwzMh2XDlZFUM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E30gmDACDhMbe+bdq8ZMDND7/qFyhAhbw4/wP5ZUMytUywJaHnQpYCRSiQd8QiuDfhitVFzsFN2tIyGQtPGnYpGEzYpboUqGapmOW9gebDXQfOVzuoEjqPvry+OAL3FW4tFof2BS6K1OYrE2cnGbSZvaVF3qLJ99rrutzxfpX9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.11,205,1725289200"; 
   d="scan'208";a="221998686"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 15 Oct 2024 22:37:15 +0900
Received: from GBR-5CG2373LKG.adwin.renesas.com (unknown [10.226.93.176])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6B2B8400755A;
	Tue, 15 Oct 2024 22:37:05 +0900 (JST)
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
Subject: [net-next PATCH v2 04/10] net: ravb: Combine if conditions in RX csum validation
Date: Tue, 15 Oct 2024 14:36:28 +0100
Message-Id: <20241015133634.193-5-paul.barker.ct@bp.renesas.com>
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

We can merge the two if conditions on skb_is_nonlinear(). Since
skb_frag_size_sub() and skb_trim() do not free memory, it is still safe
to access the trimmed bytes at the end of the packet after these calls.

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
 drivers/net/ethernet/renesas/ravb_main.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 4bc2532706c2..2f584c353c78 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -750,7 +750,6 @@ static void ravb_rx_csum_gbeth(struct sk_buff *skb)
 {
 	struct skb_shared_info *shinfo = skb_shinfo(skb);
 	__wsum csum_proto;
-	skb_frag_t *last_frag;
 	u8 *hw_csum;
 
 	/* The hardware checksum status is contained in sizeof(__sum16) * 2 = 4
@@ -766,21 +765,19 @@ static void ravb_rx_csum_gbeth(struct sk_buff *skb)
 		return;
 
 	if (skb_is_nonlinear(skb)) {
-		last_frag = &shinfo->frags[shinfo->nr_frags - 1];
+		skb_frag_t *last_frag = &shinfo->frags[shinfo->nr_frags - 1];
+
 		hw_csum = skb_frag_address(last_frag) +
 			  skb_frag_size(last_frag);
+		skb_frag_size_sub(last_frag, 2 * sizeof(__sum16));
 	} else {
 		hw_csum = skb_tail_pointer(skb);
+		skb_trim(skb, skb->len - 2 * sizeof(__sum16));
 	}
 
 	hw_csum -= sizeof(__sum16);
 	csum_proto = csum_unfold((__force __sum16)get_unaligned_le16(hw_csum));
 
-	if (skb_is_nonlinear(skb))
-		skb_frag_size_sub(last_frag, 2 * sizeof(__sum16));
-	else
-		skb_trim(skb, skb->len - 2 * sizeof(__sum16));
-
 	if (!csum_proto)
 		skb->ip_summed = CHECKSUM_UNNECESSARY;
 }
-- 
2.43.0


