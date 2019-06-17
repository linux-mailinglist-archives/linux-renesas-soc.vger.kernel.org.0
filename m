Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A43B48BB8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 20:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbfFQSQG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 14:16:06 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:42701 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfFQSQG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 14:16:06 -0400
Received: by mail-qt1-f193.google.com with SMTP id s15so11884199qtk.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2019 11:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=37lcON4Q5cuuFVjtzVGGM/zMMeikjUdgaDG0gMlFfa0=;
        b=G2wI1CqeTDlCGQ69ZKTKlW5ToPx1/aZ+J1j3AvhoR4iRaQejp0jafmg9E9Zo9fIcoi
         VWTDUsK/42dVlYodFSCqLNswkvHdc4HlrPx4U0GDcZy2LKVd5Pb5Mvv5nYHJVdY1PqC7
         C9YW6sSZcJ3cl/SsKqdZZp6hly82ti/EtswFNt36594jIan27PZeZACF+nyaugCExpz1
         ecWzp9n/70aeRY3AE179OZKfqMrxloVsr7pJX8asSqHwDLQfFmAjZhNh6/ueF+d6Vu1S
         BheM9zO9h3lV+8uF+dXDi9FAslkbjPc7UM822coUjymmIuZJrOxIgyDGO6evxaf6rUuN
         lKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=37lcON4Q5cuuFVjtzVGGM/zMMeikjUdgaDG0gMlFfa0=;
        b=DyrFqrNK7I2qBWDImrnibBQiruj2a9S03AjgYSfWAc/0lPqSPPillQ7SOVFLGlaxBJ
         B74S609W3NmNRPvot1eyOlCC2yX05qv3DpchFh1k2M6AQJ4dSZUpZ1Va0IkUsoRI3zxl
         fsqtWIjN2z1F+ahE8yUgpxUCUM7knsL7rJAlzzJdWKRaJAbJs5+DIE1jx2kUriPb0blH
         1t3QxNzne4qeeHLsnqM9KKUL+o3b7HAKEmeSQdDDVj3yuf3AYp5mUCA9RB8xKQgT2ElZ
         sgOgxrkAzfZFlOhEwMbE2fK0/0dU/4H4j1/Spf6F/rGZ9IKMI7hMIb8ZPRYzJU/5H5Wc
         e8Kg==
X-Gm-Message-State: APjAAAWc3ak4AdwhnHW7aJEpggk9Zq3XoUeDXv7OVZ2D2vKWiKL+EZbS
        ahxjPrPkY1lxTuIdWGiu8eGDoQ==
X-Google-Smtp-Source: APXvYqxdM7PLs9QGhcr/Fx0QfODHq7qGPTdDffuZ6hzGaz6//LBmr2nkyDzhQxVJ9iRxyIuUsMMb1w==
X-Received: by 2002:a0c:88c3:: with SMTP id 3mr22062442qvo.21.1560795365692;
        Mon, 17 Jun 2019 11:16:05 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([100.100.175.19])
        by smtp.gmail.com with ESMTPSA id 15sm6976783qtf.2.2019.06.17.11.16.04
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 11:16:05 -0700 (PDT)
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
        kbuild test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] drm/rcar-du: Fix error check when retrieving crtc state
Date:   Mon, 17 Jun 2019 14:15:42 -0400
Message-Id: <20190617181548.124134-1-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

drm_atomic_get_crtc_state() returns an error pointer when it fails, so
the null check is doing nothing here.

Credit to 0-day/Dan Carpenter for reporting this.

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
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index f2a5d4d997073..1c62578590f46 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -115,8 +115,8 @@ static int rcar_lvds_connector_atomic_check(struct drm_connector *connector,
 
 	/* We're not allowed to modify the resolution. */
 	crtc_state = drm_atomic_get_crtc_state(state, conn_state->crtc);
-	if (!crtc_state)
-		return -EINVAL;
+	if (IS_ERR(crtc_state))
+		return PTR_ERR(crtc_state);
 
 	if (crtc_state->mode.hdisplay != panel_mode->hdisplay ||
 	    crtc_state->mode.vdisplay != panel_mode->vdisplay)
-- 
Sean Paul, Software Engineer, Google / Chromium OS

