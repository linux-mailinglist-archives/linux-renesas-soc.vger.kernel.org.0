Return-Path: <linux-renesas-soc+bounces-14276-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 202AFA5C961
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 16:55:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 243833B08B3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 15:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623DF25FA22;
	Tue, 11 Mar 2025 15:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yz45gS8C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7U7YCVsw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yz45gS8C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7U7YCVsw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FB725F787
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Mar 2025 15:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741708510; cv=none; b=U2JIxx+z7DcfAazaEgAUm+8VZ8EtzbjVU4kl021TnIuiFPH4Zb7AFPZaUcoqgsHsRYDicx8GI9HhEhGpwOp1Oq0Up9ZqxyfG5SqZTPecewAR2aap9PCUyetVKkxL5509wZ1itAaqfNiT4m5fWu/7SJRl9kNbJGZcP64fPmtARWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741708510; c=relaxed/simple;
	bh=yojm3zvIbBuSjr4xhVPIqNMf2C0swxKzCauAYz8dZXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ESeR8pAdlTkbGLfTgQeDJKVYXnTufKSZ9degseFPs92SVN3B4FpMKWwaWhbhnaFuSbMB3IL4Kd9ag13c5f+SDnWEsOzkt3HZJrHhghzYJnq3Yn9a5p7bmSS0vKxTQ+TR1Oj9IIpufZWUSTWA2ywRPEOfD5sdIm47kqe9lbtjfjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yz45gS8C; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7U7YCVsw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yz45gS8C; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7U7YCVsw; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 85AA62117D;
	Tue, 11 Mar 2025 15:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741708490; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yMMGLrtVVhDmJyhqakJon+MPSH4DP55cAIQ1HDFmEFE=;
	b=yz45gS8COIA0gwXrjGPeX3Iu0WArLQWi3UVE/txxXX2o0qaz3G3SvTnrPf50+qmsA2CXru
	kCFfZVzrGR65dcJ62yvCpO2qmhPcpgUG7ASvMaOHvOyV37TujMxHRsifOfz3shAKeG9ltD
	py9ZZM+bsD9xBftLZ9RUhhZfUe3P3b0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741708490;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yMMGLrtVVhDmJyhqakJon+MPSH4DP55cAIQ1HDFmEFE=;
	b=7U7YCVswFKccdzPTtVgV/0HFrVuY7QTcsTQwaxDK0GywHb/qFdxOt6Eu17ieVgn13hlzYy
	O47HTL2Nt7L8lSBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741708490; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yMMGLrtVVhDmJyhqakJon+MPSH4DP55cAIQ1HDFmEFE=;
	b=yz45gS8COIA0gwXrjGPeX3Iu0WArLQWi3UVE/txxXX2o0qaz3G3SvTnrPf50+qmsA2CXru
	kCFfZVzrGR65dcJ62yvCpO2qmhPcpgUG7ASvMaOHvOyV37TujMxHRsifOfz3shAKeG9ltD
	py9ZZM+bsD9xBftLZ9RUhhZfUe3P3b0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741708490;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yMMGLrtVVhDmJyhqakJon+MPSH4DP55cAIQ1HDFmEFE=;
	b=7U7YCVswFKccdzPTtVgV/0HFrVuY7QTcsTQwaxDK0GywHb/qFdxOt6Eu17ieVgn13hlzYy
	O47HTL2Nt7L8lSBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 09A6213AB8;
	Tue, 11 Mar 2025 15:54:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MIANAcpc0GdUdQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 11 Mar 2025 15:54:50 +0000
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
Subject: [PATCH v4 05/25] drm/gem-vram: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Tue, 11 Mar 2025 16:47:09 +0100
Message-ID: <20250311155120.442633-6-tzimmermann@suse.de>
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
buffer size. Inline code from drm_gem_vram_fill_create_dumb() without
the existing size computation. Align the pitch to a multiple of 8.

Only hibmc and vboxvideo use gem-vram. Hibmc invokes the call to
drm_gem_vram_fill_create_dumb() directly and is therefore not affected.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 22b1fe9c03b8..15cd564cbeac 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -6,6 +6,7 @@
 #include <drm/drm_debugfs.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_file.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
@@ -582,10 +583,31 @@ int drm_gem_vram_driver_dumb_create(struct drm_file *file,
 				    struct drm_device *dev,
 				    struct drm_mode_create_dumb *args)
 {
+	struct drm_gem_vram_object *gbo;
+	int ret;
+
 	if (WARN_ONCE(!dev->vram_mm, "VRAM MM not initialized"))
 		return -EINVAL;
 
-	return drm_gem_vram_fill_create_dumb(file, dev, 0, 0, args);
+	ret = drm_mode_size_dumb(dev, args, SZ_8, 0);
+	if (ret)
+		return ret;
+
+	gbo = drm_gem_vram_create(dev, args->size, 0);
+	if (IS_ERR(gbo))
+		return PTR_ERR(gbo);
+
+	ret = drm_gem_handle_create(file, &gbo->bo.base, &args->handle);
+	if (ret)
+		goto err_drm_gem_object_put;
+
+	drm_gem_object_put(&gbo->bo.base);
+
+	return 0;
+
+err_drm_gem_object_put:
+	drm_gem_object_put(&gbo->bo.base);
+	return ret;
 }
 EXPORT_SYMBOL(drm_gem_vram_driver_dumb_create);
 
-- 
2.48.1


