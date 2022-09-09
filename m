Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 329915B35EB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Sep 2022 13:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbiIILAP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Sep 2022 07:00:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbiIIK74 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Sep 2022 06:59:56 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 816C24DB58
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Sep 2022 03:59:53 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 5E6241F8F4;
        Fri,  9 Sep 2022 10:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1662721191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=38ymsOX9Xr62sGFoPedrsP6MiA7QpcTkkaobc+VS6tc=;
        b=bwDRMM1zMr5cULXuNSWX301heygxGb2b3QOxXyqL2fvXMMY0zD0pQyidKLaiXMJ2jBPnhp
        St8RHODxNWkG1Z8q36LhKq8WouW+tYEscbZilXk/1Vs9lzfSIM4XzVFRZPUFEGzoPkPhwX
        UFcGPkzg1sozGRozmptm/toFx+IH0cY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1662721191;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=38ymsOX9Xr62sGFoPedrsP6MiA7QpcTkkaobc+VS6tc=;
        b=1C0DKgAgUy/okf52EnV05Y5NtIPFlECX3ktGJ/yILF6NjeBs9IuZzhcfju/YjYOsxaTTJw
        fagqwt9D9LSqLVAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1C458139D5;
        Fri,  9 Sep 2022 10:59:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id YI4VBqccG2M0BwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Fri, 09 Sep 2022 10:59:51 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, bskeggs@redhat.com,
        kherbst@redhat.com, lyude@redhat.com,
        laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jyri.sarha@iki.fi,
        tomba@kernel.org, sam@ravnborg.org
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/4] drm/plane-helper: Provide DRM_PLANE_NON_ATOMIC_FUNCS initializer macro
Date:   Fri,  9 Sep 2022 12:59:47 +0200
Message-Id: <20220909105947.6487-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220909105947.6487-1-tzimmermann@suse.de>
References: <20220909105947.6487-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Provide DRM_PLANE_NON_ATOMIC_FUNCS, which initializes plane functions
of non-atomic drivers to default values. The macro is not supposed to
be used in new code, but helps with documenting and finding existing
users.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_modeset_helper.c    |  4 +---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c |  4 +---
 include/drm/drm_plane_helper.h          | 12 ++++++++++++
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_modeset_helper.c
index 38040eebfa16..f858dfedf2cf 100644
--- a/drivers/gpu/drm/drm_modeset_helper.c
+++ b/drivers/gpu/drm/drm_modeset_helper.c
@@ -108,9 +108,7 @@ static const uint32_t safe_modeset_formats[] = {
 };
 
 static const struct drm_plane_funcs primary_plane_funcs = {
-	.update_plane = drm_plane_helper_update_primary,
-	.disable_plane = drm_plane_helper_disable_primary,
-	.destroy = drm_plane_helper_destroy,
+	DRM_PLANE_NON_ATOMIC_FUNCS,
 };
 
 /**
diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index 6b8a014b5e97..ee92d576d277 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -1276,9 +1276,7 @@ static const uint32_t modeset_formats[] = {
 };
 
 static const struct drm_plane_funcs nv04_primary_plane_funcs = {
-	.update_plane = drm_plane_helper_update_primary,
-	.disable_plane = drm_plane_helper_disable_primary,
-	.destroy = drm_plane_helper_destroy,
+	DRM_PLANE_NON_ATOMIC_FUNCS,
 };
 
 static int nv04_crtc_vblank_handler(struct nvif_notify *notify)
diff --git a/include/drm/drm_plane_helper.h b/include/drm/drm_plane_helper.h
index 1781fab24dd6..75f9c4830564 100644
--- a/include/drm/drm_plane_helper.h
+++ b/include/drm/drm_plane_helper.h
@@ -42,4 +42,16 @@ int drm_plane_helper_disable_primary(struct drm_plane *plane,
 				     struct drm_modeset_acquire_ctx *ctx);
 void drm_plane_helper_destroy(struct drm_plane *plane);
 
+/**
+ * DRM_PLANE_NON_ATOMIC_FUNCS - Default plane functions for non-atomic drivers
+ *
+ * This macro initializes plane functions for non-atomic drivers to default
+ * values. Non-atomic interfaces are deprecated and should not be used in new
+ * drivers.
+ */
+#define DRM_PLANE_NON_ATOMIC_FUNCS \
+	.update_plane = drm_plane_helper_update_primary, \
+	.disable_plane = drm_plane_helper_disable_primary, \
+	.destroy = drm_plane_helper_destroy
+
 #endif
-- 
2.37.2

