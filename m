Return-Path: <linux-renesas-soc+bounces-30118-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAtGNr92wWkQTQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30118-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 18:22:07 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 617732F9CC0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 18:22:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 32BC0318DFCB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 16:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED863B8D5C;
	Mon, 23 Mar 2026 16:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eXT4M9be"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA743C1980
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2026 16:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774284334; cv=none; b=jsDNQ2f3P9c8QCTAVbjHEma5KvUq/TIMEPWHcPemK4fTgHK0uTWCSgjxN8ElIFgYyRjUk5wuFbHe3u2aXRIroJHY4xghuj45AMcEBd9L23bkt8nPOvJJmTilSp19Qi7LLazk6uOWX+kWe1AHVkinBrzIlawFiqb3sqmHWKw4PSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774284334; c=relaxed/simple;
	bh=irn/Vmr2Ro8QyVixq34LbrCvDYRZUwvoUDgjU2tuSBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WOfMD3IeOM5GeZmpjAys+3S0iD4z3QKSHuT7/ExanrG7Az1cSFBNDt17oaBqvAkjHTiAo9jwoztRY7ZuAjAlKxvoXbarQLDdSJAbraFwt+0GWGrhX6IUpIsqjgPmlwkZzBIJrDgRIb2rirZI9syYypoFQcPxmsk0fxLJyO2Yo5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eXT4M9be; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 192EE266F;
	Mon, 23 Mar 2026 17:44:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774284254;
	bh=irn/Vmr2Ro8QyVixq34LbrCvDYRZUwvoUDgjU2tuSBE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eXT4M9beRGrqhjEstSNA8hC6RUdjZiuPAX41N7+rw7VKcD5H4CwWTD7WGGij8I+sL
	 dboyX5VHQKHaQXnXtQLPtVbtoBv3Xy5vXnpcfxuOQW1kIP2LKpvlA0DeQm9tHXWq59
	 fIV5CFsiQyOIrsQ74yxdDLyciBNPBDgrRzE4bKhY=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v2 2/4] drm: rcar-du: Store CMM device pointer instead of platform_device
Date: Mon, 23 Mar 2026 18:45:24 +0200
Message-ID: <20260323164526.2292491-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260323164526.2292491-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20260323164526.2292491-1-laurent.pinchart+renesas@ideasonboard.com>
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
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-30118-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 617732F9CC0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The DU driver stores the CMM devices as pointers to struct
platform_device, and passes them to the API exposed by the CMM driver.
This is similar to how the VSP is handled, except that the VSP uses
struct device pointers. Replace the CMM platform_device pointers with
device pointers for consistency.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Renamed function arguments from pdev to dev
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
index 628072acc98b..c420113430b9 100644
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
+int rcar_cmm_init(struct device *dev);
 
-int rcar_cmm_enable(struct platform_device *pdev);
-void rcar_cmm_disable(struct platform_device *pdev);
+int rcar_cmm_enable(struct device *dev);
+void rcar_cmm_disable(struct device *dev);
 
-int rcar_cmm_setup(struct platform_device *pdev,
+int rcar_cmm_setup(struct device *dev,
 		   const struct rcar_cmm_config *config);
 #else
-static inline int rcar_cmm_init(struct platform_device *pdev)
+static inline int rcar_cmm_init(struct device *dev)
 {
 	return -ENODEV;
 }
 
-static inline int rcar_cmm_enable(struct platform_device *pdev)
+static inline int rcar_cmm_enable(struct device *dev)
 {
 	return 0;
 }
 
-static inline void rcar_cmm_disable(struct platform_device *pdev)
+static inline void rcar_cmm_disable(struct device *dev)
 {
 }
 
-static inline int rcar_cmm_setup(struct platform_device *pdev,
+static inline int rcar_cmm_setup(struct device *dev,
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


