Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DBC342CC10
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Oct 2021 22:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbhJMUwR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Oct 2021 16:52:17 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:49011 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230246AbhJMUvx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Oct 2021 16:51:53 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id 6382758117B;
        Wed, 13 Oct 2021 16:49:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 13 Oct 2021 16:49:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=u+zwLxcZ69Jq4
        9MVAvz8TDTzcn5nvEKAlwdjPR/i2e4=; b=NEaScgCU7wtbl3SvTcTTAEV+p1JSn
        QrrVT4PYz67sYKP2gprqQCm3+w5crktcGclNsCsAzB4Z/lEfndarbEIu0RAEF0D1
        qTFTwKV4OKiso+C1NJThfALD7i/EWKgDHHfcNMUNmmcDob/fKaHwcRdD8iCo+PEN
        GbsPfJFfgDCR04Fcam8IQTRFeZnxuN6L3mvDzLAOOipYElByTp++8uYrejyAJfmS
        Ce/w9zMFUkke94FOB5STrrkl7yDcXRWy64qpQizF83EIbcwCLpwh/ATKEqpDHRGi
        emPZShksi6/vt/vTG3x8ByplA7Nu8edjbwtWbxJxBfzRX9ECzioZF4ejw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=u+zwLxcZ69Jq49MVAvz8TDTzcn5nvEKAlwdjPR/i2e4=; b=JeeT7BKE
        X3uiLZhmU9SUoAO/f2UatIX3fQPg3pR3/vJSzqE2XOWEnJc6qVL7f3/4XETfAxkx
        jrEJGPJY+OYf5mPzx9HqFd55VsdtOwAZ6PnXM0OQm4ne/NRaLmEw/PBMNMfMC/ag
        SlMAzq8cNemoHIaoQe94TO599XwWrEmyejuejMkLmHL73CIGfRoECjTvag/oqTCL
        /R4yWoSZZdjlgnEh343aSUy4CnUCVNLxi6XxYef1VhayM8sLwNvvYv1EHd6J4h5s
        ZbchtvJeQDuCH8p7NagSq1Hul2IA0+fuN8k/y1XCgujVzeqfn5BaKNWJsi0eSjzC
        VohtOeMMQFn44g==
X-ME-Sender: <xms:bUZnYV3yr5UcPn9chDXTTM0-H_mPst2e6B1T8R7c_rKZgaNezRWFfQ>
    <xme:bUZnYcHbWysbaiQQs46uKi6hvu6nLWULtrJlbGqXWKa1fMbwtYR9iXWUvf_rdH00W
    OyZxtZ7tRNQF4iiRQ>
X-ME-Received: <xmr:bUZnYV5P2OikOlMayWTy0fW_vomVRabjz5CzqpBMRrF3JQGJ0sVtJpXXaSqG3mIMAmVK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgudehudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
    ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
    fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpeegnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:bUZnYS2r826WmePUz_zE3EMW88bvPcHrvF8wY3KWsPkKAWCcUXpEhA>
    <xmx:bUZnYYEUSjnxSNp7m536M4skPqa51Yn4-4eXcwn3CdtqbchdPWiEPA>
    <xmx:bUZnYT89yThTkU702A1rAQBCiCMNzkc-YhyaJaTB5NaCA4pXkSPZTg>
    <xmx:bUZnYTDxraDKCjf74u4xmpekyT0IHlSQJpeQ1nuIjElRxilE5HXE4g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Oct 2021 16:49:46 -0400 (EDT)
From:   Fernando Ramos <greenfoo@u92.eu>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-kernel@vger.kernel.org, sean@poorly.run,
        linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v4 19/20] drm: cleanup: remove drm_modeset_(un)lock_all()
Date:   Wed, 13 Oct 2021 22:48:45 +0200
Message-Id: <20211013204846.90026-20-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013204846.90026-1-greenfoo@u92.eu>
References: <20211013204846.90026-1-greenfoo@u92.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Functions drm_modeset_lock_all() and drm_modeset_unlock_all() are no
longer used anywhere and can be removed.

Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
---
 drivers/gpu/drm/drm_modeset_lock.c | 94 +-----------------------------
 include/drm/drm_modeset_lock.h     |  2 -
 2 files changed, 3 insertions(+), 93 deletions(-)

diff --git a/drivers/gpu/drm/drm_modeset_lock.c b/drivers/gpu/drm/drm_modeset_lock.c
index 4d32b61fa1fd..b2b84ca2b738 100644
--- a/drivers/gpu/drm/drm_modeset_lock.c
+++ b/drivers/gpu/drm/drm_modeset_lock.c
@@ -117,93 +117,6 @@ static void __stack_depot_print(depot_stack_handle_t stack_depot)
 }
 #endif /* CONFIG_DRM_DEBUG_MODESET_LOCK */
 
