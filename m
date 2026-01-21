Return-Path: <linux-renesas-soc+bounces-27203-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +J9sCh3qcGk+awAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27203-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 16:00:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE7858DDB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 16:00:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5544AA6466F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 14:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 474D448AE13;
	Wed, 21 Jan 2026 14:11:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2887C481648;
	Wed, 21 Jan 2026 14:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769004694; cv=none; b=As3/dl2R8FnH1ykrqoBt/Q5LuWblwiDA9GVYE1HvAZhYxeGe6RGwpCA4S4M7ej39koqAIaNUiVwJ4RH4sexdQPWVxO/2HoVQizem5FxQoxIkiaE83Bt80mI3s6XJOykcONf29QOndIg3Ss3KORs3pJ0X0ikIgoemXHoVnp/BTxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769004694; c=relaxed/simple;
	bh=bTMo10SlkojFeqNM7uZ/l/Lwpv6fap2MUX1NzsAplUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KJZCV8Ch0CSHtXYDvMyUnOBqkuC6eubJi9CRl36q470vnxXLzCBPKvNuVaWNJiEI4uJ7I6qwZZRn7WmatQ9NdZGR8E1mxoQIGGXVvLNey/ycErHNt2S4rkOEMGrQ39n2d1d0BMmdvtZ/dIEFbM1aPF499xFRhYAtCMMnvvKiDMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B05C116D0;
	Wed, 21 Jan 2026 14:11:31 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/4] usb: phy: generic: Always use dev in usb_phy_generic_probe()
Date: Wed, 21 Jan 2026 15:11:20 +0100
Message-ID: <df4ce4bac088f0a4703dd8a3d1255b9072c0b8c6.1769004444.git.geert+renesas@glider.be>
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
	TAGGED_FROM(0.00)[bounces-27203-lists,linux-renesas-soc=lfdr.de,renesas];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 7FE7858DDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

usb_phy_generic_probe() already has a "dev" variable that serves as a
shorthand for "&pdev->dev".  Use it where appropriate, to shorten the
code.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/usb/phy/phy-generic.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/phy/phy-generic.c b/drivers/usb/phy/phy-generic.c
index 8423be59ec0ffbe8..13bd16668932dc90 100644
--- a/drivers/usb/phy/phy-generic.c
+++ b/drivers/usb/phy/phy-generic.c
@@ -294,13 +294,13 @@ static int usb_phy_generic_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 	if (nop->gpiod_vbus) {
-		err = devm_request_threaded_irq(&pdev->dev,
+		err = devm_request_threaded_irq(dev,
 						gpiod_to_irq(nop->gpiod_vbus),
 						NULL, nop_gpio_vbus_thread,
 						VBUS_IRQ_FLAGS, "vbus_detect",
 						nop);
 		if (err) {
-			dev_err(&pdev->dev, "can't request irq %i, err: %d\n",
+			dev_err(dev, "can't request irq %i, err: %d\n",
 				gpiod_to_irq(nop->gpiod_vbus), err);
 			return err;
 		}
@@ -313,14 +313,13 @@ static int usb_phy_generic_probe(struct platform_device *pdev)
 
 	err = usb_add_phy_dev(&nop->phy);
 	if (err) {
-		dev_err(&pdev->dev, "can't register transceiver, err: %d\n",
-			err);
+		dev_err(dev, "can't register transceiver, err: %d\n", err);
 		return err;
 	}
 
 	platform_set_drvdata(pdev, nop);
 
-	device_set_wakeup_capable(&pdev->dev,
+	device_set_wakeup_capable(dev,
 				  of_property_read_bool(dn, "wakeup-source"));
 
 	return 0;
-- 
2.43.0


