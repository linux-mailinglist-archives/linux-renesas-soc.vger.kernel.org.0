Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 209B43D1CC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2019 18:09:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391043AbfFKQJ0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Jun 2019 12:09:26 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:44264 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390098AbfFKQJ0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jun 2019 12:09:26 -0400
Received: by mail-qk1-f194.google.com with SMTP id w187so7971968qkb.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Jun 2019 09:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OBf0lQRcXsyg8fsgFAJ+xQgu38XLvonKyLrXp/PVzyk=;
        b=bKV4balWRuvNX3FCvP4K9BYbbQ6sCumChGMeosFCP55oNEULNouE6aviGNQOx00SpP
         4nQunwlonELt9n7xkQ3LZIg6hn2LOlarlkQ4UTrSsJlaxbax3DpvJErrsy9QdMQoC4LJ
         o0cBcee1pMVdiekz3ly3OVWmwZ7rmwzDQDa3qsDKwxNdGhLRe3Nxj9yIP/sxCWX1Grxy
         EuFCL7nTKJuycqObBCel4Hd1TQthhqjovqQbhNlPOXVJTmlN2gvwy3M1veEoZ/t06Yjp
         vS+/2q/Rp2VB+B9Tg6GFE0e1d6MZ8Lj54fI2HTT0I12qr7ttR1cochw08jRn35DPZHxF
         P9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OBf0lQRcXsyg8fsgFAJ+xQgu38XLvonKyLrXp/PVzyk=;
        b=niuBojysR+CA+l81RTnIrJnK5Ha+j3ESxoMNv5+c+L9F5n70YWvSM60243DvppRG4g
         DEQYilyBY2AdaCCNu51rHYrqymUaFH6JD57uUju3PklWDM8uj/rsb4gQE7MN0Getm5vZ
         GIiAeg9RYsOymoEck9fC+VqLNL0gmejeoBHIwHZLS9KFUJVEisviZ1kTBWgcWTOs3qFF
         y6UseLocsDBTpHkr0D0U9ItKVZ7uD8G81xTwl42tXGy90ffeHXw21txhE3m8UcZQZaE3
         TTw53h0HwWY9qT5PPjBmTqt4TxqjR5CV2GZv/4sqjsBna/EsGbdNiQ/IeeadJwrqIwXB
         b0Hw==
X-Gm-Message-State: APjAAAV2HFe6HL79SY1HwTUFxslNXPZye/Lqu7CozzLGKBKH80QS6emT
        p27aVShoGIY4sb7WKI8E0mIrMw==
X-Google-Smtp-Source: APXvYqxYaG3mJqqjA9Q+EqnPEypAk88amvwqHxVpOQ46FxuTwvUb5wqm/LH+p1in9nI3pKvnDmyC7Q==
X-Received: by 2002:a37:a890:: with SMTP id r138mr42187300qke.218.1560269365329;
        Tue, 11 Jun 2019 09:09:25 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id d188sm6755094qkf.40.2019.06.11.09.09.23
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 09:09:24 -0700 (PDT)
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
        Heiko Stuebner <heiko@sntech.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 04/11] drm: Convert connector_helper_funcs->atomic_check to accept drm_atomic_state
Date:   Tue, 11 Jun 2019 12:08:18 -0400
Message-Id: <20190611160844.257498-5-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
In-Reply-To: <20190611160844.257498-1-sean@poorly.run>
References: <20190611160844.257498-1-sean@poorly.run>
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
Changes in v5:
- intel_digital_connector_atomic_check declaration moved to i915_atomic.h

Link to v3: https://patchwork.freedesktop.org/patch/msgid/20190502194956.218441-5-sean@poorly.run
Link to v4: https://patchwork.freedesktop.org/patch/msgid/20190508160920.144739-5-sean@poorly.run

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Eric Anholt <eric@anholt.net>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/drm_atomic_helper.c      |  4 ++--
 drivers/gpu/drm/i915/intel_atomic.c      |  8 +++++---
 drivers/gpu/drm/i915/intel_atomic.h      |  2 +-
 drivers/gpu/drm/i915/intel_dp_mst.c      |  7 ++++---
 drivers/gpu/drm/i915/intel_sdvo.c        |  9 +++++----
 drivers/gpu/drm/i915/intel_tv.c          |  8 +++++---
 drivers/gpu/drm/nouveau/dispnv50/disp.c  |  5 +++--
 drivers/gpu/drm/rcar-du/rcar_lvds.c      | 12 +++++++-----
 drivers/gpu/drm/vc4/vc4_txp.c            |  7 ++++---
 include/drm/drm_modeset_helper_vtables.h |  2 +-
 10 files changed, 37 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 2133f62539176..e58be69960692 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -686,7 +686,7 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 		}
 
 		if (funcs->atomic_check)
