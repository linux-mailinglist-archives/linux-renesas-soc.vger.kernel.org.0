Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91AE145081
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2019 02:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725801AbfFNA1Q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jun 2019 20:27:16 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:33855 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbfFNA1Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jun 2019 20:27:16 -0400
Received: by mail-qk1-f193.google.com with SMTP id t8so628109qkt.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Jun 2019 17:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l7C0S5WJfNJgOiJ52J26beAsusEAv+KWpAN7qYsheGE=;
        b=eB9KHsQFoDVQBCbvWWjk4NNJVeOT6qXMnZMoAb+7XVeblYYU6KS0h8f1wlsXwuUyYq
         dHHr0KQiFB9xM0BiVk5qCkyxRu+NwoklEQwxKSqCKukuAzhlPg+4luqI2XOTHJ0ZPyp2
         prmwNGDLYcF1MraHo3cP5WaAm6CoH9F29RCjd2u89p2DI6/LqPSt7RYLtatx0CH6f9um
         Y8fID80t77YMhvbXA30oyIDSOvGkVQNFrRsvb7XDcpnflzb3a7n2Q5nxSBYaY7NgOpmn
         GYM38LUW1K3iprHANmHmaNwGNyvemPDCeJcBypBDmgqKh4mwUaJB1rptuWg8ux/IuWyL
         42vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l7C0S5WJfNJgOiJ52J26beAsusEAv+KWpAN7qYsheGE=;
        b=drsKinPyIJejD05ujIoKH+SY+1EWjeDjXKTuX1S+edt+WnlQj7PpMj29FPDPbQOjkJ
         LJ7+19c2agG863yJ4CLf7Tl5M+8FYNL+ZX+GCFvJaa5c3E0kJDeyZEcV6jaYRl4sfiR2
         lRSqTMo6ELNKFAQ2iEZkwiqU+8FIKt2MiIR6oG414DE2bw0T784/6SYmPfV5slrUUTiW
         jC31bZkaV7Z5kjsWdlPPbf5TnN9VB88/EIkWDPMyU3rm1J+aCykvtxZ+qnOPTAWBh/u9
         KKEVLl8wR56OlAvMepi521n/kyrMRWMQuv3tibQ7VBbTr4BOGLbZ0ftN10Q/N/QEk5A9
         SPCQ==
X-Gm-Message-State: APjAAAXIwIujQ7deA/RyY704j0TEbYSFZt9RA/DUIAX+RhSEAftNG31a
        xzbnHh/7BNt9DDK4PSxZj835nw==
X-Google-Smtp-Source: APXvYqyyRZKo36Hih+LhL9ssw2RDugm/GxI/CEdMIrA92jp9jxXVdjxKImfgSr4FB+cE1T6TocYo+g==
X-Received: by 2002:a37:9c8:: with SMTP id 191mr72861748qkj.341.1560472035395;
        Thu, 13 Jun 2019 17:27:15 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id x10sm982920qtc.34.2019.06.13.17.27.13
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 17:27:14 -0700 (PDT)
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
        Lyude Paul <lyude@redhat.com>,
        Karol Herbst <karolherbst@gmail.com>,
        Ilia Mirkin <imirkin@alum.mit.edu>,
        intel-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Harry Wentland <harry.wentland@amd.com>,
        Leo Li <sunpeng.li@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
        amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: Fix connector atomic_check compilation fail
Date:   Thu, 13 Jun 2019 20:27:00 -0400
Message-Id: <20190614002713.141340-1-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

I missed amdgpu in my connnector_helper_funcs->atomic_check conversion,
which is understandably causing compilation failures.

Fixes: 6f3b62781bbd ("drm: Convert connector_helper_funcs->atomic_check to accept drm_atomic_state")
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Eric Anholt <eric@anholt.net>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com> [for rcar lvds]
Cc: Sean Paul <seanpaul@chromium.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Karol Herbst <karolherbst@gmail.com>
Cc: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Reported-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 3a723e553a193..3d5e828c3d284 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3953,9 +3953,10 @@ is_hdr_metadata_different(const struct drm_connector_state *old_state,
 
 static int
 amdgpu_dm_connector_atomic_check(struct drm_connector *conn,
-				 struct drm_connector_state *new_con_state)
+				 struct drm_atomic_state *state)
 {
-	struct drm_atomic_state *state = new_con_state->state;
+	struct drm_connector_state *new_con_state =
+		drm_atomic_get_new_connector_state(state, conn);
 	struct drm_connector_state *old_con_state =
 		drm_atomic_get_old_connector_state(state, conn);
 	struct drm_crtc *crtc = new_con_state->crtc;
-- 
Sean Paul, Software Engineer, Google / Chromium OS

