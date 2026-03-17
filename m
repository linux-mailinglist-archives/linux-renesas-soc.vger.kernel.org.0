Return-Path: <linux-renesas-soc+bounces-29703-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFW8ApfiuWmnPAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29703-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 00:24:07 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9132B444A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 00:24:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF5F9300D604
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 23:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD3EC29BDB5;
	Tue, 17 Mar 2026 23:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SUEny50W"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4D137E30D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 23:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773789582; cv=none; b=J74DrJ1lngLB/dVndTWRFVFXi+GmmWgMcJayLslJ7aApCPcE/Rpb+inOb9Q5cJeSUpgYg37XusU/D7GPP339QO4x84EbDX/ELgZ758mRJbOyNbSHggb3xdkwHbh4cr1Oxli14Ldnl+Qw08Of01hD2tkTPlVLR7GeBw0Y03672xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773789582; c=relaxed/simple;
	bh=X7rmBsT/VLu4cXnU/1jFT5MXtJ/cKZy9Of0fz7nPLBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bFS3+15qpyn9KQEbHm1LQn8pLopCwC47UIKDLz6F+nbipW7l1rui1dnX+8u1pjk1Ra6RXD0wRj/MR1hmQie4//TSkg7yCibWw0eZWy70uWEKx/AQ2hYxHTHSP7m52sHj/ZMFGKtNmxVZyhlh9cASdqT0fbhso9ddwn5UdQjIH4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SUEny50W; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4CA00DF3;
	Wed, 18 Mar 2026 00:18:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773789505;
	bh=X7rmBsT/VLu4cXnU/1jFT5MXtJ/cKZy9Of0fz7nPLBw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SUEny50Wyw5/zZdrkDoyfpzv3I7P7Tz0bWwxfeDJN4LsMtl/W56c3GR0sEFAABm0X
	 zddo7SYB/JLHfdwi6blfonUrbutHPOoZDWF7+11nUgR86L8dOOOGWYEFh93gubKF3j
	 vIy66h9mC9DnjZTFUbabMmH7W8cmLMcTzeED6x4M=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH 4/4] drm: rcar-du: Don't leak device_link to CMM
Date: Wed, 18 Mar 2026 01:19:30 +0200
Message-ID: <20260317231930.595719-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260317231930.595719-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20260317231930.595719-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-29703-lists,linux-renesas-soc=lfdr.de,renesas];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: BE9132B444A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The DU driver creates device_link instances between the DU and CMMs, but
never deletes them. Fix it by introducing a rcar_du_cmm structure to
group the CMM device and device_link, and deleting the links at cleanup
time.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../gpu/drm/renesas/rcar-du/rcar_du_crtc.c    | 16 +++++-----
 .../gpu/drm/renesas/rcar-du/rcar_du_crtc.h    |  3 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h |  8 ++++-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 29 ++++++++++++-------
 4 files changed, 35 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
index 28a5aa5a14d8..7c36c30a75b6 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
@@ -513,13 +513,13 @@ static void rcar_du_cmm_setup(struct drm_crtc *crtc)
 	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
 	struct rcar_cmm_config cmm_config = {};
 
-	if (!rcrtc->cmm)
+	if (!rcrtc->cmm->dev)
 		return;
 
 	if (drm_lut)
 		cmm_config.lut.table = (struct drm_color_lut *)drm_lut->data;
 
-	rcar_cmm_setup(rcrtc->cmm, &cmm_config);
+	rcar_cmm_setup(rcrtc->cmm->dev, &cmm_config);
 }
 
 /* -----------------------------------------------------------------------------
@@ -667,8 +667,8 @@ static void rcar_du_crtc_stop(struct rcar_du_crtc *rcrtc)
 	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
 		rcar_du_vsp_disable(rcrtc);
 
-	if (rcrtc->cmm)
-		rcar_cmm_disable(rcrtc->cmm);
+	if (rcrtc->cmm->dev)
+		rcar_cmm_disable(rcrtc->cmm->dev);
 
 	/*
 	 * Select switch sync mode. This stops display operation and configures
@@ -726,8 +726,8 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
 	struct rcar_du_crtc_state *rstate = to_rcar_crtc_state(crtc->state);
 	struct rcar_du_device *rcdu = rcrtc->dev;
 
-	if (rcrtc->cmm)
-		rcar_cmm_enable(rcrtc->cmm);
+	if (rcrtc->cmm->dev)
+		rcar_cmm_enable(rcrtc->cmm->dev);
 	rcar_du_crtc_get(rcrtc);
 
 	/*
@@ -1300,8 +1300,8 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
 		return ret;
 
 	/* CMM might be disabled for this CRTC. */
