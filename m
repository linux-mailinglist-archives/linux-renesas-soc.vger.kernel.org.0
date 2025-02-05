Return-Path: <linux-renesas-soc+bounces-12864-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1173AA28A86
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 13:43:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59DB03A485F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 12:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB78E151987;
	Wed,  5 Feb 2025 12:42:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D6422CBF0;
	Wed,  5 Feb 2025 12:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759375; cv=none; b=XrVARagHYr/1n3rzdpR+eQP9xnGcf3/PbV0dIYkMTmqs+9/DyFsulTtECQIJeLt3rXvwN6RCzu4/NocHvkyDMLQU632d4LR/7oG3t09epXWyqNouA8pX7J3I0RvrAz9ufpv9VsR2MrbDGvWQvckTR52zD3mvnZFdM+ctE3cGGAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759375; c=relaxed/simple;
	bh=M59bAyhFbBpgimep1aNSv2IjiEbV0AW5sYtPvby1jk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j9yyysl5DI4ibldkYfsSEUN3gsEAeeDPDQXfeBTfd24S/45RdjlDv3frhyk7aTFK56Knnx04g67/N0DMmGjPoprUgCgzd5scPWzCvnm+5XwP8DsyDB4J/3XvtmsqWsaGueAmsw5zq9ggjJlzZD0ASQ86ivN9LA5DQAIr5fzdwXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: T6ydRXaWRROGraya7wGKig==
X-CSE-MsgGUID: KqT/9pnmRKGRVER+RoQePg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Feb 2025 21:42:52 +0900
Received: from localhost.localdomain (unknown [10.226.92.225])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 18CD341F86A7;
	Wed,  5 Feb 2025 21:42:48 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH net-next v2 2/7] net: dsa: rzn1_a5psw: Use of_get_available_child_by_name()
Date: Wed,  5 Feb 2025 12:42:22 +0000
Message-ID: <20250205124235.53285-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205124235.53285-1-biju.das.jz@bp.renesas.com>
References: <20250205124235.53285-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify a5psw_probe() by using of_get_available_child_by_name().

While at it, move of_node_put(mdio) inside the if block to avoid code
duplication.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Rebased and added patch suffix net-next.
---
 drivers/net/dsa/rzn1_a5psw.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 66974379334a..31ea8130a495 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1248,18 +1248,16 @@ static int a5psw_probe(struct platform_device *pdev)
 	if (ret)
 		goto clk_disable;
 
-	mdio = of_get_child_by_name(dev->of_node, "mdio");
-	if (of_device_is_available(mdio)) {
+	mdio = of_get_available_child_by_name(dev->of_node, "mdio");
+	if (mdio) {
 		ret = a5psw_probe_mdio(a5psw, mdio);
+		of_node_put(mdio);
 		if (ret) {
-			of_node_put(mdio);
 			dev_err(dev, "Failed to register MDIO: %d\n", ret);
 			goto hclk_disable;
 		}
 	}
 
-	of_node_put(mdio);
-
 	ds = &a5psw->ds;
 	ds->dev = dev;
 	ds->num_ports = A5PSW_PORTS_NUM;
-- 
2.43.0


