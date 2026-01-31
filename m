Return-Path: <linux-renesas-soc+bounces-27745-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOyKJzwnfmmLWAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27745-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Jan 2026 17:01:00 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1817BC2DCB
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Jan 2026 17:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A71723042D43
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Jan 2026 15:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D91733C52A;
	Sat, 31 Jan 2026 15:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fzMmmqFn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CEE340DB1;
	Sat, 31 Jan 2026 15:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769875142; cv=none; b=dWi6u389rRPb5uw4orcxsuIFlJwIQNruINTajQ3AGPh4OyoZKab6QRnocFjdZ/hFJxOB/5wNzEkq3ocoPODF66wOdz8EUullCPaTCWDg54uqNFUG4pOg1mqphageG8YCkZS46ZQ007gtC+I5v+NM+TqOUuozdXw+Y8pjKvbBzgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769875142; c=relaxed/simple;
	bh=m2qDoKi91f3lAIwsCV6C3vIi8YqJ6O3APi5f5Uf5onY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gw6qvMTfXAE9Nc5KYhjAxNKZzCVu7gp4QXjMYKyfMHUIZJsvez56WO+VQlmfgakZqX+xil0zlgSzj3qZaU4wKUzrGu1RKEzitW85eH+qAmQdN+F6D9AGkyvLREZImN0CxOJnXIC/904+Ip8rknwMvPEmmUxvTFfSoVMyY5vVjaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fzMmmqFn; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 939F2C22F7F;
	Sat, 31 Jan 2026 15:59:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AA1A1606B6;
	Sat, 31 Jan 2026 15:58:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9735E119A88F3;
	Sat, 31 Jan 2026 16:58:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769875138; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rN3xt3h5v4YQ9J23cLsAxFTBdfizY8hmnA3Lo4/tdxE=;
	b=fzMmmqFnipcPBSbm3bJCtchU+67qXPft4La/14Rp1esg5WA85F1cyD0Oh97WbaA3nSoQxi
	VC+LnwQ3RITlnkoto/J7GiN9FU3XnwV4UdDme37IAUj2xQA7pIHj0GC8uyP0T527anWvda
	iG+wCgUPXh7LicPwmJh2RswEAyjNkPTgVzITS6OKTBtWvhkRI3Zl7+kfZ45wgEckjOYFMT
	73jSnetbMzMzy5On+HtYhvADonMZqt71mKN1PJWHXjLDrUkS5adxxiDfX6+spKAVh/aRpy
	6EM9judsNxy0bqCJzMjsZeqDYNFfIWBErZI7aKzlzsc7aR7ZI6T5pZo9F+hWpQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Sat, 31 Jan 2026 16:58:36 +0100
Subject: [PATCH v2 4/6] drm/mcde: dsi: convert to
 of_drm_find_and_get_bridge()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260131-drm-bridge-alloc-getput-drm_of_find_bridge-4-v2-4-e081bcdc1467@bootlin.com>
References: <20260131-drm-bridge-alloc-getput-drm_of_find_bridge-4-v2-0-e081bcdc1467@bootlin.com>
In-Reply-To: <20260131-drm-bridge-alloc-getput-drm_of_find_bridge-4-v2-0-e081bcdc1467@bootlin.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Linus Walleij <linusw@kernel.org>, 
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27745-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ideasonboard.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:dkim,bootlin.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1817BC2DCB
X-Rspamd-Action: no action

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

Changes in v2:
- Removed drm_bridge_put(), not needed after the previous patch changes:
  the loop cannot assign 'bridge' more than once now
- Not added Linus' R-by because of this change
---
 drivers/gpu/drm/mcde/mcde_dsi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 5893fd2681b3..47d45897ed06 100644
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
@@ -1109,7 +1108,7 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 				PTR_ERR(panel));
 			panel = NULL;
 
-			bridge = of_drm_find_bridge(child);
+			bridge = of_drm_find_and_get_bridge(child);
 			if (!bridge) {
 				dev_err(dev, "failed to find bridge\n");
 				of_node_put(child);
@@ -1129,6 +1128,7 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 			dev_err(dev, "error adding panel bridge\n");
 			return PTR_ERR(bridge);
 		}
+		drm_bridge_get(bridge);
 		dev_info(dev, "connected to panel\n");
 		d->panel = panel;
 	} else if (bridge) {
@@ -1140,7 +1140,7 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 		return -ENODEV;
 	}
 
-	d->bridge_out = bridge;
+	d->bridge.next_bridge = drm_bridge_get(bridge);
 
 	/* Create a bridge for this DSI channel */
 	d->bridge.of_node = dev->of_node;
@@ -1160,7 +1160,7 @@ static void mcde_dsi_unbind(struct device *dev, struct device *master,
 	struct mcde_dsi *d = dev_get_drvdata(dev);
 
 	if (d->panel)
-		drm_panel_bridge_remove(d->bridge_out);
+		drm_panel_bridge_remove(d->bridge.next_bridge);
 	regmap_update_bits(d->prcmu, PRCM_DSI_SW_RESET,
 			   PRCM_DSI_SW_RESET_DSI0_SW_RESETN, 0);
 }

-- 
2.52.0


