Return-Path: <linux-renesas-soc+bounces-9215-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEB298A95F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 18:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED2851C223F0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 16:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F641194138;
	Mon, 30 Sep 2024 16:09:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38EE6191F6B;
	Mon, 30 Sep 2024 16:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727712569; cv=none; b=CM1dlI1gMVvuIRbkFY+YonBh8CiCZBZpT82rrZ88rJmQAuuO7ENzSugoyAUsveGYQQS/KCzSHvRJyhU0DLWsyJUb5WFdJ8DM+dhyhrD/Q8XYEE0cJBiEjTnI2Lr31quWCM1ULm9x753JNLBJ2IM914L8eu7mW8qCEaVS7neEMTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727712569; c=relaxed/simple;
	bh=u4YF1e11CPAbUSMc2KCNJi1M7BvEl88Iop1muAvdQc0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E7RuPrQIfi5PuIVy5RcEbjWacgWqxvMU8EBIO5kwfA6pFRneGjxFHqw8W6TAuMM8a3wSY8Ebwmpy/hNenEg/0kqq5rSZ8u8o0BPiQ84oAOn8JjDqV+QF4nYe8fAwqj+2MIib/bqSyT/RxN1+av8AyzfjsoY6muS/s6SWAv6bqOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pbarker.dev; spf=fail smtp.mailfrom=pbarker.dev; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pbarker.dev
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=pbarker.dev
X-IronPort-AV: E=Sophos;i="6.11,166,1725289200"; 
   d="scan'208";a="224347950"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 01 Oct 2024 01:09:25 +0900
Received: from GBR-5CG2373LKG.adwin.renesas.com (unknown [10.226.93.43])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id B56394015141;
	Tue,  1 Oct 2024 01:09:21 +0900 (JST)
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
Subject: [net-next PATCH 05/11] net: ravb: Simplify types in RX csum validation
Date: Mon, 30 Sep 2024 17:08:39 +0100
Message-Id: <20240930160845.8520-6-paul@pbarker.dev>
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

The HW checksum value is used as a 16-bit flag, it is zero when the
checksum has been validated and non-zero otherwise. Therefore we don't
need to treat this as an actual __wsum type or call csum_unfold(), we
can just use a u16 pointer.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
 drivers/net/ethernet/renesas/ravb_main.c | 30 +++++++++++-------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 1dd2152734b0..9350ca10ab22 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -749,12 +749,11 @@ static void ravb_get_tx_tstamp(struct net_device *ndev)
 static void ravb_rx_csum_gbeth(struct sk_buff *skb)
 {
 	struct skb_shared_info *shinfo = skb_shinfo(skb);
-	__wsum csum_proto;
-	skb_frag_t *last_frag;
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
@@ -762,23 +761,22 @@ static void ravb_rx_csum_gbeth(struct sk_buff *skb)
 	 * The last 2 bytes are the protocol checksum status which will be zero
 	 * if the checksum has been validated.
 	 */
-	if (unlikely(skb->len < sizeof(__sum16) * 2))
+	csum_len = sizeof(*hw_csum) * 2;
+	if (unlikely(skb->len < csum_len))
 		return;
 
 	if (skb_is_nonlinear(skb)) {
-		last_frag = &shinfo->frags[shinfo->nr_frags - 1];
-		hw_csum = skb_frag_address(last_frag) +
-			  skb_frag_size(last_frag);
-		skb_frag_size_sub(last_frag, 2 * sizeof(__sum16));
+		skb_frag_t *last_frag = &shinfo->frags[shinfo->nr_frags - 1];
+
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
+	if (!*--hw_csum)
 		skb->ip_summed = CHECKSUM_UNNECESSARY;
 }
 
-- 
2.43.0


