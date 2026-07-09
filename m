Return-Path: <linux-renesas-soc+bounces-34998-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uTYROAz3T2rwrAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34998-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 21:31:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD7D734FFE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 21:31:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=RVFmKpqA;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34998-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34998-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 03E4F3023FBC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 19:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 830EA3D16E2;
	Thu,  9 Jul 2026 19:29:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4863CCA02
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 19:29:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625370; cv=none; b=VSg31LhkYQAxpmkF5htj9Oss7n/ao6tF3Krk7LtTwYKI8tdd7aw09RDkA539DP+Jwj6RxjWBiPdNPxHkM/9oPKLFDj4PZKo3fs3IiaT3TFQ2DzhO4k+6LGCHk6GG5VKQCiA2ICCZDrGZUovqQF3cIUOHsBvfSc9FeDtz08p5iUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625370; c=relaxed/simple;
	bh=KCRL88UYwQ1FSJOf4LDM7HO191xofB2eq+pUEUSI+DA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lmwopv1SfKcQv7jq3FUgivaEEayqCfyhRfK62MkIzxPuznCxg5vACWgYlaoAR8hYVFPJtEZBio0UwKDtBYUqjyQtz/f25z7V4uDd3Znv9yrz7XwKN6arBTuPTRxspeSYO2sSFi/Y1iU9Btj2Za9hJ+EfkRiDKm2DFz/pYRKi2dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVFmKpqA; arc=none smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493ed9d8c5cso1155435e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 12:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783625366; x=1784230166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4bu2XDvGDTi01cs99wwcdGNtrPxlcDU/u4Y+5NNptKA=;
        b=RVFmKpqA1MFbXCMqlKbZB2K+1xXfNv8gcekJsNdysS5XfIRPpqTBZs0r8tCvJTv9/+
         j/tD9kJLUMuT7BMEyg3WI/q2H3uFZyzyqMzpLyQvS7Vztj7H7tiwb+Njrxmvn4RtneFm
         djYiIzHkJIQ1c5fYmYwgDroItskbN6+/3/4HhPig2eBcHg3OGEho/WlFoQBMea0I2E6F
         78DNhLwfPyi0WE70iqu9i99+pGaFVLLed8c01t9R2lN4It9CES4HEaifV8RohgOlIEPz
         c8IABY+QtDp6yY1L9ubVZncYgHjbAqR/jkGFNHIVjQ4VlYapyYw1d1Zgp9NzTTYs4hXH
         8ApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625366; x=1784230166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4bu2XDvGDTi01cs99wwcdGNtrPxlcDU/u4Y+5NNptKA=;
        b=rpxdAvncYUiz0IhpVGkFT6dlB5VnMh4lff6Cdn21V5UJ+Z5oTtP6N7QRsYWsXzk5AY
         CWYzDbXBds43ae8Fh7Sgg4gYSkRnZ6XaSelg5VMg63zF/gDDVnqCUvtO/YLuFm4I+9d9
         eOPh2UbfH+hQEu3kf6JpOE3+ORlx5dGn4zqLARYHD6FVgUTDnrwQJ50iJXBEkPG6OcXg
         z5H0oHlhsrcfAiHJdZ7QMd2KqrWpoHpGmnICYhzAR6tV4Tx1WHjTUZSqR5NRyD0B5KqQ
         qPULA0wnwLVaktWa8rtwm8dLUr925GTb6jHzJje+Of66vooQy/ZNeuf0D4d+OEIijJHL
         m3LQ==
X-Forwarded-Encrypted: i=1; AHgh+RpjtdvhFzWsxk6MRDJc7Onqfvasj96cC16qlXJcaNEyn5uu7pqglK/NzkJD1bQAJ66Xja7/cDZLCSys5HsJ9Oo+0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRgQ1B9FJLwn74VA+GeUKJGNvz5syxmNHrf4D7/fy3oQZUb3BA
	mD5kDSUzR6Li1MxcSdaS3xqOLDoM/VTUpJkML6OmA4hAYi29rYwoPcXU
