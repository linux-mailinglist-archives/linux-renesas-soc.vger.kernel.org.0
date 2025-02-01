Return-Path: <linux-renesas-soc+bounces-12805-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D16A24A6D
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Feb 2025 17:33:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40F0318873D6
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Feb 2025 16:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04AF71BEF81;
	Sat,  1 Feb 2025 16:33:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC18B208A9;
	Sat,  1 Feb 2025 16:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738427634; cv=none; b=czRajNJlYdPGOVJdQxFtXV63XUUKy3X8i+kIqqCIJdzgu8nzMjAM4ss4JsbWZr2MbSv/3PG15F7pdDlQK3eC4qER159CO4X3YK/R+gK9W9MEcnbSybulWIZGc3wtWc2WYgdBUMbEXfJPYohNv2pWXfuEFtZo8zXxE6Qe1Tf6JIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738427634; c=relaxed/simple;
	bh=d8pve0p6sTnGuIVZquvnhhxmKzKiBPw2Hpp3MEeJIYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=diAtK0xa225aLokb4sTQ/PaYyN7DuXGUNqkJNdD0hkHR72JU01ahkBdHm81Y/y3E8pL+X+0qvXwZPs3cEi6JKqE/bWA5N7oWU++S2TSbqr3hYQ3GJtYmOX5WWks9B6JCQ2s8MxfiMvGbL/U35XueMq2QwYd4Hc31rKI636WWF5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: ZXAq82SFTwyCTbtwILs9dA==
X-CSE-MsgGUID: zZxZZH6oQ3mgdqdlF1epzA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 02 Feb 2025 01:33:51 +0900
Received: from localhost.localdomain (unknown [10.226.92.62])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 93BEF402512B;
	Sun,  2 Feb 2025 01:33:47 +0900 (JST)
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
Subject: [PATCH] net: dsa: rzn1_a5psw: Use of_get_available_child_by_name()
Date: Sat,  1 Feb 2025 16:33:43 +0000
Message-ID: <20250201163345.49779-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify a5psw_probe() by using of_get_available_child_by_name().

While at it, move of_node_put(mdio) inside the if block to avoid
code duplication.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch is only compile tested and depend upon[1]
[1] https://lore.kernel.org/all/20250201093126.7322-1-biju.das.jz@bp.renesas.com/
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


