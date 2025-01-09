Return-Path: <linux-renesas-soc+bounces-12006-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DC0A07ADE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 16:04:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA70016991D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 15:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 929EE221D8D;
	Thu,  9 Jan 2025 15:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="twwf6bRk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MDWzRXw1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aTd4wlIj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Pe3ScWyO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CA021C195;
	Thu,  9 Jan 2025 15:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736435007; cv=none; b=Ljw3jpTnokX3U3J5X0N3oPvO0AMDMNJipez530JF+RAjckCjm4hH3K+Rd8C93/UBiLsO4uVIOjasSAozQJdy8KVSuZ1WWvU85Is4uXCLZCsqsG08kuGA9fkO/3Jh/deJU7ibyngPlNT9GNst7B6KAwvL+uYZ7xmqPXjSeJ5PrjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736435007; c=relaxed/simple;
	bh=E5TrV5gaErbw3TVoRrWfIb71C3WJk9tN88UbVROpbNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VSuic8szYZnjvrGWhMD2uvKbBkJsNegBaWLfcRwgnrmhOtbW5tGXEsAMFM+28utBxTjcXT0JA8dcji/XLBqTNYS98BmDj4GYw+TSLw43jatH4dwFBi5ycmjfQSaPSr85ZcuBva9GV/CLlkrEhutg4vVeyF3EqgHE1vhBu5wJ6m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=twwf6bRk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MDWzRXw1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aTd4wlIj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Pe3ScWyO; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 560EC1F455;
	Thu,  9 Jan 2025 15:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736435003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dlB8gALn1o96mpymG+jR60eAc3m1/AcHQiXg4BbiBLc=;
	b=twwf6bRkpdKoZbvnVil5OIS9zFS4Nl4YkETG5YWHIzRH9t2fNHB9NPCN+go+XqNXJHgCB1
	q27ZcbHf0nXJdntb4Z1YeAcXls8jYY5WwKYpVRr7Zz1in9ZdSactUKaLDdc6YjJ8IYsmx8
	caSjErYSXtXv87RFGViu9+DIDVMdDvI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736435003;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dlB8gALn1o96mpymG+jR60eAc3m1/AcHQiXg4BbiBLc=;
	b=MDWzRXw1agMN0fVPgxJSAd9CV57KEnNuZFPPF1FOZml8wr0xK3LyjP64b95ZKMqRJRLph+
	pHKfciLuwypgCLCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736435002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dlB8gALn1o96mpymG+jR60eAc3m1/AcHQiXg4BbiBLc=;
	b=aTd4wlIjW2Ym/cI/L10oTJnpoZoVXB9QiHOfV6piOCDx5zzt8S9b742qbwpr+coTsfCQAH
	KTGj8R3O3J65bIygefD8Cw4x+GF6gLHkhHsE4sbDsoJd+sNisUowc4D7hjWLGhzj3wOfZf
	3dsPNHfTS9ILQydyYFiqzNYAHVmpr14=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736435002;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dlB8gALn1o96mpymG+jR60eAc3m1/AcHQiXg4BbiBLc=;
	b=Pe3ScWyOfQDGNKt/GkTehVmf7gpnpBC2JJpDrTJq3GWNdC+oMbIkbH3leZ23JIzhLy83t4
	bsI2LaOWdyCUmqCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B7E8113A8B;
	Thu,  9 Jan 2025 15:03:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sNaEKznlf2c1awAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 09 Jan 2025 15:03:21 +0000
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
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 13/25] drm/msm: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Thu,  9 Jan 2025 15:57:07 +0100
Message-ID: <20250109150310.219442-14-tzimmermann@suse.de>
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
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[somainline.org:email,quicinc.com:email,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,linaro.org:email,poorly.run:email];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org,suse.de,gmail.com,quicinc.com,linaro.org,poorly.run,somainline.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. The hardware requires the scnaline pitch to be a multiple
of 32 pixels. Therefore compute the byte size of 32 pixels in the given
color mode and align the pitch accordingly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index ebc9ba66efb8..a956905f1ef2 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -11,8 +11,10 @@
 #include <linux/dma-buf.h>
 #include <linux/pfn_t.h>
 
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_prime.h>
 #include <drm/drm_file.h>
+#include <drm/drm_fourcc.h>
 
 #include <trace/events/gpu_mem.h>
 
@@ -700,8 +702,29 @@ void msm_gem_unpin_iova(struct drm_gem_object *obj,
 int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 		struct drm_mode_create_dumb *args)
 {
-	args->pitch = align_pitch(args->width, args->bpp);
-	args->size  = PAGE_ALIGN(args->pitch * args->height);
+	u32 fourcc;
+	const struct drm_format_info *info;
+	u64 pitch_align;
+	int ret;
+
+	/*
+	 * Adreno needs pitch aligned to 32 pixels. Compute the number
+	 * of bytes for a block of 32 pixels at the given color format.
+	 * Use the result as pitch alignment.
+	 */
+	fourcc = drm_driver_color_mode_format(dev, args->bpp);
+	if (fourcc == DRM_FORMAT_INVALID)
+		return -EINVAL;
+	info = drm_format_info(fourcc);
+	if (!info)
+		return -EINVAL;
+	pitch_align = drm_format_info_min_pitch(info, 0, SZ_32);
+	if (!pitch_align || pitch_align > U32_MAX)
+		return -EINVAL;
+	ret = drm_mode_size_dumb(dev, args, pitch_align, 0);
+	if (ret)
+		return ret;
+
 	return msm_gem_new_handle(dev, file, args->size,
 			MSM_BO_SCANOUT | MSM_BO_WC, &args->handle, "dumb");
 }
-- 
2.47.1


