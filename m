Return-Path: <linux-renesas-soc+bounces-5519-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9192F8D0228
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 15:50:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB209B2B9A3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 13:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A88915F3E7;
	Mon, 27 May 2024 13:34:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB67915F3E5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 May 2024 13:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716816894; cv=none; b=XP5DxaUl7eGfwgdKRzcNnry4ccdhEHXzsichdJJndRNVIkfykUH9wvuLnJNCi79YEvTpW7twR3O8IMq6kPr1CiTZhWQdpYal/EVIS+LWrmOaBYtsoaMJ2/4Wqm6e+qfog0biIKK8q9MpNP2YPeanb63Rd19XlCN57DzeP+jqM6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716816894; c=relaxed/simple;
	bh=2UKdpjY/LXcgYTNi8wbyRcPvDGJThQnKe2Gtubh/S94=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DUBkkb+SPg8/geGVcA02UuIZmkWGYHq0L5bfe83Gg7zto7F9r2NWmk4xS7hA+9eK7sgW6g2FITBDyYD/0GJMaijmoMKWqecPJSgBKO28g9oTBz2DYsHN0jKw3bJzoU0XmDxo59MXgF8XyBpR++CAnSumlaCjw2vrve4d3NQvj+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:c993:5573:f894:7353])
	by andre.telenet-ops.be with bizsmtp
	id UDaq2C0082nC7mg01Daqa2; Mon, 27 May 2024 15:34:50 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sBaU4-00CmN2-Ez;
	Mon, 27 May 2024 15:34:50 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sBaV0-003xdp-3y;
	Mon, 27 May 2024 15:34:50 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jocelyn Falempe <jfalempe@redhat.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] drm: renesas: shmobile: Add drm_panic support
Date: Mon, 27 May 2024 15:34:48 +0200
Message-Id: <292638fde9aef8b00e984245f43dc02a818cf322.1716816827.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the drm_panic module, which displays a message on
the screen when a kernel panic occurs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Tested on Armadillo-800-EVA.
---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
index 07ad17d24294d5e6..9d166ab2af8bd231 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
@@ -273,6 +273,13 @@ static const struct drm_plane_helper_funcs shmob_drm_plane_helper_funcs = {
 	.atomic_disable = shmob_drm_plane_atomic_disable,
 };
 
+static const struct drm_plane_helper_funcs shmob_drm_primary_plane_helper_funcs = {
+	.atomic_check = shmob_drm_plane_atomic_check,
+	.atomic_update = shmob_drm_plane_atomic_update,
+	.atomic_disable = shmob_drm_plane_atomic_disable,
+	.get_scanout_buffer = drm_fb_dma_get_scanout_buffer,
+};
+
 static const struct drm_plane_funcs shmob_drm_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
@@ -310,7 +317,12 @@ struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
 
 	splane->index = index;
 
-	drm_plane_helper_add(&splane->base, &shmob_drm_plane_helper_funcs);
+	if (type == DRM_PLANE_TYPE_PRIMARY)
+		drm_plane_helper_add(&splane->base,
+				     &shmob_drm_primary_plane_helper_funcs);
+	else
+		drm_plane_helper_add(&splane->base,
+				     &shmob_drm_plane_helper_funcs);
 
 	return &splane->base;
 }
-- 
2.34.1


