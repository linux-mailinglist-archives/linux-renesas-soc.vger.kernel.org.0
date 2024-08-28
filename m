Return-Path: <linux-renesas-soc+bounces-8434-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 304779624BD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 12:23:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C65B1C23345
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 10:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8DB16BE11;
	Wed, 28 Aug 2024 10:23:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4714816B74F;
	Wed, 28 Aug 2024 10:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724840580; cv=none; b=gHIBpPcP3RC5rZFscbx75kfswfkpczrKRfDEO4tfosTtnwj6jaKlEdaXr17851I9hommplOCqjXXHluIv8mJ+634Ga0TfacXZ0Q28ap+btjv8j76ZI5irebnY9e76+0j9wV8hIBP+JhAR/+eszh/uhkr6IP7fmyRZ3SSShiD2iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724840580; c=relaxed/simple;
	bh=at7aNEEsQV/XWz/f9wPy2n+nLCMgHn9QsYVU774x0Qw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dikz0+tUCqcrMoXfzoLZgTP+3r4SO6Jn//QpzUjS8GCh22BDwdj/t2uo5728MtzPHrGi8fy4RrCz+2Yjq5+2HkkDIc9L3P/DgMNQfEkAO6pxYmnHktn0KdK3/x366yykAHa6ltlKG8J6yOl716qnoIojJTsIPxLjUkoMweQk6aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="220800735"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 28 Aug 2024 19:22:50 +0900
Received: from GBR-5CG2373LKG.adwin.renesas.com (unknown [10.226.92.33])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id AC1274007539;
	Wed, 28 Aug 2024 19:22:45 +0900 (JST)
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S . Miller" <davem@davemloft.net>,
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
Subject: [net PATCH v2 2/2] net: ravb: Fix R-Car RX frame size limit
Date: Wed, 28 Aug 2024 11:22:26 +0100
Message-Id: <20240828102226.223-3-paul.barker.ct@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240828102226.223-1-paul.barker.ct@bp.renesas.com>
References: <20240828102226.223-1-paul.barker.ct@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RX frame size limit should not be based on the current MTU setting.
Instead it should be based on the hardware capabilities.

Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
 drivers/net/ethernet/renesas/ravb_main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 471a68b0146e..b103632de4d4 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -555,8 +555,10 @@ static void ravb_emac_init_gbeth(struct net_device *ndev)
 
 static void ravb_emac_init_rcar(struct net_device *ndev)
 {
+	struct ravb_private *priv = netdev_priv(ndev);
+
 	/* Receive frame limit set register */
-	ravb_write(ndev, ndev->mtu + ETH_HLEN + VLAN_HLEN + ETH_FCS_LEN, RFLR);
+	ravb_write(ndev, priv->info->rx_max_frame_size + ETH_FCS_LEN, RFLR);
 
 	/* EMAC Mode: PAUSE prohibition; Duplex; RX Checksum; TX; RX */
 	ravb_write(ndev, ECMR_ZPF | ECMR_DM |
-- 
2.43.0


