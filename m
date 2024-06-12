Return-Path: <linux-renesas-soc+bounces-6106-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CD8905470
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 15:57:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07BE8288804
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 13:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA79A17E8E8;
	Wed, 12 Jun 2024 13:54:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1EE17E8EB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Jun 2024 13:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718200468; cv=none; b=aG/GvTPUU+qOKW5Du2//CHvFHE0O7fMXovv8LKb3DpTuYlrdb6m+v+IkXqju9a85RgzMFoQkhrwwTCRbPPhq//O9josLy4omCmPiRHL6KJjkOmk7Ey4oQ0hf+kAGu1ba0yU2hGJw8e7P9Q0cvcBDwiRYLqj53zuBLS+x5LmZP2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718200468; c=relaxed/simple;
	bh=noVWXhuEHzf0XR84ByJpltoN5kaX7NcXU6fPSYm9R7s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nWdSt4GRQ1qUibfW8y3SA+gaVn5naTFzxpVfryMuUVbZzGintuBKXeTK8DHdjU5a5eBhJVuRIKugRFALJjgWR9X81AFlgYeyEVD2tQJ4/vzEoHB8CRUfDlEStV4+VWxUBIhODYdJHSYD4tjop9k9f7vwfLd6TqksHrDtMplgZUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:170b:1b4a:247:a009])
	by xavier.telenet-ops.be with bizsmtp
	id aduH2C0023axqkY01duH18; Wed, 12 Jun 2024 15:54:18 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sHOPX-008eJo-TK;
	Wed, 12 Jun 2024 15:54:17 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sHOQb-00EdFn-1W;
	Wed, 12 Jun 2024 15:54:17 +0200
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
Subject: [PATCH 3/3] drm/panic: Add support for drawing a monochrome graphical logo
Date: Wed, 12 Jun 2024 15:54:10 +0200
Message-Id: <d17461f9be3a4541b8a2947a4a620739327365ee.1718199918.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718199918.git.geert+renesas@glider.be>
References: <cover.1718199918.git.geert+renesas@glider.be>
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
 drivers/gpu/drm/drm_panic.c | 78 +++++++++++++++++++++++++++++++++----
 drivers/video/logo/Kconfig  |  2 +
 2 files changed, 73 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 05b406a7034bb295..f2d7484eff43f5a8 100644
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
 #include <linux/types.h>
 
 #include <drm/drm_drv.h>
@@ -81,6 +85,42 @@ static const struct drm_panic_line logo_ascii[] = {
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
@@ -357,6 +397,20 @@ static void drm_panic_fill(struct iosys_map *dmap, unsigned int dpitch,
 	}
 }
 
+/*
+ * Draw a monochrome logo on a framebuffer.
+ */
+static void draw_logo_mono(struct drm_scanout_buffer *sb, const struct linux_logo *logo,
+			   struct drm_rect *clip, u32 fg_color, u32 bg_color)
+{
+	unsigned int px_width = sb->format->cpp[0];
+	struct iosys_map dst = sb->map[0];
+
+	iosys_map_incr(&dst, clip->y1 * sb->pitch[0] + clip->x1 * px_width);
+	drm_panic_blit(&dst, sb->pitch[0], logo->data, DIV_ROUND_UP(logo->width, 8),
+		       logo->height, logo->width, fg_color, bg_color, px_width);
+}
+
 static const u8 *get_char_bitmap(const struct font_desc *font, char c, size_t font_pitch)
 {
 	return font->data + (c * font->height) * font_pitch;
@@ -421,6 +475,7 @@ static void draw_panic_static(struct drm_scanout_buffer *sb)
 	u32 fg_color = CONFIG_DRM_PANIC_FOREGROUND_COLOR;
 	u32 bg_color = CONFIG_DRM_PANIC_BACKGROUND_COLOR;
 	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
+	unsigned int logo_width, logo_height;
 	struct drm_rect r_logo, r_msg;
 
 	if (!font)
@@ -429,9 +484,15 @@ static void draw_panic_static(struct drm_scanout_buffer *sb)
 	fg_color = convert_from_xrgb8888(fg_color, sb->format->format);
 	bg_color = convert_from_xrgb8888(bg_color, sb->format->format);
 
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
@@ -443,10 +504,13 @@ static void draw_panic_static(struct drm_scanout_buffer *sb)
 	drm_panic_fill(&sb->map[0], sb->pitch[0], sb->height, sb->width,
 		       bg_color, sb->format->cpp[0]);
 
-	if ((r_msg.x1 >= drm_rect_width(&r_logo) || r_msg.y1 >= drm_rect_height(&r_logo)) &&
-	    drm_rect_width(&r_logo) <= sb->width && drm_rect_height(&r_logo) <= sb->height) {
-		draw_txt_rectangle(sb, font, logo_ascii, logo_ascii_lines, false, &r_logo,
-				   fg_color, bg_color);
+	if ((r_msg.x1 >= logo_width || r_msg.y1 >= logo_height) &&
+	    logo_width <= sb->width && logo_height <= sb->height) {
+		if (logo_mono)
+			draw_logo_mono(sb, logo_mono, &r_logo, fg_color, bg_color);
+		else
+			draw_txt_rectangle(sb, font, logo_ascii, logo_ascii_lines, false, &r_logo,
+					   fg_color, bg_color);
 	}
 	draw_txt_rectangle(sb, font, panic_msg, msg_lines, true, &r_msg, fg_color, bg_color);
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


