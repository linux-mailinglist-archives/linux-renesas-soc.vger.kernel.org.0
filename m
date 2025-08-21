Return-Path: <linux-renesas-soc+bounces-20852-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6706DB2F242
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 10:36:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48BF01882946
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 08:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180193002CB;
	Thu, 21 Aug 2025 08:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="p4vOr178";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CSG9dMpH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="p4vOr178";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CSG9dMpH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12F22FFDFE
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Aug 2025 08:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755764602; cv=none; b=bDHEHzpomYPY/Y9rn/EbR1FUT65+v7/SyTYpD4eq4rUGgp/jkyLj1RxfFjmkyVPZHrUFXK/NKkROMT8COxbbo31Vis9uSNiAwCOV1kHOHCVVy5E3UDOwa8I2kRLimxJq0sJRk0SBwBDZDd8jHnj3q4XcgjvnvzutB2pfq+7Hwgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755764602; c=relaxed/simple;
	bh=5XvoPqwP2AIsv0r5eRSzdv9lKnldzxKpWFaUw3K5ifU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hHOAUcHEYnpx5hdIlmccy/tJ73au/g+9etYCeKDUu+z9WcKIqAiQBa+2JdpWYxTR5eZ5qKUV7SI3FPY3QqojXNQCGBFk9CMLM9jWllOtNwoer1cc8q6zTuZ4+XoQQ9iMaA5zStSUfVCbXn1KgU7+jSggKKoUhmC0EZcic7+a6Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=p4vOr178; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CSG9dMpH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=p4vOr178; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CSG9dMpH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4B3BA1F83E;
	Thu, 21 Aug 2025 08:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755764542; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xijqT1x/c6ExTCIr+MaR/AHlHHs2pRlUXr04ECasbYs=;
	b=p4vOr178hGSJT9SO2wfic7PcaihKyqBMgkjUUclhCRkVzJNfej6t/ogWnPwmPFAwltUrQ/
	zQrnisbydUKEFcYZxE9fOYmXvern68yi4E7DGYFxPdb9dlA23aGaIZYviWGMB+s5JUcgW7
	GGVpmcPVjIg7GWpXlCayEF6zZpo6YHw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755764542;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xijqT1x/c6ExTCIr+MaR/AHlHHs2pRlUXr04ECasbYs=;
	b=CSG9dMpHynGwEqa2ibkqqxhnKlhelvv6YUbArTPtcqYyCgB80ZQodTgpzlHkD821PVT0Bz
	wWbYpooL5Fpw4yCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=p4vOr178;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=CSG9dMpH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755764542; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xijqT1x/c6ExTCIr+MaR/AHlHHs2pRlUXr04ECasbYs=;
	b=p4vOr178hGSJT9SO2wfic7PcaihKyqBMgkjUUclhCRkVzJNfej6t/ogWnPwmPFAwltUrQ/
	zQrnisbydUKEFcYZxE9fOYmXvern68yi4E7DGYFxPdb9dlA23aGaIZYviWGMB+s5JUcgW7
	GGVpmcPVjIg7GWpXlCayEF6zZpo6YHw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755764542;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xijqT1x/c6ExTCIr+MaR/AHlHHs2pRlUXr04ECasbYs=;
	b=CSG9dMpHynGwEqa2ibkqqxhnKlhelvv6YUbArTPtcqYyCgB80ZQodTgpzlHkD821PVT0Bz
	wWbYpooL5Fpw4yCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A6F4139A8;
	Thu, 21 Aug 2025 08:22:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EM+DJD3XpmhzEwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 21 Aug 2025 08:22:21 +0000
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
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v6 17/25] drm/renesas/rcar-du: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Thu, 21 Aug 2025 10:17:24 +0200
Message-ID: <20250821081918.79786-18-tzimmermann@suse.de>
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
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_RCPT(0.00)[renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email];
	R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc),to(RLbwen1niosrcqbxsafh1)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 4B3BA1F83E
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -1.51

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. Align the pitch according to hardware requirements.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
index 216219accfd9..6294443f6068 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
@@ -11,6 +11,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
@@ -407,8 +408,8 @@ int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
 			struct drm_mode_create_dumb *args)
 {
 	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
-	unsigned int min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
 	unsigned int align;
+	int ret;
 
 	/*
 	 * The R8A7779 DU requires a 16 pixels pitch alignment as documented,
@@ -419,7 +420,9 @@ int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
 	else
 		align = 16 * args->bpp / 8;
 
-	args->pitch = roundup(min_pitch, align);
+	ret = drm_mode_size_dumb(dev, args, align, 0);
+	if (ret)
+		return ret;
 
 	return drm_gem_dma_dumb_create_internal(file, dev, args);
 }
-- 
2.50.1


