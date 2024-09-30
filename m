Return-Path: <linux-renesas-soc+bounces-9217-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D68E98A96F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 18:12:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 076D1B27052
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 16:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F2E192D86;
	Mon, 30 Sep 2024 16:09:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D56190667;
	Mon, 30 Sep 2024 16:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727712577; cv=none; b=PRFByUj/IuLXJf4crcbTmfuqVkL9eIKJZV03d8v6/EQ80v/sqS0Z3Avj9z2xT8DQ5uLS1pHhhUF1a1gP0/FLDH/KvUpYHtJgabTZjr5hhOzsVJ05fxhPrUvfyQrxruMKqdT91JRUrML9k3vgIMjyNR6EGOStcZJtPJSG0rI3sY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727712577; c=relaxed/simple;
	bh=k2BG4Wh6IclsjFlxRTyHQ9kTeZa9kLRDBXyfoMuI6GU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RYssiv6QAuclGGrHMx8Vw6Arcsg664lCKEcYb6CMyCjqBu5Ohf5odq0/5KAoB9oygSiYLDAtqiwK+KMLF10hHiUKJWU14aJftPdPs+LV4otct2bqV5nhkzg28xF0x5Ksnnmvav/SFb7Z1WZ+EnUlU3hPmg9srp31Qhsp8KSQf1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pbarker.dev; spf=fail smtp.mailfrom=pbarker.dev; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pbarker.dev
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=pbarker.dev
X-IronPort-AV: E=Sophos;i="6.11,166,1725289200"; 
   d="scan'208";a="224347959"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 01 Oct 2024 01:09:34 +0900
Received: from GBR-5CG2373LKG.adwin.renesas.com (unknown [10.226.93.43])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id EB0034015135;
	Tue,  1 Oct 2024 01:09:16 +0900 (JST)
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
Subject: [net-next PATCH 04/11] net: ravb: Combine if conditions in RX csum validation
Date: Mon, 30 Sep 2024 17:08:38 +0100
Message-Id: <20240930160845.8520-5-paul@pbarker.dev>
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

We can merge the two if conditions on skb_is_nonlinear(). Since
skb_frag_size_sub() and skb_trim() do not free memory, it is still safe
to access the trimmed bytes at the end of the packet after these calls.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
 drivers/net/ethernet/renesas/ravb_main.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index f3913c164161..1dd2152734b0 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -769,18 +769,15 @@ static void ravb_rx_csum_gbeth(struct sk_buff *skb)
 		last_frag = &shinfo->frags[shinfo->nr_frags - 1];
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


