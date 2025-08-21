Return-Path: <linux-renesas-soc+bounces-20856-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F981B2F22F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 10:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 627735A59AF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 08:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72381302CB1;
	Thu, 21 Aug 2025 08:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ybImOkpc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pD0tD8nN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WuVYjXJ7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fIo7TsGz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15842FF159
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Aug 2025 08:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755764615; cv=none; b=SecA5K6OrVE/6fo3tZ/Yd9VGEqA6buw3CFTGqhvahiB9lwugsowNJj//a3ggKikfyW1KdEq3xd+7KWb0YQb177GKmic7y5ocXPgOGnjEScWdoNvl5HIQYCY2SNypEfMMUWc/j8isc0mW9JFEhrnpZOuWZUecMs2wz6uwbcMnH+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755764615; c=relaxed/simple;
	bh=e887uRDoxEpQCW1322GNYfBnc9kCE7+A3lBsrQIJdt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o/mYDbtQJzNjwdPF7HhXFuXLE4J7qjdx1F3KiSg2Y9hbxmkRID/+/D51j2OZEIZRKALJ/sPNYNDrNFous1Txm0q4ycoN4WNu0aVLMAzxeNWFN09nZW2daI5ODUNB6pz0of7yAQjXfT0rOViBHPmk52l/9zOcevZrGmOeX7yLz5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ybImOkpc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pD0tD8nN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WuVYjXJ7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fIo7TsGz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E92901F836;
	Thu, 21 Aug 2025 08:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755764546; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hHo3GRIYvA9xU1xmUh5J3OGK8ZZKXekovTY6CDupMA0=;
	b=ybImOkpcCpGMVxoLCfs7DwHB3NQdAM6I5GB2dIe6ycgAYybGRiSTDUQGrLPrf1H97wSjVA
	jhAbOmccATonq4vNgnOBuUO59Ci4oJ5pRTUwaeRaB4io3FsQx+NHOad1Zcjr8yUUN8RYOZ
	pg582KlEehqbsVla3Y2t9WJzQ3fZoPc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755764546;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hHo3GRIYvA9xU1xmUh5J3OGK8ZZKXekovTY6CDupMA0=;
	b=pD0tD8nN42FoPTaMyUjCINwzI0MpsU3LtNHox/MXc+Z0lucytTbAGyUPhlQvkL7ZXWFI+J
	KtlEgL0+SWpNUxBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=WuVYjXJ7;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fIo7TsGz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755764545; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hHo3GRIYvA9xU1xmUh5J3OGK8ZZKXekovTY6CDupMA0=;
	b=WuVYjXJ71ED17c9hj+XQLHQqWo7JmkkpelMz+gFtRa2o6XsakpdrrpVoAcGNRxrW5NRkJl
	E4ffL/nvf+Gr6ZqhnglArODgYcAQFgTH6DQUSKF81qzdvXsnXNIxOvxDcebwm+emQGVPgn
	G0hjA2/yDtCBP+UN5eHogvMRDLMx+14=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755764545;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hHo3GRIYvA9xU1xmUh5J3OGK8ZZKXekovTY6CDupMA0=;
	b=fIo7TsGzjwqszL/iU4SWJUBO0+5gStXtbBBikqOldRND3ePvehIOlQtLSoVuimz0Kwy3yW
	0tQm9znLDnDLgwAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4D34B13AB7;
	Thu, 21 Aug 2025 08:22:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MG6qEUHXpmhzEwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 21 Aug 2025 08:22:25 +0000
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
	Matthew Auld <matthew.auld@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v6 23/25] drm/xe: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Thu, 21 Aug 2025 10:17:30 +0200
Message-ID: <20250821081918.79786-24-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821081918.79786-1-tzimmermann@suse.de>
References: <20250821081918.79786-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: E92901F836
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	R_RATELIMIT(0.00)[to(RLbwen1niosrcqbxsafh1),to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,intel.com:email]
X-Spam-Score: -2.01

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch
and buffer size. Align the pitch to a multiple of 8. Align the
buffer size according to hardware requirements.

Xe's internal calculation allowed for 64-bit wide buffer sizes, but
the ioctl's internal checks always verified against 32-bit wide limits.
Hance, it is safe to limit the driver code to 32-bit calculations as
well.

v3:
- mention 32-bit calculation in commit description (Matthew)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 6fea39842e1e..2be7a618165a 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -9,6 +9,7 @@
 #include <linux/nospec.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/ttm/ttm_backup.h>
@@ -3130,14 +3131,13 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
 	struct xe_device *xe = to_xe_device(dev);
 	struct xe_bo *bo;
 	uint32_t handle;
-	int cpp = DIV_ROUND_UP(args->bpp, 8);
 	int err;
 	u32 page_size = max_t(u32, PAGE_SIZE,
 		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K);
 
-	args->pitch = ALIGN(args->width * cpp, 64);
-	args->size = ALIGN(mul_u32_u32(args->pitch, args->height),
-			   page_size);
+	err = drm_mode_size_dumb(dev, args, SZ_64, page_size);
+	if (err)
+		return err;
 
 	bo = xe_bo_create_user(xe, NULL, NULL, args->size,
 			       DRM_XE_GEM_CPU_CACHING_WC,
-- 
2.50.1


