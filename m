Return-Path: <linux-renesas-soc+bounces-9759-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3339B99EDEC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 15:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D29801F257C9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 13:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8EA1212640;
	Tue, 15 Oct 2024 13:37:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B083D1FAF14;
	Tue, 15 Oct 2024 13:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728999462; cv=none; b=fU4TEpszesArAXCGEqE3aHuJQKb9+NRXDWoB/hCaLFKstJGF+9nN3Bt+8HlI51lWl89DuoBZkofkLumbm9gRNpdBV5S4IanXT8aCDIyoQztz/bk/98PaV8tvyOQM/XQUnQ5xXhb6ppx5De7vF31gPd+sKNcioaP51RgYYzG8wfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728999462; c=relaxed/simple;
	bh=j6RReWYcf79gWTDSp+9jFx/cBR/XOms6tCBdzHuMCHc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W11uC32GiAHRuU7bgHaPOxR3RH0bpc6eJdLFsv3tZ8LTzX0Vdp3x3BBzTUCD+U8NBoi+XI/hZzFkug+ZCZqY4UWLSzKIKECBNEjkKw0vvGkvT6JVu1CcJ91efkjlKDhkbr8VWcg8Q+TvznitIHo12xunP//KuXzXvGgU4Ft1gqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.11,205,1725289200"; 
   d="scan'208";a="225980160"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 15 Oct 2024 22:37:38 +0900
Received: from GBR-5CG2373LKG.adwin.renesas.com (unknown [10.226.93.176])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 687F040031EA;
	Tue, 15 Oct 2024 22:37:34 +0900 (JST)
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
Subject: [net-next PATCH v2 10/10] net: ravb: Add VLAN checksum support
Date: Tue, 15 Oct 2024 14:36:34 +0100
Message-Id: <20241015133634.193-11-paul.barker.ct@bp.renesas.com>
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

The GbEth IP supports offloading checksum calculation for VLAN-tagged
packets, provided that the EtherType is 0x8100 and only one VLAN tag is
present.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
 drivers/net/ethernet/renesas/ravb.h      |  1 +
 drivers/net/ethernet/renesas/ravb_main.c | 24 ++++++++++++++++++++----
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index d7b3810ce21b..7b48060c250b 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -1055,6 +1055,7 @@ struct ravb_hw_info {
 	size_t gstrings_size;
 	netdev_features_t net_hw_features;
 	netdev_features_t net_features;
+	netdev_features_t vlan_features;
 	int stats_len;
 	u32 tccr_mask;
 	u32 tx_max_frame_size;
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 14b4462331b0..bc56f1f4bec9 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2063,13 +2063,27 @@ static void ravb_tx_timeout_work(struct work_struct *work)
 
 static bool ravb_can_tx_csum_gbeth(struct sk_buff *skb)
 {
+	u16 net_protocol = ntohs(skb->protocol);
 	u8 inner_protocol;
 
-	/* TODO: Need to add support for VLAN tag 802.1Q */
-	if (skb_vlan_tag_present(skb))
-		return false;
+	/* GbEth IP can calculate the checksum if:
+	 * - there are zero or one VLAN headers with TPID=0x8100
+	 * - the network protocol is IPv4 or IPv6
+	 * - the transport protocol is TCP, UDP or ICMP
+	 * - the packet is not fragmented
+	 */
+
+	if (net_protocol == ETH_P_8021Q) {
+		struct vlan_hdr vhdr, *vh;
+
+		vh = skb_header_pointer(skb, ETH_HLEN, sizeof(vhdr), &vhdr);
+		if (!vh)
+			return false;
+
+		net_protocol = ntohs(vh->h_vlan_encapsulated_proto);
+	}
 
-	switch (ntohs(skb->protocol)) {
+	switch (net_protocol) {
 	case ETH_P_IP:
 		inner_protocol = ip_hdr(skb)->protocol;
 		break;
@@ -2772,6 +2786,7 @@ static const struct ravb_hw_info gbeth_hw_info = {
 	.gstrings_size = sizeof(ravb_gstrings_stats_gbeth),
 	.net_hw_features = NETIF_F_RXCSUM | NETIF_F_HW_CSUM,
 	.net_features = NETIF_F_RXCSUM | NETIF_F_HW_CSUM,
+	.vlan_features = NETIF_F_RXCSUM | NETIF_F_HW_CSUM,
 	.stats_len = ARRAY_SIZE(ravb_gstrings_stats_gbeth),
 	.tccr_mask = TCCR_TSRQ0,
 	.tx_max_frame_size = 1522,
@@ -2914,6 +2929,7 @@ static int ravb_probe(struct platform_device *pdev)
 
 	ndev->features = info->net_features;
 	ndev->hw_features = info->net_hw_features;
+	ndev->vlan_features = info->vlan_features;
 
 	error = reset_control_deassert(rstc);
 	if (error)
-- 
2.43.0


