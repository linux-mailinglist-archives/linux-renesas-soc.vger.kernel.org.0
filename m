Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 329CF17DD9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2019 18:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727478AbfEHQJe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 May 2019 12:09:34 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:39752 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727930AbfEHQJd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 May 2019 12:09:33 -0400
Received: by mail-qt1-f194.google.com with SMTP id y42so4371586qtk.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 May 2019 09:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jBDdhPb+qvn/dBHPY34W6OYhoJDYrZsCUgdFWJmXhQg=;
        b=Ft9PFxIBMfyN28mPrgM6P62aRECybosI1mJJaW9qfxvLpvdaBI+WzNOlIIMaOlZG5S
         oao1Qti+HwbpkPomoqCNo6BjP/zkxfT88z2hQz3RMrtopjfZTvOsXN3i1DI5TU51Cbu2
         vF9MvwH3EtJo8a7iH9z79T267LWl0Nfukisoy7yPzPfXtSzjd6eH3ioAl3Qb9+GTlKLW
         bRwC1OMUUuWJkaIwbY7ulWBY1isF6vSnaA51P7jKtk14PSeqz6p6n+t8lEmQV2OHOcUl
         go9psES4Sd8dIznn6RX8ek4wvpC9lJHkAKLq3hcHgeiF/a0BHk+YXx3J9M7rFhTbKwn9
         3lbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jBDdhPb+qvn/dBHPY34W6OYhoJDYrZsCUgdFWJmXhQg=;
        b=bABYT+Wfmxjsa2Kky+t/kHuRm3YLphrG4zqP4X5THrkjXcQlSwinANN8f9PQoXDuiE
         ZQVECxbGsss20wmVdsNeyd4SWA0lBdVxmdF9Z78K2obXEVSzWQQN2AaqIrPuqaukxEjb
         cx0Zx1AfxKmZczdTWRh+CyHmHn/8CjFklBFOyg5bcCVjOUB/nl/7/p3c3n2jsOH71HSg
         kHpdaq7Gi5WdQAGlJC96ewRgaTRPyUjCvACfcCQ4R7Y4Wyz6Ef3IZogKXJS5MyfAUHu5
         HT9OJw/LimOxvMz82QI8E3UTkxNnV3fEgUVBzoECXQ4BD/qXpp+DkLWaVug0Nw1Z8sqF
         Ez3g==
X-Gm-Message-State: APjAAAWh7LTZThhrUT6hZu8c6d3ItV2iXX4pQoFJmij6t5zJV92jy1va
        7qEF9P9ZyMFbKED/3Bj2FbWSbg==
X-Google-Smtp-Source: APXvYqz3BkF1Qr3TY1H40IC6hNnysDhF/ttV0uVWbbCMkYDmRlBpGzF2CKd00XJHZiO8yMtinvrRWw==
X-Received: by 2002:a0c:c48c:: with SMTP id u12mr31976887qvi.107.1557331771260;
        Wed, 08 May 2019 09:09:31 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id s50sm10936877qts.39.2019.05.08.09.09.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 May 2019 09:09:30 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Eric Anholt <eric@anholt.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 04/11] drm: Convert connector_helper_funcs->atomic_check to accept drm_atomic_state
Date:   Wed,  8 May 2019 12:09:09 -0400
Message-Id: <20190508160920.144739-5-sean@poorly.run>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190508160920.144739-1-sean@poorly.run>
References: <20190508160920.144739-1-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

Everyone who implements connector_helper_funcs->atomic_check reaches
into the connector state to get the atomic state. Instead of continuing
this pattern, change the callback signature to just give atomic state
and let the driver determine what it does and does not need from it.

Eventually all atomic functions should do this, but that's just too much
busy work for me.

Changes in v3:
- Added to the set
Changes in v4:
- None

Link to v3: https://patchwork.freedesktop.org/patch/msgid/20190502194956.218441-5-sean@poorly.run

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Eric Anholt <eric@anholt.net>
Acked-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/drm_atomic_helper.c      |  4 ++--
 drivers/gpu/drm/i915/intel_atomic.c      |  8 +++++---
 drivers/gpu/drm/i915/intel_dp_mst.c      |  7 ++++---
 drivers/gpu/drm/i915/intel_drv.h         |  2 +-
 drivers/gpu/drm/i915/intel_sdvo.c        |  9 +++++----
 drivers/gpu/drm/i915/intel_tv.c          |  8 +++++---
 drivers/gpu/drm/nouveau/dispnv50/disp.c  |  5 +++--
 drivers/gpu/drm/rcar-du/rcar_lvds.c      | 12 +++++++-----
 drivers/gpu/drm/vc4/vc4_txp.c            |  7 ++++---
 include/drm/drm_modeset_helper_vtables.h |  2 +-
 10 files changed, 37 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index e8b7187a8494..ee945d6f1cba 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -683,7 +683,7 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 		}
 
 		if (funcs->atomic_check)
-			ret = funcs->atomic_check(connector, new_connector_state);
+			ret = funcs->atomic_check(connector, state);
 		if (ret)
 			return ret;
 
