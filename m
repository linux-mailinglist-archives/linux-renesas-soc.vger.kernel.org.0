Return-Path: <linux-renesas-soc+bounces-3162-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0834686724D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 11:57:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A69121F2D97D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 10:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80DB043AA8;
	Mon, 26 Feb 2024 10:55:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BE01CD37
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2024 10:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708944903; cv=none; b=NxyaovJyRvWsEn3JeJQS9/xfR09zIV/ZACfx3dIwJukb+Je2pu3CIEOdlfCjI7McdKyjhaS2szHXBfIzlLr/hGE4POi/I5VCDtO3L0tJq/fqWfsPpm9BcUVZyHSCv1Vf6QC2Gi87hlt6IBm7eUs7Ii/4FBWPr1tnysN2HB9lCWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708944903; c=relaxed/simple;
	bh=uIO3ivE9OMuVei6Mkpu/UIskfZ1MslhV7m53wpD32OU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=No9VeC0ZYvmuuGw+ZS23mbahtT0ZF4dF2W87tXNVoIQRrjeS+bNJc2pwnpqxNrmYq8Jx1ReQj1nPmEv2GVliFSJ6LiUJMJqbK6TePKatNHUDbyTMCGToPwk+DpKFIYxKI41PLUSgJppFGJNUBHTJVtSZKFdClgodLquMwg01DVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7662:e968:947d:f3d0])
	by xavier.telenet-ops.be with bizsmtp
	id rmut2B00N5Kh3Z501mutSV; Mon, 26 Feb 2024 11:54:54 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1reYdA-001lUY-91;
	Mon, 26 Feb 2024 11:54:53 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1reYdJ-0044Jt-Or;
	Mon, 26 Feb 2024 11:54:53 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sebastian Reichel <sre@kernel.org>,
	Andrew Davis <afd@ti.com>
Cc: linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] power: reset: rmobile-reset: Make sysc_base2 local
Date: Mon, 26 Feb 2024 11:54:52 +0100
Message-Id: <35f04935c48ae55dc562071e0a1d6fca65234a58.1708944642.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The static global variable sysc_base2 is no longer used outside the
probe method and the reset handler, so it can be converted to a local
variable, and passed to the reset handler via its callback data.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Depends on commits 0867276eb12230a5 ("power: reset: rmobile-reset: Use
devm_platform_ioremap_resource() helper") and ba1188ea8be80a7b ("power:
reset: rmobile-reset: Use devm_register_sys_off_handler(RESTART)") in
battery/for-next (next-20240214 and later).
---
 drivers/power/reset/rmobile-reset.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/power/reset/rmobile-reset.c b/drivers/power/reset/rmobile-reset.c
index 14682cd59e618d5f..7dbc51c32b0eb4b0 100644
--- a/drivers/power/reset/rmobile-reset.c
+++ b/drivers/power/reset/rmobile-reset.c
@@ -19,10 +19,10 @@
 /* Reset Control Register 2 */
 #define RESCNT2_PRES	0x80000000	/* Soft power-on reset */
 
-static void __iomem *sysc_base2;
-
 static int rmobile_reset_handler(struct sys_off_data *data)
 {
+	void __iomem *sysc_base2 = (void __iomem *)data->cb_data;
+
 	/* Let's assume we have acquired the HPB semaphore */
 	writel(RESCNT2_PRES, sysc_base2 + RESCNT2);
 
@@ -31,6 +31,7 @@ static int rmobile_reset_handler(struct sys_off_data *data)
 
 static int rmobile_reset_probe(struct platform_device *pdev)
 {
+	void __iomem *sysc_base2;
 	int error;
 
 	sysc_base2 = devm_platform_ioremap_resource(pdev, 1);
@@ -41,7 +42,7 @@ static int rmobile_reset_probe(struct platform_device *pdev)
 					      SYS_OFF_MODE_RESTART,
 					      SYS_OFF_PRIO_HIGH,
 					      rmobile_reset_handler,
-					      NULL);
+					      (__force void *)sysc_base2);
 	if (error) {
 		dev_err(&pdev->dev,
 			"cannot register restart handler (err=%d)\n", error);
-- 
2.34.1


