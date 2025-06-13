Return-Path: <linux-renesas-soc+bounces-18249-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D23CAD86D5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 11:05:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23D30170D25
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 09:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22A8D2727EC;
	Fri, 13 Jun 2025 09:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qnzBIvdS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HalWXNLa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qnzBIvdS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HalWXNLa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0251D291C26
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Jun 2025 09:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749805513; cv=none; b=cdG/brlCnUPyjlPLhi0sauvNbgwIFWVTtrYFPP8YvZgEQV8WZuioXjh2Ibw4pdd9qyQQTXtYvGvuQ7ItMlraxHDH1W7a8Pk0j7AkvrTjxH15tis8lGR2mbO1M5X/Bnp5fcChFBfBqeP70RNQ9WzrPYXuPgMdDvW3s47dBYp2alo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749805513; c=relaxed/simple;
	bh=ftEM1JZlLW7Y6ebJPv5sTUfEQaort+Y0H4+rnnEg+YE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dTyDe5huMrLgAY9a8ADry/U7ZQekLWHhTNb3m5lawxPAUyBHiJxK5K6uMnxFziTSMoMDcDMed84JAR6i1ZIfbOybStm9QIJvGL3jQlxm14SZBeXxMOKGvZCjTIuyzQt8iQOI4l2qMlwRZgZMDZCSi0q3JNGBro1t5fnha8nwzoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qnzBIvdS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HalWXNLa; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qnzBIvdS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HalWXNLa; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 49E391F78E;
	Fri, 13 Jun 2025 09:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749805481; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pL8BIAz+3TknRN85zYSjBUUnsd8cQe8ZmaDYWneQEX4=;
	b=qnzBIvdSAXQbKG2D/0OBFTs4apc1oGcdc2lMo3V/fA0fA0V1s+D0YAddWsUmdXhykKPqhI
	yB8tDwqmvyFG2KhextLm/2MizwF9Gs24uVkr0wZAdTw0aohbCr3Wq7l4XIPyhDWcI6dind
	YBw1H43uv9oWH51+4EtfMDEbIRWIRZM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749805481;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pL8BIAz+3TknRN85zYSjBUUnsd8cQe8ZmaDYWneQEX4=;
	b=HalWXNLaE7Vnen/y3IUTrNChIYVpQFAQgFkhF6W9Dw/fI0wQ4I4IegcpQmHfHXBFuyyOKW
	k7G6Hf7H/Y9PYtCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749805481; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pL8BIAz+3TknRN85zYSjBUUnsd8cQe8ZmaDYWneQEX4=;
	b=qnzBIvdSAXQbKG2D/0OBFTs4apc1oGcdc2lMo3V/fA0fA0V1s+D0YAddWsUmdXhykKPqhI
	yB8tDwqmvyFG2KhextLm/2MizwF9Gs24uVkr0wZAdTw0aohbCr3Wq7l4XIPyhDWcI6dind
	YBw1H43uv9oWH51+4EtfMDEbIRWIRZM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749805481;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pL8BIAz+3TknRN85zYSjBUUnsd8cQe8ZmaDYWneQEX4=;
	b=HalWXNLaE7Vnen/y3IUTrNChIYVpQFAQgFkhF6W9Dw/fI0wQ4I4IegcpQmHfHXBFuyyOKW
	k7G6Hf7H/Y9PYtCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B1C0B137FE;
	Fri, 13 Jun 2025 09:04:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eLYGKqjpS2inNAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 13 Jun 2025 09:04:40 +0000
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
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: [PATCH v5 08/25] drm/gma500: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Fri, 13 Jun 2025 11:00:27 +0200
Message-ID: <20250613090431.127087-9-tzimmermann@suse.de>
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
X-Spamd-Result: default: False [-5.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[22];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org,suse.de,gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -5.30

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. Align the pitch to a multiple of 64.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/gem.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
index 4b7627a72637..fc337db0a948 100644
--- a/drivers/gpu/drm/gma500/gem.c
+++ b/drivers/gpu/drm/gma500/gem.c
@@ -16,6 +16,7 @@
 #include <asm/set_memory.h>
 
 #include <drm/drm.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_vma_manager.h>
 
 #include "gem.h"
@@ -199,35 +200,25 @@ psb_gem_create(struct drm_device *dev, u64 size, const char *name, bool stolen,
 int psb_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 			struct drm_mode_create_dumb *args)
 {
-	size_t pitch, size;
 	struct psb_gem_object *pobj;
 	struct drm_gem_object *obj;
-	u32 handle;
 	int ret;
 
-	pitch = args->width * DIV_ROUND_UP(args->bpp, 8);
-	pitch = ALIGN(pitch, 64);
-
-	size = pitch * args->height;
-	size = roundup(size, PAGE_SIZE);
-	if (!size)
-		return -EINVAL;
+	ret = drm_mode_size_dumb(dev, args, SZ_64, 0);
+	if (ret)
+		return ret;
 
-	pobj = psb_gem_create(dev, size, "gem", false, PAGE_SIZE);
+	pobj = psb_gem_create(dev, args->size, "gem", false, PAGE_SIZE);
 	if (IS_ERR(pobj))
 		return PTR_ERR(pobj);
 	obj = &pobj->base;
 
-	ret = drm_gem_handle_create(file, obj, &handle);
+	ret = drm_gem_handle_create(file, obj, &args->handle);
 	if (ret)
 		goto err_drm_gem_object_put;
 
 	drm_gem_object_put(obj);
 
-	args->pitch = pitch;
-	args->size = size;
-	args->handle = handle;
-
 	return 0;
 
 err_drm_gem_object_put:
-- 
2.49.0


