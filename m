Return-Path: <linux-renesas-soc+bounces-26930-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5F5D37A3E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 18:33:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA3443047413
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 17:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6AA239A7E0;
	Fri, 16 Jan 2026 17:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nHWU4I0+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C903536BCC4;
	Fri, 16 Jan 2026 17:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768584812; cv=none; b=O5eG8BZEIn8LIDj3KanzHEmZuLPabH10wacj1fyaV0ZkigO0zIQtick7SDEIb4pJ4Ad73/wm8EqZ8OAsinX8Ho+ijMwlq6ixppE1Jt7seQq7fxdMGLYRnxtfSpBaaQ7M66jYIzvXYmcrEXQ72YJi6Yqaamt8pYX1dmRIotj6/AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768584812; c=relaxed/simple;
	bh=q9mLaWcGE4un8yS+lqE3JMtbmXu+0+3wNFfi1FGdm4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZwYY7d+Cu4iei7z7c8cDdt85Nk2qkMiWv3mg4ugBgyI0j/qe3/Pctogh9Nz8RM5omiSycP0mGcP4nj9RbGqFhi5bcyNuGin5ZlmdNk7jLRB85ViK46KnIwm5NcFSwpI6RwTVi1SZnOmcRv7YmLcMqlD6sVrqIgujJJ9oOamkibM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nHWU4I0+; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 79643C1F1FD;
	Fri, 16 Jan 2026 17:32:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4C875606F9;
	Fri, 16 Jan 2026 17:33:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0B9F610B688EC;
	Fri, 16 Jan 2026 18:33:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768584803; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GMcadQbEAhLIcK+wFfr5iTPjY0nkzGM3bzuOMc2uZCs=;
	b=nHWU4I0+KxmgIAhJj+X+1QvYlCO+E9NOovnKwgGx+IUuRkMoMOfeP+9FEeg3wGxe0S6B1h
	pNhC3bvl/d1es3WQnFfQeXJX4d19PIkVVoU0IOtehR1/YN7/4T2oaJP6p8YzcTLS/t9hh1
	ZjX+zAUFAucjU8RvPToqcBv0EvKRNeOPyiFA63JGeLUEUXWBDk/wP+P9JGyKPM0yOV2Erv
	6XNyv3eX1Fzr8GsEtMBRn51+mm51hRnsF3etAj6SFvEvLn53VjHLdJ46iBGUNe5M+Onxru
	kp25OLSHFDYuDQ+3xgj5htmztvHgvh7zv3VWkOngMUqbGAergZMi3+3oXJfrXA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 16 Jan 2026 18:32:39 +0100
Subject: [PATCH 4/6] drm/mcde: dsi: convert to of_drm_find_and_get_bridge()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-drm-bridge-alloc-getput-drm_of_find_bridge-4-v1-4-e34b38f50d27@bootlin.com>
References: <20260116-drm-bridge-alloc-getput-drm_of_find_bridge-4-v1-0-e34b38f50d27@bootlin.com>
In-Reply-To: <20260116-drm-bridge-alloc-getput-drm_of_find_bridge-4-v1-0-e34b38f50d27@bootlin.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, Linus Walleij <linusw@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

of_drm_find_bridge() is deprecated. Move to its replacement
of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
is put when done.

We need to handle the two cases: when a panel is found and when it isn't,
even though the latter is not supported. So:

 * in case a panel is not found and bridge is, get a reference to the
   found bridge
 * in case a panel is found, get a reference to the panel_bridge when it
   is added, so the following code always get exactly one reference that
   it needs to put

Finally, use the next_bridge pointer in struct drm_bridge in order to
simplify putting the reference.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/mcde/mcde_dsi.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 3faebe571fc2..bd2135fd4293 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -40,7 +40,6 @@ struct mcde_dsi {
 	struct mcde *mcde;
 	struct drm_bridge bridge;
 	struct drm_panel *panel;
-	struct drm_bridge *bridge_out;
 	struct mipi_dsi_host dsi_host;
 	struct mipi_dsi_device *mdsi;
 	const struct drm_display_mode *mode;
@@ -1060,7 +1059,7 @@ static int mcde_dsi_bridge_attach(struct drm_bridge *bridge,
 	}
 
 	/* Attach the DSI bridge to the output (panel etc) bridge */
-	return drm_bridge_attach(encoder, d->bridge_out, bridge, flags);
+	return drm_bridge_attach(encoder, d->bridge.next_bridge, bridge, flags);
 }
 
 static const struct drm_bridge_funcs mcde_dsi_bridge_funcs = {
@@ -1076,7 +1075,7 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 	struct mcde_dsi *d = dev_get_drvdata(dev);
 	struct device_node *child;
 	struct drm_panel *panel = NULL;
-	struct drm_bridge *bridge = NULL;
+	struct drm_bridge *bridge __free(drm_bridge_put) = NULL;
 
 	if (!of_get_available_child_count(dev->of_node)) {
 		dev_info(dev, "unused DSI interface\n");
@@ -1112,7 +1111,8 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 				PTR_ERR(panel));
 			panel = NULL;
 
-			bridge = of_drm_find_bridge(child);
+			drm_bridge_put(bridge); // In case of multiple matching loops
+			bridge = of_drm_find_and_get_bridge(child);
 			if (!bridge) {
 				dev_err(dev, "failed to find bridge\n");
 				of_node_put(child);
@@ -1127,6 +1127,7 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 			dev_err(dev, "error adding panel bridge\n");
 			return PTR_ERR(bridge);
 		}
+		drm_bridge_get(bridge);
 		dev_info(dev, "connected to panel\n");
 		d->panel = panel;
 	} else if (bridge) {
@@ -1138,7 +1139,7 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 		return -ENODEV;
 	}
 
-	d->bridge_out = bridge;
+	d->bridge.next_bridge = drm_bridge_get(bridge);
 
 	/* Create a bridge for this DSI channel */
 	d->bridge.of_node = dev->of_node;
@@ -1158,7 +1159,7 @@ static void mcde_dsi_unbind(struct device *dev, struct device *master,
 	struct mcde_dsi *d = dev_get_drvdata(dev);
 
 	if (d->panel)
-		drm_panel_bridge_remove(d->bridge_out);
+		drm_panel_bridge_remove(d->bridge.next_bridge);
 	regmap_update_bits(d->prcmu, PRCM_DSI_SW_RESET,
 			   PRCM_DSI_SW_RESET_DSI0_SW_RESETN, 0);
 }

-- 
2.52.0


