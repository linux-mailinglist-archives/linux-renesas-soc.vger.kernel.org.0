Return-Path: <linux-renesas-soc+bounces-18262-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 359FDAD8725
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 11:07:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58D793A90CE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 09:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA52291C1A;
	Fri, 13 Jun 2025 09:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="njzl47lV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rO/Zx6Q3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="njzl47lV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rO/Zx6Q3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B300B291C08
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Jun 2025 09:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749805574; cv=none; b=GN+qKd3LGEpvrshv7H4PMUQhkOIytbxSclHr+i4wZRAHXxryYTL+sON85EblZhpKj+DhXMIAPtRrM8FTEW8UJy7JH22OjFKSr1HKH7YkX7lV8jus9cN+Ni+XQO5N7CylzmTGNPbzLFmD0LlZ1lE4LzGgT18tFzPTuylpGbsXIFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749805574; c=relaxed/simple;
	bh=pJnjrshtIBJWYkn4h61UxlFuuPccl2mjOrJZ9/MRXVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G5328yP1cajwZtDOfnqMXsM98AhTpwbf3BmaxHfBQjlx+nv5bInqcoAryIp1wbT7oWli7NRVrw2uVka2RRF8tksCUs8xQRZvBiOrFbwJK46qm8uyUXqLpDdPboBgtgEubdvDZgy1cXL4sNYDMj9K4DA8xe0SDyojUMWuWAfd0yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=njzl47lV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rO/Zx6Q3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=njzl47lV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rO/Zx6Q3; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A2CC11F898;
	Fri, 13 Jun 2025 09:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749805492; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=co8oy2hD8rdxc+Ecu2XQ9CKCy4aLh0YIl4/k0TTFtWw=;
	b=njzl47lVWESzyaOgeHkQC23FWdD1IR9lcOYrIsKjJTDRxDQxyoV+eu21nY+uNw+i2Y4/m9
	jm1gtH5Z+2MHJuMSyqpAVVRGboPVn+nXsZX9MGVLykd1oYlcJKR0LtDddiZ483tYLgyBnm
	Aja3vjvOrPyJjLWt0yed1+ozDGgd8oY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749805492;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=co8oy2hD8rdxc+Ecu2XQ9CKCy4aLh0YIl4/k0TTFtWw=;
	b=rO/Zx6Q3P5TDRPkWkZDmPciuekz8KUlXEQbwCbcgdOlg4j9Xl6NHKjy3sIswlAitA4o2GL
	Bn35tXJxOlWoIcAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749805492; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=co8oy2hD8rdxc+Ecu2XQ9CKCy4aLh0YIl4/k0TTFtWw=;
	b=njzl47lVWESzyaOgeHkQC23FWdD1IR9lcOYrIsKjJTDRxDQxyoV+eu21nY+uNw+i2Y4/m9
	jm1gtH5Z+2MHJuMSyqpAVVRGboPVn+nXsZX9MGVLykd1oYlcJKR0LtDddiZ483tYLgyBnm
	Aja3vjvOrPyJjLWt0yed1+ozDGgd8oY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749805492;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=co8oy2hD8rdxc+Ecu2XQ9CKCy4aLh0YIl4/k0TTFtWw=;
	b=rO/Zx6Q3P5TDRPkWkZDmPciuekz8KUlXEQbwCbcgdOlg4j9Xl6NHKjy3sIswlAitA4o2GL
	Bn35tXJxOlWoIcAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6BF4A13A9C;
	Fri, 13 Jun 2025 09:04:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CCLvGLPpS2inNAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 13 Jun 2025 09:04:51 +0000
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
Subject: [PATCH v5 23/25] drm/xe: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Fri, 13 Jun 2025 11:00:42 +0200
Message-ID: <20250613090431.127087-24-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613090431.127087-1-tzimmermann@suse.de>
References: <20250613090431.127087-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-5.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,intel.com:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -5.80

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
index 4e39188a021a..992aa9a1416b 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -9,6 +9,7 @@
 #include <linux/nospec.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/ttm/ttm_backup.h>
@@ -3098,14 +3099,13 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
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
2.49.0


