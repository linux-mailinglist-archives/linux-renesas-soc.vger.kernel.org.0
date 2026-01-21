Return-Path: <linux-renesas-soc+bounces-27205-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOWrNqLkcGk+awAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27205-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 15:37:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D06B58876
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 15:37:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 64C7A72A0DE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 14:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6538A48C409;
	Wed, 21 Jan 2026 14:11:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FA148C3FF;
	Wed, 21 Jan 2026 14:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769004696; cv=none; b=GpQil0POn58Mj6dY362GhVoekfTDf2gaKgoMC/aU2MIE0dztzx8wN4kJQoqoBJTB5/hQuq4sZjMpva5i128vgH8yg/mTfl/Hsbjn6583iKItRSI6tdX7LSeyihlIbCBVg4T0a0PjdInXE60O12JT7NewvUo/yW/Zylt7s3C8ZOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769004696; c=relaxed/simple;
	bh=vaLFZ4d9a2vOXPbplXYpViMr1qmGtkCweSDpn09S8Rs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bZu0yjwiOMuAR4+YH/x6Hk+qcXhGXRcHGbG1ISvDhc+pQdVP3yejdbDAex2i+ciP2ofzPiG8YYncqJZ1Dt7qXVHnvnTJ3BAyfmv5Zg/DYlSA8fIZPWWgGWMA3eeVMBSOC3KO356+0nCrH+gXuZjV+84CiGmfagzYJLkbCZF9zUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B35E6C116D0;
	Wed, 21 Jan 2026 14:11:34 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/4] usb: phy: generic: Convert to dev_err_probe()
Date: Wed, 21 Jan 2026 15:11:22 +0100
Message-ID: <68739eb048a394fe9198080e4e57503bb2fb9b64.1769004444.git.geert+renesas@glider.be>
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
	TAGGED_FROM(0.00)[bounces-27205-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,glider.be:mid,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 7D06B58876
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert the remaining error handling in the probe path to use the
dev_err_probe() helper, to make sure error messages and codes are not
missed, and recorded properly.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/usb/phy/phy-generic.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/phy/phy-generic.c b/drivers/usb/phy/phy-generic.c
index 53b0262e6e306ada..9f3a38b93f2649a8 100644
--- a/drivers/usb/phy/phy-generic.c
+++ b/drivers/usb/phy/phy-generic.c
@@ -227,18 +227,15 @@ int usb_phy_gen_create_phy(struct device *dev, struct usb_phy_generic *nop)
 		return -ENOMEM;
 
 	nop->clk = devm_clk_get_optional(dev, "main_clk");
-	if (IS_ERR(nop->clk)) {
-		dev_dbg(dev, "Can't get phy clock: %ld\n",
-					PTR_ERR(nop->clk));
-		return PTR_ERR(nop->clk);
-	}
+	if (IS_ERR(nop->clk))
+		return dev_err_probe(dev, PTR_ERR(nop->clk),
+				     "Can't get phy clock\n");
 
 	if (clk_rate) {
 		err = clk_set_rate(nop->clk, clk_rate);
-		if (err) {
-			dev_err(dev, "Error setting clock rate\n");
-			return err;
-		}
+		if (err)
+			return dev_err_probe(dev, err,
+					     "Error setting clock rate\n");
 	}
 
 	nop->vcc = devm_regulator_get_optional(dev, "vcc");
@@ -283,17 +280,17 @@ static int usb_phy_generic_probe(struct platform_device *pdev)
 	err = usb_phy_gen_create_phy(dev, nop);
 	if (err)
 		return err;
+
 	if (nop->gpiod_vbus) {
 		err = devm_request_threaded_irq(dev,
 						gpiod_to_irq(nop->gpiod_vbus),
 						NULL, nop_gpio_vbus_thread,
 						VBUS_IRQ_FLAGS, "vbus_detect",
 						nop);
-		if (err) {
-			dev_err(dev, "can't request irq %i, err: %d\n",
-				gpiod_to_irq(nop->gpiod_vbus), err);
-			return err;
-		}
+		if (err)
+			return dev_err_probe(dev, err, "can't request irq %i\n",
+					     gpiod_to_irq(nop->gpiod_vbus));
+
 		nop->phy.otg->state = gpiod_get_value(nop->gpiod_vbus) ?
 			OTG_STATE_B_PERIPHERAL : OTG_STATE_B_IDLE;
 	}
@@ -302,10 +299,8 @@ static int usb_phy_generic_probe(struct platform_device *pdev)
 	nop->phy.shutdown	= usb_gen_phy_shutdown;
 
 	err = usb_add_phy_dev(&nop->phy);
-	if (err) {
-		dev_err(dev, "can't register transceiver, err: %d\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err, "can't register transceiver\n");
 
 	platform_set_drvdata(pdev, nop);
 
-- 
2.43.0


