Return-Path: <linux-renesas-soc+bounces-9757-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B6599EDE6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 15:40:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52FABB21A41
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 13:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6AAB1C4A13;
	Tue, 15 Oct 2024 13:37:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D131E1AF0B9;
	Tue, 15 Oct 2024 13:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728999459; cv=none; b=q2K8UghvMMlDZKFhfmZVPVBziz6j3SDptGq1ShIXjQxMupIrbt5v2hRLanwJB7oegl/IOyZmr1GPZlfqSLipFKN2gP8apwP5xDjz8ktIjade7H4cAdlo9Pus+ENhzu2mDuexHozY1Lpt9egM/L8WcFMzVaDO4LJhYHIGGwPbwQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728999459; c=relaxed/simple;
	bh=oNh1LBfzKYEMAG2t3CpJgC1JHnKYkQ+eRce0cJyaSYg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Pr6FTwLncae2ZqCLZvOOYsPRxg6d87+kbvh0GNP8zXK0ILdg/oCWDmDvgjJidMYeNyMDPVVIltaKjl1gACsIDXMKMSXhQa5jBhh5yYuxz+YwGBn6hE34NxE+1ahvuTRKjwLtPLv9whdeAiuHT8pHuGmxfgRhIbfN/XJLM5DKIL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.11,205,1725289200"; 
   d="scan'208";a="221998705"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 15 Oct 2024 22:37:36 +0900
Received: from GBR-5CG2373LKG.adwin.renesas.com (unknown [10.226.93.176])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id A9D774007529;
	Tue, 15 Oct 2024 22:37:19 +0900 (JST)
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
Subject: [net-next PATCH v2 07/10] net: ravb: Simplify UDP TX checksum offload
Date: Tue, 15 Oct 2024 14:36:31 +0100
Message-Id: <20241015133634.193-8-paul.barker.ct@bp.renesas.com>
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

The GbEth IP will pass through a zero UDP checksum without asserting any
error flags so we do not need to resort to software checksum calculation
in this case.

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
 drivers/net/ethernet/renesas/ravb_main.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index ca8f785b96b4..80c0d36bffcb 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2075,20 +2075,11 @@ static bool ravb_can_tx_csum_gbeth(struct sk_buff *skb)
 
 	switch (ip->protocol) {
 	case IPPROTO_TCP:
-		break;
 	case IPPROTO_UDP:
-		/* If the checksum value in the UDP header field is 0, TOE does
-		 * not calculate checksum for UDP part of this frame as it is
-		 * optional function as per standards.
-		 */
-		if (udp_hdr(skb)->check == 0)
-			return false;
-		break;
+		return true;
 	default:
 		return false;
 	}
-
-	return true;
 }
 
 /* Packet transmit function for Ethernet AVB */
-- 
2.43.0


