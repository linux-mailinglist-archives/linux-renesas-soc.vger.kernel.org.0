Return-Path: <linux-renesas-soc+bounces-6172-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D89907C78
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 21:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A083B262D7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 19:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A4EA158D78;
	Thu, 13 Jun 2024 19:18:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0322915382E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Jun 2024 19:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718306299; cv=none; b=uCCWQoppH1ypXrbNSnr01sX48zLGR/i/bEi+ei8sjadO8LdjJrGNu24n6QpmNBuHvttJUfUdU4PHMN6dHcyjJwXR1lkrDvXctTlczZYuijGlivFxUynTsWwORK6tFkbY0iK6T5ISfUF81RX2S8vQWyjfvWW9uBzrtBLtmo4/HiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718306299; c=relaxed/simple;
	bh=Sa5ge7CcXmGHW0duWK1aTVxhD/buIL/3bSCNBiMvBNs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AFmiQ7rQjsMLuvaVWY2ot++UT1XOW4bw4SFkZp225IX+Dbt3mbjmehIXxu176cA14w2WEI9TzQzAjzs3RY+9z3DnvLL7EHvjA1/6EGsja/kRqSB/HoFyzziQIz5Svcmzs1Bs/Okf4w97l1c2fNzPp9OdbwLlbP/lA8kiBY8cGuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:be2a:f066:50f0:dff7])
	by xavier.telenet-ops.be with bizsmtp
	id b7J62C00H3w30qz017J6ml; Thu, 13 Jun 2024 21:18:08 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sHpwS-00Ax78-JJ;
	Thu, 13 Jun 2024 21:18:06 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sHpxW-00FL8v-JP;
	Thu, 13 Jun 2024 21:18:06 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Jocelyn Falempe <jfalempe@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 7/7] drm/panic: Add support for drawing a monochrome graphical logo
Date: Thu, 13 Jun 2024 21:18:05 +0200
Message-Id: <3f1a5f56213f3e4584773eb2813e212b2dff6d14.1718305355.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718305355.git.geert+renesas@glider.be>
References: <cover.1718305355.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Re-use the existing support for boot-up logos to draw a monochrome
graphical logo in the DRM panic handler.  When no suitable graphical
logo is available, the code falls back to the ASCII art penguin logo.

Note that all graphical boot-up logos are freed during late kernel
initialization, hence a copy must be made for later use.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Rebased,
  - Inline trivial draw_logo_mono().
---
 drivers/gpu/drm/drm_panic.c | 65 +++++++++++++++++++++++++++++++++----
 drivers/video/logo/Kconfig  |  2 ++
 2 files changed, 60 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index f7e22b69bb25d3be..af30f243b2802ad7 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -7,11 +7,15 @@
  */
 
 #include <linux/font.h>
+#include <linux/init.h>
 #include <linux/iosys-map.h>
 #include <linux/kdebug.h>
 #include <linux/kmsg_dump.h>
+#include <linux/linux_logo.h>
 #include <linux/list.h>
+#include <linux/math.h>
 #include <linux/module.h>
+#include <linux/overflow.h>
 #include <linux/printk.h>
 #include <linux/types.h>
 
@@ -88,6 +92,42 @@ static const struct drm_panic_line logo_ascii[] = {
 	PANIC_LINE(" \\___)=(___/"),
 };
 
+#ifdef CONFIG_LOGO
+static const struct linux_logo *logo_mono;
+
+static int drm_panic_setup_logo(void)
+{
+	const struct linux_logo *logo = fb_find_logo(1);
+	const unsigned char *logo_data;
+	struct linux_logo *logo_dup;
+
+	if (!logo || logo->type != LINUX_LOGO_MONO)
+		return 0;
+
+	/* The logo is __init, so we must make a copy for later use */
+	logo_data = kmemdup(logo->data,
+			    size_mul(DIV_ROUND_UP(logo->width, BITS_PER_BYTE), logo->height),
+			    GFP_KERNEL);
+	if (!logo_data)
+		return -ENOMEM;
+
+	logo_dup = kmemdup(logo, sizeof(*logo), GFP_KERNEL);
+	if (!logo_dup) {
+		kfree(logo_data);
+		return -ENOMEM;
+	}
+
+	logo_dup->data = logo_data;
+	logo_mono = logo_dup;
+
+	return 0;
+}
+
+device_initcall(drm_panic_setup_logo);
+#else
+#define logo_mono	((const struct linux_logo *)NULL)
+#endif
+
 /*
  * Color conversion
  */
@@ -452,15 +492,22 @@ static void draw_panic_static_user(struct drm_scanout_buffer *sb)
 	u32 bg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_COLOR, sb->format->format);
 	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
 	struct drm_rect r_screen, r_logo, r_msg;
+	unsigned int logo_width, logo_height;
 
 	if (!font)
 		return;
 
 	r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
 
-	r_logo = DRM_RECT_INIT(0, 0,
-			       get_max_line_len(logo_ascii, logo_ascii_lines) * font->width,
-			       logo_ascii_lines * font->height);
+	if (logo_mono) {
+		logo_width = logo_mono->width;
+		logo_height = logo_mono->height;
+	} else {
+		logo_width = get_max_line_len(logo_ascii, logo_ascii_lines) * font->width;
+		logo_height = logo_ascii_lines * font->height;
+	}
+
+	r_logo = DRM_RECT_INIT(0, 0, logo_width, logo_height);
 	r_msg = DRM_RECT_INIT(0, 0,
 			      min(get_max_line_len(panic_msg, msg_lines) * font->width, sb->width),
 			      min(msg_lines * font->height, sb->height));
@@ -471,10 +518,14 @@ static void draw_panic_static_user(struct drm_scanout_buffer *sb)
 	/* Fill with the background color, and draw text on top */
 	drm_panic_fill(sb, &r_screen, bg_color);
 
-	if ((r_msg.x1 >= drm_rect_width(&r_logo) || r_msg.y1 >= drm_rect_height(&r_logo)) &&
-	    drm_rect_width(&r_logo) <= sb->width && drm_rect_height(&r_logo) <= sb->height) {
-		draw_txt_rectangle(sb, font, logo_ascii, logo_ascii_lines, false, &r_logo,
-				   fg_color);
+	if ((r_msg.x1 >= logo_width || r_msg.y1 >= logo_height) &&
+	    logo_width <= sb->width && logo_height <= sb->height) {
+		if (logo_mono)
+			drm_panic_blit(sb, &r_logo, logo_mono->data, DIV_ROUND_UP(logo_width, 8),
+				       fg_color);
+		else
+			draw_txt_rectangle(sb, font, logo_ascii, logo_ascii_lines, false, &r_logo,
+					   fg_color);
 	}
 	draw_txt_rectangle(sb, font, panic_msg, msg_lines, true, &r_msg, fg_color);
 }
diff --git a/drivers/video/logo/Kconfig b/drivers/video/logo/Kconfig
index b7d94d1dd1585a84..ce6bb753522d215d 100644
--- a/drivers/video/logo/Kconfig
+++ b/drivers/video/logo/Kconfig
@@ -8,6 +8,8 @@ menuconfig LOGO
 	depends on FB_CORE || SGI_NEWPORT_CONSOLE
 	help
 	  Enable and select frame buffer bootup logos.
+	  Monochrome logos will also be used by the DRM panic handler, if
+	  enabled.
 
 if LOGO
 
-- 
2.34.1


