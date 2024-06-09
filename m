Return-Path: <linux-renesas-soc+bounces-5978-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AC6901817
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Jun 2024 22:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3B56B2051E
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Jun 2024 20:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B303C18B1A;
	Sun,  9 Jun 2024 20:16:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1791E17C6D
	for <linux-renesas-soc@vger.kernel.org>; Sun,  9 Jun 2024 20:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717964196; cv=none; b=LxPw0OB69M5xZWxzfuomYT96LQmJV6940IFtpInGbv3jCswypdLS3JVBUmcesbV23A1ztxbh56yLMBCnl67euqYHj9AgKlJ8CFATAfu/7XHKVoRmk1YJAEHQXFIiW1v/I7GGTzNt7L0Xlo71l1fPGuRY/qwjtNfvib4dpS97G+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717964196; c=relaxed/simple;
	bh=OehodMmgrjPwceCRkkBfepU7Tziph6aPpb3ca5qyHW8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=m0VJb5rExUlHfQVNsLSJ8uDc7QSkaX0YdVkCW0HqNVFL/AMNZVrU6b8NUMzUEaI/Sn4pjAaOgKuMgzd1WCofhkxvNUmNI6pMnOlZEWL/G2AEUN0J619tUh+rT97/oynIQD+Gq0CKf1/Ug3MXqUQtCobcNtGIcAscNZhxJkzTjwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,226,1712588400"; 
   d="scan'208";a="211185676"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 10 Jun 2024 05:16:26 +0900
Received: from localhost.localdomain (unknown [10.226.92.40])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id ECA7D4003FC2;
	Mon, 10 Jun 2024 05:16:24 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] reset: rzg2l-usbphy-ctrl: Move reset_deassert after devm_*()
Date: Sun,  9 Jun 2024 21:16:22 +0100
Message-Id: <20240609201622.87166-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move reset_control_deassert after devm_reset_controller_register() to
simplify the error path in probe().

While at it, drop the blank line before devm_reset_controller_register().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index 8f6fbd978591..93c65a57686d 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -121,20 +121,19 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->rstc),
 				     "failed to get reset\n");
 
-	error = reset_control_deassert(priv->rstc);
-	if (error)
-		return error;
-
 	priv->rcdev.ops = &rzg2l_usbphy_ctrl_reset_ops;
 	priv->rcdev.of_reset_n_cells = 1;
 	priv->rcdev.nr_resets = NUM_PORTS;
 	priv->rcdev.of_node = dev->of_node;
 	priv->rcdev.dev = dev;
-
 	error = devm_reset_controller_register(dev, &priv->rcdev);
 	if (error)
 		return error;
 
+	error = reset_control_deassert(priv->rstc);
+	if (error)
+		return error;
+
 	spin_lock_init(&priv->lock);
 	dev_set_drvdata(dev, priv);
 
-- 
2.25.1


