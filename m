Return-Path: <linux-renesas-soc+bounces-13277-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC11DA39F88
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 15:29:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8112C3A4A34
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 14:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B5C926A0E4;
	Tue, 18 Feb 2025 14:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XmJhhnzh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7uSLZzm+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XmJhhnzh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7uSLZzm+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9E626A0CB
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Feb 2025 14:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739888788; cv=none; b=oDBSIRgbZrqc5s/vSQSNxSxhDp8J/8NTnhqqXDwEEu7KHWKqU4NAlYVXsMZ0kYC6E9z+U/b4kWKYO7OF2XZkbDcnXAXKM/oyAjm6/KHcyWWM9qQT/u87j4YwyV8XwCXrimntvVUKI5eG9XDNkVVMVPB90dgBPpz2703XMUlf6Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739888788; c=relaxed/simple;
	bh=Y3ByVaBT/QoRtwm3OJ7uzjwRAVEEgfVSxgDMp/idaT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xa3mOBBSXPiDT0iXWYfP+Z2A0yUdXnI6gUf+c+1NO0uqoRANvwtm/Kh7OqT+EHD4FNyW0h4jzhTsNV2Ivk5hSiipkHOj+vpz2MSBHYDAXyAgNlLvsLcXtYQ8r7JB4kc0ipQ5SMwEH5k9N23qF/D0BuFlObpjWUS8SA1YdDpvIXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=fail smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XmJhhnzh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7uSLZzm+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XmJhhnzh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7uSLZzm+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5AC5A21178;
	Tue, 18 Feb 2025 14:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739888753; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MlMXXFdQxI/n+TKAq4PasfKR7Xggh6ISrSBylzxHnYo=;
	b=XmJhhnzh3yjjCwMXlBMhpaZpY2XXit13YkgmNofAtYEH7VmcOLvqfCpl3WCKetKW1gCNdm
	LeO5yYju/cvB2jlIkMfWkX1dlhKsAIWk5Ht9ygepckSlLLg8aYMvTi4dX+Gm13q+PEj7Nw
	FWDzp8jg8/duAl2tyqjJXr+Ja5XS5e0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739888753;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MlMXXFdQxI/n+TKAq4PasfKR7Xggh6ISrSBylzxHnYo=;
	b=7uSLZzm+QCK8Sk1f9sr1K0+1MpeCVEz6oKn8L/KZqgKu3u/EhKhGi4fs1wgUs9rKNEmCLu
	Yo+5/ngwnCXKqPDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=XmJhhnzh;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7uSLZzm+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739888753; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MlMXXFdQxI/n+TKAq4PasfKR7Xggh6ISrSBylzxHnYo=;
	b=XmJhhnzh3yjjCwMXlBMhpaZpY2XXit13YkgmNofAtYEH7VmcOLvqfCpl3WCKetKW1gCNdm
	LeO5yYju/cvB2jlIkMfWkX1dlhKsAIWk5Ht9ygepckSlLLg8aYMvTi4dX+Gm13q+PEj7Nw
	FWDzp8jg8/duAl2tyqjJXr+Ja5XS5e0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739888753;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MlMXXFdQxI/n+TKAq4PasfKR7Xggh6ISrSBylzxHnYo=;
	b=7uSLZzm+QCK8Sk1f9sr1K0+1MpeCVEz6oKn8L/KZqgKu3u/EhKhGi4fs1wgUs9rKNEmCLu
	Yo+5/ngwnCXKqPDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D0F0913A82;
	Tue, 18 Feb 2025 14:25:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qBWxMXCYtGdXYQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 18 Feb 2025 14:25:52 +0000
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
	Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v3 11/25] drm/loongson: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Tue, 18 Feb 2025 15:23:34 +0100
Message-ID: <20250218142542.438557-12-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 5AC5A21178
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[20];
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
2.48.1


