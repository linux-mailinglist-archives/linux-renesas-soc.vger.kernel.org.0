Return-Path: <linux-renesas-soc+bounces-20843-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFB7B2F1DF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 10:33:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43596AA2B43
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 08:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC7A2FD1C4;
	Thu, 21 Aug 2025 08:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Yfp+a1a9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Jeh8Tiuv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Yfp+a1a9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Jeh8Tiuv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7A32FAC15
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Aug 2025 08:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755764574; cv=none; b=VKvXx+zgeraMWzXuWcEoa0K/+fN68S1lR3yYn86iiQ3Mo5PuOCubr1pt4coRjvXqOdgIDvkexU5ukSHTa8uyFDWmXJ7RGE/MYimCLGMOAh9/giIkR+bjtHpiICId3+GA5ZNyFI99AycfPSDzEq4hc5fkjeGrX0ySWCA3+yrW0xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755764574; c=relaxed/simple;
	bh=Db6++ZlAWja0+mt3oZWBr08izVqoLsxRGp/ZkDzNEJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kW4in3pXMbH3W9OyLWBeixnV6/WdBim4a68LOUx8oHyTE8camjb8ylMGWAsnqx9Dl4iJqiyk+0+DdVWsiVWtJcfmzNnTw4KHDLVd2HfPT7PX4ECam56kUPtJqANC/kp85vZ7dL85pvEhFa/B18kWn+s0RDGdCi3JxrPyWrkKmqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Yfp+a1a9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Jeh8Tiuv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Yfp+a1a9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Jeh8Tiuv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8508C22647;
	Thu, 21 Aug 2025 08:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755764538; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=poQ7C1VCsw7aM0EcfCcWX93Ll0/l4nTwPTwAPzmeB+U=;
	b=Yfp+a1a9SgVPnjsRGFiqns3Sq9QPQtvDEhdH73T8C9z4PuAA+Luwv5Txd6mySnhlQT/oV1
	N13gv49c66vT6jhQl39PoCM0AU0znPEStglrxgpLeeOTuq+sq4QMj+uXQJNz8NFBkyfxxx
	A9e08W6aKs3zp4RUYYl+86MKx4kNAXw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755764538;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=poQ7C1VCsw7aM0EcfCcWX93Ll0/l4nTwPTwAPzmeB+U=;
	b=Jeh8Tiuvokw72qh/UAOTEDH4tn/SpL5QbEI+OanMljgUyfcHwdhqAsE/86H/Nt0dJ4Ndkd
	ZqdL+8qQh3yn3YDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Yfp+a1a9;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Jeh8Tiuv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755764538; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=poQ7C1VCsw7aM0EcfCcWX93Ll0/l4nTwPTwAPzmeB+U=;
	b=Yfp+a1a9SgVPnjsRGFiqns3Sq9QPQtvDEhdH73T8C9z4PuAA+Luwv5Txd6mySnhlQT/oV1
	N13gv49c66vT6jhQl39PoCM0AU0znPEStglrxgpLeeOTuq+sq4QMj+uXQJNz8NFBkyfxxx
	A9e08W6aKs3zp4RUYYl+86MKx4kNAXw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755764538;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=poQ7C1VCsw7aM0EcfCcWX93Ll0/l4nTwPTwAPzmeB+U=;
	b=Jeh8Tiuvokw72qh/UAOTEDH4tn/SpL5QbEI+OanMljgUyfcHwdhqAsE/86H/Nt0dJ4Ndkd
	ZqdL+8qQh3yn3YDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0121413AB7;
	Thu, 21 Aug 2025 08:22:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yBmxOjnXpmhzEwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 21 Aug 2025 08:22:17 +0000
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
	Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v6 11/25] drm/loongson: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Thu, 21 Aug 2025 10:17:18 +0200
Message-ID: <20250821081918.79786-12-tzimmermann@suse.de>
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
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 8508C22647
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -1.51

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. Align the pitch according to hardware requirements.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/loongson/lsdc_gem.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/loongson/lsdc_gem.c b/drivers/gpu/drm/loongson/lsdc_gem.c
index a720d8f53209..9f982b85301f 100644
--- a/drivers/gpu/drm/loongson/lsdc_gem.c
+++ b/drivers/gpu/drm/loongson/lsdc_gem.c
@@ -6,6 +6,7 @@
 #include <linux/dma-buf.h>
 
 #include <drm/drm_debugfs.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_prime.h>
@@ -204,45 +205,31 @@ int lsdc_dumb_create(struct drm_file *file, struct drm_device *ddev,
 	const struct lsdc_desc *descp = ldev->descp;
 	u32 domain = LSDC_GEM_DOMAIN_VRAM;
 	struct drm_gem_object *gobj;
-	size_t size;
-	u32 pitch;
-	u32 handle;
 	int ret;
 
-	if (!args->width || !args->height)
-		return -EINVAL;
-
-	if (args->bpp != 32 && args->bpp != 16)
-		return -EINVAL;
-
-	pitch = args->width * args->bpp / 8;
-	pitch = ALIGN(pitch, descp->pitch_align);
-	size = pitch * args->height;
-	size = ALIGN(size, PAGE_SIZE);
+	ret = drm_mode_size_dumb(ddev, args, descp->pitch_align, 0);
+	if (ret)
+		return ret;
 
 	/* Maximum single bo size allowed is the half vram size available */
-	if (size > ldev->vram_size / 2) {
-		drm_err(ddev, "Requesting(%zuMiB) failed\n", size >> 20);
+	if (args->size > ldev->vram_size / 2) {
+		drm_err(ddev, "Requesting(%zuMiB) failed\n", (size_t)(args->size >> PAGE_SHIFT));
 		return -ENOMEM;
 	}
 
-	gobj = lsdc_gem_object_create(ddev, domain, size, false, NULL, NULL);
+	gobj = lsdc_gem_object_create(ddev, domain, args->size, false, NULL, NULL);
 	if (IS_ERR(gobj)) {
 		drm_err(ddev, "Failed to create gem object\n");
 		return PTR_ERR(gobj);
 	}
 
-	ret = drm_gem_handle_create(file, gobj, &handle);
+	ret = drm_gem_handle_create(file, gobj, &args->handle);
 
 	/* drop reference from allocate, handle holds it now */
 	drm_gem_object_put(gobj);
 	if (ret)
 		return ret;
 
-	args->pitch = pitch;
-	args->size = size;
-	args->handle = handle;
-
 	return 0;
 }
 
-- 
2.50.1


