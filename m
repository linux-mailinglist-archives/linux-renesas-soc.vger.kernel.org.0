Return-Path: <linux-renesas-soc+bounces-14628-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA5AA68DC3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Mar 2025 14:26:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 772B93BF54A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Mar 2025 13:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E4EA2571CB;
	Wed, 19 Mar 2025 13:26:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E64B2566E2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Mar 2025 13:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742390762; cv=none; b=tjr+Hzpe0PbQGInWXsBRYHdBCIHK4bs/uCdIHtT7CZlNP+ptqDrwOgogxRC9DzsFiqW8uz/Hb5+JhQxuwMXPK5pOQh57eR5V5ZkoYJKbjQDbpV7swo4AA/0b/NWF9krAkO+E5ctQfxS/N3XJUkpWG5f7blIE7cM11PcsGH0hw/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742390762; c=relaxed/simple;
	bh=H6XYnRoO0ffYCwemv6mdC/71RwSZcugq+eoIdiEoCs4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y3q/GY3HGpkjSbIlUm0Uhwf7xDkrsil7djHSCrrvpkUTbUxkMbh2B+z97KoaoIzqFJLyhaacCcfoZaY/kZjIqX9ATJKUJEE9IiCz9D3YCWxijC9q9Q6JAXVX3NHuUEPp8WOjCUaxhxVN36Rko6Ue+eAQBCCjcrgwMwm6Vdc+ewQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1557:27ad:a073:92ed])
	by laurent.telenet-ops.be with cmsmtp
	id SdRt2E0010FbbzD01dRtAa; Wed, 19 Mar 2025 14:25:56 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tutQ9-0000000EmS6-1drF;
	Wed, 19 Mar 2025 14:25:49 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tutQa-0000000BlRv-460m;
	Wed, 19 Mar 2025 14:25:48 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob@rox.of.borg,
	Herring@rox.of.borg,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Aswath Govindraju <a-govindraju@ti.com>
Cc: linux-can@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] phy: can-transceiver: Re-instate "mux-states" property presence check
Date: Wed, 19 Mar 2025 14:25:47 +0100
Message-ID: <6bcfde63b3a6b25640a56be2e24a357e41f8400f.1742390569.git.geert+renesas@glider.be>
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

Fix this by re-instating the property presence check.

This is bascially a revert of commit d02dfd4ceb2e9f34 ("phy:
can-transceiver: Drop unnecessary "mux-states" property presence
check"), with two changes:
  1. Use the proper API for checking whether a property is present,
  2. Do not print an error message, as the mux core already takes care
     of that.

Fixes: d02dfd4ceb2e9f34 ("phy: can-transceiver: Drop unnecessary "mux-states" property presence check")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Alternatively, the multiplexer subsystem needs to gain support for
getting an optional mux...
---
 drivers/phy/phy-can-transceiver.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/phy-can-transceiver.c b/drivers/phy/phy-can-transceiver.c
index 2bec70615449f94d..539b3446b9c33eed 100644
--- a/drivers/phy/phy-can-transceiver.c
+++ b/drivers/phy/phy-can-transceiver.c
@@ -103,7 +103,6 @@ static int can_transceiver_phy_probe(struct platform_device *pdev)
 	struct phy *phy;
 	struct gpio_desc *standby_gpio;
 	struct gpio_desc *enable_gpio;
-	struct mux_state *mux_state;
 	u32 max_bitrate = 0;
 	int err;
 
@@ -114,11 +113,13 @@ static int can_transceiver_phy_probe(struct platform_device *pdev)
 	match = of_match_node(can_transceiver_phy_ids, pdev->dev.of_node);
 	drvdata = match->data;
 
-	mux_state = devm_mux_state_get(dev, NULL);
-	if (IS_ERR(mux_state)) {
-		if (PTR_ERR(mux_state) == -EPROBE_DEFER)
+	if (of_property_present(dev->of_node, "mux-states")) {
+		struct mux_state *mux_state;
+
+		mux_state = devm_mux_state_get(dev, NULL);
+		if (IS_ERR(mux_state))
 			return PTR_ERR(mux_state);
-	} else {
+
 		can_transceiver_phy->mux_state = mux_state;
 	}
 
-- 
2.43.0


