Return-Path: <linux-renesas-soc+bounces-24356-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8B2C41E87
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 08 Nov 2025 00:05:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C5793B9332
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 23:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06FC92E040D;
	Fri,  7 Nov 2025 23:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="yMFO3eL4";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="YCBwyK8p"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBF36A33B
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Nov 2025 23:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762556726; cv=none; b=l4p3BONJfAEURkxdqNn0A9jW9lzR7EfASX1qFox97mFy66iEUw8xPzPnEuNyhClAu1CCqjmUklPRxTgzsjQmgcHPQJnoima7X070hMgDBfNAICFcM/rkTFUvsaqbZNYfaYX3pbYIVfqRQ3YgrjQst2o8PLAEL6m9pknUPOXLm3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762556726; c=relaxed/simple;
	bh=ari8UhD/d+WX382VHHvjaAJzfjGooWDyMkcGlZ2JiAE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FXZIEJh11SOLSqLgw85mKX+0e773HMQJdeYsWtUrsYnbLBdZfdHBJwXDLw75tlFi01KSu7PPS/MJdFEPzX7oXkOaWG8JwE27wYrCU4e/nGSbFPcrnArmLzmbBbiOz8WCa0Q2JJSG+Fj/nSIJR7tJfBFAhaWFSGjndt6+n2tpQv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=yMFO3eL4; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=YCBwyK8p; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4d3F5b13wlz9sy9;
	Sat,  8 Nov 2025 00:05:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762556723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0evSFeD56GOAdAv0d5qxmcVH10/osVKRuYfNE0zbx2k=;
	b=yMFO3eL4LdEpjEeH5PAGf2HrYHzUkariUy78jeRpTAgfoDSMNGBRWiGftmqeC/uM4h/Sq2
	KuPyedfq3RSSJP/Ra+EHsScDQl4pcEz2OgRw97JULSV84ZFZtVkmAPS/8FPNmS/xxYfgiH
	Jc6Jks16og7y6ByS1q1jYQiPRXTjzLtAGjfTW/uTXZc4CqnEClVkqjpHNZ+uceP9l/j+QX
	Tsjbm8K/oT/a+Zx3pPWQ0os8gN2npYn+X2GUbf3LZQmJE5xIIfMsoEp2ET6upXfqAGvKQI
	yl/wk8tqKvS3EpnG8WOq6vQ4PbEklU0urPiEAVwPkmflYBe/n2EjFZHCDdkwzA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762556721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0evSFeD56GOAdAv0d5qxmcVH10/osVKRuYfNE0zbx2k=;
	b=YCBwyK8prdPevXGX4RqHyLiz9leNmnxmte3271rI5BtkzumGo29GHKVX/d1sCyQdVieisD
	JxJINhRO1FMr6kxiB+np5/ZBA/ZFji3KGSP24Io+GQdX9wOYHWg7De1P4dtVfY5Ob43fI7
	ciXvnVkd68xkAIl7jcY/hy8PsVLixPZOsg88R0mKDXBnu50TuMyoe+942MaBHWYW2Q7/i6
	liib6Bkrv8tKcSOWcQmzFhVOAgQWyGl8cjLyh5A+Nfnd1v62iInsZM2pRYGHdHrs8nz2ol
	9Hqc7xcnYEK+1Zw+vXEf1eQUEknXksii7dAupLBZ2fUvSxqprGzfNLz2gmWLDQ==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm/atomic-helper: rcar-du: Enable CRTC early on R-Car DU
Date: Sat,  8 Nov 2025 00:04:26 +0100
Message-ID: <20251107230517.471894-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 597f3ce88561df07777
X-MBO-RS-META: iihdrhx1drn6nxepuj4bmxeibeej3iba

Introduce a variant of drm_atomic_helper_commit_modeset_enables()
which enables CRTC before encoder/bridge. This is needed on R-Car DU,
where the CRTC provides clock to LVDS and DSI, and has to be started
before a bridge may call .prepare , which may trigger e.g. DSI transfer.

This specifically fixes the case where ILI9881C is connected to R-Car
DU DSI. The ILI9881C panel driver does DSI command transfer in its
struct drm_panel_funcs .prepare function, which is currently called
before R-Car DU rcar_du_crtc_atomic_enable() rcar_mipi_dsi_pclk_enable()
and the DSI command transfer times out.

Fix this by restoring the enable ordering introduced in commit
c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable
and post-disable"), to enable CRTC early.

Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/drm_atomic_helper.c           | 24 +++++++++++++++++++
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |  2 +-
 include/drm/drm_atomic_helper.h               |  2 ++
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 5a473a274ff06..c0cdd36a03df1 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1692,6 +1692,30 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_enables);
 
+/**
+ * drm_atomic_helper_commit_modeset_enables_crtc_early - modeset commit to enable outputs, start CRTC early
+ * @dev: DRM device
+ * @state: atomic state object being committed
+ *
+ * This function is a variant of drm_atomic_helper_commit_modeset_enables()
+ * which enables CRTC before encoder/bridge. This is needed on R-Car DU,
+ * where the CRTC provides clock to LVDS and DSI, and has to be started
+ * before a bridge may call .prepare , which may trigger e.g. DSI transfer.
+ */
+void
+drm_atomic_helper_commit_modeset_enables_crtc_early(struct drm_device *dev,
+						    struct drm_atomic_state *state)
+{
+	crtc_enable(dev, state);
+
+	encoder_bridge_pre_enable(dev, state);
+
+	encoder_bridge_enable(dev, state);
+
+	drm_atomic_helper_commit_writebacks(dev, state);
+}
+EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_enables_crtc_early);
+
 /*
  * For atomic updates which touch just a single CRTC, calculate the time of the
  * next vblank, and inform all the fences of the deadline.
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
index 116ad9605704b..b7e2a735a03ae 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
@@ -547,7 +547,7 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 	drm_atomic_helper_commit_modeset_disables(dev, old_state);
 	drm_atomic_helper_commit_planes(dev, old_state,
 					DRM_PLANE_COMMIT_ACTIVE_ONLY);
-	drm_atomic_helper_commit_modeset_enables(dev, old_state);
+	drm_atomic_helper_commit_modeset_enables_crtc_early(dev, old_state);
 
 	drm_atomic_helper_commit_hw_done(old_state);
 	drm_atomic_helper_wait_for_flip_done(dev, old_state);
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 53382fe93537b..d7fb473db3431 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -93,6 +93,8 @@ void drm_atomic_helper_commit_modeset_disables(struct drm_device *dev,
 					       struct drm_atomic_state *state);
 void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 					  struct drm_atomic_state *old_state);
+void drm_atomic_helper_commit_modeset_enables_crtc_early(struct drm_device *dev,
+							 struct drm_atomic_state *old_state);
 
 int drm_atomic_helper_prepare_planes(struct drm_device *dev,
 				     struct drm_atomic_state *state);
-- 
2.51.0


