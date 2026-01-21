Return-Path: <linux-renesas-soc+bounces-27204-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNWrLRTtcGk+awAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27204-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 16:13:24 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DEA58FF7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 16:13:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 98DA8A64D8D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 14:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E451E48AE3A;
	Wed, 21 Jan 2026 14:11:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C9A48AE32;
	Wed, 21 Jan 2026 14:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769004694; cv=none; b=EpFy+Ge5tb9zDy6Xlh7V/pq7E5UvtP/JfPQ8Gycz7g8GrGnpcJ+1aBSQSqMSNZq3tLJ/42A2oHlxJhieZ1j0GECwWKXAL6BHrBHYu7VYd/MZLMLljbuQNYGHMG2hYnAKOlOEhJs54d8OxuabRoxr8uEni7DZhs35mbbYsaGXGWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769004694; c=relaxed/simple;
	bh=r9WccWp0ajtLu0rLDpt+6kp79yZiT+r3M0SVKJZ6gXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gppux/tYtwsdUXO2yEefaRkRvJ0gB7gGyum6bXPwdEcc5zis89vm/WQXqq5rKbuqe91zWtGneKOK8HnvZQJipK6ifmIXRPF+K+DbR+fKOHLSqcTgtHAVQwbYjyDHIhGOM7Sv/g3Qp0C/PkZlhTTEGE/MjVZg57uCA8dU8b3zffA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AF20C4CEF1;
	Wed, 21 Jan 2026 14:11:33 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/4] usb: phy: generic: Convert to devm_clk_get_optional()
Date: Wed, 21 Jan 2026 15:11:21 +0100
Message-ID: <5cc21d821edf5d40f56a74cd251bb1b982876b72.1769004444.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769004444.git.geert+renesas@glider.be>
References: <cover.1769004444.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.76 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-27204-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,glider.be:email,glider.be:mid]
X-Rspamd-Queue-Id: 27DEA58FF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The generic USB PHY driver uses the existence of the "clocks" property
to see if a clock is optional or not.  Use devm_clk_get_optional()
instead, which exists for this purpose.  As usb_phy_generic.clk is now
either a valid clock pointer or NULL, and all clock operations handle
NULL pointers gracefully, several IS_ERR() checks can be removed,
simplifying the code.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

...
---
 drivers/usb/phy/phy-generic.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/phy/phy-generic.c b/drivers/usb/phy/phy-generic.c
index 13bd16668932dc90..53b0262e6e306ada 100644
--- a/drivers/usb/phy/phy-generic.c
+++ b/drivers/usb/phy/phy-generic.c
@@ -49,15 +49,13 @@ static int nop_set_suspend(struct usb_phy *x, int suspend)
 	int ret = 0;
 
 	if (suspend) {
-		if (!IS_ERR(nop->clk))
-			clk_disable_unprepare(nop->clk);
+		clk_disable_unprepare(nop->clk);
 		if (!IS_ERR(nop->vcc) && !device_may_wakeup(x->dev))
 			ret = regulator_disable(nop->vcc);
 	} else {
 		if (!IS_ERR(nop->vcc) && !device_may_wakeup(x->dev))
 			ret = regulator_enable(nop->vcc);
-		if (!IS_ERR(nop->clk))
-			clk_prepare_enable(nop->clk);
+		clk_prepare_enable(nop->clk);
 	}
 
 	return ret;
@@ -137,11 +135,9 @@ int usb_gen_phy_init(struct usb_phy *phy)
 			dev_err(phy->dev, "Failed to enable power\n");
 	}
 
-	if (!IS_ERR(nop->clk)) {
-		ret = clk_prepare_enable(nop->clk);
-		if (ret)
-			return ret;
-	}
+	ret = clk_prepare_enable(nop->clk);
+	if (ret)
+		return ret;
 
 	nop_reset(nop);
 
@@ -155,8 +151,7 @@ void usb_gen_phy_shutdown(struct usb_phy *phy)
 
 	gpiod_set_value_cansleep(nop->gpiod_reset, 1);
 
-	if (!IS_ERR(nop->clk))
-		clk_disable_unprepare(nop->clk);
+	clk_disable_unprepare(nop->clk);
 
 	if (!IS_ERR(nop->vcc)) {
 		if (regulator_disable(nop->vcc))
@@ -202,17 +197,13 @@ int usb_phy_gen_create_phy(struct device *dev, struct usb_phy_generic *nop)
 {
 	enum usb_phy_type type = USB_PHY_TYPE_USB2;
 	int err = 0;
-
 	u32 clk_rate = 0;
-	bool needs_clk = false;
 
 	if (dev->of_node) {
 		struct device_node *node = dev->of_node;
 
 		if (of_property_read_u32(node, "clock-frequency", &clk_rate))
 			clk_rate = 0;
-
-		needs_clk = of_property_present(node, "clocks");
 	}
 	nop->gpiod_reset = devm_gpiod_get_optional(dev, "reset",
 						   GPIOD_ASIS);
@@ -235,15 +226,14 @@ int usb_phy_gen_create_phy(struct device *dev, struct usb_phy_generic *nop)
 	if (!nop->phy.otg)
 		return -ENOMEM;
 
-	nop->clk = devm_clk_get(dev, "main_clk");
+	nop->clk = devm_clk_get_optional(dev, "main_clk");
 	if (IS_ERR(nop->clk)) {
 		dev_dbg(dev, "Can't get phy clock: %ld\n",
 					PTR_ERR(nop->clk));
-		if (needs_clk)
-			return PTR_ERR(nop->clk);
+		return PTR_ERR(nop->clk);
 	}
 
-	if (!IS_ERR(nop->clk) && clk_rate) {
+	if (clk_rate) {
 		err = clk_set_rate(nop->clk, clk_rate);
 		if (err) {
 			dev_err(dev, "Error setting clock rate\n");
-- 
2.43.0


