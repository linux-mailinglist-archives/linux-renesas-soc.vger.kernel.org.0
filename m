Return-Path: <linux-renesas-soc+bounces-29701-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEUhB5HhuWmnPAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29701-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 00:19:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3942B4300
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 00:19:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 55FA8300468C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 23:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B8229BDB5;
	Tue, 17 Mar 2026 23:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fRK+sB4f"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2B937E30D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 23:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773789579; cv=none; b=uoWr1ZJnYVkNVZDx9fLPHE11HxejR8SwcnS7ukimOTwP/optCS0s99t+CZ6lHW3HYd2HnlVl0DQUZo3AMUDSpseI3MQEQXZUA7zzzDAXSuUKZb2UHJ0gGwsFqWMX99Geb13fVLAZAk04e6SuVICsyhoa4gs9vgnWaluTxI2EHAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773789579; c=relaxed/simple;
	bh=VUBPoq8RlSJcSAm4lz0007Pdbq9oQcUgdMLx2Ch+530=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hmfO4CXRaqsaDVSNYTSK2k7gMjapvs+Yp11PUg/Puxeu7b9qT8ghvAF43ppABnZTUhlYicrZp4Htru2gXWttMYOjRt3gR4OMPLE8UlvQIuyv3LSjuw697bS98JQe+Of1B+Xf2Tdh5csZlkyRpB0fy6cr+8lnstjQoDsqVmfF6fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fRK+sB4f; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B8BEBDA4;
	Wed, 18 Mar 2026 00:18:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773789502;
	bh=VUBPoq8RlSJcSAm4lz0007Pdbq9oQcUgdMLx2Ch+530=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fRK+sB4fbvr+WSMcGc1OYL6OSqmvDuMDb/6x31EoBGg6Npp3fJliFjNzrehF58m1I
	 oH6C/fGhkC9+Iqdw5tow3fxYRZNr3WMuMLJ+q3oSrAethDMZQ6cQJkK7WaGGh/ki94
	 Yg9ivx3/uVBnJaX+yT6EdEAf8DiDsdyMfNx2NLqY=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH 2/4] drm: rcar-du: Store CMM device pointer instead of platform_device
Date: Wed, 18 Mar 2026 01:19:28 +0200
Message-ID: <20260317231930.595719-3-laurent.pinchart+renesas@ideasonboard.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-29701-lists,linux-renesas-soc=lfdr.de,renesas];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 2A3942B4300
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The DU driver stores the CMM devices as pointers to struct
platform_device, and passes them to the API exposed by the CMM driver.
This is similar to how the VSP is handled, except that the VSP uses
struct device pointers. Replace the CMM platform_device pointers with
device pointers for consistency.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c    | 26 +++++++++----------
 drivers/gpu/drm/renesas/rcar-du/rcar_cmm.h    | 18 ++++++-------
 .../gpu/drm/renesas/rcar-du/rcar_du_crtc.h    |  2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h |  2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |  6 ++---
 5 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
