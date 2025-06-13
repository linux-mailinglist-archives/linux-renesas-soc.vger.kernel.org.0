Return-Path: <linux-renesas-soc+bounces-18252-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E37CEAD86F1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 11:06:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 568F917CD14
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 09:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47232C158E;
	Fri, 13 Jun 2025 09:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OpvkHcV1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uh5rpvHS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OpvkHcV1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uh5rpvHS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3CE279DC6
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Jun 2025 09:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749805524; cv=none; b=ghayLwXwzo3MEOz1vXvC7SBp6oFtoIh8KK6AYkEr8bmd4imrJNZ9kiDbuPUw5w8sowY+X95bj18dUjqTQW6HQUNostZBKMXDUcWUJqkJTQ1KOtKGKLFQrxEoVaH7sTinlaSf3515clwMbUJi3JvIkX1Z58g8KPNAKrDjqd7IYJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749805524; c=relaxed/simple;
	bh=7npq0SVa454z9aGOGEKztMKtvRwJLcdH6kq3Jc4OK7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gBPlEJw2QtWlVNRSAVi1stNJcMDF7cFvJG2/7GtKQh80L5HMBazRErxI7O9ZF2ZIlzUIJgrFc4Y8X6DpoUlnd9QWwsSPX/3e0ExIDhwkHHpjQXVT48XwSjD/UGnFqISZitosrYWWyuHMehMblf0y52QF8G3e1rqzKFS3rPh8VZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OpvkHcV1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uh5rpvHS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OpvkHcV1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uh5rpvHS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6436921282;
	Fri, 13 Jun 2025 09:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749805491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7jf9qOExxDcSOt4izp67/OXl6KEF+Jd/H4a7h9LsPuc=;
	b=OpvkHcV1/2de0xS4OZzHVt9N8jm2reUe5KPT9bWKoZ9u4z1dvB8sO7YYkQVOyDC7JLzXrr
	cvbV4vCNMIdtMSVxhO1smLBtMckCpfjFbUvWdvpBwoOGjK8llf8bXPfCzxP0Nh4BF+kTy4
	3kVow4aDqx4epsUoxiGzL6JpexbF2vI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749805491;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7jf9qOExxDcSOt4izp67/OXl6KEF+Jd/H4a7h9LsPuc=;
	b=uh5rpvHS8JlHCsb5KBUR7mEQa3z2/atdoBMkNf0dIomDDg2iOAkRvf0OrFRgb/vopVkntg
	CudKOkXm40sL13Cg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749805491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7jf9qOExxDcSOt4izp67/OXl6KEF+Jd/H4a7h9LsPuc=;
	b=OpvkHcV1/2de0xS4OZzHVt9N8jm2reUe5KPT9bWKoZ9u4z1dvB8sO7YYkQVOyDC7JLzXrr
	cvbV4vCNMIdtMSVxhO1smLBtMckCpfjFbUvWdvpBwoOGjK8llf8bXPfCzxP0Nh4BF+kTy4
	3kVow4aDqx4epsUoxiGzL6JpexbF2vI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749805491;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7jf9qOExxDcSOt4izp67/OXl6KEF+Jd/H4a7h9LsPuc=;
	b=uh5rpvHS8JlHCsb5KBUR7mEQa3z2/atdoBMkNf0dIomDDg2iOAkRvf0OrFRgb/vopVkntg
	CudKOkXm40sL13Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C6143137FE;
	Fri, 13 Jun 2025 09:04:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sAX9LrLpS2inNAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 13 Jun 2025 09:04:50 +0000
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
Subject: [PATCH v5 22/25] drm/vmwgfx: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Fri, 13 Jun 2025 11:00:41 +0200
Message-ID: <20250613090431.127087-23-tzimmermann@suse.de>
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
X-Spam-Flag: NO
X-Spam-Score: -5.30
X-Spamd-Result: default: False [-5.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 

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
2.49.0