@@ -725,7 +725,7 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 			continue;
 
 		if (funcs->atomic_check)
-			ret = funcs->atomic_check(connector, new_connector_state);
+			ret = funcs->atomic_check(connector, state);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/i915/intel_atomic.c b/drivers/gpu/drm/i915/intel_atomic.c
index b844e8840c6f..e8a5b82e9242 100644
--- a/drivers/gpu/drm/i915/intel_atomic.c
+++ b/drivers/gpu/drm/i915/intel_atomic.c
@@ -103,12 +103,14 @@ int intel_digital_connector_atomic_set_property(struct drm_connector *connector,
 }
 
 int intel_digital_connector_atomic_check(struct drm_connector *conn,
-					 struct drm_connector_state *new_state)
+					 struct drm_atomic_state *state)
 {
+	struct drm_connector_state *new_state =
+		drm_atomic_get_new_connector_state(state, conn);
 	struct intel_digital_connector_state *new_conn_state =
 		to_intel_digital_connector_state(new_state);
 	struct drm_connector_state *old_state =
-		drm_atomic_get_old_connector_state(new_state->state, conn);
+		drm_atomic_get_old_connector_state(state, conn);
 	struct intel_digital_connector_state *old_conn_state =
 		to_intel_digital_connector_state(old_state);
 	struct drm_crtc_state *crtc_state;
@@ -118,7 +120,7 @@ int intel_digital_connector_atomic_check(struct drm_connector *conn,
 	if (!new_state->crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_new_crtc_state(new_state->state, new_state->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
 
 	/*
 	 * These properties are handled by fastset, and might not end
diff --git a/drivers/gpu/drm/i915/intel_dp_mst.c b/drivers/gpu/drm/i915/intel_dp_mst.c
index 19d81cef2ab6..89cfec128ba0 100644
--- a/drivers/gpu/drm/i915/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/intel_dp_mst.c
@@ -143,9 +143,10 @@ static int intel_dp_mst_compute_config(struct intel_encoder *encoder,
 
 static int
 intel_dp_mst_atomic_check(struct drm_connector *connector,
-			  struct drm_connector_state *new_conn_state)
+			  struct drm_atomic_state *state)
 {
-	struct drm_atomic_state *state = new_conn_state->state;
+	struct drm_connector_state *new_conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
 	struct drm_connector_state *old_conn_state =
 		drm_atomic_get_old_connector_state(state, connector);
 	struct intel_connector *intel_connector =
@@ -155,7 +156,7 @@ intel_dp_mst_atomic_check(struct drm_connector *connector,
 	struct drm_dp_mst_topology_mgr *mgr;
 	int ret;
 
-	ret = intel_digital_connector_atomic_check(connector, new_conn_state);
+	ret = intel_digital_connector_atomic_check(connector, state);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/i915/intel_drv.h b/drivers/gpu/drm/i915/intel_drv.h
index f8c7b291fdc3..88571b8e8d62 100644
--- a/drivers/gpu/drm/i915/intel_drv.h
+++ b/drivers/gpu/drm/i915/intel_drv.h
@@ -2481,7 +2481,7 @@ int intel_digital_connector_atomic_set_property(struct drm_connector *connector,
 						struct drm_property *property,
 						u64 val);
 int intel_digital_connector_atomic_check(struct drm_connector *conn,
-					 struct drm_connector_state *new_state);
+					 struct drm_atomic_state *state);
 struct drm_connector_state *
 intel_digital_connector_duplicate_state(struct drm_connector *connector);
 
diff --git a/drivers/gpu/drm/i915/intel_sdvo.c b/drivers/gpu/drm/i915/intel_sdvo.c
index 68f497493d43..72ea164b971c 100644
--- a/drivers/gpu/drm/i915/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/intel_sdvo.c
@@ -2342,9 +2342,10 @@ static const struct drm_connector_funcs intel_sdvo_connector_funcs = {
 };
 
 static int intel_sdvo_atomic_check(struct drm_connector *conn,
-				   struct drm_connector_state *new_conn_state)
+				   struct drm_atomic_state *state)
 {
-	struct drm_atomic_state *state = new_conn_state->state;
+	struct drm_connector_state *new_conn_state =
+		drm_atomic_get_new_connector_state(state, conn);
 	struct drm_connector_state *old_conn_state =
 		drm_atomic_get_old_connector_state(state, conn);
 	struct intel_sdvo_connector_state *old_state =
@@ -2356,13 +2357,13 @@ static int intel_sdvo_atomic_check(struct drm_connector *conn,
 	    (memcmp(&old_state->tv, &new_state->tv, sizeof(old_state->tv)) ||
 	     memcmp(&old_conn_state->tv, &new_conn_state->tv, sizeof(old_conn_state->tv)))) {
 		struct drm_crtc_state *crtc_state =
-			drm_atomic_get_new_crtc_state(new_conn_state->state,
+			drm_atomic_get_new_crtc_state(state,
 						      new_conn_state->crtc);
 
 		crtc_state->connectors_changed = true;
 	}
 
-	return intel_digital_connector_atomic_check(conn, new_conn_state);
+	return intel_digital_connector_atomic_check(conn, state);
 }
 
 static const struct drm_connector_helper_funcs intel_sdvo_connector_helper_funcs = {
diff --git a/drivers/gpu/drm/i915/intel_tv.c b/drivers/gpu/drm/i915/intel_tv.c
index 3924c4944e1f..a41c5b467c14 100644
--- a/drivers/gpu/drm/i915/intel_tv.c
+++ b/drivers/gpu/drm/i915/intel_tv.c
@@ -1817,16 +1817,18 @@ static const struct drm_connector_funcs intel_tv_connector_funcs = {
 };
 
 static int intel_tv_atomic_check(struct drm_connector *connector,
-				 struct drm_connector_state *new_state)
+				 struct drm_atomic_state *state)
 {
+	struct drm_connector_state *new_state;
 	struct drm_crtc_state *new_crtc_state;
 	struct drm_connector_state *old_state;
 
+	new_state = drm_atomic_get_new_connector_state(state, connector);
 	if (!new_state->crtc)
 		return 0;
 
-	old_state = drm_atomic_get_old_connector_state(new_state->state, connector);
-	new_crtc_state = drm_atomic_get_new_crtc_state(new_state->state, new_state->crtc);
+	old_state = drm_atomic_get_old_connector_state(state, connector);
+	new_crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
 
 	if (old_state->tv.mode != new_state->tv.mode ||
 	    old_state->tv.margins.left != new_state->tv.margins.left ||
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 4b1650f51955..7ba373f493b2 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -948,11 +948,12 @@ nv50_mstc_get_modes(struct drm_connector *connector)
 
 static int
 nv50_mstc_atomic_check(struct drm_connector *connector,
-		       struct drm_connector_state *new_conn_state)
+		       struct drm_atomic_state *state)
 {
-	struct drm_atomic_state *state = new_conn_state->state;
 	struct nv50_mstc *mstc = nv50_mstc(connector);
 	struct drm_dp_mst_topology_mgr *mgr = &mstc->mstm->mgr;
+	struct drm_connector_state *new_conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
 	struct drm_connector_state *old_conn_state =
 		drm_atomic_get_old_connector_state(state, connector);
 	struct drm_crtc_state *crtc_state;
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 620b51aab291..5b81ba2a7f27 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -92,13 +92,15 @@ static int rcar_lvds_connector_get_modes(struct drm_connector *connector)
 }
 
 static int rcar_lvds_connector_atomic_check(struct drm_connector *connector,
-					    struct drm_connector_state *state)
+					    struct drm_atomic_state *state)
 {
 	struct rcar_lvds *lvds = connector_to_rcar_lvds(connector);
 	const struct drm_display_mode *panel_mode;
+	struct drm_connector_state *conn_state;
 	struct drm_crtc_state *crtc_state;
 
-	if (!state->crtc)
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (!conn_state->crtc)
 		return 0;
 
 	if (list_empty(&connector->modes)) {
@@ -110,9 +112,9 @@ static int rcar_lvds_connector_atomic_check(struct drm_connector *connector,
 				      struct drm_display_mode, head);
 
 	/* We're not allowed to modify the resolution. */
-	crtc_state = drm_atomic_get_crtc_state(state->state, state->crtc);
-	if (IS_ERR(crtc_state))
-		return PTR_ERR(crtc_state);
+	crtc_state = drm_atomic_get_crtc_state(state, conn_state->crtc);
+	if (!crtc_state)
+		return -EINVAL;
 
 	if (crtc_state->mode.hdisplay != panel_mode->hdisplay ||
 	    crtc_state->mode.vdisplay != panel_mode->vdisplay)
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index c8b89a78f9f4..96f91c1b4b6e 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -221,17 +221,18 @@ static const u32 txp_fmts[] = {
 };
 
 static int vc4_txp_connector_atomic_check(struct drm_connector *conn,
-					struct drm_connector_state *conn_state)
+					  struct drm_atomic_state *state)
 {
+	struct drm_connector_state *conn_state;
 	struct drm_crtc_state *crtc_state;
 	struct drm_framebuffer *fb;
 	int i;
 
+	conn_state = drm_atomic_get_new_connector_state(state, conn);
 	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
 		return 0;
 
-	crtc_state = drm_atomic_get_new_crtc_state(conn_state->state,
-						   conn_state->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
 
 	fb = conn_state->writeback_job->fb;
 	if (fb->width != crtc_state->mode.hdisplay ||
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index aa509c107083..2cdf58da4c90 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1023,7 +1023,7 @@ struct drm_connector_helper_funcs {
 	 * deadlock.
 	 */
 	int (*atomic_check)(struct drm_connector *connector,
-			    struct drm_connector_state *state);
+			    struct drm_atomic_state *state);
 
 	/**
 	 * @atomic_commit:
-- 
Sean Paul, Software Engineer, Google / Chromium OS

