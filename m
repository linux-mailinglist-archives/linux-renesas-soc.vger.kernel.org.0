Return-Path: <linux-renesas-soc+bounces-20849-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2C9B2F223
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 10:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 533CE168397
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 08:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 492472ED170;
	Thu, 21 Aug 2025 08:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="T9aVr0/E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5vOFrucC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="T9aVr0/E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5vOFrucC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B81D2FF171
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Aug 2025 08:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755764594; cv=none; b=VsjmG7tjhITW0jkPdojfhqof+mIcHW4kd2ChWVM3ECFcIi4s2o+tXQubPx2PFqps16UBTX9yHSUtu+9JlyCz3JPFkewCWwOVoB+AWvWWa/IxQPryj54/puZu16mj8QW0fCUV2GPdMwjZP/JuuwBQDsotlYPhd5NQjWcP9DcRVnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755764594; c=relaxed/simple;
	bh=5HLvDZoW/v+cdv+dxW3pK1VuH6liJdHtW/fjKHPf2As=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NFrq+19fHDmcwjiV+87KYv8IL8/uWvfwVSP9vQm5hcjz1B+FhERMKktGVwgwC4bB5FC+P+lCEdah3S8In+IntRK5iyrZvhuzXZah2ODu5WCFcrB83KlsOZ1zi7Ssks1szUsbWjHOTa/qJzXldhyeXlshnok7TqOvIvUWRrWbukk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=T9aVr0/E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5vOFrucC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=T9aVr0/E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5vOFrucC; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4714622650;
	Thu, 21 Aug 2025 08:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755764545; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kgypNVMMyj7G9RTUcdPLKrE/vfDgVYUf8Wo20zBqeqM=;
	b=T9aVr0/EmC9BMyqgT/oDMe7UEtmT5QkHbL4brDQCYvVz2Dq9k5WthGhNB4anZONVCtOucX
	pKUtTVOk4zpndjRxolDPK5MWT2+70v6Mdvg9y1cjuU5kcJzKMXKmjnIFpUIFCM4e4aCNyj
	YmRRU6beJlIKMcyHRmcdugvmhc/Dkpk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755764545;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kgypNVMMyj7G9RTUcdPLKrE/vfDgVYUf8Wo20zBqeqM=;
	b=5vOFrucC9XrXX3Agdf7cgx3prhBn24PPqjXte3D1Pp7ww+bYgpL5O3mGaAAEU0qY7mBHHd
	m5ml0BSHt7TMm9Dg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755764545; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kgypNVMMyj7G9RTUcdPLKrE/vfDgVYUf8Wo20zBqeqM=;
	b=T9aVr0/EmC9BMyqgT/oDMe7UEtmT5QkHbL4brDQCYvVz2Dq9k5WthGhNB4anZONVCtOucX
	pKUtTVOk4zpndjRxolDPK5MWT2+70v6Mdvg9y1cjuU5kcJzKMXKmjnIFpUIFCM4e4aCNyj
	YmRRU6beJlIKMcyHRmcdugvmhc/Dkpk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755764545;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kgypNVMMyj7G9RTUcdPLKrE/vfDgVYUf8Wo20zBqeqM=;
	b=5vOFrucC9XrXX3Agdf7cgx3prhBn24PPqjXte3D1Pp7ww+bYgpL5O3mGaAAEU0qY7mBHHd
	m5ml0BSHt7TMm9Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AE04813867;
	Thu, 21 Aug 2025 08:22:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iNpLKUDXpmhzEwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 21 Aug 2025 08:22:24 +0000
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
	Zack Rusin <zack.rusin@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Subject: [PATCH v6 22/25] drm/vmwgfx: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Thu, 21 Aug 2025 10:17:29 +0200
Message-ID: <20250821081918.79786-23-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821081918.79786-1-tzimmermann@suse.de>
References: <20250821081918.79786-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -1.30

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch
and buffer size. No alignment required.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>
Cc: Zack Rusin <zack.rusin@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 7e281c3c6bc5..c4ac9b47e23a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -15,6 +15,7 @@
 #include "vmw_surface_cache.h"
 #include "device_include/svga3d_surfacedefs.h"
 
+#include <drm/drm_dumb_buffers.h>
 #include <drm/ttm/ttm_placement.h>
 
 #define SVGA3D_FLAGS_64(upper32, lower32) (((uint64_t)upper32 << 32) | lower32)
@@ -2267,23 +2268,9 @@ int vmw_dumb_create(struct drm_file *file_priv,
 	 * contents is going to be rendered guest side.
 	 */
 	if (!dev_priv->has_mob || !vmw_supports_3d(dev_priv)) {
-		int cpp = DIV_ROUND_UP(args->bpp, 8);
-
-		switch (cpp) {
-		case 1: /* DRM_FORMAT_C8 */
-		case 2: /* DRM_FORMAT_RGB565 */
-		case 4: /* DRM_FORMAT_XRGB8888 */
-			break;
-		default:
-			/*
-			 * Dumb buffers don't allow anything else.
-			 * This is tested via IGT's dumb_buffers
-			 */
-			return -EINVAL;
-		}
-
-		args->pitch = args->width * cpp;
-		args->size = ALIGN(args->pitch * args->height, PAGE_SIZE);
+		ret = drm_mode_size_dumb(dev, args, 0, 0);
+		if (ret)
+			return ret;
 
 		ret = vmw_gem_object_create_with_handle(dev_priv, file_priv,
 							args->size, &args->handle,
-- 
2.50.1