-			ret = funcs->atomic_check(connector, new_connector_state);
+			ret = funcs->atomic_check(connector, state);
 		if (ret)
 			return ret;
 
@@ -728,7 +728,7 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 			continue;
 
 		if (funcs->atomic_check)
-			ret = funcs->atomic_check(connector, new_connector_state);
+			ret = funcs->atomic_check(connector, state);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/i915/intel_atomic.c b/drivers/gpu/drm/i915/intel_atomic.c
index 58b8049649a0f..ab40448a19d56 100644
--- a/drivers/gpu/drm/i915/intel_atomic.c
+++ b/drivers/gpu/drm/i915/intel_atomic.c
@@ -106,12 +106,14 @@ int intel_digital_connector_atomic_set_property(struct drm_connector *connector,
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
@@ -121,7 +123,7 @@ int intel_digital_connector_atomic_check(struct drm_connector *conn,
 	if (!new_state->crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_new_crtc_state(new_state->state, new_state->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
 
 	/*
 	 * These properties are handled by fastset, and might not end
diff --git a/drivers/gpu/drm/i915/intel_atomic.h b/drivers/gpu/drm/i915/intel_atomic.h
index 1c8507da1a690..58065d3161a34 100644
--- a/drivers/gpu/drm/i915/intel_atomic.h
+++ b/drivers/gpu/drm/i915/intel_atomic.h
@@ -28,7 +28,7 @@ int intel_digital_connector_atomic_set_property(struct drm_connector *connector,
 						struct drm_property *property,
 						u64 val);
 int intel_digital_connector_atomic_check(struct drm_connector *conn,
-					 struct drm_connector_state *new_state);
+					 struct drm_atomic_state *state);
 struct drm_connector_state *
 intel_digital_connector_duplicate_state(struct drm_connector *connector);
 
diff --git a/drivers/gpu/drm/i915/intel_dp_mst.c b/drivers/gpu/drm/i915/intel_dp_mst.c
index 0caf645fbbb84..60652ebbdf610 100644
--- a/drivers/gpu/drm/i915/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/intel_dp_mst.c
@@ -151,9 +151,10 @@ static int intel_dp_mst_compute_config(struct intel_encoder *encoder,
 
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
@@ -163,7 +164,7 @@ intel_dp_mst_atomic_check(struct drm_connector *connector,
 	struct drm_dp_mst_topology_mgr *mgr;
 	int ret;
 
-	ret = intel_digital_connector_atomic_check(connector, new_conn_state);
+	ret = intel_digital_connector_atomic_check(connector, state);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/i915/intel_sdvo.c b/drivers/gpu/drm/i915/intel_sdvo.c
index 6c98b35790db5..368b99f6f7fbd 100644
--- a/drivers/gpu/drm/i915/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/intel_sdvo.c
@@ -2353,9 +2353,10 @@ static const struct drm_connector_funcs intel_sdvo_connector_funcs = {
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
@@ -2367,13 +2368,13 @@ static int intel_sdvo_atomic_check(struct drm_connector *conn,
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
index 5dc594eafaf2f..0a95df6c6a57f 100644
--- a/drivers/gpu/drm/i915/intel_tv.c
+++ b/drivers/gpu/drm/i915/intel_tv.c
@@ -1821,16 +1821,18 @@ static const struct drm_connector_funcs intel_tv_connector_funcs = {
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
index 4b1650f51955d..7ba373f493b29 100644
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
index 620b51aab291f..5b81ba2a7f272 100644
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
index c8b89a78f9f4f..96f91c1b4b6e6 100644
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
index 0701b3a3108e5..0899f53180e59 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1027,7 +1027,7 @@ struct drm_connector_helper_funcs {
 	 * deadlock.
 	 */
 	int (*atomic_check)(struct drm_connector *connector,
-			    struct drm_connector_state *state);
+			    struct drm_atomic_state *state);
 
 	/**
 	 * @atomic_commit:
-- 
Sean Paul, Software Engineer, Google / Chromium OS

