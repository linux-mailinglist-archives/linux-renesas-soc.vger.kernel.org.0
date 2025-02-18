Return-Path: <linux-renesas-soc+bounces-13271-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93710A39F70
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 15:28:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A190169CB0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 14:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7579626A1C7;
	Tue, 18 Feb 2025 14:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E47xWng3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KChpdRZm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E47xWng3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KChpdRZm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FFB23E22A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Feb 2025 14:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739888770; cv=none; b=OPDg4ZnYyUiyBeKqKT8NUv6NyAbCg9YhiZIlnMlThCSZ/0tN6JKSUUWBNmOffjC/a0qyqVBwKpAjoAFfF1O7H3gIljd1JOUmxCtKX6xkJ5lEZ4H6HZK2sSje2qke5J6Bgmg0oAeWyObfni74o/y+oGMILZ1+g+F/F8TizBObTdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739888770; c=relaxed/simple;
	bh=yojm3zvIbBuSjr4xhVPIqNMf2C0swxKzCauAYz8dZXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MYOGbs19IHNGl/bgKghPgmzgqsXFW5Be1NPZCF/rd32kDfGv511shXXwcatUadKbw457Xqqdk8DoMhNRkEE6acurBxkdM3/q8pESImGDIyvd1cPuaQnl1+aqNXIGEhh38zvZtRtOjwYWZ/8b91yTF+DS/39dXK/KHzsvvA+97/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=fail smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E47xWng3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KChpdRZm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E47xWng3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KChpdRZm; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C4CF321176;
	Tue, 18 Feb 2025 14:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739888749; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yMMGLrtVVhDmJyhqakJon+MPSH4DP55cAIQ1HDFmEFE=;
	b=E47xWng3L35jgIjhUNDgJ9IazNVlavOvGJN3WDb/m6Cem/59nyTW52GsbENqfjhLchxma9
	Atx20BVSEwYZSWclxttlJFioVcOvKrMDzfYw0Xi5HDc3xkGUrzcUarbvSF+UQaMdIOMbou
	PznQ7Y1uzqRqrLJjTRDfv+H5cf0m8+c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739888749;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yMMGLrtVVhDmJyhqakJon+MPSH4DP55cAIQ1HDFmEFE=;
	b=KChpdRZmT8vPYbjGrMC6aE9iGTQQH45kGwN2Kaxcrb8WI8ASCupKpzWl8uVkGyOYP/PNi8
	vhpO+6GiloKoRZBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=E47xWng3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KChpdRZm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739888749; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yMMGLrtVVhDmJyhqakJon+MPSH4DP55cAIQ1HDFmEFE=;
	b=E47xWng3L35jgIjhUNDgJ9IazNVlavOvGJN3WDb/m6Cem/59nyTW52GsbENqfjhLchxma9
	Atx20BVSEwYZSWclxttlJFioVcOvKrMDzfYw0Xi5HDc3xkGUrzcUarbvSF+UQaMdIOMbou
	PznQ7Y1uzqRqrLJjTRDfv+H5cf0m8+c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739888749;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yMMGLrtVVhDmJyhqakJon+MPSH4DP55cAIQ1HDFmEFE=;
	b=KChpdRZmT8vPYbjGrMC6aE9iGTQQH45kGwN2Kaxcrb8WI8ASCupKpzWl8uVkGyOYP/PNi8
	vhpO+6GiloKoRZBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4BA1713A82;
	Tue, 18 Feb 2025 14:25:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MJInEW2YtGdXYQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 18 Feb 2025 14:25:49 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
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
Subject: [PATCH v3 05/25] drm/gem-vram: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Tue, 18 Feb 2025 15:23:28 +0100
Message-ID: <20250218142542.438557-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218142542.438557-1-tzimmermann@suse.de>
References: <20250218142542.438557-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C4CF321176
X-Spam-Score: -1.51
X-Rspamd-Action: no action
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[19];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

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