X-Gm-Gg: AfdE7cluK7Tqk2mwpdhXhGdCBbpFMsQivUcof7qE2vKBBJu/JScCxzX3fRg92l8Cqhx
	otmWRBzNXkLaAkpP5Rq0j56pBEPwuhoRKBgAHCuSdzyH/iDJUg1/4m7hGzqmDnbItMJpSAyqQ7i
	8VEXKQNVVr/kb8E4briluB2yAry4e/zbqGfQyj9wl5gEboPpB6Bv03pArBH4N9SA3Sr490lHIFY
	sLdL02vbEhnh0B7glfrbbd7Z6cEInOYq1BSxdBXXgA0jyUVSVINnOzL6q0o5r8NR3aXZMxD+0qi
	CJxSQkvOLnsHMlcaHE/iSZEei/JV+Rz0L/riwUY88ot9GzLCLeb8tOjVDJcFRtw/sR2v6nFuUAR
	YLAAmGd281OTxwD2bleVv/u489ybtp38WrsXFjew2q6rW70TIqSBxarcEiq7Se3Am7QMENUWgQu
	4sxWnrBYOBSw70+D9tXu0y
X-Received: by 2002:a05:600c:871a:b0:493:edde:33e2 with SMTP id 5b1f17b1804b1-493edde34cbmr36301625e9.32.1783625365851;
        Thu, 09 Jul 2026 12:29:25 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8fb6:1d85:3dc1:42ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6ccdbbsm84366045e9.3.2026.07.09.12.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:29:25 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v19 09/12] mmc: renesas_sdhi: Save and restore IOVS across suspend/resume
Date: Thu,  9 Jul 2026 20:29:06 +0100
Message-ID: <20260709192916.630794-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709192916.630794-1-biju.das.jz@bp.renesas.com>
References: <20260709192916.630794-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-34998-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:ulfh@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-mmc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:wsa@sang-engineering.com,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DDD7D734FFE

From: Biju Das <biju.das.jz@bp.renesas.com>

The SD_STATUS register, specifically the IOVS (I/O Voltage Switch) bit, is
not automatically restored after a suspend/resume cycle, causing the
regulator to report an incorrect voltage on resume.

Fix this by caching the CTL_SD_STATUS register value in the renesas_sdhi
private struct at suspend time and writing it back during resume. The
save/restore is only performed when a regulator device (rdev) is present,
as the IOVS bit is only relevant in that context.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v18->v19:
 * Updated suspend/resume with scoped runtime calls in suspend.
v17->v18:
 * No change.
v1->v17:
 * No change.
---
 drivers/mmc/host/renesas_sdhi.h      |  2 ++
 drivers/mmc/host/renesas_sdhi_core.c | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index d46598190004..39d915da6f38 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -104,6 +104,8 @@ struct renesas_sdhi {
 	struct reset_control *rstc_axim;
 	struct tmio_mmc_host *host;
 	struct regulator_dev *rdev;
+
+	u32 cache_sd_status;
 };
 
 #define host_to_priv(host) \
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index c4908c09d89d..cec703122b22 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -1400,6 +1400,15 @@ int renesas_sdhi_suspend(struct device *dev)
 	};
 	int ret;
 
+	if (priv->rdev) {
+		PM_RUNTIME_ACQUIRE_IF_ENABLED(dev, pm);
+		ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+		if (ret < 0)
+			return ret;
+
+		priv->cache_sd_status = sd_ctrl_read32(host, CTL_SD_STATUS);
+	}
+
 	ret = pm_runtime_force_suspend(dev);
 	if (ret)
 		return ret;
@@ -1430,6 +1439,8 @@ int renesas_sdhi_resume(struct device *dev)
 	ret = pm_runtime_force_resume(dev);
 	if (ret)
 		reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
+	else if (priv->rdev)
+		sd_ctrl_write32(host, CTL_SD_STATUS, priv->cache_sd_status);
 
 	return ret;
 }
-- 
2.43.0


