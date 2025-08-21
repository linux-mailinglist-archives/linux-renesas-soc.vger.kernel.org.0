Return-Path: <linux-renesas-soc+bounces-20836-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA388B2F1B9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 10:32:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B874A03CA8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 08:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA092F5461;
	Thu, 21 Aug 2025 08:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WmaiKfCQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kJUj0aJ4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WmaiKfCQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kJUj0aJ4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06D22F5305
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Aug 2025 08:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755764551; cv=none; b=u6iN1uAQToTC2NmsfGNlG6cwEqfNHi2c5R7Yku6IpHFLn7vCL6Up08MaFff1IwcC0sBn9C9Vj9CoEFnMH7iHIC0PzNSbNeo2FpNzm6vQQzsvUSYh4yqMcFtjQu3tN5tBJ7SMDZj4OJg8s41n73mcsxZlP7MpNcRkA+soE+scSYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755764551; c=relaxed/simple;
	bh=0hTkQ6jYs9dXt37PHJoopebhwtDA9Ic9v5BTo9bl/rk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pka3mz5MyU7LlTicqjpXJC4ZxN3J+YR/pGMUBm82qPPF2TRHOPLR3qK0NQOsEaP+O3ZLaVvfFjpV5ysM6Yhn79tKWhouhnOTP1BG77m3lDAK/U0PXBm/QYSbnBpTF7i7YvIuKXtXk3avjS4laqSJyoOrAhJvkGEBGlrJ5iSDp6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WmaiKfCQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kJUj0aJ4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WmaiKfCQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kJUj0aJ4; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4D4611F7FB;
	Thu, 21 Aug 2025 08:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755764534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WyvgiHGFdcanw0/STMlXUJNb0LhNUwAiWqxt0oleFks=;
	b=WmaiKfCQLW3guThatF6dgda2Za5HiKKUN05xkDa9YXeEbh3ayHPQOb5c9On+vEuNYZs2Oo
	16wMW6cx8wtZk1Hv40CDEs3bz8HyW2ay6Vui5qp5GRORU/yzniTKgHNveshlx21agLTsIM
	VzNsMdaPbPidMlpeFxFxpX4IU+Tz2G0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755764534;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WyvgiHGFdcanw0/STMlXUJNb0LhNUwAiWqxt0oleFks=;
	b=kJUj0aJ4gbbRW81Ud2K0bz5BIKn3jfRNS2B+WeR3HzjDHj/68JjaUbs+w0mQ87nwM+YQL+
	oIAAxplVxebCmwBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755764534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WyvgiHGFdcanw0/STMlXUJNb0LhNUwAiWqxt0oleFks=;
	b=WmaiKfCQLW3guThatF6dgda2Za5HiKKUN05xkDa9YXeEbh3ayHPQOb5c9On+vEuNYZs2Oo
	16wMW6cx8wtZk1Hv40CDEs3bz8HyW2ay6Vui5qp5GRORU/yzniTKgHNveshlx21agLTsIM
	VzNsMdaPbPidMlpeFxFxpX4IU+Tz2G0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755764534;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WyvgiHGFdcanw0/STMlXUJNb0LhNUwAiWqxt0oleFks=;
	b=kJUj0aJ4gbbRW81Ud2K0bz5BIKn3jfRNS2B+WeR3HzjDHj/68JjaUbs+w0mQ87nwM+YQL+
	oIAAxplVxebCmwBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C35AD13867;
	Thu, 21 Aug 2025 08:22:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GCSGLjXXpmhzEwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 21 Aug 2025 08:22:13 +0000
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
Subject: [PATCH v6 04/25] drm/gem-shmem: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Thu, 21 Aug 2025 10:17:11 +0200
Message-ID: <20250821081918.79786-5-tzimmermann@suse.de>
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
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -1.30

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. Align the pitch to a multiple of 8.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 5d1349c34afd..b90096ad82d8 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -18,6 +18,7 @@
 #include <drm/drm.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_prime.h>
 #include <drm/drm_print.h>
@@ -518,18 +519,11 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_purge_locked);
 int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
 			      struct drm_mode_create_dumb *args)
 {
-	u32 min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
+	int ret;
 
-	if (!args->pitch || !args->size) {
-		args->pitch = min_pitch;
-		args->size = PAGE_ALIGN(args->pitch * args->height);
-	} else {
-		/* ensure sane minimum values */
-		if (args->pitch < min_pitch)
-			args->pitch = min_pitch;
-		if (args->size < args->pitch * args->height)
-			args->size = PAGE_ALIGN(args->pitch * args->height);
-	}
+	ret = drm_mode_size_dumb(dev, args, SZ_8, 0);
+	if (ret)
+		return ret;
 
 	return drm_gem_shmem_create_with_handle(file, dev, args->size, &args->handle);
 }
-- 
2.50.1