-	if (rcdu->cmms[swindex]) {
-		rcrtc->cmm = rcdu->cmms[swindex];
+	if (rcdu->cmms[swindex].dev) {
+		rcrtc->cmm = &rcdu->cmms[swindex];
 		rgrp->cmms_mask |= BIT(hwindex % 2);
 
 		drm_mode_crtc_set_gamma_size(crtc, CM2_LUT_SIZE);
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
index 07a40b305be8..8857926e109a 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
@@ -19,6 +19,7 @@
 
 #include <media/vsp1.h>
 
+struct rcar_du_cmm;
 struct rcar_du_group;
 struct rcar_du_vsp;
 
@@ -65,7 +66,7 @@ struct rcar_du_crtc {
 	unsigned int vblank_count;
 
 	struct rcar_du_group *group;
-	struct device *cmm;
+	struct rcar_du_cmm *cmm;
 	struct rcar_du_vsp *vsp;
 	unsigned int vsp_pipe;
 
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h
index 9e160dede4e6..de9c6617a2d4 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h
@@ -22,6 +22,7 @@
 
 struct clk;
 struct device;
+struct device_link;
 struct drm_bridge;
 struct drm_property;
 struct rcar_du_device;
@@ -88,6 +89,11 @@ struct rcar_du_device_info {
 	unsigned int lvds_clk_mask;
 };
 
+struct rcar_du_cmm {
+	struct device *dev;
+	struct device_link *link;
+};
+
 #define RCAR_DU_MAX_CRTCS		4
 #define RCAR_DU_MAX_GROUPS		DIV_ROUND_UP(RCAR_DU_MAX_CRTCS, 2)
 #define RCAR_DU_MAX_VSPS		4
@@ -106,7 +112,7 @@ struct rcar_du_device {
 	unsigned int num_crtcs;
 
 	struct rcar_du_group groups[RCAR_DU_MAX_GROUPS];
-	struct device *cmms[RCAR_DU_MAX_CRTCS];
+	struct rcar_du_cmm cmms[RCAR_DU_MAX_CRTCS];
 	struct rcar_du_vsp vsps[RCAR_DU_MAX_VSPS];
 	struct drm_bridge *lvds[RCAR_DU_MAX_LVDS];
 	struct drm_bridge *dsi[RCAR_DU_MAX_DSI];
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
index 9a53b5a86c82..b2d0e4651e35 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
@@ -769,23 +769,23 @@ static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
 	}
 
 	for (i = 0; i < cells; ++i) {
-		struct device_node *cmm __free(device_node) = NULL;
+		struct device_node *cmm_node __free(device_node) = NULL;
+		struct rcar_du_cmm *cmm = &rcdu->cmms[i];
 		struct platform_device *pdev;
-		struct device_link *link;
 		int ret;
 
-		cmm = of_parse_phandle(np, "renesas,cmms", i);
-		if (!cmm) {
+		cmm_node = of_parse_phandle(np, "renesas,cmms", i);
+		if (!cmm_node) {
 			dev_err(rcdu->dev,
 				"Failed to parse 'renesas,cmms' property\n");
 			return -EINVAL;
 		}
 
-		if (!of_device_is_available(cmm))
+		if (!of_device_is_available(cmm_node))
 			/* It's fine to have a phandle to a non-enabled CMM. */
 			continue;
 
-		pdev = of_find_device_by_node(cmm);
+		pdev = of_find_device_by_node(cmm_node);
 		if (!pdev) {
 			dev_err(rcdu->dev, "No device found for CMM%u\n", i);
 			return -EINVAL;
@@ -801,14 +801,15 @@ static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
 			return ret == -ENODEV ? 0 : ret;
 		}
 
-		rcdu->cmms[i] = &pdev->dev;
+		cmm->dev = &pdev->dev;
 
 		/*
 		 * Enforce suspend/resume ordering by making the CMM a provider
 		 * of the DU: CMM is suspended after and resumed before the DU.
 		 */
-		link = device_link_add(rcdu->dev, &pdev->dev, DL_FLAG_STATELESS);
-		if (!link) {
+		cmm->link = device_link_add(rcdu->dev, cmm->dev,
+					    DL_FLAG_STATELESS);
+		if (!cmm->link) {
 			dev_err(rcdu->dev,
 				"Failed to create device link to CMM%u\n", i);
 			return -EINVAL;
@@ -823,8 +824,14 @@ static void rcar_du_modeset_cleanup(struct drm_device *dev, void *res)
 	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(rcdu->cmms); ++i)
-		put_device(rcdu->cmms[i]);
+	for (i = 0; i < ARRAY_SIZE(rcdu->cmms); ++i) {
+		struct rcar_du_cmm *cmm = &rcdu->cmms[i];
+
+		if (cmm->link)
+			device_link_del(cmm->link);
+
+		put_device(cmm->dev);
+	}
 }
 
 int rcar_du_modeset_init(struct rcar_du_device *rcdu)
-- 
Regards,

Laurent Pinchart


