Return-Path: <linux-renesas-soc+bounces-15303-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B491A78C0A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Apr 2025 12:23:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A71BE1705C2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Apr 2025 10:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD8C23496B;
	Wed,  2 Apr 2025 10:22:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E7253BE;
	Wed,  2 Apr 2025 10:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743589369; cv=none; b=kH0ZLOlAmrncCFJKKiX2TJ/UTLS0XbANsUv/cKaEeCpn8R4LRWQDaKaBLtVjMKoofuBfWmCEVnu1UIDMuA+2iwTVtaP6mp1PvafocqmzEujW4jLPt+34gbaBic3ePZCGWLv8BWE352tEb6OeDGFO3Ef0yID/8JCP2KlThcTV6zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743589369; c=relaxed/simple;
	bh=UCfydqd9zT+xvD4YM8nH6iXme/emAuct9ppKIZ7ze/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KRxmME9qLS3D1OgafbMtDoi/qnGOyxPidjsVn63auPQjtWHMSbYlPpR8z40B62ECjlK1ST3XqkFlrrUQ38cZDkkOyVrHFn+byw4e0+O4mNFgCk229zcwod6ey1AJa9bSsnWKVHtJ/49FVAWhtbRwcQXZF5dJsYQV0NTbWv5ZLIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: FyxOSCR6SICwaf+st//4sg==
X-CSE-MsgGUID: rwAwC4NnQ16lG4z4LQY6Mw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 02 Apr 2025 19:22:47 +0900
Received: from localhost.localdomain (unknown [10.226.93.220])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2AA6E4222E78;
	Wed,  2 Apr 2025 19:22:43 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
	linux-can@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v8 03/19] can: rcar_canfd: Use of_get_available_child_by_name()
Date: Wed,  2 Apr 2025 11:21:55 +0100
Message-ID: <20250402102226.28032-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250402102226.28032-1-biju.das.jz@bp.renesas.com>
References: <20250402102226.28032-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify rcar_canfd_probe() using of_get_available_child_by_name().

While at it, move of_node_put(child) inside the if block to avoid
additional check if of_child is NULL.

Reviewed-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v7->v8:
 * No change.
v6->v7:
 * No change.
v5->v6:
 * No change.
v4->v5:
 * No change.
v3->v4:
 * No change.
v2->v3:
 * Added Rb tag from Geert.
v2:
 * Added to this series as dependency patch hit on can-next.
 * Added Rb tag from Vincent Mailhol
 * Dropped redundant comment from commit description.
---
 drivers/net/can/rcar/rcar_canfd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index aa3df0d05b85..2d9569fd0e0b 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -1855,13 +1855,13 @@ static int rcar_canfd_probe(struct platform_device *pdev)
 
 	for (i = 0; i < info->max_channels; ++i) {
 		name[7] = '0' + i;
-		of_child = of_get_child_by_name(dev->of_node, name);
-		if (of_child && of_device_is_available(of_child)) {
+		of_child = of_get_available_child_by_name(dev->of_node, name);
+		if (of_child) {
 			channels_mask |= BIT(i);
 			transceivers[i] = devm_of_phy_optional_get(dev,
 							of_child, NULL);
+			of_node_put(of_child);
 		}
-		of_node_put(of_child);
 		if (IS_ERR(transceivers[i]))
 			return PTR_ERR(transceivers[i]);
 	}
-- 
2.43.0


