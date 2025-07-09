Return-Path: <linux-renesas-soc+bounces-19453-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 779E9AFF170
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 21:06:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7F71176A33
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 19:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4872238178;
	Wed,  9 Jul 2025 19:06:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808106BFCE;
	Wed,  9 Jul 2025 19:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752087990; cv=none; b=Wc0SQtbvPBCPDRvRgko1pu6nkKF94uSmU2DmNFpzhOIlt1S5x789ghh6E8PEOeSZvYvncEoT20E0hYLlY7aQd8ceCmQ3bUZzQaEIANbxlVTm2uyJM8GBOKnSshhAxbO4JXCOyfySl2IosxOmp+vnrKlXUBiFQ6skqy1bci8buFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752087990; c=relaxed/simple;
	bh=DSSHuCVYtK+/ilyszFbVwShAauYmmY3nny/QF2q0Bdw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qX6M4y36sXQ7JA9PkiG/l1iiT7k5OUqLZmdKhnKVcGJeY1R5w7b7XoYJuMoesrJ/xkxuYVE5eULE19BQoHTS5LGqqS5oCnYGmPDiyWIsHZtbYx7qmTOMVuGnMibTIftz56uetWu7e/mj4dsC4pjVZCTXLlKQ+do4+UJvkk9KLSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCF1CC4CEEF;
	Wed,  9 Jul 2025 19:06:28 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-usb@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] usb: renesas_usbhs: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  9 Jul 2025 21:06:26 +0200
Message-ID: <e1136dcd351a19b2e7145436bea1f38faa93a677.1752087914.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Renesas USBHS driver from SIMPLE_DEV_PM_OPS() to
DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().  This lets us drop the
__maybe_unused annotations from its suspend and resume callbacks, and
reduces kernel size in case CONFIG_PM or CONFIG_PM_SLEEP is disabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/usb/renesas_usbhs/common.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index f52418fe3fd47dcd..18a6ef4dce517f0c 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -823,7 +823,7 @@ static void usbhs_remove(struct platform_device *pdev)
 	usbhs_pipe_remove(priv);
 }
 
-static __maybe_unused int usbhsc_suspend(struct device *dev)
+static int usbhsc_suspend(struct device *dev)
 {
 	struct usbhs_priv *priv = dev_get_drvdata(dev);
 	struct usbhs_mod *mod = usbhs_mod_get_current(priv);
@@ -839,7 +839,7 @@ static __maybe_unused int usbhsc_suspend(struct device *dev)
 	return 0;
 }
 
-static __maybe_unused int usbhsc_resume(struct device *dev)
+static int usbhsc_resume(struct device *dev)
 {
 	struct usbhs_priv *priv = dev_get_drvdata(dev);
 	struct platform_device *pdev = usbhs_priv_to_pdev(priv);
@@ -856,12 +856,12 @@ static __maybe_unused int usbhsc_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(usbhsc_pm_ops, usbhsc_suspend, usbhsc_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(usbhsc_pm_ops, usbhsc_suspend, usbhsc_resume);
 
 static struct platform_driver renesas_usbhs_driver = {
 	.driver		= {
 		.name	= "renesas_usbhs",
-		.pm	= &usbhsc_pm_ops,
+		.pm	= pm_sleep_ptr(&usbhsc_pm_ops),
 		.of_match_table = usbhs_of_match,
 	},
 	.probe		= usbhs_probe,
-- 
2.43.0


