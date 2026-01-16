Return-Path: <linux-renesas-soc+bounces-26928-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D28ED37A3B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 18:33:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E1CF30508A2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 17:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4358E394496;
	Fri, 16 Jan 2026 17:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="00DqBXZ6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAF839525D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jan 2026 17:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768584807; cv=none; b=LBc2QqpY75vbGCmL3QD99AWR0RNUNdJgb0RuzAbTjMlIUHdL4Z61mRSML3WjQE+AFVO/pcrBnhC3xWKUiDjzxxqUy4yARYkQUdhggho/UxWKViyskvGHUNX9J5Jyq6DVA+h62xEWLJgJR627s8+99CJ0VapLpkAKkWFBoKnRoHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768584807; c=relaxed/simple;
	bh=BHMI5cZX0CNLkjeQo46La9pw6SwOIPMWy1ez9c7bmQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pXFmGS8wMcEyi5QDJPRy1P7MAKKlLPfAmcEOm116Gce9KVazaBs+Qw3iOoLNDjgE544z36zKH8AWLKwbJDji/tUmkJAVAAVbPXgfNCBXCFPwkGA40ZVb35hRAtJ6THHqbH5sQWAnyaxgfAMO1uSTfn54v1k1SCpeO/BSXFIjw18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=00DqBXZ6; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 516CD4E4211A;
	Fri, 16 Jan 2026 17:33:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 255C5606F9;
	Fri, 16 Jan 2026 17:33:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 805F510B686BE;
	Fri, 16 Jan 2026 18:33:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768584797; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XWvPrNM51DRgWiT+4jttnUuVuHPq0djc3tV/ZM+m9o0=;
	b=00DqBXZ6UzRS/aLVK8QYcupDhaJq22/amgLzGzGLat9m1McDxVvnZWaWYcempf+fR2a7HU
	1R6db19pMLi01HSus6kmbRMWs/XSQw/2qo/zarYhZA8kvD4EpezBG7BqINkxFFuFcwPPXy
	DeEjCoebOCKMgVHlvy0yDC6g/7xQvtlgWRG4reDyXaMNy75RXZDajrLlr2XRWEswvdEz7B
	SigPnEoirPQSC/Q9geO34Zjs9IucigYxXvu8XDoh98A6jN+M5TdwtpeROD0zvcOXl2rEYX
	QgfolNwhVT1pd/X+VHTjgGr0ADW4FhlpydZ4OBkMjTW+Kw4FNp+Hlz9ZFhP3Gw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 16 Jan 2026 18:32:37 +0100
Subject: [PATCH 2/6] drm/kmb/dsi: convert to of_drm_find_and_get_bridge()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-drm-bridge-alloc-getput-drm_of_find_bridge-4-v1-2-e34b38f50d27@bootlin.com>
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
of_drm_find_and_get_bridge() which gets a bridge reference.

This driver has global variables for the DSI host and DSI device, and code
to allocate them on probe but no code to free them when on remove. So it
does not at all support removal, and not even multiple instances. For this
reason putting the reference would be pointless here.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/kmb/kmb_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index faf38ca9e44c..8c8908c3bf32 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -251,7 +251,7 @@ int kmb_dsi_host_bridge_init(struct device *dev)
 		return -EINVAL;
 	}
 	/* Locate drm bridge from the hdmi encoder DT node */
-	adv_bridge = of_drm_find_bridge(encoder_node);
+	adv_bridge = of_drm_find_and_get_bridge(encoder_node);
 	of_node_put(dsi_out);
 	of_node_put(encoder_node);
 	if (!adv_bridge) {

-- 
2.52.0


