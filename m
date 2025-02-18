Return-Path: <linux-renesas-soc+bounces-13288-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25501A39FBC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 15:30:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A53A3B40EB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 14:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2480226B968;
	Tue, 18 Feb 2025 14:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J1SDq8il";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NdvsVw0q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J1SDq8il";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NdvsVw0q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F5126B95A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Feb 2025 14:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739888822; cv=none; b=Re9W08XaXULnQWQSvN1Jzh/7WdsmspT6kkK6WlIvwZPF/l66+4sc4sMxttG93AWx8MkdyQgh2D+LJCn/RMHwribK4GN80ar7ubsFlD07Zy3yUn0gyJkjtzCrGYo8GwNi8LrK+7zOauDTBWytzrjjFNGmLa6FrdMIjrDTwiylOX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739888822; c=relaxed/simple;
	bh=2EkoMKCR77DxHlDoncrCVVpXGpsSmWUjVWij6CnuUV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YhF/6V/0ZSB5H5EdjFA2FoJZCtjgHlMp1TsnjIjj0prJBbshHI+Oq/YS9rP7lx0dR9rFc+r1xBOKJSqcBwE+9X4bGvTLlMndeNYK9EupGMtzpmTRbuvJVzYb07M4R4McxKk5Aeho8/tQsJaPiIwOCr84VVpAhjCzsii1oxuFzQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=fail smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=J1SDq8il; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NdvsVw0q; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=J1SDq8il; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NdvsVw0q; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 658EB1F460;
	Tue, 18 Feb 2025 14:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739888760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bwygu7OW2nYZSxrnhLvVTuKP6gfPJ4hKNl5leS6/5bM=;
	b=J1SDq8ilSoBM3Kc8e9IFGnI53gxG0YCJMn0IU5NdiJ1xZsZufpAJ0VNDZR5dVqjMB33Ae2
	5RWhqnnKqfae2oFMbBpegQMhWmnRVECjKpiNldRUM/c8jS7t+xZw7ViSySsIKOhOqslLd/
	H1EnuuhklW8z8uv92mo+ZLpdEVfC4wI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739888760;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bwygu7OW2nYZSxrnhLvVTuKP6gfPJ4hKNl5leS6/5bM=;
	b=NdvsVw0q5LoN12zBkXXlpMhKqN2vWroDy/WUajxn5xSDvvBg/gkh1takUqbMONpdvmpRJW
	Z5+EAaLTkewFppBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739888760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bwygu7OW2nYZSxrnhLvVTuKP6gfPJ4hKNl5leS6/5bM=;
	b=J1SDq8ilSoBM3Kc8e9IFGnI53gxG0YCJMn0IU5NdiJ1xZsZufpAJ0VNDZR5dVqjMB33Ae2
	5RWhqnnKqfae2oFMbBpegQMhWmnRVECjKpiNldRUM/c8jS7t+xZw7ViSySsIKOhOqslLd/
	H1EnuuhklW8z8uv92mo+ZLpdEVfC4wI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739888760;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bwygu7OW2nYZSxrnhLvVTuKP6gfPJ4hKNl5leS6/5bM=;
	b=NdvsVw0q5LoN12zBkXXlpMhKqN2vWroDy/WUajxn5xSDvvBg/gkh1takUqbMONpdvmpRJW
	Z5+EAaLTkewFppBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CEA5A13A82;
	Tue, 18 Feb 2025 14:25:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wOImMXeYtGdXYQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 18 Feb 2025 14:25:59 +0000
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
	Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 23/25] drm/xe: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Tue, 18 Feb 2025 15:23:46 +0100
Message-ID: <20250218142542.438557-24-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218142542.438557-1-tzimmermann@suse.de>
References: <20250218142542.438557-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.80
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6),to(RLbwen1niosrcqbxsafh1)];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 78d09c5ed26d..b34f446ad57d 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -9,6 +9,7 @@
 #include <linux/nospec.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/ttm/ttm_device.h>
@@ -2672,14 +2673,13 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
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
2.48.1


