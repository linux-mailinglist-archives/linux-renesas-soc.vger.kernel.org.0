Return-Path: <linux-renesas-soc+bounces-28473-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WATXA+7cn2nEeQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28473-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 06:41:02 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EAB1A1143
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 06:41:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F8843068EE0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 05:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE4C38A732;
	Thu, 26 Feb 2026 05:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VhskgLD2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0302765ED
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Feb 2026 05:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772084459; cv=none; b=pMCAfkSeEytg8JEI6cpvtHxWkxRH4RB5dmHMqSXk6A1GnEJhI5fyweEcTOM8CYM7asSa6vWflM2DTS+nsnpUFPGHS1mra79ToBZ9hs90Lak6ULXrLl99Xi7NU9APNn33lgnzahsHPnTS9RYpwHnIld67wVM5GUilS40x0TxNYNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772084459; c=relaxed/simple;
	bh=IHUuUsvpGlnLM4yHfGPnWG2ZQvQGkIAE8S9I+XFQDY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qzMhx5g1/vCZ5KlnEv03Uz+9nYWlrApkNJrDwjH2wVA4oT/1QvccUMHmzjPDCZBzyOEAdD6nTQO3SEab72NJ3v6/30jpTfkK2cP+nnkncJ/F+gooTJtAGR8uD51IKsSPNvRy2kKQNseEsl+9bWS+mc+0c5ezeh4bpz3ZsqB/5k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VhskgLD2; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2add623cb27so2760155ad.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Feb 2026 21:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772084457; x=1772689257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VaZyUwACUA0Qe6gGb/aYaVkPcTkTUmYev0wediivZlU=;
        b=VhskgLD2HCKQ5f2kFtLWzd0RPjBhbY75qPZWbMOigeW3HPm0OTCi/xAcZwnEwosrJb
         v7kdv+9bOX5bqH9vuCOLPrpMO2FSJVvyFLg8HmHGrqjuRG8JZFNDatZApOKJX45+dNv8
         QVTJCNsxYwkrNM336pxoi5UbTCRe/XK7Za0E3UzgztJR1SkE9PVeB6uyOa67rXgNOSFw
         zJcpifIk4z3WJ/J77RMwxsxqpHn2YOgAzxibHApBx7STkcDwCbkzRK6U6KorEdMkBVkY
         nuOcW4ykI6+yDTcTyYFYSRVebMf99sv+HrlU+ZMxS8i1tv0DE2qWt5vRPmUr8sxTT/wN
         3K8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772084457; x=1772689257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VaZyUwACUA0Qe6gGb/aYaVkPcTkTUmYev0wediivZlU=;
        b=sYjkGMMGP4f4N/vKH/jlvS+N4VbBU0w+E/wcyuc4vZNOcfHCZZJrmCe7SsLdchJUAT
         /10RuEIIap+QnMXYk84juZ1y4/RrnyHkzjjyym4KPYZ1toGqZtyWfmUq7VuHyqFeELme
         9brhFKEhUdsiDSX5VHNJ1fIZFWy10kEPjCN/B8c8IdUK1M6XnYOttPBTvl4fSnnlO0SK
         xgjkMA6K97KQ5ErMyfGf8maQu+SH9kCHOCzBV1gK45SEnMsyK+NNa0u5Kl0kGnOUkvAL
         QvyaJSePuweHcFF56a7p6lmXNSNYmVTtuUqGD1Mms57BwiHig5MpHG1qo02zZmD5PIZ3
         alpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSWU169Yf6YS9fajxlvzkmFD8ESrYKtNuTB/l+8Y95ul4Xu60h4QERRSAtLGUkD8q5vR1W8wjg9bLJ1XcdK76dCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVXzn2IHZvSAe9vs7WrAqI1hIYV39yPLTcf8O94thGstmlu7jP
	xRurjyR2lamEfDAQNLDZYWQhoKd9vdOe1LRJnBCL4/S8NOFG1FhO4icM5pqHBw==
X-Gm-Gg: ATEYQzzt8p6aYLnV2SOTA+mrnHf/hcAKQ9ySi4XLuPN7FnxgmiFAYnkYBru2f7LkGYS
	62V0J6sUpeOjZcawqRC0gfxlX1PJxnVri/41ZvQONN6OKuVJA/hJs6QjrkQYXFd38U7pFCz12eW
	Xlp7/3nvpNys4JPXNgQS1d604vcNR6Nkc+QNYX+3MAHFyQkwwh4TY1tKb1ihUjcYRqaa4IiJAKP
	M2je0nSA9j3tJ37YM7e9u+jfENKNNPHYj6We77FRx+VKRrmxTHEO+LcP2Zd+KH0dxvYTqQ6m0P0
	fueZmS6FR2sq4DYBv9VAdJVSlOEkUi7vahNemsTMyMBW7QY6xfIxl5CjogVoj2k4BL0n+qlU4uv
	SOEiddICHTphFPVBEsys7zQWAywZd+I72jY81IV7wuNXZFOn2v7qFhgLDW9ELSCcFCvUVblUADa
	QvsjzjV3lxkM3tHswRnJ2/HGUgEG+GxBx/ybe4uMp/rBsW0NM2lD7gYKa/yQ==
