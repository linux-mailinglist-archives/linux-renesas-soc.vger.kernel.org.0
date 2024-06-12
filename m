Return-Path: <linux-renesas-soc+bounces-6107-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F7F90546F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 15:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D84A81C2479A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 13:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CABFA17E8F2;
	Wed, 12 Jun 2024 13:54:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803AC17E8F8
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Jun 2024 13:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718200468; cv=none; b=W5+47n1mr5kjyfGk3sZdM1JHu+3VjoH0Btp711+o9DWzQ2TL57fT2SdH6ZUp7uxxduaTEY/JC+fnxmL7gvUvweEITow+DMX0AOS56VUwrwkiO+0QAg+1Trkyzf/I3OQdEM4nkJ/gRI4UzQlv1CF25L5Lbz2FN4t0lZrfy9USXJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718200468; c=relaxed/simple;
	bh=M717r1WHlp0VNEIi6s7JQcx9lPU39omC2RuymmC7CWc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MywKoNxoPUIZaUXz+5MbyPlHsKy3KzpCOySPOaReR0w71c+JYJpt/iUVQYEHRPytB3D/eL/hxkgadoZuoCL49nNJi53LXD1lcbNcYI50K7bncKdQH3vcdvliNeJ3a4iLyIgKv8swdU1iy4XFkP51x+z7wnkHGtvuQsxLPLDwBsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:170b:1b4a:247:a009])
	by baptiste.telenet-ops.be with bizsmtp
	id aduH2C0083axqkY01duHp4; Wed, 12 Jun 2024 15:54:18 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sHOPX-008eJj-SD;
	Wed, 12 Jun 2024 15:54:17 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sHOQa-00EdFh-W8;
	Wed, 12 Jun 2024 15:54:16 +0200
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
Subject: [PATCH 1/3] drm/panic: Fix off-by-one logo size checks
Date: Wed, 12 Jun 2024 15:54:08 +0200
Message-Id: <653cc7f0ab18c1eadd8128debedefa5174591c90.1718199918.git.geert+renesas@glider.be>
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

Logos that are either just as wide or just as high as the display work
fine.

Fixes: bf9fb17c6672868d ("drm/panic: Add a drm panic handler")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/drm_panic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 7ece67086cecb79f..52d8a96b7dedff2c 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -444,7 +444,7 @@ static void draw_panic_static(struct drm_scanout_buffer *sb)
 		       bg_color, sb->format->cpp[0]);
 
 	if ((r_msg.x1 >= drm_rect_width(&r_logo) || r_msg.y1 >= drm_rect_height(&r_logo)) &&
-	    drm_rect_width(&r_logo) < sb->width && drm_rect_height(&r_logo) < sb->height) {
+	    drm_rect_width(&r_logo) <= sb->width && drm_rect_height(&r_logo) <= sb->height) {
 		draw_txt_rectangle(sb, font, logo, logo_lines, false, &r_logo, fg_color, bg_color);
 	}
 	draw_txt_rectangle(sb, font, panic_msg, msg_lines, true, &r_msg, fg_color, bg_color);
-- 
2.34.1


