Return-Path: <linux-renesas-soc+bounces-12003-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E71B0A07AF1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 16:05:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 955471885584
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 15:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE5221D00B;
	Thu,  9 Jan 2025 15:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VLl6xT+5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fifjMAqL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VLl6xT+5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fifjMAqL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D55921C18E;
	Thu,  9 Jan 2025 15:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736435006; cv=none; b=JTD0bcdrIO/ON07xbHiE8vbHjDRB9B+EBeMyzODizxkZd4EE/dpfzREs9YmzqfnBmbHhckjhlLQhVE6/Y6f0pjfalJ8bEIWuXM9uD9c8IrQdNGkfHjpzA5XEQmNgyQTinTUYzLSi3vHeK2jXWT+oFEw+nVR+xYHN4sUQ+as5Ako=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736435006; c=relaxed/simple;
	bh=afe6agfbSA7oWclxYF2IMnfuq7ZDassKT0Pqy3vGcyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OZ5UhyIhI22B0EsM/6tNo3kjII7lmoH1qYTzNnFBbjSfBiIzQodsjPkeQiYQb95kj8pjLbfjRHKr3ZADXBODU2VtgFNir0KIV0pnQSyMjoqX3qSwllHgEu98g/0NyDbrLYKD40k9cpF9q7HE1CcLAUN8f3fsxAuU10ge0zDFGjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VLl6xT+5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fifjMAqL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VLl6xT+5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fifjMAqL; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E721721175;
	Thu,  9 Jan 2025 15:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736435002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wRpUybXQ3IoxKMifg+lwMpUmgyWaomPjVOJ6r5kSHgs=;
	b=VLl6xT+5I8TPVHFOngQvYEhQnG+lUfRt14fa/OjgqeYdGeqEquD1A2cIljbfujJElXUaW7
	N0X+zY/Tjg5iB2babKHZymfb2ZbSqd29IJsIaU5nOrh5Mf1QSdMFmrhTnXvXCRGUvQQ25l
	TIeVK8Qk+K8CI0HaqN4x2NeJzjUtH8U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736435002;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wRpUybXQ3IoxKMifg+lwMpUmgyWaomPjVOJ6r5kSHgs=;
	b=fifjMAqLN7G35kS2kbwkJDE22Y1i9PVbWvFm0yUA/mq4aAxNwp3cV56ksFYNk3aK7fR7td
	B/GzL1hODSXNO+Cw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736435002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wRpUybXQ3IoxKMifg+lwMpUmgyWaomPjVOJ6r5kSHgs=;
	b=VLl6xT+5I8TPVHFOngQvYEhQnG+lUfRt14fa/OjgqeYdGeqEquD1A2cIljbfujJElXUaW7
	N0X+zY/Tjg5iB2babKHZymfb2ZbSqd29IJsIaU5nOrh5Mf1QSdMFmrhTnXvXCRGUvQQ25l
	TIeVK8Qk+K8CI0HaqN4x2NeJzjUtH8U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736435002;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wRpUybXQ3IoxKMifg+lwMpUmgyWaomPjVOJ6r5kSHgs=;
	b=fifjMAqLN7G35kS2kbwkJDE22Y1i9PVbWvFm0yUA/mq4aAxNwp3cV56ksFYNk3aK7fR7td
	B/GzL1hODSXNO+Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5CBB713A9E;
	Thu,  9 Jan 2025 15:03:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uNFbFTrlf2c1awAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 09 Jan 2025 15:03:22 +0000
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
	Thomas Zimmermann <tzimmermann@suse.de>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 14/25] drm/nouveau: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Thu,  9 Jan 2025 15:57:08 +0100
Message-ID: <20250109150310.219442-15-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109150310.219442-1-tzimmermann@suse.de>
References: <20250109150310.219442-1-tzimmermann@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
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
buffer size. Align the pitch to a multiple of 256.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index add006fc8d81..daa2528f9c9a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -30,6 +30,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_client_event.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_probe_helper.h>
@@ -808,9 +809,9 @@ nouveau_display_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
 	uint32_t domain;
 	int ret;
 
-	args->pitch = roundup(args->width * (args->bpp / 8), 256);
-	args->size = args->pitch * args->height;
-	args->size = roundup(args->size, PAGE_SIZE);
+	ret = drm_mode_size_dumb(dev, args, SZ_256, 0);
+	if (ret)
+		return ret;
 
 	/* Use VRAM if there is any ; otherwise fallback to system memory */
 	if (nouveau_drm(dev)->client.device.info.ram_size != 0)
-- 
2.47.1


