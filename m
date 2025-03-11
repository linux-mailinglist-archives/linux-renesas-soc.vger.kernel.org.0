Return-Path: <linux-renesas-soc+bounces-14295-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE4AA5C9E2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 16:58:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CD5C170D22
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 15:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C9B426158E;
	Tue, 11 Mar 2025 15:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="t1dpIHSn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5ktR/K8D";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="t1dpIHSn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5ktR/K8D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0657261582
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Mar 2025 15:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741708570; cv=none; b=P07phgGwmDCavkA4FIOvxqa8XJPamQV8en9zFJbIXHtJ0gp3di4vF6Y2n6jPalD+BvuVwJTXZeyZqZBxk2ttcQb3gGbBFAsnZSN/P7NzeDMTOmdzes94JQkaNObF1Ay4bdtMFxmgejkkD0DYum9O51LwLifnc7LPKJMSiz+Ef1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741708570; c=relaxed/simple;
	bh=FoSAEyAX/tNPTSF9PKyXW7ZtWGgMQB8OqAepwVmIb9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D1kfbp23ri8560DCgD9Op9m+O83VLuyzuZwnAlXU+/r3eneQGaL0Cxn3AYz1m0quiwtrTSPPWi2A1E2CYu5WKMbaVNlqIaqh7/3OlnlwtndIONfEQQ5M6rJu7+6NcZoqdJPljJfxRT5Ohk6M+PFpZp/XHtQVakkANJ9v5G6idIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=t1dpIHSn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5ktR/K8D; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=t1dpIHSn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5ktR/K8D; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 23CC02118B;
	Tue, 11 Mar 2025 15:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741708503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rf5dFpikKn5c3GIrBSRRcQu3Wk8DqddBNdtAqBZYLZM=;
	b=t1dpIHSnrqZECTpEd+UQCMQ3F/48i/4XO5nRl9ubGbks3GPoT/Eeiba3sq2UK9xMKJoB1l
	U/abKclaN4reyQImvyg1rfFVn/qKr4cmSi2kDE1+zx5W7qLNGMsJGc3SoKF0p5gCo4nqEn
	CjQfFTRd21RBnVgqGuUd8Lpngff7ZpM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741708503;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rf5dFpikKn5c3GIrBSRRcQu3Wk8DqddBNdtAqBZYLZM=;
	b=5ktR/K8D6OHZhut2hSWsmTlNgnHxixVaGxtP1u5MUSk7TW4N4mKLSiIIL/wzS6N/ePsrlr
	ZW5ElZzsmr8tGbCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741708503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rf5dFpikKn5c3GIrBSRRcQu3Wk8DqddBNdtAqBZYLZM=;
	b=t1dpIHSnrqZECTpEd+UQCMQ3F/48i/4XO5nRl9ubGbks3GPoT/Eeiba3sq2UK9xMKJoB1l
	U/abKclaN4reyQImvyg1rfFVn/qKr4cmSi2kDE1+zx5W7qLNGMsJGc3SoKF0p5gCo4nqEn
	CjQfFTRd21RBnVgqGuUd8Lpngff7ZpM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741708503;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rf5dFpikKn5c3GIrBSRRcQu3Wk8DqddBNdtAqBZYLZM=;
	b=5ktR/K8D6OHZhut2hSWsmTlNgnHxixVaGxtP1u5MUSk7TW4N4mKLSiIIL/wzS6N/ePsrlr
	ZW5ElZzsmr8tGbCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8533F13AB8;
	Tue, 11 Mar 2025 15:55:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qCY1H9Zc0GdUdQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 11 Mar 2025 15:55:02 +0000
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
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 25/25] drm/xlnx: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Tue, 11 Mar 2025 16:47:29 +0100
Message-ID: <20250311155120.442633-26-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250311155120.442633-1-tzimmermann@suse.de>
References: <20250311155120.442633-1-tzimmermann@suse.de>
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
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
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
buffer size. Align the pitch according to hardware requirements.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_kms.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index b47463473472..7ea0cd4f71d3 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -19,6 +19,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fourcc.h>
@@ -363,10 +364,12 @@ static int zynqmp_dpsub_dumb_create(struct drm_file *file_priv,
 				    struct drm_mode_create_dumb *args)
 {
 	struct zynqmp_dpsub *dpsub = to_zynqmp_dpsub(drm);
-	unsigned int pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
+	int ret;
 
 	/* Enforce the alignment constraints of the DMA engine. */
-	args->pitch = ALIGN(pitch, dpsub->dma_align);
+	ret = drm_mode_size_dumb(drm, args, dpsub->dma_align, 0);
+	if (ret)
+		return ret;
 
 	return drm_gem_dma_dumb_create_internal(file_priv, drm, args);
 }
-- 
2.48.1