index 93ba115d654f..5bced9d778e8 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
@@ -59,7 +59,7 @@ static void rcar_cmm_lut_write(struct rcar_cmm *rcmm,
 
 /*
  * rcar_cmm_setup() - Configure the CMM unit
- * @pdev: The platform device associated with the CMM instance
+ * @dev: The device associated with the CMM instance
  * @config: The CMM unit configuration
  *
  * Configure the CMM unit with the given configuration. Currently enabling,
@@ -73,10 +73,10 @@ static void rcar_cmm_lut_write(struct rcar_cmm *rcmm,
  * TODO: Add support for LUT double buffer operations to avoid updating the
  * LUT table entries while a frame is being displayed.
  */
-int rcar_cmm_setup(struct platform_device *pdev,
+int rcar_cmm_setup(struct device *dev,
 		   const struct rcar_cmm_config *config)
 {
-	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
+	struct rcar_cmm *rcmm = dev_get_drvdata(dev);
 
 	/* Disable LUT if no table is provided. */
 	if (!config->lut.table) {
@@ -102,7 +102,7 @@ EXPORT_SYMBOL_GPL(rcar_cmm_setup);
 
 /*
  * rcar_cmm_enable() - Enable the CMM unit
- * @pdev: The platform device associated with the CMM instance
+ * @dev: The device associated with the CMM instance
  *
  * When the output of the corresponding DU channel is routed to the CMM unit,
  * the unit shall be enabled before the DU channel is started, and remain
@@ -113,11 +113,11 @@ EXPORT_SYMBOL_GPL(rcar_cmm_setup);
  * It is an error to attempt to enable an already enabled CMM unit, or to
  * attempt to disable a disabled unit.
  */
-int rcar_cmm_enable(struct platform_device *pdev)
+int rcar_cmm_enable(struct device *dev)
 {
 	int ret;
 
-	ret = pm_runtime_resume_and_get(&pdev->dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
 		return ret;
 
@@ -127,7 +127,7 @@ EXPORT_SYMBOL_GPL(rcar_cmm_enable);
 
 /*
  * rcar_cmm_disable() - Disable the CMM unit
- * @pdev: The platform device associated with the CMM instance
+ * @dev: The device associated with the CMM instance
  *
  * See rcar_cmm_enable() for usage information.
  *
@@ -135,27 +135,27 @@ EXPORT_SYMBOL_GPL(rcar_cmm_enable);
  * state shall thus be restored with rcar_cmm_setup() when re-enabling the CMM
  * unit after the next rcar_cmm_enable() call.
  */
-void rcar_cmm_disable(struct platform_device *pdev)
+void rcar_cmm_disable(struct device *dev)
 {
-	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
+	struct rcar_cmm *rcmm = dev_get_drvdata(dev);
 
 	rcar_cmm_write(rcmm, CM2_LUT_CTRL, 0);
 	rcmm->lut.enabled = false;
 
-	pm_runtime_put(&pdev->dev);
+	pm_runtime_put(dev);
 }
 EXPORT_SYMBOL_GPL(rcar_cmm_disable);
 
 /*
  * rcar_cmm_init() - Initialize the CMM unit
- * @pdev: The platform device associated with the CMM instance
+ * @dev: The device associated with the CMM instance
  *
  * Return: 0 on success, -EPROBE_DEFER if the CMM is not available yet,
  *         -ENODEV if the DRM_RCAR_CMM config option is disabled
  */
-int rcar_cmm_init(struct platform_device *pdev)
+int rcar_cmm_init(struct device *dev)
 {
-	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
+	struct rcar_cmm *rcmm = dev_get_drvdata(dev);
 
 	if (!rcmm)
 		return -EPROBE_DEFER;
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.h b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.h
index 628072acc98b..1454605b8100 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.h
@@ -10,8 +10,8 @@
 
 #define CM2_LUT_SIZE		256
 
+struct device;
 struct drm_color_lut;
-struct platform_device;
 
 /**
  * struct rcar_cmm_config - CMM configuration
@@ -26,29 +26,29 @@ struct rcar_cmm_config {
 };
 
 #if IS_ENABLED(CONFIG_DRM_RCAR_CMM)
-int rcar_cmm_init(struct platform_device *pdev);
+int rcar_cmm_init(struct device *pdev);
 
-int rcar_cmm_enable(struct platform_device *pdev);
-void rcar_cmm_disable(struct platform_device *pdev);
+int rcar_cmm_enable(struct device *pdev);
+void rcar_cmm_disable(struct device *pdev);
 
-int rcar_cmm_setup(struct platform_device *pdev,
+int rcar_cmm_setup(struct device *pdev,
 		   const struct rcar_cmm_config *config);
 #else
-static inline int rcar_cmm_init(struct platform_device *pdev)
+static inline int rcar_cmm_init(struct device *pdev)
 {
 	return -ENODEV;
 }
 
-static inline int rcar_cmm_enable(struct platform_device *pdev)
+static inline int rcar_cmm_enable(struct device *pdev)
 {
 	return 0;
 }
 
-static inline void rcar_cmm_disable(struct platform_device *pdev)
+static inline void rcar_cmm_disable(struct device *pdev)
 {
 }
 
-static inline int rcar_cmm_setup(struct platform_device *pdev,
+static inline int rcar_cmm_setup(struct device *pdev,
 				 const struct rcar_cmm_config *config)
 {
 	return 0;
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
index d0f38a8b3561..07a40b305be8 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
@@ -65,7 +65,7 @@ struct rcar_du_crtc {
 	unsigned int vblank_count;
 
 	struct rcar_du_group *group;
-	struct platform_device *cmm;
+	struct device *cmm;
 	struct rcar_du_vsp *vsp;
 	unsigned int vsp_pipe;
 
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h
index 5cfa2bb7ad93..9e160dede4e6 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h
@@ -106,7 +106,7 @@ struct rcar_du_device {
 	unsigned int num_crtcs;
 
 	struct rcar_du_group groups[RCAR_DU_MAX_GROUPS];
-	struct platform_device *cmms[RCAR_DU_MAX_CRTCS];
+	struct device *cmms[RCAR_DU_MAX_CRTCS];
 	struct rcar_du_vsp vsps[RCAR_DU_MAX_VSPS];
 	struct drm_bridge *lvds[RCAR_DU_MAX_LVDS];
 	struct drm_bridge *dsi[RCAR_DU_MAX_DSI];
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
index 60e6f43b8ab2..f38e45d38ad2 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
@@ -806,13 +806,13 @@ static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
 		 * -ENODEV is used to report that the CMM config option is
 		 * disabled: return 0 and let the DU continue probing.
 		 */
-		ret = rcar_cmm_init(pdev);
+		ret = rcar_cmm_init(&pdev->dev);
 		if (ret) {
 			platform_device_put(pdev);
 			return ret == -ENODEV ? 0 : ret;
 		}
 
-		rcdu->cmms[i] = pdev;
+		rcdu->cmms[i] = &pdev->dev;
 
 		/*
 		 * Enforce suspend/resume ordering by making the CMM a provider
@@ -835,7 +835,7 @@ static void rcar_du_modeset_cleanup(struct drm_device *dev, void *res)
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(rcdu->cmms); ++i)
-		platform_device_put(rcdu->cmms[i]);
+		put_device(rcdu->cmms[i]);
 }
 
 int rcar_du_modeset_init(struct rcar_du_device *rcdu)
-- 
Regards,

Laurent Pinchart


