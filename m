Return-Path: <linux-renesas-soc+bounces-6173-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAF6907C75
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 21:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AA26288DC9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 19:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FDE7158D7A;
	Thu, 13 Jun 2024 19:18:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C90515444E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Jun 2024 19:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718306299; cv=none; b=Ng1r4ts/cUVAhGKpgyeNXrOtSm9tYCptVbVVxcbHNv3JAbYbfLW1tReJx6icBKl6+NA1PktHqekkXl9XBT7uqlSLAsi+VmY/4naiwIW1O6Ak7H80t5vIuQFgczpAYCPGSaI1YrF3Bo+YACBOBbAkJQX9LApqEXBbAdLyg3oX4J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718306299; c=relaxed/simple;
	bh=wTfhc+5qe9USjIEvskfQ4A/ZHi14nOoEz6awhHKpCrE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kh0M+Rmiwymtiz7KL54zKvEPTBb7lb8ZReYF8qwoM8yhyyk6TLdy/WzICe7MIzUUNgS1BTLzsBQpXUGCIGH+dRDZTNW3RzIQHNrnuQTBwBy7Cqro/2dI+89eMqZW46lVF4bZDefavwgY+P7XQhPMJT7JzKtjdaFOJUC9WVCxUpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:be2a:f066:50f0:dff7])
	by baptiste.telenet-ops.be with bizsmtp
	id b7J62C00T3w30qz017J6ok; Thu, 13 Jun 2024 21:18:09 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sHpwS-00Ax71-Gm;
	Thu, 13 Jun 2024 21:18:06 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sHpxW-00FL8j-H0;
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
Subject: [PATCH v2 5/7] drm/panic: Convert to drm_fb_clip_offset()
Date: Thu, 13 Jun 2024 21:18:03 +0200
Message-Id: <3121082eb4beb461773ebb6f656ed9b4286967ee.1718305355.git.geert+renesas@glider.be>
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

Use the drm_fb_clip_offset() helper instead of open-coding the same
operation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
DRM_PANIC already selects DRM_KMS_HELPER.

v2:
  - New.
---
 drivers/gpu/drm/drm_panic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 814ef5c20c08ee42..5b0acf8c86e402a8 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -285,7 +285,7 @@ static void drm_panic_blit(struct drm_scanout_buffer *sb, struct drm_rect *clip,
 		return drm_panic_blit_pixel(sb, clip, sbuf8, spitch, fg_color);
 
 	map = sb->map[0];
-	iosys_map_incr(&map, clip->y1 * sb->pitch[0] + clip->x1 * sb->format->cpp[0]);
+	iosys_map_incr(&map, drm_fb_clip_offset(sb->pitch[0], sb->format, clip));
 
 	switch (sb->format->cpp[0]) {
 	case 2:
@@ -373,7 +373,7 @@ static void drm_panic_fill(struct drm_scanout_buffer *sb, struct drm_rect *clip,
 		return drm_panic_fill_pixel(sb, clip, color);
 
 	map = sb->map[0];
-	iosys_map_incr(&map, clip->y1 * sb->pitch[0] + clip->x1 * sb->format->cpp[0]);
+	iosys_map_incr(&map, drm_fb_clip_offset(sb->pitch[0], sb->format, clip));
 
 	switch (sb->format->cpp[0]) {
 	case 2:
-- 
2.34.1


