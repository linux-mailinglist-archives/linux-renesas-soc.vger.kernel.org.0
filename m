Return-Path: <linux-renesas-soc+bounces-8991-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CC497B940
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Sep 2024 10:22:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95BE91C20CCE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Sep 2024 08:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7EC18990D;
	Wed, 18 Sep 2024 08:19:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04D6E188A11;
	Wed, 18 Sep 2024 08:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726647548; cv=none; b=dbDlbtKKxAolFwCDit1bABQDxtDmfrzgFDPtdElayRK2kBpPL4N6/if2H1g6LNOOzQc6h9eiVNH3CRRpMo1ce387TSogI1uAyvbOg8ctmrU+PYjOoGVLMCzMSiLuwWrS3v7tyGRg7HEbZnj/5h94bbm0fMvUJTYBuG98f4fg56o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726647548; c=relaxed/simple;
	bh=sCzmNmE1dkbBgPAe9riNuYDBqENaSpmejami5k78wi4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PoqOTC2Dz6/uWQAfnVS+YRT/7gdLRlcrdOpuGpyUL306YH0B+OOvh8NdnoQVW3nsDJG4gpoFTHb9sIwqbXUoI5uI4m6fwF/9b1vM6nFt2/Lj7AGiNXzSEMjXggU77GoGkPC734NaRV0wgivqrTVTNZQRQjCK/7RvjrzApAXdFmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.10,238,1719846000"; 
   d="scan'208";a="219067088"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 18 Sep 2024 17:19:05 +0900
Received: from GBR-5CG2373LKG.adwin.renesas.com (unknown [10.226.93.61])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9E6B940062C9;
	Wed, 18 Sep 2024 17:19:00 +0900 (JST)
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Andrew Lunn <andrew@lunn.ch>
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mitsuhiro Kimura <mitsuhiro.kimura.kc@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net PATCH v3 2/2] net: ravb: Fix R-Car RX frame size limit
Date: Wed, 18 Sep 2024 09:18:39 +0100
Message-Id: <20240918081839.259-3-paul.barker.ct@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240918081839.259-1-paul.barker.ct@bp.renesas.com>
References: <20240918081839.259-1-paul.barker.ct@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The RX frame size limit should not be based on the current MTU setting.
Instead it should be based on the hardware capabilities.

While we're here, improve the description of the receive frame length
setting as suggested by Niklas.

Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
 drivers/net/ethernet/renesas/ravb_main.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index e73cdba58516..d2a6518532f3 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -555,8 +555,16 @@ static void ravb_emac_init_gbeth(struct net_device *ndev)
 
 static void ravb_emac_init_rcar(struct net_device *ndev)
 {
-	/* Receive frame limit set register */
-	ravb_write(ndev, ndev->mtu + ETH_HLEN + VLAN_HLEN + ETH_FCS_LEN, RFLR);
+	struct ravb_private *priv = netdev_priv(ndev);
+
+	/* Set receive frame length
+	 *
+	 * The length set here describes the frame from the destination address
+	 * up to and including the CRC data. However only the frame data,
+	 * excluding the CRC, are transferred to memory. To allow for the
+	 * largest frames add the CRC length to the maximum Rx descriptor size.
+	 */
+	ravb_write(ndev, priv->info->rx_max_frame_size + ETH_FCS_LEN, RFLR);
 
 	/* EMAC Mode: PAUSE prohibition; Duplex; RX Checksum; TX; RX */
 	ravb_write(ndev, ECMR_ZPF | ECMR_DM |
-- 
2.43.0


