Return-Path: <linux-renesas-soc+bounces-27206-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEotJLvkcGk+awAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27206-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 15:37:47 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1F158885
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 15:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 486CD8CE423
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 14:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA20148C8C5;
	Wed, 21 Jan 2026 14:11:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFB448C8B9;
	Wed, 21 Jan 2026 14:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769004697; cv=none; b=oZ5o1R3nWEn9hxpfuLqsMqYqJ8vZJT6gJVANvleUMOqqFYt7oyDR9au7pvXEhks5L24f7vseIfUIrqJSDxAH/dq5qUH7Q2vLM1uY7HSIhQ20X93h65IOtB3BVZ46Wt79Ada5hoVHwwc6y7B+DnSzw0tipdK8cUhOV1vhKN+GKzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769004697; c=relaxed/simple;
	bh=AniItZ42tKauvjfP/x2WMTbXkdm/ea1F8M05YC6oMHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gh30Hmxin9YZpkvrO3hPI52o3mvA3plZa8usxz0dkUhdtAxxEcDUU6ywNuuAKKLHtL+3HJWod5p8TorjktQH9te2/hIF5pO0zPNTwrFVCVVmf0UN2z1hmf61PtsOzZ+46X41O2RQHYccYbh99STGWYxDU+mNjU3eeM2D9f6PNTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3CFC4CEF1;
	Wed, 21 Jan 2026 14:11:36 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/4] usb: phy: generic: Convert to device property API
Date: Wed, 21 Jan 2026 15:11:23 +0100
Message-ID: <e69adff1d6ca7b26cd2a4117d45392e05470d27c.1769004444.git.geert+renesas@glider.be>
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
	TAGGED_FROM(0.00)[bounces-27206-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,glider.be:mid,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: EB1F158885
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert from OF properties to device properties, to make the driver more
generic and simpler.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/usb/phy/phy-generic.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/phy/phy-generic.c b/drivers/usb/phy/phy-generic.c
index 9f3a38b93f2649a8..de26b302334de974 100644
--- a/drivers/usb/phy/phy-generic.c
+++ b/drivers/usb/phy/phy-generic.c
@@ -20,7 +20,7 @@
 #include <linux/slab.h>
 #include <linux/clk.h>
 #include <linux/regulator/consumer.h>
-#include <linux/of.h>
+#include <linux/property.h>
 #include <linux/gpio/consumer.h>
 #include <linux/delay.h>
 
@@ -199,12 +199,7 @@ int usb_phy_gen_create_phy(struct device *dev, struct usb_phy_generic *nop)
 	int err = 0;
 	u32 clk_rate = 0;
 
-	if (dev->of_node) {
-		struct device_node *node = dev->of_node;
-
-		if (of_property_read_u32(node, "clock-frequency", &clk_rate))
-			clk_rate = 0;
-	}
+	device_property_read_u32(dev, "clock-frequency", &clk_rate);
 	nop->gpiod_reset = devm_gpiod_get_optional(dev, "reset",
 						   GPIOD_ASIS);
 	err = PTR_ERR_OR_ZERO(nop->gpiod_reset);
@@ -269,7 +264,6 @@ EXPORT_SYMBOL_GPL(usb_phy_gen_create_phy);
 static int usb_phy_generic_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *dn = dev->of_node;
 	struct usb_phy_generic	*nop;
 	int err;
 
@@ -305,7 +299,7 @@ static int usb_phy_generic_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, nop);
 
 	device_set_wakeup_capable(dev,
-				  of_property_read_bool(dn, "wakeup-source"));
+				  device_property_read_bool(dev, "wakeup-source"));
 
 	return 0;
 }
-- 
2.43.0


