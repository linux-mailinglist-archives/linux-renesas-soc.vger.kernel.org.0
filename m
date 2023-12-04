Return-Path: <linux-renesas-soc+bounces-606-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 081E1802DD5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 10:09:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC865280DAA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 09:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49E3B14A86;
	Mon,  4 Dec 2023 09:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QodIoyIg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rG77zgKk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2a07:de40:b251:101:10:150:64:2])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 873B1D8
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Dec 2023 01:09:03 -0800 (PST)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E2B151FE5C;
	Mon,  4 Dec 2023 09:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1701680941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CE72kd1LGrmiy64K5ztSk6DJXD+F3KaMFtTOCY5tkEM=;
	b=QodIoyIg5wBOC4w0AQVdoLOvdIEcv2ARxMNMKy6d+RWITct1O47cjp1VZjXX5ZE5C6BWuJ
	97Y5b4vNwQPyySUe0LeqVLX0EZjDHUxdtsVqgy7DBI/RNXLoIal+9obHU2Ss/wgrY9+XgB
	bBFmOOJDdIbDzLBuvA+xp2jj6aan5/s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1701680941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CE72kd1LGrmiy64K5ztSk6DJXD+F3KaMFtTOCY5tkEM=;
	b=rG77zgKkEbWxZMoInQNqtQJ2WTA0ZCl9yVbAoH4QJ+3kWYC1hPqInVl4EhPCNp+a4h4Y1y
	VztOX2K8n6X1x9CA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id A245513B47;
	Mon,  4 Dec 2023 09:09:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id 8IqfJi2XbWV+KAAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Mon, 04 Dec 2023 09:09:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	daniel@ffwll.ch,
	airlied@gmail.com,
	suijingfeng@loongson.cn
Cc: laurent.pinchart@ideasonboard.com,
	javierm@redhat.com,
	dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 1/8] drm/plane-helper: Move drm_plane_helper_atomic_check() into udl
Date: Mon,  4 Dec 2023 10:07:46 +0100
Message-ID: <20231204090852.1650-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231204090852.1650-1-tzimmermann@suse.de>
References: <20231204090852.1650-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.90
X-Spamd-Result: default: False [0.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[12];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,loongson.cn:email];
	 FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,ffwll.ch,gmail.com,loongson.cn];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]

The udl driver is the only caller of drm_plane_helper_atomic_check().
Move the function into the driver. No functional changes.

v2:
	* fix documenation (Sui)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/drm_crtc_helper.c  |  7 ++-----
 drivers/gpu/drm/drm_plane_helper.c | 32 ------------------------------
 drivers/gpu/drm/udl/udl_modeset.c  | 19 ++++++++++++++++--
 include/drm/drm_plane_helper.h     |  2 --
 4 files changed, 19 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index a209659a996c7..2dafc39a27cb9 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -439,11 +439,8 @@ EXPORT_SYMBOL(drm_crtc_helper_set_mode);
  * @state: atomic state object
  *
  * Provides a default CRTC-state check handler for CRTCs that only have
- * one primary plane attached to it.
- *
- * This is often the case for the CRTC of simple framebuffers. See also
- * drm_plane_helper_atomic_check() for the respective plane-state check
- * helper function.
+ * one primary plane attached to it. This is often the case for the CRTC
+ * of simple framebuffers.
  *
  * RETURNS:
  * Zero on success, or an errno code otherwise.
diff --git a/drivers/gpu/drm/drm_plane_helper.c b/drivers/gpu/drm/drm_plane_helper.c
index 5e95089676ff8..7982be4b0306d 100644
--- a/drivers/gpu/drm/drm_plane_helper.c
+++ b/drivers/gpu/drm/drm_plane_helper.c
@@ -279,35 +279,3 @@ void drm_plane_helper_destroy(struct drm_plane *plane)
 	kfree(plane);
 }
 EXPORT_SYMBOL(drm_plane_helper_destroy);
-
-/**
- * drm_plane_helper_atomic_check() - Helper to check plane atomic-state
- * @plane: plane to check
- * @state: atomic state object
- *
- * Provides a default plane-state check handler for planes whose atomic-state
- * scale and positioning are not expected to change since the plane is always
- * a fullscreen scanout buffer.
- *
- * This is often the case for the primary plane of simple framebuffers. See
- * also drm_crtc_helper_atomic_check() for the respective CRTC-state check
- * helper function.
- *
- * RETURNS:
- * Zero on success, or an errno code otherwise.
- */
-int drm_plane_helper_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state)
-{
-	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
-	struct drm_crtc *new_crtc = new_plane_state->crtc;
-	struct drm_crtc_state *new_crtc_state = NULL;
-
-	if (new_crtc)
-		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_crtc);
-
-	return drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
-						   DRM_PLANE_NO_SCALING,
-						   DRM_PLANE_NO_SCALING,
-						   false, false);
-}
-EXPORT_SYMBOL(drm_plane_helper_atomic_check);
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 40876bcdd79a4..7702359c90c22 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -21,7 +21,6 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_modeset_helper_vtables.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
@@ -261,6 +260,22 @@ static const uint64_t udl_primary_plane_fmtmods[] = {
 	DRM_FORMAT_MOD_INVALID
 };
 
+static int udl_primary_plane_helper_atomic_check(struct drm_plane *plane,
+						 struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc *new_crtc = new_plane_state->crtc;
+	struct drm_crtc_state *new_crtc_state = NULL;
+
+	if (new_crtc)
+		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_crtc);
+
+	return drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   false, false);
+}
+
 static void udl_primary_plane_helper_atomic_update(struct drm_plane *plane,
 						   struct drm_atomic_state *state)
 {
@@ -296,7 +311,7 @@ static void udl_primary_plane_helper_atomic_update(struct drm_plane *plane,
 
 static const struct drm_plane_helper_funcs udl_primary_plane_helper_funcs = {
 	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
-	.atomic_check = drm_plane_helper_atomic_check,
+	.atomic_check = udl_primary_plane_helper_atomic_check,
 	.atomic_update = udl_primary_plane_helper_atomic_update,
 };
 
diff --git a/include/drm/drm_plane_helper.h b/include/drm/drm_plane_helper.h
index 3a574e8cd22f4..75f9c4830564a 100644
--- a/include/drm/drm_plane_helper.h
+++ b/include/drm/drm_plane_helper.h
@@ -26,7 +26,6 @@
 
 #include <linux/types.h>
 
-struct drm_atomic_state;
 struct drm_crtc;
 struct drm_framebuffer;
 struct drm_modeset_acquire_ctx;
@@ -42,7 +41,6 @@ int drm_plane_helper_update_primary(struct drm_plane *plane, struct drm_crtc *cr
 int drm_plane_helper_disable_primary(struct drm_plane *plane,
 				     struct drm_modeset_acquire_ctx *ctx);
 void drm_plane_helper_destroy(struct drm_plane *plane);
-int drm_plane_helper_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state);
 
 /**
  * DRM_PLANE_NON_ATOMIC_FUNCS - Default plane functions for non-atomic drivers
-- 
2.43.0


