Return-Path: <linux-renesas-soc+bounces-14273-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EB7A5C947
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 16:55:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9530D7AA668
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 15:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D0325F977;
	Tue, 11 Mar 2025 15:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1tmXxKit";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LiqGsVTS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1tmXxKit";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LiqGsVTS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6275325F971
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Mar 2025 15:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741708500; cv=none; b=rV24gZlPXDXfeezJwm2RhBibbfeyNmNacrJqTUfwV1fAjgz1AEW4Wja6oWdD/oZ3GOUWe5DSLsKOR/qg17P/sH5QhBRdTRNFA/GrprbWIIKRWhLvKZWUZzOWI1BetHhqreNnzbW2cJ9UCewlx8xS22VLWqbahEQA980081dDGVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741708500; c=relaxed/simple;
	bh=roaMBKXR8qKD/jB1DO2kvb+4bZ+7d5WKSfOXUC9ZwLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RFlWUwXq3z13AkMy6mmBt1bdCIGX+ystyOSS6h0IjneT2mfUu1+rGOx38JpdkoA3MC4w3OgenFpyTh5coPiZ18oPxI0vx/9t4A8qirGPJPMTcB3QZKPnhZpPeTVcjf8r+jlVkHxGJXGs7jDKcsBxHBKBuNzLM5C+ypGVXOxrA1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1tmXxKit; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LiqGsVTS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1tmXxKit; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LiqGsVTS; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6CA3D1F38F;
	Tue, 11 Mar 2025 15:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741708489; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+NaxrZ58v7KbvSgmylUcHGu27OMC1B7uFqKMqZUAWsA=;
	b=1tmXxKit7PZAOPFsFJJbuZ/K1y3mDLpan/elzkN+eesYl607QGVH53LbvVxOB/IH1CGbrX
	W24cBAuafdgBp4QO23LucFNdIxmJ173XFh6QogfCDxN9vR8XY9bsdl2RkOKQUciX3e7zuz
	vUTaaClcMmy9b8oBMv5AX17FY1RdKwo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741708489;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+NaxrZ58v7KbvSgmylUcHGu27OMC1B7uFqKMqZUAWsA=;
	b=LiqGsVTSa9Vy5ofjUJY9sbE4rFjvLUZSIgNSqOjRCiwv88MrnH5gAOQ9HVTUphuNPAWykV
	y1o0f7xKpyS1buCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741708489; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+NaxrZ58v7KbvSgmylUcHGu27OMC1B7uFqKMqZUAWsA=;
	b=1tmXxKit7PZAOPFsFJJbuZ/K1y3mDLpan/elzkN+eesYl607QGVH53LbvVxOB/IH1CGbrX
	W24cBAuafdgBp4QO23LucFNdIxmJ173XFh6QogfCDxN9vR8XY9bsdl2RkOKQUciX3e7zuz
	vUTaaClcMmy9b8oBMv5AX17FY1RdKwo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741708489;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+NaxrZ58v7KbvSgmylUcHGu27OMC1B7uFqKMqZUAWsA=;
	b=LiqGsVTSa9Vy5ofjUJY9sbE4rFjvLUZSIgNSqOjRCiwv88MrnH5gAOQ9HVTUphuNPAWykV
	y1o0f7xKpyS1buCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D982D13AB8;
	Tue, 11 Mar 2025 15:54:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iEjOM8hc0GdUdQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 11 Mar 2025 15:54:48 +0000
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
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 03/25] drm/gem-dma: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Tue, 11 Mar 2025 16:47:07 +0100
Message-ID: <20250311155120.442633-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250311155120.442633-1-tzimmermann@suse.de>
References: <20250311155120.442633-1-tzimmermann@suse.de>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -1.30
X-Spam-Flag: NO

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. Align the pitch to a multiple of 8.

Push the current calculation into the only direct caller imx. Imx's
hardware requires the framebuffer width to be aligned to 8. The
driver's current approach is actually incorrect, as it only guarantees
this implicitly and requires bpp to be a multiple of 8 already. A
later commit will fix this problem by aligning the scanline pitch
such that an aligned width still fits into each scanline's memory.

A number of other drivers are build on top of gem-dma helpers and
implement their own dumb-buffer allocation. These drivers invoke
drm_gem_dma_dumb_create_internal(), which is not affected by this
commit.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_dma_helper.c     | 7 +++++--
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c | 2 ++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index b7f033d4352a..49be9b033610 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -20,6 +20,7 @@
 #include <drm/drm.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_vma_manager.h>
 
@@ -304,9 +305,11 @@ int drm_gem_dma_dumb_create(struct drm_file *file_priv,
 			    struct drm_mode_create_dumb *args)
 {
 	struct drm_gem_dma_object *dma_obj;
+	int ret;
 
-	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
-	args->size = args->pitch * args->height;
+	ret = drm_mode_size_dumb(drm, args, SZ_8, 0);
+	if (ret)
+		return ret;
 
 	dma_obj = drm_gem_dma_create_with_handle(file_priv, drm, args->size,
 						 &args->handle);
diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
index ec5fd9a01f1e..e7025df7b978 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
@@ -145,6 +145,8 @@ static int imx_drm_dumb_create(struct drm_file *file_priv,
 	int ret;
 
 	args->width = ALIGN(width, 8);
+	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
+	args->size = args->pitch * args->height;
 
 	ret = drm_gem_dma_dumb_create(file_priv, drm, args);
 	if (ret)
-- 
2.48.1


