Return-Path: <linux-renesas-soc+bounces-31764-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICTPMoY58mlopAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31764-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 19:01:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B127497E4F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 19:01:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C5B9D303D8B4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 17:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7B6E413249;
	Wed, 29 Apr 2026 17:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9v6t60E"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF0F410D29
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 17:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777482027; cv=none; b=NLtNkQqoAN9aNKY+50dDOUYEcmHjpXeAJjK+S/IikwaxFibIwk286NOWlxD2wEPQevgTPz66fcWwZKJA7pbnJfg//fGclo/UaXmkvc/VNyhnxMHTa53M3EA1U90q0zfpUVYzd3AveCB/6V1ygJsjTgvht6sFOoLamqpWRyWXOi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777482027; c=relaxed/simple;
	bh=5KJb4pUz9ISCWuOFq3mdW6ldExid2fnbaeYjkHbT2Ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qa8oGiWPE/XBFyJTVwJf++ZZPzYsXzlwNcXaM5hcmtkMhCecy5A8i9jWWUW69nWTk7XYhjotM8C+lFiOFbTNyI9SQwej5X+LiJkR64dS8tgGsZoX/fjIOC41CpdlBpdTHXqgqO4Bw2UPuPOULTlCB4v7I6M6RD/h3nEfrbgZC7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9v6t60E; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488ba840146so114513625e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 10:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777482023; x=1778086823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vkSm8ny43p543u10ucazCdZPdCMdlkGl7rYD8obUTQI=;
        b=L9v6t60EVwJS0l40I9Wxs7ixw3yT/RqlkQPjdsj8+jsEfZRhSBV5wCqavh5b+xkkIh
         cu/uSbyRPbXzLL0GlxeETvfbG0Rso5UlJ3ar1XeypEvWrvZVrP1nQkvva68BVCFR91RD
         Vt+/tMXh82o00vbnliNomQjABvJ0TUz4b+EepgwTRR6NUnCRIre2LWmiB46z6B2vQqHM
         Rmehb5/cHcBkV3N0+pRsFT4B9JYxBmZEB1mHpn7FLqWdr5RnoWBeanUG3peYcHHFdFUK
         3HoWWJH2wW3r3lTsLkXKY5sxq5gIhUeXjgWDJ49+p+9d+KWRQKASam0L7xAMrsqhSq9i
         Bg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482023; x=1778086823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vkSm8ny43p543u10ucazCdZPdCMdlkGl7rYD8obUTQI=;
        b=Ak9NbVfz7e6oQCLWiAGDHshOTeyhwegKuqCLtClQtas+qgM2JrCcb0w/H2OL7CNpVy
         ud4TeCblk+Ub8mpKepD1IyMCsfZeRjL1NzE6dyxVXNN+28kxF13dJlXG6WPJnplOU4Z6
         SrbQhAGCw1/JxO2Gc8nJA7EP2iqgk6dqwFmKCx8moRcAmUZAIBCDgAzhxlI5Q5qwvu0B
         pWQ1cgfjYkkb5p8TwPMB9ksxdFRQR3CuOCajpUnxL1FCr1X2kKvcRcucAQPeZR3Dhza5
         wYmO0SKqWdRc/SyzW1wVHLJji91EsJgcP3bIJ6ZZ3LxlfCHuhjzE4w6jPkYYZ4nPkT6I
         Oj+A==
X-Gm-Message-State: AOJu0YwyOwvREJ/wA12vv/r1Dn5IZnxY8nFk3RKVVolfAfEkQqdKUeJl
	Lp1sJpXMaQGDGq7+Pg5RmSHhAjjCvraXO5IwGgBoXzZEBo0AXFkhGh3f
X-Gm-Gg: AeBDievcCT8p39LlMjTNiRzmvloLzyCACC9xGEIDAwiNgV53bHKX4rcqp9PMZ7PZscY
	mABqtOnGbXDllWH1OmSvZ4+U3ZoqO3APikdpdwnyuVXLD6noyruTXEQG5KA9Cb0Rxt7GoGWJ7/8
	vj+u91zacWJRU4/TyuDcOTubgZT5ic077Ec5MG3Eqg6mhGBksiRbXs+bPEdRHppigWmALwDQVDV
	hB3Dp+WH/p54toqvJaXTUBjVBLBd3Dp9QgzGcXrGsnmgBCGOQEVGg5YczgUUVKKFJPAYvDD+7vg
	2AkNgZlt0O38hp+P5JQIPL7OI/SQ7wI4ah2Ne1wXFOXcLzfcLbEKPMbSeGkf8djFyTc+/8Hqwj0
	euSVhtSZhCSUu1A9iuEHqG+vVmy/ata5FQ4ILGF2lNEwjtd3HZlUyKiKa6wY7APi8nA+QD6GKTJ
	Zpes9vDeKUqq0o/oFR1RwE9vqwnZaSX1s8mB+pA8Ooh+QHFmAlGFIQMsrMovgAr704VCEQEUUCp
	9RNK8eREwXvIM67zaNbfUrRIUKsC0H27S4bEimIkK2LkF96
X-Received: by 2002:a05:600c:609a:b0:48a:54a6:b29f with SMTP id 5b1f17b1804b1-48a77b1da9dmr131662065e9.17.1777482022872;
        Wed, 29 Apr 2026 10:00:22 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:212b:3a69:4f2c:3897])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a820c856dsm4809755e9.6.2026.04.29.10.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 10:00:22 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/4] drm: renesas: rz-du: Add support for RZ/T2H SoC
Date: Wed, 29 Apr 2026 18:00:12 +0100
Message-ID: <20260429170012.366537-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5B127497E4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31764-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,pengutronix.de,glider.be,ideasonboard.com,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,renesas.com,bp.renesas.com];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/T2H (R9A09G077) SoC includes a DU with a DPI interface,
supporting resolutions up to WXGA with two RPFs for layer blending.
Unlike earlier RZ/G2L SoCs, RZ/T2H requires explicit assertion of a
DPI output-enable signal (DU_MCR0_DPI_EN) during CRTC startup.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |  7 ++++++-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 14 ++++++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  | 10 ++++++++++
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
index 2b772a11c7ee..017d5f26bc96 100644
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
index 3b7162c6e1f4..fc55dfffebaf 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -63,10 +63,24 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
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


