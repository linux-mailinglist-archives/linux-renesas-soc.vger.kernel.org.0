Return-Path: <linux-renesas-soc+bounces-4666-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EFD8A70A9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 17:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B7F72819A3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 15:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FBA71327F7;
	Tue, 16 Apr 2024 15:53:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9962013BAE6
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Apr 2024 15:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713282839; cv=none; b=ACQFmdSIeAXCFaGGRh9XuENG4dCyBJ1gDIbqcMTxI8GaiFqkNHU9Uv4ACUD+2ZTNs6tM4YbbNMi/2CO6lQM6A+DDrjvgTKgxoeh7pdzdjme2G5rtF0fjYSX6Itr0pfW+QMdNV4d3HItBuPw7Uks0TqP/EO8mM79P/t5m+XetW88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713282839; c=relaxed/simple;
	bh=mfpRafmUuJiIQpfZ3GGN6ncw2AlHg6Tk4UtFfCKqWBA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=t5YnnwpvrLuC+s8CQ5O/z8s5HD8sFlnUmIglgEa9suSS0kuienYQQWqjDOFMZMmch3msMOhOeXBbIPPgVXVFdE5I3eLF0/W+qONYNs9F96trTFxLnBtYOdsE5DFs7UP5lgY8NummsGSpos25eAGWA5gMW2f1JBWiCSZZlLg2nwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by andre.telenet-ops.be with bizsmtp
	id Brtp2C0020SSLxL01rtptB; Tue, 16 Apr 2024 17:53:49 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rwl7R-008Jte-Hk;
	Tue, 16 Apr 2024 17:53:49 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rwl80-00Ebsc-Vf;
	Tue, 16 Apr 2024 17:53:48 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-usb@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] usb: renesas_usbhs: Remove renesas_usbhs_get_info() wrapper
Date: Tue, 16 Apr 2024 17:53:45 +0200
Message-Id: <fa296af4452dfe394a58b75fd44c3bb9591936eb.1713282736.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The renesas_usbhs_get_info() wrapper was useful for legacy board code.
Since commit 1fa59bda21c7fa36 ("ARM: shmobile: Remove legacy board code
for Armadillo-800 EVA") in v4.3, it is no longer used outside the USBHS
driver, and provides no added value over dev_get_platdata(), while
obfuscating the real operation.

Drop it, and replace it by dev_get_platdata() in its sole user.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/usb/renesas_usbhs/common.c | 2 +-
 include/linux/usb/renesas_usbhs.h  | 5 -----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index b6bef9081bf275f0..edc43f169d493c65 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -613,7 +613,7 @@ static int usbhs_probe(struct platform_device *pdev)
 
 	info = of_device_get_match_data(dev);
 	if (!info) {
-		info = renesas_usbhs_get_info(pdev);
+		info = dev_get_platdata(dev);
 		if (!info)
 			return dev_err_probe(dev, -EINVAL, "no platform info\n");
 	}
diff --git a/include/linux/usb/renesas_usbhs.h b/include/linux/usb/renesas_usbhs.h
index 372898d9eeb00bbc..67bfcda6c7d2779e 100644
--- a/include/linux/usb/renesas_usbhs.h
+++ b/include/linux/usb/renesas_usbhs.h
@@ -194,9 +194,4 @@ struct renesas_usbhs_platform_info {
 	struct renesas_usbhs_driver_param	driver_param;
 };
 
-/*
- * macro for platform
- */
-#define renesas_usbhs_get_info(pdev)\
-	((struct renesas_usbhs_platform_info *)(pdev)->dev.platform_data)
 #endif /* RENESAS_USB_H */
-- 
2.34.1


