Return-Path: <linux-renesas-soc+bounces-32829-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAXtLIuPDGp1jAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32829-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 18:27:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD38558258D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 18:27:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2965530B6DC4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 16:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA73409623;
	Tue, 19 May 2026 16:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YWRae9hL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB0E407CC7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 16:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779206932; cv=none; b=BZnJoOOw0aqDzwskKm/Px8FmWwG8fVXwhAA6Fzri6rRCivDucYnJtR7qUGKUIXwLkYRWPXujYl2/Z4dCMpvl89vhLsvDyYMdy+ptETNH6p9RiHyloe2Yfab3DVt7y4oiCMBj5DfBqP+8ijc06B019m7ZLqSxBYl2Idx01rCYSgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779206932; c=relaxed/simple;
	bh=+xVm8Xax4VAKdAhD5oD6QA4LEfJKKTaqqkmkZvU9t8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OS8pdPK/Kc/GyveBGgEFFd5YO8tgkGYcnB1EIwQs6A4lMAzZXsYXUaa6ygDMBYPaPjYJYKY7cd+DvSk+r3fHO9ds9SWiPsxecd46iz1Tu6D2zOlOlDPqhOp2lM9XcIfSKcSpoFmoQioh6j0u21HlBZxTihd9sYWnp9CinzVZXc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YWRae9hL; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so36816025e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 09:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779206928; x=1779811728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JPi1O/9kVNRbabQOXnYQalc7uFGr2pxzXb6VmowUh3M=;
        b=YWRae9hLVyLEJTl2kvfb4kqBe/K7zu9EQ6bQOfPcFgsID4sp4tVy/5vhWR8HaC0Zu2
         I2hv84idH5NIEKlpQIPhntDsrVHCd9R2ipNFVp4KNW+j9BWv1Co9hbdPr1yE3I1B03uK
         03Nn2i0VCHKl7hWkwT4wcK0fsoqw6imZeg6jGwl6t/sGd+3959HJROfOcd3jRcfrcUjF
         OgBDN30RsQVHBk6grya4r9DIg3GPMNs3/2yjTA94FU9egQYIvLsIJqG+mRNrbYuAZyiM
         wXxIC8vL5xArmRDgii2PQ5Ty60mKGh6Psg4yZhiHIriUFucK3UQ048VcjZlgf9f3WRFR
         BqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779206928; x=1779811728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JPi1O/9kVNRbabQOXnYQalc7uFGr2pxzXb6VmowUh3M=;
        b=NbrYXEc/zpCbJxV+nFkHEnNfFNpaM+znoPtzEFZxnGCSiob6ecoueK2qxS9NyYXAbf
         ANeVN9VXtopZ+FyrHxTvQd8DPlhXdv/G9tYnBURaJhydRoO3lbAx5PL2wUDXtO5p0xdh
         pzrhQkWAsz5Lb0t2gvfcFrpYeP4B4imst84ze+n1BZN3yqUg2wAlpimJlYmCEcLAAQSs
         U7BndRJ1N+YmuxgzmdlJeVT5j5GGLr4d0q+76hEsl+pCSRESG2//Lvqn6ZvXeM1/eAuK
         tlAI+39mUV3Yw0G2tKnd94KRZyYKBZrwJBv5w/UlXe/Z1WYX9Y6w/fKmiT1O0kR7NIaN
         2NbQ==
X-Forwarded-Encrypted: i=1; AFNElJ+rpD52PBOkz6+Ovx2VJB+PypHJIDdcQry1Th4VQOP42X9vAocgMB07aRo21stVwq875nCidlCk30O7vNOFUeA6Ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTU4vgtEULGApGBf1dTkWHTTWPcXPYnNvjNkIMtOHZEYPVVQB7
	i3D/cqC9gd8jFGPyBq16uwMgVsC6iPVDR38CwBnBizo5ZNFvMz5CE8+S
X-Gm-Gg: Acq92OGNyxjbfDhZ9vBwzvYrK2vnvhfDN43AQP0ntmBqiP0xncECiiKuOgw40qpCMvD
	unhAd7rYLW67xs3px4F8aczSjFj232vlnjDKE9l8MfQKekVsOityaabIUvphDMkf2poD+Fk4OsZ
	WK5XVi9CLfrCeAvKi6O9Rle/lWjbWDPOwMkhdOAD+gWx9ML1BDhywqkVbeO6d+HVGhey76b7772
	3h1Ux9gjMaYOxaVtoHFZfqHOYXvtEopXkCsQa7ixC+asiqM81qiKFP+2Bcdt0H4M/l6I5ar3c7B
	W/1PYzfwxXc1g9AQRVX68AvWoZPqN6a7O3oGq7ysrt9FrU39rVw0Vo7hha7ah2oqqA9tAEN1tcl
	MmxOF6y7bBopw0696tZSZsy2bx1rNKUcs20V3zERDHBQS6PdaCUSDWS+ieHZ+4pMcRqEeaP/cXK
	bwWk6qLsSebNRTKrSnq3f945tUi0L5EJ3SrY1issJcl5LuVEYyfwW3NikaVusHzpMI3m4O1qEc/
	+rRbz+N3VfTbi1etntuWhxgeTExMomDxacyLA==
