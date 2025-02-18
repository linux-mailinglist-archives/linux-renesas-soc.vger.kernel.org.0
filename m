Return-Path: <linux-renesas-soc+bounces-13267-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D39A39EE6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 15:26:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 744C43A9980
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 14:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A513F26A0DA;
	Tue, 18 Feb 2025 14:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CKM3W15i";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4/NWz53R";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CKM3W15i";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4/NWz53R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E2D26A0ED
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Feb 2025 14:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739888757; cv=none; b=L68CYj5Nxe9cmtYC6Y/ImX/S6vYgyXwdCpONOGSQekJjdhwN13Upo3Xw13IAMP4PcHT1Qv+K+rfqal0rGgweR7WCvE7bEIzrmQZwyh+HaMAgBV3ZnmE2vb5d7e8mDbVPpSwwedX3bBMGass9YcaE3ox3LPkXmzdlNHqCPv2KM9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739888757; c=relaxed/simple;
	bh=NMSd5mHbAN1H+tF8d3mRvv9/j+4bc5b7Og9hVg5ltQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B+YkA3D6aIVSIcXvN4FcfI2wuOanRcmQjZT/qQf7gIOvMzhidWeTFN8YIZF1sw0eMaTPaUeWBzSZ5lVcFnWwQ+4jmEoK7DzTOCcDsmDLAf6VXtK3EVh7n16lPZBfcCEPGEoHdnORmAxlPXTcymFwxd3CKNd9qokzUJqWYoLQv0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=fail smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CKM3W15i; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4/NWz53R; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CKM3W15i; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4/NWz53R; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BB33621162;
	Tue, 18 Feb 2025 14:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739888748; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VnMmPLNY+n0phaG9bDoqCa5BBA8txYogt2G9zhVLJzM=;
	b=CKM3W15i1QbrgIv1cPwT1b35yVoluqQWcZmpvKVDG8vwNojlAeZd4ymF1n1kBbYIrdJQod
	SiCa3faw4YWZuzNrBvxOpB1v/Xouh0zzNAB3Rd+VwxsBIx05dmGSzBU6VHbr8d2acaLy/M
	AqMe5S44BuQzs2yShhoeshV4+vhpwbI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739888748;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VnMmPLNY+n0phaG9bDoqCa5BBA8txYogt2G9zhVLJzM=;
	b=4/NWz53RULUF2997lSe9By9Ck71u4U8tnXSKUf4T4D7Fr7x39yT+GqM4yEWBSfBRmGBbbK
	WpGXltFskniLTfDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CKM3W15i;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="4/NWz53R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739888748; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VnMmPLNY+n0phaG9bDoqCa5BBA8txYogt2G9zhVLJzM=;
	b=CKM3W15i1QbrgIv1cPwT1b35yVoluqQWcZmpvKVDG8vwNojlAeZd4ymF1n1kBbYIrdJQod
	SiCa3faw4YWZuzNrBvxOpB1v/Xouh0zzNAB3Rd+VwxsBIx05dmGSzBU6VHbr8d2acaLy/M
	AqMe5S44BuQzs2yShhoeshV4+vhpwbI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739888748;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VnMmPLNY+n0phaG9bDoqCa5BBA8txYogt2G9zhVLJzM=;
	b=4/NWz53RULUF2997lSe9By9Ck71u4U8tnXSKUf4T4D7Fr7x39yT+GqM4yEWBSfBRmGBbbK
	WpGXltFskniLTfDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 42D0F13A82;
	Tue, 18 Feb 2025 14:25:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YAvgDmyYtGdXYQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 18 Feb 2025 14:25:48 +0000
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
Subject: [PATCH v3 03/25] drm/gem-dma: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Tue, 18 Feb 2025 15:23:26 +0100
Message-ID: <20250218142542.438557-4-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: BB33621162
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
index 16988d316a6d..5bca7ce3683f 100644
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


