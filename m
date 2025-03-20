Return-Path: <linux-renesas-soc+bounces-14696-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D1FA6A990
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 16:19:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F33701890BBF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 15:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36891E25F9;
	Thu, 20 Mar 2025 15:16:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5180F1DDA31
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Mar 2025 15:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742483768; cv=none; b=t6f1FUGXEC2cZXvhVcmF6d83KReSHVG9J+3WgEYOALBw/eYVOre9miRab1EwR6q59sPbBEc53FfyfD48swXiJRxer7531a9YdKURhSPcj5OrQNqVCWwt5yaGAtZfgIZriv25risVQ4ymQwUn9TPOLvt8LvHvXcM0lgE4dMIY3fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742483768; c=relaxed/simple;
	bh=8mDKlB4zStFV9ZDiEQFcBMofkUekV5QNGKPeKjL6LNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dHzVjQD31cfS6+TXmbVZ996lacGY4hLGh1Wy7HIVciOd4A9ZbryOf3oRXVhAIkp+P94QZNeyFr+1exdkAohtGzO3JbpQ9lM6oTO8A+qxBmK99j7tzDkaGi7qdp6m8hHABYFX/AX0QTx5M7Wkg02lllzw/DGp7priiT0XWaV1BVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4ZJTg21kqrz4wyWv
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Mar 2025 16:15:58 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:a7a2:d643:e23:c1c8])
	by michel.telenet-ops.be with cmsmtp
	id T3Fn2E00C3dQZlQ063FnUp; Thu, 20 Mar 2025 16:15:51 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tvHc7-0000000EusU-3TIs;
	Thu, 20 Mar 2025 16:15:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tvHcZ-0000000BsKE-0NI2;
	Thu, 20 Mar 2025 16:15:47 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-can@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] phy: can-transceiver: Re-instate "mux-states" property presence check
Date: Thu, 20 Mar 2025 16:15:42 +0100
Message-ID: <3d7e0d723908284e8cf06ad1f7950c03173178f3.1742483710.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the Renesas Gray Hawk Single development board:

    can-transceiver-phy can-phy0: /can-phy0: failed to get mux-state (0)

"mux-states" is an optional property for CAN transceivers.  However,
mux_get() always prints an error message in case of an error, including
when the property is not present, confusing the user.

Fix this by re-instating the property presence check (this time using
the proper API) in a wrapper around devm_mux_state_get().  When the
multiplexer subsystem gains support for optional muxes, the wrapper can
just be removed.

In addition, propagate all real errors upstream, instead of ignoring
them.

Fixes: d02dfd4ceb2e9f34 ("phy: can-transceiver: Drop unnecessary "mux-states" property presence check")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Alternatively, the multiplexer subsystem needs to gain support for
getting an optional mux...

v2:
  - Add and use devm_mux_state_get_optional(),
  - No given tags added, as the new solution is different.
---
 drivers/phy/phy-can-transceiver.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/phy-can-transceiver.c b/drivers/phy/phy-can-transceiver.c
index 2bec70615449f94d..f59caff4b3d4c267 100644
--- a/drivers/phy/phy-can-transceiver.c
+++ b/drivers/phy/phy-can-transceiver.c
@@ -93,6 +93,16 @@ static const struct of_device_id can_transceiver_phy_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, can_transceiver_phy_ids);
 
+/* Temporary wrapper until the multiplexer subsystem supports optional muxes */
+static inline struct mux_state *
+devm_mux_state_get_optional(struct device *dev, const char *mux_name)
+{
+	if (!of_property_present(dev->of_node, "mux-states"))
+		return NULL;
+
+	return devm_mux_state_get(dev, mux_name);
+}
+
 static int can_transceiver_phy_probe(struct platform_device *pdev)
 {
 	struct phy_provider *phy_provider;
@@ -114,13 +124,11 @@ static int can_transceiver_phy_probe(struct platform_device *pdev)
 	match = of_match_node(can_transceiver_phy_ids, pdev->dev.of_node);
 	drvdata = match->data;
 
-	mux_state = devm_mux_state_get(dev, NULL);
-	if (IS_ERR(mux_state)) {
-		if (PTR_ERR(mux_state) == -EPROBE_DEFER)
-			return PTR_ERR(mux_state);
-	} else {
-		can_transceiver_phy->mux_state = mux_state;
-	}
+	mux_state = devm_mux_state_get_optional(dev, NULL);
+	if (IS_ERR(mux_state))
+		return PTR_ERR(mux_state);
+
+	can_transceiver_phy->mux_state = mux_state;
 
 	phy = devm_phy_create(dev, dev->of_node,
 			      &can_transceiver_phy_ops);
-- 
2.43.0