X-Received: by 2002:a05:600c:4692:b0:48a:906b:14ca with SMTP id 5b1f17b1804b1-48fe632579dmr319854455e9.20.1779206928193;
        Tue, 19 May 2026 09:08:48 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3f5e:825d:a98f:fd29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5ab527asm372645305e9.11.2026.05.19.09.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 09:08:47 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 5/5] drm: renesas: rz-du: Add support for RZ/T2H SoC
Date: Tue, 19 May 2026 17:08:25 +0100
Message-ID: <20260519160825.4082566-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260519160825.4082566-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260519160825.4082566-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32829-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[bp.renesas.com,ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,glider.be];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com,renesas.com,bp.renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ideasonboard.com:email]
X-Rspamd-Queue-Id: BD38558258D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/T2H (R9A09G077) SoC includes a DU with a DPI interface,
supporting resolutions up to WXGA with two RPFs for layer blending.
Unlike earlier RZ/G2L SoCs, RZ/T2H requires explicit assertion of a
DPI output-enable signal (DU_MCR0_DPI_EN) during CRTC startup.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v3->v4:
- Dropped per pad limits

v2->v3:
- Moved clock limits from device_info to output_routing to allow
  per-output constraints.

v1->v2:
- Added Reviewed-by tag from Laurent Pinchart.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |  7 ++++++-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 14 ++++++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  | 10 ++++++++++
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
index 48065f4952a3..d0f01aa642a7 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
@@ -28,6 +28,7 @@
 #include "rzg2l_du_vsp.h"
 
 #define DU_MCR0			0x00
+#define DU_MCR0_DPI_EN		BIT(0)
 #define DU_MCR0_DI_EN		BIT(8)
 
 #define DU_DITR0		0x10
@@ -217,8 +218,12 @@ static void rzg2l_du_crtc_put(struct rzg2l_du_crtc *rcrtc)
 static void rzg2l_du_start_stop(struct rzg2l_du_crtc *rcrtc, bool start)
 {
 	struct rzg2l_du_device *rcdu = rcrtc->dev;
+	u32 val = DU_MCR0_DI_EN;
 
-	writel(start ? DU_MCR0_DI_EN : 0, rcdu->mmio + DU_MCR0);
+	if (start && rzg2l_du_has(rcdu, RZG2L_DU_FEATURE_DPIO_OE))
+		val |= DU_MCR0_DPI_EN;
+
+	writel(start ? val : 0, rcdu->mmio + DU_MCR0);
 }
 
 static void rzg2l_du_crtc_start(struct rzg2l_du_crtc *rcrtc)
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index 1e4b9f38c55b..3d13f61d3c97 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -65,10 +65,24 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
 	},
 };
 
+static const struct rzg2l_du_device_info rzg2l_du_r9a09g077_info = {
+	.channels_mask = BIT(0),
+	.routes = {
+		[RZG2L_DU_OUTPUT_DPAD0] = {
+			.possible_outputs = BIT(0),
+			.port = 0,
+		},
+	},
+	.features = RZG2L_DU_FEATURE_DPIO_OE,
+	.mode_clock_min = 5000,
+	.mode_clock_max = 100000,
+};
+
 static const struct of_device_id rzg2l_du_of_table[] = {
 	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
 	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
 	{ .compatible = "renesas,r9a09g057-du", .data = &rzg2l_du_r9a09g057_info },
+	{ .compatible = "renesas,r9a09g077-du", .data = &rzg2l_du_r9a09g077_info },
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
index 885558eb9547..baf076d69cda 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
@@ -20,6 +20,8 @@
 struct device;
 struct drm_property;
 
+#define RZG2L_DU_FEATURE_DPIO_OE	BIT(0)	/* Has DPIO output enable control */
+
 enum rzg2l_du_output {
 	RZG2L_DU_OUTPUT_DSI0,
 	RZG2L_DU_OUTPUT_DPAD0,
@@ -46,12 +48,14 @@ struct rzg2l_du_output_routing {
  * @routes: array of CRTC to output routes, indexed by output (RZG2L_DU_OUTPUT_*)
  * @mode_clock_min: minimum pixel clock in kHz
  * @mode_clock_max: maximum pixel clock in kHz
+ * @features: device features (RZG2L_DU_FEATURE_*)
  */
 struct rzg2l_du_device_info {
 	unsigned int channels_mask;
 	struct rzg2l_du_output_routing routes[RZG2L_DU_OUTPUT_MAX];
 	u32 mode_clock_min;
 	u32 mode_clock_max;
+	unsigned int features;
 };
 
 #define RZG2L_DU_MAX_CRTCS		1
@@ -77,6 +81,12 @@ static inline struct rzg2l_du_device *to_rzg2l_du_device(struct drm_device *dev)
 	return container_of(dev, struct rzg2l_du_device, ddev);
 }
 
+static inline bool rzg2l_du_has(struct rzg2l_du_device *rcdu,
+				unsigned int feature)
+{
+	return rcdu->info->features & feature;
+}
+
 const char *rzg2l_du_output_name(enum rzg2l_du_output output);
 
 #endif /* __RZG2L_DU_DRV_H__ */
-- 
2.54.0


