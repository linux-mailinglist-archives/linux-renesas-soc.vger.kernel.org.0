Return-Path: <linux-renesas-soc+bounces-29852-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONnBCZ20u2k8mgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29852-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 09:32:29 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BAE2C7ED0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 09:32:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D8CF3035D6B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 08:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63043A7828;
	Thu, 19 Mar 2026 08:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SIWLP6Qc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF4530EF97
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 08:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773909145; cv=none; b=lUMyxelzijFD1aPCtcBhRzcj9QAj4ESgkcpcE5SeY+gujpHbf7Ttv6BJ5NO+PvZPyvy5Go946o3Y/JPe87im2B4sF6VsCTov+KOxAA/fRZpSwpd6rHdH0pSlpp7PmRdm+GvjWpsGon0H0A85aW3QrpDMzbl5HubJpqslGa//GSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773909145; c=relaxed/simple;
	bh=SC29zW4VcpmHk7y/5BpagzpL5n5QvsDOhzfIPZ3UGHs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sgRO8PAfv3OIPKUFU14AHNe7vAVDvnKBUHblJvKwvrcj9lfDPOqlJAhFq1ISK2BpJVfwUn99YiIxMwKj+Y+mHY+nyBmr93Q+TF6HUzaBKm4z/KrqirAbACH71F0pwVkURRxnmaZ4qQoq/BIYrEEUeZELePkgcEo25cuhsBxk8L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SIWLP6Qc; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ad21f437eeso5754235ad.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 01:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773909144; x=1774513944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VqOOQO8G00f+NnUwp116p4eShMIJWuolK06DttQTATw=;
        b=SIWLP6Qc8cqRmSVKnQTObKCJLsrPFrOEN0Qv8L0Gya6B8W1VAJC2jKtyTfeBwQJCvO
         RnDCMLrFWulv6vTxu7sE/x22vKMEx9MY5vAJlXSm/Zdx0ksfSOjZOHhMdrsdHZ0r2foz
         tBq1FjcGdAdm5y5ciqLExIomDezUH9QR/9WylKaSkQ/6+xfHIXu7Smrrl0WzRtnXEIGt
         EUIKCo7GZGzxhC9h1/Rf8tfHA8znJ692mtevFnLC3qCIkNynflLOcahfqNWDRBPQnFmC
         Q69F3xgUI5uWlyuw05m2txsVnED5EETKuDuuNneglmh2c0+JCyucagJlI2U9ggoxSjUt
         ePaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773909144; x=1774513944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VqOOQO8G00f+NnUwp116p4eShMIJWuolK06DttQTATw=;
        b=X9C1xUhy++t3ulf7PH5Upb1MHcHlJ7FmrmDL0ljkDh5NgR+1mXBXVKjjBcqg0AHlU4
         SkFGgElzAMy6JkqVaJ2ZU7eruJujJLr1q0H3qXjqAWo1QC898HK3+PYW7LqF2cXoZQXB
         uGcNLyAUKFX9nXcifFbUQMCE+6jq3GsiZrZyKhZ7RYVqKLmlXlPzkwunkEHBK4Fd3P8C
         WvxjAqAWP8UFjT2y9H2JsulMi4G7YBkOoC+OL2fwh0Pl65LzGo3+j/JNx89ttWfkx5Po
         MtkaKmPeMCpqkMRDbCnVqjMnA8jBffngxjx0gFYhoRbTnLEGtrDbXdKhYrIIuyzWN05y
         ZCWg==
X-Forwarded-Encrypted: i=1; AJvYcCVGI2GplTFUrG2ceLg2AsStodYUGswy025rLcEzs3utcKzJbubWoUNOFY6Mo4fAb28Ou3nsPwzH9B93hAEdWsmfvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCqMmiYV6O1+OR4cWKkAwZFdMXnvICqY4Bh7kq4pKpehDSiPTc
	/qlPc8PtlE/PQ8mPn2LErYXf9MmRRV+LQSduiarUc2Epxrg6Mh7Qb7C8
X-Gm-Gg: ATEYQzyQGfbe5N8C48gE73dbLp++Algfh0xcTLLcMFBSZ8EADC8rneYF4G7OpHs8aRC
	u/cAu4ZX2wwplzG6RUby9x1NPCD2rT0Pvg/PYQmDQ77sWhPuTdKbCSAb4Vw8HaIBd3CMLEI34br
	GTo7d3Z5MO0XruwUSkUvqD1wxvUVSAtAJe0tNzoemgTnjdIFRu7jFecrOHvX/BnC90uLwQ5DSAF
	CuLWXPuO+xYo/UgMUDw2MJ3DBIhX+MQ91YKc7zKtOghgBnrllzAMZxgr6wOxwmXX7ZKCPexxxq3
	+TA1V2z15nXkyqQ403VzXjRwelzPSJhV4RP3Kcwi6m/XXdm3vCU+b9lsC9tqG/yC7sjgBfO0JgH
	7vZtupjpPD6eUlOiqIiGN1yTJ5wBIdQOQAb+hFatsZBYP6qZUIO6scL7eRSXqYvJnulRINDoZRM
	DkwgXT0JFa8gPQ8gkkrn4ztSuKxm80z8r8BXJ4hc7c7s829lWTK7mqtkNbEA==
X-Received: by 2002:a17:903:38c5:b0:2b0:6ba2:3d32 with SMTP id d9443c01a7336-2b07716eb19mr29493095ad.2.1773909143843;
        Thu, 19 Mar 2026 01:32:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e603b2asm53581615ad.55.2026.03.19.01.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 01:32:23 -0700 (PDT)
From: phucduc.bui@gmail.com
To: 
Cc: phucduc.bui@gmail.com,
	airlied@gmail.com,
	dri-devel@lists.freedesktop.org,
	geert@linux-m68k.org,
	laurent.pinchart@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	wsa+renesas@sang-engineering.com,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3] drm: shmobile: Fix white screen after resume when LCDC is stopped
Date: Thu, 19 Mar 2026 15:31:49 +0700
Message-ID: <20260319083207.17195-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,linux-m68k.org,ideasonboard.com,vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,suse.de,sang-engineering.com,glider.be];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-29852-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.692];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Queue-Id: 80BAE2C7ED0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: bui duc phuc <phucduc.bui@gmail.com>

The LCDC on R8A7740 may show a completely white screen after resuming
from suspend (s2idle or s2ram).

After resume, both Set A and Set B registers are reset to 0. As the
Frame End interrupt is not generated while the controller is stopped
(DO=0), the hardware register switching mechanism is not triggered.
Consequently, Set A remains at 0x00000000 even though a valid Start
Address is written to Set B, resulting in a white screen.

This is a timing-dependent race condition. In some configurations,
debug options slow down the resume path enough for a Frame End
interrupt to occur, which can mask the issue.

Fix this by priming both register sets with the Start Address while the
controller is stopped, ensuring a valid base address is available
immediately after resume.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
Changes:
 - v3 
   Update commit message, add Tested-by and Reviewed-by tags 
 - v2 
   Fix incorrect use of lcdc_write_mirror() for LDSA2R in
   the DO=0 path; use lcdc_write() to update both register
   sets as intended.

 .../gpu/drm/renesas/shmobile/shmob_drm_plane.c  | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
index b61fda52d17a..23c8489dba71 100644
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


