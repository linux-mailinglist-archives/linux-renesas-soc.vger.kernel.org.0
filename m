Return-Path: <linux-renesas-soc+bounces-9223-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C422E98A97D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 18:13:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A37D2B2801C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 16:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D483919A292;
	Mon, 30 Sep 2024 16:09:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2156E1922F4;
	Mon, 30 Sep 2024 16:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727712594; cv=none; b=jkCh3nvDxZkUbvkyYTeffR0FaXoUEKEKX4/mHhJ2ONlwPOqsiMr6pTgT7B5hDsW0o1AlregIr3XDFyyyKMfs7miJIv0XIiOFLbeoHRnzpR9ang775whO9o1MM2CSHcxnSNTcGWrMkhEjYLEGenIt+vxCwR+jXbzpe5xoX3WcMmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727712594; c=relaxed/simple;
	bh=IZ9CPul3h+k6m4vAfdAx+DtxwAdYljmJ1DMBrJM62Nw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gg96PYx0aYfCv63YRNWHSqzL/X9PONzNqBkJpZfiBvmjpp+IEazx/Bg1DgHpHfWLHWUS+H7zuGvXkzI37nqikjgZb4WS3d7io3ZeDU+77YX17x9wfiE8GpRW4FOhCtlSicIaqFsdIMdosBMQ7+4c7gII22Rup7CXKmaiPb3guAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pbarker.dev; spf=fail smtp.mailfrom=pbarker.dev; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pbarker.dev
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=pbarker.dev
X-IronPort-AV: E=Sophos;i="6.11,166,1725289200"; 
   d="scan'208";a="220371977"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Oct 2024 01:09:52 +0900
Received: from GBR-5CG2373LKG.adwin.renesas.com (unknown [10.226.93.43])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id D862A4006371;
	Tue,  1 Oct 2024 01:09:45 +0900 (JST)
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
Subject: [net-next PATCH 10/11] net: ravb: Enable IPv6 TX checksum offload for GbEth
Date: Mon, 30 Sep 2024 17:08:44 +0100
Message-Id: <20240930160845.8520-11-paul@pbarker.dev>
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

The GbEth IP supports offloading IPv6 TCP, UDP & ICMPv6 checksums.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
 drivers/net/ethernet/renesas/ravb.h      |  3 ++-
 drivers/net/ethernet/renesas/ravb_main.c | 31 ++++++++++++++----------
 2 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index 8523b89ba1c6..2cb6c4ef1330 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -998,7 +998,8 @@ enum CSR1_BIT {
 	CSR1_TDHD	= 0x08000000,
 };
 
-#define CSR1_CSUM_ENABLE (CSR1_TTCP4 | CSR1_TUDP4 | CSR1_TICMP4)
+#define CSR1_CSUM_ENABLE (CSR1_TTCP4 | CSR1_TUDP4 | CSR1_TICMP4 | \
+			  CSR1_TTCP6 | CSR1_TUDP6 | CSR1_TICMP6)
 
 enum CSR2_BIT {
 	CSR2_RIP4	= 0x00000001,
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 69d71fbf3e02..832132d44fb4 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2063,25 +2063,30 @@ static void ravb_tx_timeout_work(struct work_struct *work)
 
 static bool ravb_can_tx_csum_gbeth(struct sk_buff *skb)
 {
-	struct iphdr *ip = ip_hdr(skb);
-
 	/* TODO: Need to add support for VLAN tag 802.1Q */
 	if (skb_vlan_tag_present(skb))
 		return false;
 
-	/* TODO: Need to add hardware checksum for IPv6 */
-	if (skb->protocol != htons(ETH_P_IP))
-		return false;
-
-	switch (ip->protocol) {
-	case IPPROTO_TCP:
-	case IPPROTO_UDP:
-	case IPPROTO_ICMP:
-		return true;
+	switch (ntohs(skb->protocol)) {
+	case ETH_P_IP:
+		switch (ip_hdr(skb)->protocol) {
+		case IPPROTO_TCP:
+		case IPPROTO_UDP:
+		case IPPROTO_ICMP:
+			return true;
+		}
+		break;
 
-	default:
-		return false;
+	case ETH_P_IPV6:
+		switch (ipv6_hdr(skb)->nexthdr) {
+		case IPPROTO_TCP:
+		case IPPROTO_UDP:
+		case IPPROTO_ICMPV6:
+			return true;
+		}
 	}
+
+	return false;
 }
 
 /* Packet transmit function for Ethernet AVB */
-- 
2.43.0


