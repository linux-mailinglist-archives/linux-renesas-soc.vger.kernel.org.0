Return-Path: <linux-renesas-soc+bounces-20832-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D103B2F1C4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 10:32:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAE8C1BC29EE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 08:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00DDB2F0670;
	Thu, 21 Aug 2025 08:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QwFg6fuV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8duM82QC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QwFg6fuV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8duM82QC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4F32F0675
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Aug 2025 08:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755764536; cv=none; b=D/2FKdZ62tOMUz1RpspYSu854C9c5v7rxsFBwiCZW8VDeeCEBzuygr6ePNLSveBkJLEs0k2CwsSiaSqzOTuBbj6I0Dtn+NY5CVa2LsyoYiT9eyfKTBq2LOV+JktdYf/9q1fFdbm0q+ym7ORIw94XoRdw4EnzjTdNgqVTpzZ/04g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755764536; c=relaxed/simple;
	bh=bqb6XBvlf0pUF3QPF+gNfPvhXj5Qqv8rePkFuVNppus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZCAPtL6bgbkDrpyXTP653243XaTKGFii8lTvkUyhc7OANR94eeOFo9ZPf45wm2DqrjagtjchTn/uhI2RXkpXtGWdwswmBdsF8WSvh4PonfpQfNjvCBZsYZDEHIt520iaTs6blWmO9PDPlnz+JEEYgvVvMiiW8tbToOFt1CqdgWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QwFg6fuV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8duM82QC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QwFg6fuV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8duM82QC; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B4E1B1F38C;
	Thu, 21 Aug 2025 08:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755764532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DfRQ1YDtmgRVCMBhPF9y1+DPJvJKm8NOBTKOgwEKeOI=;
	b=QwFg6fuVO8kPC3CYpqcQMO2WnQzn0UNsKdu6B8kida4DQTDf5ilhc9P/oEanolVli+EjXH
	K2qdPnPu37aHiZvC1dPRSQf7Po/5l+b5ytj76OleQf/+O71LyMnwNmrKf15mwFsj3pVTRD
	yu9WsOJMP1YR8H+bCw+nsu5K4VjKXXE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755764532;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DfRQ1YDtmgRVCMBhPF9y1+DPJvJKm8NOBTKOgwEKeOI=;
	b=8duM82QCakQuiQUEkCtZxN78y8O1YDpsjhOPnIkd0B9OWViO1Q0VH9BWFwN3D+zmy/5dln
	lKsnf6WxI16j+1Bw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755764532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DfRQ1YDtmgRVCMBhPF9y1+DPJvJKm8NOBTKOgwEKeOI=;
	b=QwFg6fuVO8kPC3CYpqcQMO2WnQzn0UNsKdu6B8kida4DQTDf5ilhc9P/oEanolVli+EjXH
	K2qdPnPu37aHiZvC1dPRSQf7Po/5l+b5ytj76OleQf/+O71LyMnwNmrKf15mwFsj3pVTRD
	yu9WsOJMP1YR8H+bCw+nsu5K4VjKXXE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755764532;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DfRQ1YDtmgRVCMBhPF9y1+DPJvJKm8NOBTKOgwEKeOI=;
	b=8duM82QCakQuiQUEkCtZxN78y8O1YDpsjhOPnIkd0B9OWViO1Q0VH9BWFwN3D+zmy/5dln
	lKsnf6WxI16j+1Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2B0FC139A8;
	Thu, 21 Aug 2025 08:22:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qIcXCTTXpmhzEwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 21 Aug 2025 08:22:12 +0000
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
Subject: [PATCH v6 01/25] drm/dumb-buffers: Sanitize output on errors
Date: Thu, 21 Aug 2025 10:17:08 +0200
Message-ID: <20250821081918.79786-2-tzimmermann@suse.de>
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
	RCPT_COUNT_TWELVE(0.00)[21];
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

The ioctls MODE_CREATE_DUMB and MODE_MAP_DUMB return results into a
memory buffer supplied by user space. On errors, it is possible that
intermediate values are being returned. The exact semantics depends
on the DRM driver's implementation of these ioctls. Although this is
most-likely not a security problem in practice, avoid any uncertainty
by clearing the memory to 0 on errors.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_dumb_buffers.c | 40 ++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
index 70032bba1c97..9916aaf5b3f2 100644
--- a/drivers/gpu/drm/drm_dumb_buffers.c
+++ b/drivers/gpu/drm/drm_dumb_buffers.c
@@ -99,7 +99,30 @@ int drm_mode_create_dumb(struct drm_device *dev,
 int drm_mode_create_dumb_ioctl(struct drm_device *dev,
 			       void *data, struct drm_file *file_priv)
 {
-	return drm_mode_create_dumb(dev, data, file_priv);
+	struct drm_mode_create_dumb *args = data;
+	int err;
+
+	err = drm_mode_create_dumb(dev, args, file_priv);
+	if (err) {
+		args->handle = 0;
+		args->pitch = 0;
+		args->size = 0;
+	}
+	return err;
+}
+
+static int drm_mode_mmap_dumb(struct drm_device *dev, struct drm_mode_map_dumb *args,
+			      struct drm_file *file_priv)
+{
+	if (!dev->driver->dumb_create)
+		return -ENOSYS;
+
+	if (dev->driver->dumb_map_offset)
+		return dev->driver->dumb_map_offset(file_priv, dev, args->handle,
+						    &args->offset);
+	else
+		return drm_gem_dumb_map_offset(file_priv, dev, args->handle,
+					       &args->offset);
 }
 
 /**
@@ -120,17 +143,12 @@ int drm_mode_mmap_dumb_ioctl(struct drm_device *dev,
 			     void *data, struct drm_file *file_priv)
 {
 	struct drm_mode_map_dumb *args = data;
+	int err;
 
-	if (!dev->driver->dumb_create)
-		return -ENOSYS;
-
-	if (dev->driver->dumb_map_offset)
-		return dev->driver->dumb_map_offset(file_priv, dev,
-						    args->handle,
-						    &args->offset);
-	else
-		return drm_gem_dumb_map_offset(file_priv, dev, args->handle,
-					       &args->offset);
+	err = drm_mode_mmap_dumb(dev, args, file_priv);
+	if (err)
+		args->offset = 0;
+	return err;
 }
 
 int drm_mode_destroy_dumb(struct drm_device *dev, u32 handle,
-- 
2.50.1


