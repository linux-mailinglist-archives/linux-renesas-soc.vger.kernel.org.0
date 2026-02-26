Return-Path: <linux-renesas-soc+bounces-28472-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEE6KpTWn2kYeQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28472-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 06:13:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF071A100B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 06:13:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 881653017DF6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 05:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E743876BA;
	Thu, 26 Feb 2026 05:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fyy6k/eW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8507F3815FE
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Feb 2026 05:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772082834; cv=none; b=LOhUciW5ASaFYO5/mRoizOL5Iq/OmcVBPqjm+LYcmuBN0rDwpoC7jYXZKkLlV9IkIb6mDEcUkRhlAHVuhsU277zHihjdWMdeXr9Sa4hA6WqzI9D26FnsozdMnPQ2BAu6UeeIat79WNSAqghn3aDQ2iPW5roZwS6PAk5i8860khE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772082834; c=relaxed/simple;
	bh=KrNUsi+2Aycse7pYVayJOxdMVyMiyzgBb7YukhjRM1c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mGSg51fEtlz4V36H1+GnHptjWcugiY5gq12ZtlS6ch1sWgMHZKWmj8QusiEY042KSpbn+dtcQ2y5SF//opMHC5aIIiAr99QOvi2ZvaGrm+1HS3AALTLyhk+zH111EwsbtXrQxR2EbL7YL7uylu8wR35PiwGSZWnAa9SymOtY7i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fyy6k/eW; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-827270d50d4so509733b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Feb 2026 21:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772082833; x=1772687633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/mKOurc9EHBKfVMuwdiuhgyEKIrS/i0ROAg7NG335J8=;
        b=Fyy6k/eW9yCJj0tULMsYjpwbhpPsSCYncCIfsCdbXkYVfrntz23r7M4qXbxQHpBEMB
         ElhYFvh7Dr4SdmXqktky0PSp3wIulRefoQsQkEHYL5JnZUeVH2HtZv2PIBBXWZ1RE+0s
         6NZFTtEk5q0ewrnnyJKqJtuNDWTwRWpwf9N+WoROwtEab/mSIqtbfQDuS9Rvz4jbiTEF
         qetSNW8BRnH+KvpMTAfGYkv+PMR2noyo7FV36U96MSI5Jidv6sKEzNU0jziPK72RTQph
         +VMV+BRRQP/cD54W0ZFZrOO1jUXX793IZuKzxP+HsJKu1C0g1g7EpRLeZvAdrUJZOUTS
         FQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772082833; x=1772687633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/mKOurc9EHBKfVMuwdiuhgyEKIrS/i0ROAg7NG335J8=;
        b=if1fihXNf3EBy3icPe4BK0vLhZnrqz2F+/g8MzsnIbd2TaIl5lSDpA/1PMR0a5mGKV
         jePXL+vHhaqCnq6n7iep/BDkMsJe6h1MkMYAMNQ2BN2JQe0/Lj+N7Ia9rybEz5MHEWYs
         P4zXpa/CuNy2u2NzU1Ww+KDdYphV0YSViLiz5HfrKBGkHMslqTmJujSTD3xXy6C6dO3y
         cPxQ/d4DXXpfHJqZLD6+vtNcS30i0QF5Lgrz4CukfNZI3u/pn8UEXEZ6rMeC8y4whQPf
         nBzGVzzTPkTcSv7ohxnJnfK81hpykuTv3PWd/vTpMWNH6cuRGuS6nDsTPH9Q6cSTc51X
         dKxw==
X-Forwarded-Encrypted: i=1; AJvYcCVk4jZa62HKz+Bz3xy/o/X3038S6fRbnNSRFqJp1QSpNY1WBcKelFSiXFTnv/OeYpJF+Q8uCQ1W9jyLyJWvoEFpow==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcdNuEuKfsWjkn+9hf5bc8QmNT4FNwNg5ebkM7b/8TTMbdBmUq
	R4rmfh4EGdcQDztql8FoRumBER8IgDx+rDyDzByPbPRo/cTcemQRzlSA
X-Gm-Gg: ATEYQzyG9yfXzG/OKe9u1ZgQvnQt0rdZ4oudXVrkGQ6prkcVz3ZUjxILtl0blFtEuKv
	yjdqFIh22YEwNTIj8odbGHiqCIcuTeMCBWS4mtv4FYJN2E/D97fKsIsbBw0OQ7lkfg4ROh1xq6Y
	jZxSUE8BRmENPLgBmcW9l+Omy0epmOgyuCjzdJSrawAXVwJ/lYBcdCACpjGtKnuMcDvK7qPo8cB
	FOmvziwMStuPKv0VuHT6XkPtu64F1rz1VqHs8uFR9Dt7z0E9bpdnR5i6uJrGniSeKCK/LZLezf/
	0pwgUAVoEn6qMEDfJD12Zmw2ecCmOxIENDk66+wBquejLpcSxLo+h78PCHb07eQG57aVH3OfBiL
	y0e+2gpKzhUxsbCaOsdW6zZa3NkfTN6G4NpSNyVcGBP4J7XugkJxb+pq0c2aJJR2kTG6ZITaOcg
	AIu7Q6U1K0RFyK2QA4wibNSn1x0WQwiXTry5RcnsQCB2MuPiz3TCUHTG4xyg==
X-Received: by 2002:a05:6a00:852:b0:824:374a:140d with SMTP id d2e1a72fcca58-8273bc57a30mr1152848b3a.4.1772082832756;
        Wed, 25 Feb 2026 21:13:52 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ff3667sm912196b3a.41.2026.02.25.21.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 21:13:52 -0800 (PST)
From: phucduc.bui@gmail.com
To: dri-devel@lists.freedesktop.org
Cc: laurent.pinchart@ideasonboard.com,
	geert+renesas@glider.be,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phucduc.bui@gmail.com
Subject: [PATCH] drm: shmobile: Fix blank screen after resume when LCDC is stopped
Date: Thu, 26 Feb 2026 12:13:38 +0700
Message-ID: <20260226051338.27460-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28472-lists,linux-renesas-soc=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[ideasonboard.com,glider.be,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,vger.kernel.org];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4DF071A100B
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
 .../gpu/drm/renesas/shmobile/shmob_drm_plane.c  | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
index 9d166ab2af8b..21fd1e19beda 100644
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
+			lcdc_write_mirror(sdev, LDSA2R, sstate->dma[1]);
+	}
 }
 
 static void shmob_drm_overlay_plane_setup(struct shmob_drm_plane *splane,
-- 
2.43.0


