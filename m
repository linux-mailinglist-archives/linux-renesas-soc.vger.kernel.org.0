Return-Path: <linux-renesas-soc+bounces-9760-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6322299EDF4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 15:41:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04C161F25697
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 13:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982281C4A2B;
	Tue, 15 Oct 2024 13:37:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA0531AF0BB;
	Tue, 15 Oct 2024 13:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728999468; cv=none; b=OCjCzLqSr9vJLdiD25TK3KOgmhH4/LoZntVFXcklALav0HCclrur0woWg4mK3DxfPt/zBToFhk3JV7MhNeCEn0+hT6ofblvyIgZTjlYXjnBdsX6mU3J94Dxx3YGHIHwStFFk5roYUnGujdy11lS68fb91OumJzXw67VUyRCSWik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728999468; c=relaxed/simple;
	bh=bc5yl74zdn98bGrzflzZJhT8dVZ1ucUyhLi6xxRM+Rg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y23DOypGNm9aZIAgZifyU5myEfWBK2QE3amZu1eOE7coYugjT0sp8YcwY0IZfOAbnSmA9/vK5UWb4Z+9wQfpzPEcb7vd6WyOsPAws6mPHyAcQoMny+N2gU72zhICepd1m+aBqc3ik3OjSQk+h9DuBzCDSFr1jEoh2Sz0DKYUe2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.11,205,1725289200"; 
   d="scan'208";a="221998714"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 15 Oct 2024 22:37:45 +0900
Received: from GBR-5CG2373LKG.adwin.renesas.com (unknown [10.226.93.176])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id ADE22400755A;
	Tue, 15 Oct 2024 22:37:28 +0900 (JST)
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
Subject: [net-next PATCH v2 09/10] net: ravb: Enable IPv6 TX checksum offload for GbEth
Date: Tue, 15 Oct 2024 14:36:33 +0100
Message-Id: <20241015133634.193-10-paul.barker.ct@bp.renesas.com>
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

The GbEth IP supports offloading IPv6 TCP, UDP & ICMPv6 checksums in the
TX path.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
 drivers/net/ethernet/renesas/ravb.h      |  2 +-
 drivers/net/ethernet/renesas/ravb_main.c | 15 +++++++++++----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index e1e55e677215..d7b3810ce21b 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -998,7 +998,7 @@ enum CSR1_BIT {
 	CSR1_TDHD	= 0x08000000,
 };
 
-#define CSR1_CSUM_ENABLE (CSR1_TTCP4 | CSR1_TUDP4)
+#define CSR1_CSUM_ENABLE (CSR1_TTCP4 | CSR1_TUDP4 | CSR1_TTCP6 | CSR1_TUDP6)
 
 enum CSR2_BIT {
 	CSR2_RIP4	= 0x00000001,
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 80c0d36bffcb..14b4462331b0 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2063,17 +2063,24 @@ static void ravb_tx_timeout_work(struct work_struct *work)
 
 static bool ravb_can_tx_csum_gbeth(struct sk_buff *skb)
 {
-	struct iphdr *ip = ip_hdr(skb);
+	u8 inner_protocol;
 
 	/* TODO: Need to add support for VLAN tag 802.1Q */
 	if (skb_vlan_tag_present(skb))
 		return false;
 
-	/* TODO: Need to add hardware checksum for IPv6 */
-	if (skb->protocol != htons(ETH_P_IP))
+	switch (ntohs(skb->protocol)) {
+	case ETH_P_IP:
+		inner_protocol = ip_hdr(skb)->protocol;
+		break;
+	case ETH_P_IPV6:
+		inner_protocol = ipv6_hdr(skb)->nexthdr;
+		break;
+	default:
 		return false;
+	}
 
-	switch (ip->protocol) {
+	switch (inner_protocol) {
 	case IPPROTO_TCP:
 	case IPPROTO_UDP:
 		return true;
-- 
2.43.0