-/**
- * drm_modeset_lock_all - take all modeset locks
- * @dev: DRM device
- *
- * This function takes all modeset locks, suitable where a more fine-grained
- * scheme isn't (yet) implemented. Locks must be dropped by calling the
- * drm_modeset_unlock_all() function.
- *
- * This function is deprecated. It allocates a lock acquisition context and
- * stores it in &drm_device.mode_config. This facilitate conversion of
- * existing code because it removes the need to manually deal with the
- * acquisition context, but it is also brittle because the context is global
- * and care must be taken not to nest calls. New code should use the
- * drm_modeset_lock_all_ctx() function and pass in the context explicitly.
- */
-void drm_modeset_lock_all(struct drm_device *dev)
-{
-	struct drm_mode_config *config = &dev->mode_config;
-	struct drm_modeset_acquire_ctx *ctx;
-	int ret;
-
-	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL | __GFP_NOFAIL);
-	if (WARN_ON(!ctx))
-		return;
-
-	mutex_lock(&config->mutex);
-
-	drm_modeset_acquire_init(ctx, 0);
-
-retry:
-	ret = drm_modeset_lock_all_ctx(dev, ctx);
-	if (ret < 0) {
-		if (ret == -EDEADLK) {
-			drm_modeset_backoff(ctx);
-			goto retry;
-		}
-
-		drm_modeset_acquire_fini(ctx);
-		kfree(ctx);
-		return;
-	}
-	ww_acquire_done(&ctx->ww_ctx);
-
-	WARN_ON(config->acquire_ctx);
-
-	/*
-	 * We hold the locks now, so it is safe to stash the acquisition
-	 * context for drm_modeset_unlock_all().
-	 */
-	config->acquire_ctx = ctx;
-
-	drm_warn_on_modeset_not_all_locked(dev);
-}
-EXPORT_SYMBOL(drm_modeset_lock_all);
-
-/**
- * drm_modeset_unlock_all - drop all modeset locks
- * @dev: DRM device
- *
- * This function drops all modeset locks taken by a previous call to the
- * drm_modeset_lock_all() function.
- *
- * This function is deprecated. It uses the lock acquisition context stored
- * in &drm_device.mode_config. This facilitates conversion of existing
- * code because it removes the need to manually deal with the acquisition
- * context, but it is also brittle because the context is global and care must
- * be taken not to nest calls. New code should pass the acquisition context
- * directly to the drm_modeset_drop_locks() function.
- */
-void drm_modeset_unlock_all(struct drm_device *dev)
-{
-	struct drm_mode_config *config = &dev->mode_config;
-	struct drm_modeset_acquire_ctx *ctx = config->acquire_ctx;
-
-	if (WARN_ON(!ctx))
-		return;
-
-	config->acquire_ctx = NULL;
-	drm_modeset_drop_locks(ctx);
-	drm_modeset_acquire_fini(ctx);
-
-	kfree(ctx);
-
-	mutex_unlock(&dev->mode_config.mutex);
-}
-EXPORT_SYMBOL(drm_modeset_unlock_all);
-
 /**
  * drm_warn_on_modeset_not_all_locked - check that all modeset locks are locked
  * @dev: device
@@ -425,10 +338,9 @@ EXPORT_SYMBOL(drm_modeset_unlock);
  * This function takes all modeset locks, suitable where a more fine-grained
  * scheme isn't (yet) implemented.
  *
- * Unlike drm_modeset_lock_all(), it doesn't take the &drm_mode_config.mutex
- * since that lock isn't required for modeset state changes. Callers which
- * need to grab that lock too need to do so outside of the acquire context
- * @ctx.
+ * It doesn't take the &drm_mode_config.mutex since that lock isn't required for
+ * modeset state changes. Callers which need to grab that lock too need to do so
+ * outside of the acquire context @ctx.
  *
  * Locks acquired with this function should be released by calling the
  * drm_modeset_drop_locks() function on @ctx.
diff --git a/include/drm/drm_modeset_lock.h b/include/drm/drm_modeset_lock.h
index b84693fbd2b5..96b853530120 100644
--- a/include/drm/drm_modeset_lock.h
+++ b/include/drm/drm_modeset_lock.h
@@ -140,8 +140,6 @@ struct drm_device;
 struct drm_crtc;
 struct drm_plane;
 
-void drm_modeset_lock_all(struct drm_device *dev);
-void drm_modeset_unlock_all(struct drm_device *dev);
 void drm_warn_on_modeset_not_all_locked(struct drm_device *dev);
 
 int drm_modeset_lock_all_ctx(struct drm_device *dev,
-- 
2.33.0

