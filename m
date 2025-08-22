Return-Path: <linux-renesas-soc+bounces-20892-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 185A8B31488
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Aug 2025 12:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0B031C25515
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Aug 2025 09:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 968852EE5FA;
	Fri, 22 Aug 2025 09:50:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CDE2EB86B;
	Fri, 22 Aug 2025 09:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755856258; cv=none; b=oIVpY/lgBU1x02z4inhLr9ilQeuylTZ6+Vo8QDYJS5cvvEDNXgOWAse0B/JoelAWCyG5gk9eA1rpE0LyLG7fLReFx82AkNa4mV438BqA4wEP+sVU0fit3FwnynCmQAbq6AtOzxmDotPpWHD8kuwEvTOKi2Fk10acifyHzecATkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755856258; c=relaxed/simple;
	bh=qmfGKfAVwcdopdC1aM/b9/8wPXgCVvR10VGGaKodUeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SD8O+gaUL+KudgaNt/if2azT7Zr1uBx60Hi3gG9umoqh0K/Umfz92AjDqTi14G18JmWiuV+avbNDKM3Iq2k1B6RcijxysMsVnAwE0EG6Uv3wReHw9/mx4IVmBzgcBDs9ypg4/tx9Ddy86Dv4Afg4jZLtpOHfR4Jq9C6TMquCwnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2882C116B1;
	Fri, 22 Aug 2025 09:50:56 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-can@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/6] can: rcar_canfd: Invert global vs. channel teardown
Date: Fri, 22 Aug 2025 11:50:40 +0200
Message-ID: <00ff7a4ad18bb26a74c77134182b4efd380ecc84.1755855779.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755855779.git.geert+renesas@glider.be>
References: <cover.1755855779.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Global state is initialized and torn down before per-channel state.
Invert the order to restore symmetry.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/net/can/rcar/rcar_canfd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index 6f013f87f25c1494..341bc25df32a8973 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -2193,14 +2193,14 @@ static void rcar_canfd_remove(struct platform_device *pdev)
 	struct rcar_canfd_global *gpriv = platform_get_drvdata(pdev);
 	u32 ch;
 
-	rcar_canfd_reset_controller(gpriv);
-	rcar_canfd_disable_global_interrupts(gpriv);
-
 	for_each_set_bit(ch, &gpriv->channels_mask, gpriv->info->max_channels) {
 		rcar_canfd_disable_channel_interrupts(gpriv->ch[ch]);
 		rcar_canfd_channel_remove(gpriv, ch);
 	}
 
+	rcar_canfd_disable_global_interrupts(gpriv);
+	rcar_canfd_reset_controller(gpriv);
+
 	/* Enter global sleep mode */
 	rcar_canfd_set_bit(gpriv->base, RCANFD_GCTR, RCANFD_GCTR_GSLPR);
 	clk_disable_unprepare(gpriv->clkp);
-- 
2.43.0


