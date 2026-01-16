Return-Path: <linux-renesas-soc+bounces-26927-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 26839D37A44
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 18:35:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6186F30D3ADB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 17:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA17395D9B;
	Fri, 16 Jan 2026 17:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="J2VuVEmR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3149D392C41;
	Fri, 16 Jan 2026 17:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768584800; cv=none; b=tMHDNnQEWkuFU2oWOKd7cmcaXT9CsuIQzGSa9qSraMgTaa5FHwTVdYNK3j6/cLZ1zRuOlEMXZF8qoEU9muG3Pbnfl4MTE26Y5eYnXSwN1nxRJaByAhE6D3WrkDtboKPMsdPh62dpjdXCBwF6H20Fzmx8B3T8PVi7a7KkkS+yqa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768584800; c=relaxed/simple;
	bh=iErtiSC36F3AUFBxqKldHjpcGezk5nxgqgJonzj+4wU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mj9RRY5vTLidsRpeCMSLM4ZAdZ31tDAjk6oxBnXGvjLt7ZgkIM/U1xgoYDgbARuoN85kgJqwBwTqSmry1Pob8sqbiuYWwxXbHdQpx9o83lnBcJ0bjqv7rPDIjW6DqvXU9RHn2bozfjQY+kqptk5V18ccN+xWV0HvbqocyVksdsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=J2VuVEmR; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7B7744E42118;
	Fri, 16 Jan 2026 17:33:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5122F606F9;
	Fri, 16 Jan 2026 17:33:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E44C810B68691;
	Fri, 16 Jan 2026 18:33:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768584795; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7D5QQyExNyfyjBaZdxllAyYcdraSblv1miW7+FtWhKM=;
	b=J2VuVEmRYXdllUmJsgqx8GMHcQE/5/YprW6IyoYLsat6DpJZlqslAM9KqXn1iXtvNmM0wL
	fG1JHM3/Bzqix74bdstRYq+XE4O1KFom7jH/RWcGRQeNDh87+4aJCPH9Vw3Bds2GG/Sftd
	fIMmL7l+udv1aCdoicKh8evbRyKnweqCbzn4vXVVvZrIt4/W+Iyz+mBElbcPGI+h94u50x
	DXKsiVZ6vgNP2MVtoyhlr2AUoR0ZhO56UyvSGlYdLPKcJOtoJKsJ8zZXq38Hhr2+fJ5N9Y
	ucEP4suRLY0MAkQ6Q9meC4rOlZcGJS2J4YHv1PA5rhOazDDs3xEKgCtnBD1FKA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 16 Jan 2026 18:32:36 +0100
Subject: [PATCH 1/6] drm: renesas: rz-du: rzg2l_du_encoder: convert to
 of_drm_find_and_get_bridge()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-drm-bridge-alloc-getput-drm_of_find_bridge-4-v1-1-e34b38f50d27@bootlin.com>
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

This is made somewhat simpler by the fact that 'bridge' is a local
variable.

However we need to handle both branches of the main if().

In the 'else' case, just switch to of_drm_find_and_get_bridge() to ensure
the bridge is not freed while in use in the function tail
(drm_bridge_attach() mainly).

In the 'then' case, devm_drm_panel_bridge_add_typed() already increments
the refcount using devres which ties the bridge allocation lifetime to the
device lifetime, so we would not need to do anything. However to have the
same behaviour in both branches take an additional reference here, so that
the bridge needs to be put whichever branch is taken without more
complicated logic. Ensure to clear the bridge pointer however, to avoid
calling drm_bridge_put() on an ERR_PTR.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
index 5e6dd16705e6..9b65bcefdb86 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
@@ -67,7 +67,7 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
 {
 	struct rzg2l_du_encoder *renc;
 	struct drm_connector *connector;
-	struct drm_bridge *bridge;
+	struct drm_bridge *bridge __free(drm_bridge_put) = NULL;
 	int ret;
 
 	/*
@@ -83,10 +83,16 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
 
 		bridge = devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
 							 DRM_MODE_CONNECTOR_DPI);
-		if (IS_ERR(bridge))
-			return PTR_ERR(bridge);
+		if (IS_ERR(bridge)) {
+			// Inhibit the cleanup action on an ERR_PTR
+			ret = PTR_ERR(bridge);
+			bridge = NULL;
+			return ret;
+		}
+
+		drm_bridge_get(bridge);
 	} else {
-		bridge = of_drm_find_bridge(enc_node);
+		bridge = of_drm_find_and_get_bridge(enc_node);
 		if (!bridge)
 			return -EPROBE_DEFER;
 	}

-- 
2.52.0


