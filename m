Return-Path: <linux-renesas-soc+bounces-2147-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3F48443B3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 17:08:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE5281F279C8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 16:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E016C1F164;
	Wed, 31 Jan 2024 16:08:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FBB1272A3
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 16:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706717316; cv=none; b=Xe5oRB0nMWKRgP2+g6geK3SSteKHhZA/2h0YQZM+rAACGgWoSEtYfml8ijWXYnFooC4Ulhe2EIJC/5LoTDFHN+Lyoj2X+dgtCYaa80kibYhP9Ue8XggHgFt65jbAZ8rai+so7gcA4K61au2cBOb95I20NUZjtYXnC4jUlZjBt+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706717316; c=relaxed/simple;
	bh=2YYGXqpdPOexNxqUK4AkcfSNd3n0oz0aEmWNzP09+8Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K4Gw/qACKSJdG59trQNOVlNSHf6PwCcVCD7eMa7g5NFnswTT9YJNtlUChkg/XhmlzNkgPpQDJdLjMz4WWvxkK6+MISUuRf0P5zqrNsqtjP6Wf806x6wSXxJ0zhqD88lmomEJCh/Y3LTvsGNr9a5rzO10hIwiwHOkLEKE4byRWx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:88f0:c83b:bafa:cdc3])
	by andre.telenet-ops.be with bizsmtp
	id hU8R2B0094efzLr01U8Rmn; Wed, 31 Jan 2024 17:08:25 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVD7d-00GrUM-1K;
	Wed, 31 Jan 2024 17:08:25 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVD8T-008lTG-9T;
	Wed, 31 Jan 2024 17:08:25 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Helge Deller <deller@gmx.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] fbdev: Restrict FB_SH_MOBILE_LCDC to SuperH
Date: Wed, 31 Jan 2024 17:08:23 +0100
Message-Id: <c4a090bd3f4737774351b136db72b15297cd0239.1706717146.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit f402f7a02af6956d ("staging: board: Remove Armadillo-800-EVA
board staging code"), there are no more users of the legacy SuperH
Mobile LCDC framebuffer driver on Renesas ARM platforms.  All former
users on these platforms have been converted to the SH-Mobile DRM
driver, using DT.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Commit f402f7a02af6956d is in staging-next (next-20240129 and later).
---
 drivers/video/fbdev/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 2d0bcc1d786e50bb..b688900bb67eed55 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1554,7 +1554,7 @@ config FB_FSL_DIU
 config FB_SH_MOBILE_LCDC
 	tristate "SuperH Mobile LCDC framebuffer support"
 	depends on FB && HAVE_CLK && HAS_IOMEM
-	depends on SUPERH || ARCH_RENESAS || COMPILE_TEST
+	depends on SUPERH || COMPILE_TEST
 	depends on FB_DEVICE
 	select FB_BACKLIGHT
 	select FB_DEFERRED_IO
-- 
2.34.1


