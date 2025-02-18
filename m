Return-Path: <linux-renesas-soc+bounces-13280-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A82A39F91
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 15:29:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D2CD3A982C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 14:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6754226A0CA;
	Tue, 18 Feb 2025 14:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0dXGFZ2U";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xIrYnj0a";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0dXGFZ2U";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xIrYnj0a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23F326B0AC
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Feb 2025 14:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739888797; cv=none; b=nhhoQyaBMemtzpTR6BLEGxPtYrSodtKsnhfJxXL/fUCq1mVmhc/B+DRoEoZ+leTDolJAoah/5BVnFR67YIYFsjA/FfZh9TRFfNeSSJvfVnSiEf3q+RDju+fL1NESl6oDRYAVb5wTDp71vRzA7jcTcYfhtwhS9jM84+Gk+P9lFH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739888797; c=relaxed/simple;
	bh=BoZqzpsCqyQU/l4SA37gGE1MAKpdDVEAXm/8zrKdRZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X4gwXntzeYrvmR7VGHsFd1JcKMVviMISkUwXWMAjuA/SjRxKXvGVzvUapj6AOLPRDbKhL8UKTeG68jOSSPrNXxL9ZlMfM1johM23FgKg+4GTuYQ5Uyn2qM05VnFED384o/6brZ9ruSKp/uMU/T+kZzpMvU8cy3Rdicjwf/RlZf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=fail smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0dXGFZ2U; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xIrYnj0a; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0dXGFZ2U; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xIrYnj0a; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4DC861F44F;
	Tue, 18 Feb 2025 14:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739888756; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y2QvY6PVclanBPN/7E5Tf5uByFFYe3OXaJ8iZr7ZrX8=;
	b=0dXGFZ2U3SyRuQ7nVpoTcGQkGlcvlux4SEXKmIJdlTewQT1F6f/f1RCmrmNbY3ijFW1rVx
	kfIap99HQaOYa8TZ1X99QlDmTOOnlpUr1ebF0Nq7FMxBJEcYpVbtnXi/hkPIvoCYdiaXqx
	9h9HLuErAULVDEBvmdljIWXK1ljsPzs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739888756;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y2QvY6PVclanBPN/7E5Tf5uByFFYe3OXaJ8iZr7ZrX8=;
	b=xIrYnj0aapk8fHPPGo/L9oh4IFFDB7R9/fO5fOk8fI+bAF4oDqamXkUJBOhB1siMI/aaBA
	DIA4FXw8uCJ8VSAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739888756; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y2QvY6PVclanBPN/7E5Tf5uByFFYe3OXaJ8iZr7ZrX8=;
	b=0dXGFZ2U3SyRuQ7nVpoTcGQkGlcvlux4SEXKmIJdlTewQT1F6f/f1RCmrmNbY3ijFW1rVx
	kfIap99HQaOYa8TZ1X99QlDmTOOnlpUr1ebF0Nq7FMxBJEcYpVbtnXi/hkPIvoCYdiaXqx
	9h9HLuErAULVDEBvmdljIWXK1ljsPzs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739888756;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y2QvY6PVclanBPN/7E5Tf5uByFFYe3OXaJ8iZr7ZrX8=;
	b=xIrYnj0aapk8fHPPGo/L9oh4IFFDB7R9/fO5fOk8fI+bAF4oDqamXkUJBOhB1siMI/aaBA
	DIA4FXw8uCJ8VSAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BE373132C7;
	Tue, 18 Feb 2025 14:25:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yMD+LHOYtGdXYQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 18 Feb 2025 14:25:55 +0000
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
	Dave Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v3 16/25] drm/qxl: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Tue, 18 Feb 2025 15:23:39 +0100
Message-ID: <20250218142542.438557-17-tzimmermann@suse.de>
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
	RCPT_COUNT_TWELVE(0.00)[21];
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

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch
and buffer size. No alignment required.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_dumb.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_dumb.c b/drivers/gpu/drm/qxl/qxl_dumb.c
index 17df5c7ccf69..1200946767ce 100644
--- a/drivers/gpu/drm/qxl/qxl_dumb.c
+++ b/drivers/gpu/drm/qxl/qxl_dumb.c
@@ -23,6 +23,8 @@
  *          Alon Levy
  */
 
+#include <drm/drm_dumb_buffers.h>
+
 #include "qxl_drv.h"
 #include "qxl_object.h"
 
@@ -35,14 +37,13 @@ int qxl_mode_dumb_create(struct drm_file *file_priv,
 	struct qxl_device *qdev = to_qxl(dev);
 	struct qxl_bo *qobj;
 	struct drm_gem_object *gobj;
-	uint32_t handle;
 	int r;
 	struct qxl_surface surf;
-	uint32_t pitch, format;
+	u32 format;
 
-	pitch = args->width * ((args->bpp + 1) / 8);
-	args->size = pitch * args->height;
-	args->size = ALIGN(args->size, PAGE_SIZE);
+	r = drm_mode_size_dumb(dev, args, 0, 0);
+	if (r)
+		return r;
 
 	switch (args->bpp) {
 	case 16:
@@ -57,20 +58,18 @@ int qxl_mode_dumb_create(struct drm_file *file_priv,
 
 	surf.width = args->width;
 	surf.height = args->height;
-	surf.stride = pitch;
+	surf.stride = args->pitch;
 	surf.format = format;
 	surf.data = 0;
 
 	r = qxl_gem_object_create_with_handle(qdev, file_priv,
 					      QXL_GEM_DOMAIN_CPU,
 					      args->size, &surf, &gobj,
-					      &handle);
+					      &args->handle);
 	if (r)
 		return r;
 	qobj = gem_to_qxl_bo(gobj);
 	qobj->is_dumb = true;
 	drm_gem_object_put(gobj);
-	args->pitch = pitch;
-	args->handle = handle;
 	return 0;
 }
-- 
2.48.1


