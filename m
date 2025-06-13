Return-Path: <linux-renesas-soc+bounces-18251-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7167DAD86F0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 11:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D78F33B9D30
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 09:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F136279DCD;
	Fri, 13 Jun 2025 09:05:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F7729CB24
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Jun 2025 09:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749805520; cv=none; b=k2Qv/RzC6+KpYjamkERVQT90ykzM5nfpgG/byazygcLfLCspk53ayTcJSkq7J7m7QRNlE17vwKYdPS5L31YLmly9xGFIiD/qNX130j1zfMHm8WhBIPOvNomD4v7uNA0wO669P1PbtvYUGPYqrz5Ou6cgYEBPxkGpElgcs8liUNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749805520; c=relaxed/simple;
	bh=x45ukw67OJuRzl6QgbEuYIut/uVOQEz2BADU3nbw8Oo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UnG7hyK6jazeYdgQnME8XFQ0d48kjJQ4D0rNGUT/AtNSM8XuhKje9BYYoFlV8Ol1XQ6Vk3NHUxUpOCPsUp5V0m35P+wSJ1OVdtKJWhOrRPQ3vpKg/SE/eBaLoZTJGZp+j7fU3/hAi4ngGL48UodH/cKjlwmTQ4k8UhD+Bnr/Ai4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D93101F891;
	Fri, 13 Jun 2025 09:04:42 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 11BCF137FE;
	Fri, 13 Jun 2025 09:04:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mOb7AqrpS2inNAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 13 Jun 2025 09:04:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch,
	airlied@gmail.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	geert@linux-m68k.org,
	tomi.valkeinen@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	xen-devel@lists.xenproject.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v5 10/25] drm/imx/ipuv3: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Fri, 13 Jun 2025 11:00:29 +0200
Message-ID: <20250613090431.127087-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613090431.127087-1-tzimmermann@suse.de>
References: <20250613090431.127087-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Rspamd-Queue-Id: D93101F891
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Score: -4.00

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. The hardware requires the framebuffer width to be a
multiple of 8. The scanline pitch has to be large enough to support
this. Therefore compute the byte size of 8 pixels in the given color
mode and align the pitch accordingly.

v5:
- fix typo in commit description

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
---
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c | 31 ++++++++++++++++++------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
index af4a30311e18..465b5a6ad5bb 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
@@ -17,7 +17,9 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_fbdev_dma.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_managed.h>
@@ -141,19 +143,32 @@ static int imx_drm_dumb_create(struct drm_file *file_priv,
 			       struct drm_device *drm,
 			       struct drm_mode_create_dumb *args)
 {
-	u32 width = args->width;
+	u32 fourcc;
+	const struct drm_format_info *info;
+	u64 pitch_align;
 	int ret;
 
-	args->width = ALIGN(width, 8);
-	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
-	args->size = args->pitch * args->height;
-
-	ret = drm_gem_dma_dumb_create_internal(file_priv, drm, args);
+	/*
+	 * Hardware requires the framebuffer width to be aligned to
+	 * multiples of 8. The mode-setting code handles this, but
+	 * the buffer pitch has to be aligned as well. Set the pitch
+	 * alignment accordingly, so that the each scanline fits into
+	 * the allocated buffer.
+	 */
+	fourcc = drm_driver_color_mode_format(drm, args->bpp);
+	if (fourcc == DRM_FORMAT_INVALID)
+		return -EINVAL;
+	info = drm_format_info(fourcc);
+	if (!info)
+		return -EINVAL;
+	pitch_align = drm_format_info_min_pitch(info, 0, SZ_8);
+	if (!pitch_align || pitch_align > U32_MAX)
+		return -EINVAL;
+	ret = drm_mode_size_dumb(drm, args, pitch_align, 0);
 	if (ret)
 		return ret;
 
-	args->width = width;
-	return ret;
+	return drm_gem_dma_dumb_create(file_priv, drm, args);
 }
 
 static const struct drm_driver imx_drm_driver = {
-- 
2.49.0


