Return-Path: <linux-renesas-soc+bounces-14063-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD87CA54B0F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 13:43:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9630916E6D1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 12:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E5720B7F4;
	Thu,  6 Mar 2025 12:43:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDFB190051;
	Thu,  6 Mar 2025 12:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741265004; cv=none; b=QhabSFCBWRmtMhV52/mSDs69PfjNFTEcU54ooonhPUyfmaftF2A/PSzGSDIM6w0LuiEj2mN8S2ODlBIqY7586NXmCl5Ua9DB7U+aKoRzD6VkLVykTFr0Onr9ol7/bEm842Tg9UoZkYvLLkE2njMDyhDFU5oSYdvjor2dNM/lfis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741265004; c=relaxed/simple;
	bh=0DB2R/RnZH6Ig/XXSJzhncNhnAKQvfnwEp5CeF7bOTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OWuUb/7uSibXrFbfOtl8fDzvPToEmIoaeXYUmHXWPQmytZki/7OhAK4odcKWs2xzVcWh5NfhCuElMimUvt5+LhucX9pZnBzODOSfhb5W+jCfx37sxX2nRtvCC3ALQOnKcZXT1JDNa+sCO6nxQeBR+OvYSCTVtBWQ9HV2KdTSd0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 3xwp7YbISsmWvLVugesH0g==
X-CSE-MsgGUID: 11moz4PsRbutR4JsvuPDvg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 06 Mar 2025 21:43:21 +0900
Received: from localhost.localdomain (unknown [10.226.92.10])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 901954281B03;
	Thu,  6 Mar 2025 21:43:18 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-can@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 04/11] can: rcar_canfd: Add ch_interface_mode variable to struct rcar_canfd_hw_info
Date: Thu,  6 Mar 2025 12:42:43 +0000
Message-ID: <20250306124256.93033-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306124256.93033-1-biju.das.jz@bp.renesas.com>
References: <20250306124256.93033-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

R-Car Gen4 has channel specific interface mode bit for setting CAN-FD or
Classical CAN mode whereas on R-Car Gen3 it is global. Add a
ch_interface_mode variable to struct rcar_canfd_hw_info to handle this
difference.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * No change.
v3:
 * New patch.
---
 drivers/net/can/rcar/rcar_canfd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index 8b326977ddf7..e21041fe432c 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -516,6 +516,7 @@ struct rcar_canfd_hw_info {
 	/* hardware features */
 	unsigned shared_global_irqs:1;	/* Has shared global irqs */
 	unsigned multi_channel_irqs:1;	/* Has multiple channel irqs */
+	unsigned ch_interface_mode:1;	/* Has channel interface mode */
 };
 
 /* Channel priv data */
@@ -596,6 +597,7 @@ static const struct rcar_canfd_hw_info rcar_gen4_hw_info = {
 	.max_channels = 8,
 	.postdiv = 2,
 	.shared_global_irqs = 1,
+	.ch_interface_mode = 1,
 };
 
 static const struct rcar_canfd_hw_info rzg2l_hw_info = {
@@ -683,7 +685,7 @@ static void rcar_canfd_tx_failure_cleanup(struct net_device *ndev)
 
 static void rcar_canfd_set_mode(struct rcar_canfd_global *gpriv)
 {
-	if (is_gen4(gpriv)) {
+	if (gpriv->info->ch_interface_mode) {
 		u32 ch, val = gpriv->fdmode ? RCANFD_GEN4_FDCFG_FDOE
 					    : RCANFD_GEN4_FDCFG_CLOE;
 
-- 
2.43.0


