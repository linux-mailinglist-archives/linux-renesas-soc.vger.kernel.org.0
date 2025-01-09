Return-Path: <linux-renesas-soc+bounces-12005-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0ADA07B00
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 16:05:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38596188C5CF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 15:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2295C2206BA;
	Thu,  9 Jan 2025 15:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E4gyrWDS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="g1BuhauS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E4gyrWDS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="g1BuhauS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378A222068D;
	Thu,  9 Jan 2025 15:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736435007; cv=none; b=RL07H2/zDWjvSfeI6D4XPsHw4OzgES/kn3EFYr9+bx+4huISLOyXfP9kx2o8ZlLTp5s/z46hbMDDkxzkEBEvI6LSAN0NX3+cPrdPosc2PvzBLvpwpCO1eWc9QkWt0t7gcOvtnXUAhLLVVDixE6J6KDhw0hkZPBiLvL/vyXdb+iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736435007; c=relaxed/simple;
	bh=iKiiE2VGFX3nzM8wVIpPt1h4ByRr4DMZImdWb/8xRzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q2KAppC8j1FHR1KVmh3NtZn0F/GuTFZfqtfZJNDrWT3x8y3g6cAhKi3f9jL5hmmJkDzUcBuzSkrDYXMAHtI7fwGwd1L5hunucu43M+XFpVxuIzwNBpi/IdeGfAPefAOxDedwxW5ccGTYyt1E0dMqpgJhhIY06IkEHXPGa4Qsjck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E4gyrWDS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=g1BuhauS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E4gyrWDS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=g1BuhauS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 780B521176;
	Thu,  9 Jan 2025 15:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736435003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3o8YijqW7m/S5WxSzbbW/Q5FOb5jd8geeefF53uQ3Sk=;
	b=E4gyrWDSGtocRabFdSS5vO711dWQ2MU575H8KfCe4OIkyPCA64KXntTrgwB04h8JcFr5ij
	xGfFwNJcpSOGvfLup/xsh5sfcWUTxBtKhvkwanObi0+W+5qbhuBGzvR2cpxkr34FuFR2Aa
	8mjAZNQsz4nyJhK9QAybn0E0vXObC2c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736435003;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3o8YijqW7m/S5WxSzbbW/Q5FOb5jd8geeefF53uQ3Sk=;
	b=g1BuhauSMOd9WqdOfRXc+TgRctQC+2ed7h7cFyLQpsl0EwtIe/Yr6P+pyfq3JSAjSvvpPJ
	3Yoz+g7dCFqbVDBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736435003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3o8YijqW7m/S5WxSzbbW/Q5FOb5jd8geeefF53uQ3Sk=;
	b=E4gyrWDSGtocRabFdSS5vO711dWQ2MU575H8KfCe4OIkyPCA64KXntTrgwB04h8JcFr5ij
	xGfFwNJcpSOGvfLup/xsh5sfcWUTxBtKhvkwanObi0+W+5qbhuBGzvR2cpxkr34FuFR2Aa
	8mjAZNQsz4nyJhK9QAybn0E0vXObC2c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736435003;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3o8YijqW7m/S5WxSzbbW/Q5FOb5jd8geeefF53uQ3Sk=;
	b=g1BuhauSMOd9WqdOfRXc+TgRctQC+2ed7h7cFyLQpsl0EwtIe/Yr6P+pyfq3JSAjSvvpPJ
	3Yoz+g7dCFqbVDBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E8CA413AA7;
	Thu,  9 Jan 2025 15:03:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GDmLNzrlf2c1awAAD6G6ig
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
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 15/25] drm/omapdrm: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Thu,  9 Jan 2025 15:57:09 +0100
Message-ID: <20250109150310.219442-16-tzimmermann@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6),to(RLbwen1niosrcqbxsafh1)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -1.30
X-Spam-Flag: NO

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. Align the pitch to a multiple of 8.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/omap_gem.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index b9c67e4ca360..b8413a2dcdeb 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -11,6 +11,7 @@
 #include <linux/pfn_t.h>
 #include <linux/vmalloc.h>
 
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_prime.h>
 #include <drm/drm_vma_manager.h>
 
@@ -583,15 +584,13 @@ static int omap_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struc
 int omap_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 		struct drm_mode_create_dumb *args)
 {
-	union omap_gem_size gsize;
-
-	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
-
-	args->size = PAGE_ALIGN(args->pitch * args->height);
+	union omap_gem_size gsize = { };
+	int ret;
 
-	gsize = (union omap_gem_size){
-		.bytes = args->size,
-	};
+	ret = drm_mode_size_dumb(dev, args, SZ_8, 0);
+	if (ret)
+		return ret;
+	gsize.bytes = args->size;
 
 	return omap_gem_new_handle(dev, file, gsize,
 			OMAP_BO_SCANOUT | OMAP_BO_WC, &args->handle);
-- 
2.47.1