X-Received: by 2002:a17:903:98d:b0:2a7:3dbe:353d with SMTP id d9443c01a7336-2ae03705fb6mr11325425ad.53.1772084457349;
        Wed, 25 Feb 2026 21:40:57 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6f3436sm17026575ad.88.2026.02.25.21.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 21:40:56 -0800 (PST)
From: phucduc.bui@gmail.com
To: phucduc.bui@gmail.com
Cc: airlied@gmail.com,
	dri-devel@lists.freedesktop.org,
	geert+renesas@glider.be,
	laurent.pinchart@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: [PATCH v2] drm: shmobile: Fix blank screen after resume when LCDC is stopped
Date: Thu, 26 Feb 2026 12:40:35 +0700
Message-ID: <20260226054035.30330-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226051338.27460-1-phucduc.bui@gmail.com>
References: <20260226051338.27460-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28473-lists,linux-renesas-soc=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,glider.be,ideasonboard.com,vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	TO_DN_NONE(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 66EAB1A1143
X-Rspamd-Action: no action

From: bui duc phuc <phucduc.bui@gmail.com>

The LCDC controller on R8A7740 loses its register state during
deep sleep. Upon resume, the driver's Mirror Register mechanism
(MRS) fails to update active registers because the controller is
stopped (DO=0).

According to the datasheet (Section 38.7.1, Figure 38.13), the
Two-Set Register Switching logic only triggers a change between
Set A and Set B when a Frame End Interrupt occurs at the
completion of a display frame. During resume, as the LCDC is
stopped, no frame is processed and no Frame End pulse is
generated. This leaves the Display Data Start Address (SA)
pending in the standby set, while the active register (Side A)
remains at 0x00000000, preventing the display engine from
starting.Debug logs collected during resume confirm this
behavior, showing the start address written to the standby set
while the active register remains unchanged.

Prime both register sets when the LCDC is stopped:

    If DO=0: Use lcdc_write() to force the Start Address (SA)
    into both Set A and Set B registers. This bypasses the
    switching logic and ensures the engine has a valid base
    address immediately upon being enabled.

    If DO=1: Maintain the standard Mirror mechanism and MRS
    toggle for normal, tear-free operation.

Verified on R8A7740.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Fix incorrect use of lcdc_write_mirror() for LDSA2R in
   the DO=0 path; use lcdc_write() to update both register
   sets as intended.

 .../gpu/drm/renesas/shmobile/shmob_drm_plane.c  | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
index 9d166ab2af8b..6371bdc2371a 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
@@ -70,6 +70,7 @@ static void shmob_drm_primary_plane_setup(struct shmob_drm_plane *splane,
 	struct shmob_drm_plane_state *sstate = to_shmob_plane_state(state);
 	struct shmob_drm_device *sdev = to_shmob_device(splane->base.dev);
 	struct drm_framebuffer *fb = state->fb;
+	u32 ldcnt2r;
 
 	/* TODO: Handle YUV colorspaces. Hardcode REC709 for now. */
 	lcdc_write(sdev, LDDFR, sstate->format->lddfr | LDDFR_CF1);
@@ -78,11 +79,19 @@ static void shmob_drm_primary_plane_setup(struct shmob_drm_plane *splane,
 	/* Word and long word swap. */
 	lcdc_write(sdev, LDDDSR, sstate->format->ldddsr);
 
-	lcdc_write_mirror(sdev, LDSA1R, sstate->dma[0]);
-	if (shmob_drm_format_is_yuv(sstate->format))
-		lcdc_write_mirror(sdev, LDSA2R, sstate->dma[1]);
+	ldcnt2r = lcdc_read(sdev, LDCNT2R);
+
+	if (ldcnt2r & LDCNT2R_DO) {
+		lcdc_write_mirror(sdev, LDSA1R, sstate->dma[0]);
+		if (shmob_drm_format_is_yuv(sstate->format))
+			lcdc_write_mirror(sdev, LDSA2R, sstate->dma[1]);
 
-	lcdc_write(sdev, LDRCNTR, lcdc_read(sdev, LDRCNTR) ^ LDRCNTR_MRS);
+		lcdc_write(sdev, LDRCNTR, lcdc_read(sdev, LDRCNTR) ^ LDRCNTR_MRS);
+	} else {
+		lcdc_write(sdev, LDSA1R, sstate->dma[0]);
+		if (shmob_drm_format_is_yuv(sstate->format))
+			lcdc_write(sdev, LDSA2R, sstate->dma[1]);
+	}
 }
 
 static void shmob_drm_overlay_plane_setup(struct shmob_drm_plane *splane,
-- 
2.43.0


