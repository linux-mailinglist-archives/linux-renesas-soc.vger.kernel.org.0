Return-Path: <linux-renesas-soc+bounces-28770-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Hq8JE44qGkTqgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28770-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 14:49:02 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5BD200B09
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 14:49:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B0DE30233DB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 13:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D1D3176EE;
	Wed,  4 Mar 2026 13:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I52LbPs9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F3E31813A
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 13:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772632132; cv=none; b=ZNK/pJhOytZK3LELp9JDjYZ3L1H21PeLSE9u2D81pQ9ie0SxyW75jmTElaUARwVNrO6fgOx9gaCVf8z/WovwamGSHW/uJtQF6+gawDxz0lAtbvgwK8StKKl3mq65xUZQEBXUHMKNg/rt0tQMZ/yH/TO5SmX2yAEoNW9Uvm+KD2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772632132; c=relaxed/simple;
	bh=ux98bloS626kMSKVxtpkB3CLg1ruIkfxSp1Jl98N3pg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vGkH88eEmzQP6xxXfR2v5j+0zwjjLazrYSCyaQgJ7fI+naV2YbaTBeOagISNuSjGYmf5Qlq9yphsvDIQZGes8h0hOfxsHpEQ855JbMfKo9WH/PsVqvLMr9QpbYWkYz7FOUBj3OX1NVoVgZdoTa+WadavTeIsMBt27J/Kz5sv9TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I52LbPs9; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439b9cf8cb5so2864319f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 05:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772632129; x=1773236929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QTTqK7TuaDqF+tP6hPwnkWAR5TFFHKJ4XYpEBPBHnmY=;
        b=I52LbPs9o/nLtRidKot+WLTW/QJMTzsGIjX1Zf2NF/HOpwsZDoy7hImJaGRwRJLAl9
         ZqIkPztioDh134FdBw7a0PECk3MQuSTwrdkIaWfHt95VbY9ONnMBKS6xoug4QaVsp8I5
         kfKyRHHljvUruYkpFMb9FNs+FEErnpq59kX90mddSsA2Pg0zyvLVGIxw3nsiK+IXS92Z
         47NxXc/S0avglvfgoTxNcB/mO61oeu9PzRKk8/6dOaDiuIHFn1A6s6jKUpTAQ4dE+pHY
         kyX5Z6k2VjvTODLfIdVfgCCIDtffTjE/egJNapXrb92sqcx/Xp9c6J56dp02fY83gzE8
         Ydvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772632129; x=1773236929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QTTqK7TuaDqF+tP6hPwnkWAR5TFFHKJ4XYpEBPBHnmY=;
        b=owCHIlJcnf2iwZe2VG2BIhE46qD8OH/ShnPzxCwXN6IjnQKhXVXfbovNUzzfVUeo8z
         gmJgNymKBgwdOgLGp6xb8ik78a5tWV0shZ8GMx4sInfRuya+ahxwnZyKiSkTGVpuSxuR
         9MCYpEJ4cdI5iv6wNLmuLXnQimmdtiNICYjm7LSDVnkDhPHxWQKURpSOghDCpS0Jr4Sn
         SckMpM8m7WNBZ+cAcjZoW50pkm0o2etKoHT4pz9XuveivzmaRZ4UYyJhRWn0l989zOMI
         fF5IH4bBlCvNtl2HlH7CRMqBTP6je68B4x0JCJamDJ+7vJnnF2qzP7yzHQSKNy27Kjdb
         Vnhw==
X-Forwarded-Encrypted: i=1; AJvYcCVg0cyy+R6aVAQU0qVg2M6VS75VfvG2iSRMzZ3WVYgNjiDZj/205+hZbqgC1KoCj12A/lSoKf1tB/g6h6HnusWGVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPeal23QBvZ4DLlyCUt8mnrdJpEwMpwL9g2Jgnzpgovo931C4k
	n9czyZ22B+bC7de+NSKH0AUeQTrAiW6utbHYJYoAKPlWqC9ttkTWkeQw
X-Gm-Gg: ATEYQzzy3LelMrX59D0HQIfEbiY853nMQEcI4LhRkmmluvEN28jB+yG0P2dUnb1lvj6
	d/cctZJAntB6WRpv30AoK3trJPYyh6OjbNAg3qtyAKt/EMYlnlZ9c6cfDmBhkHMj8NEaz5vvbjS
	JE5evG8GY1T+yuiwiXSwZceMNQN7Vp/NSzhj3DAMHF2OpuOydsXAl+1p4UyBO26hfnJZIfuu+rQ
	DLXBdL1pcw8OAZ7shRSKr4yWWjqk7Yn/rNcglbopQwfVuqqHzQi02KMjXDbNtWxUAmazYqC60Wg
	HzuOSU+lkwfliKBJNgBHHUXEm8T/l6s3jsuTPM4MCHSgEr+/Qjq6ClbTyMil+luGOpiyyfqOobY
	3h67OaUzc5UHmaMT9UXkd4H/qhUMKf4jdLFP136XcQS46crcKdTTTWoVFt5m7IaS03MvCpf1WMy
	Xso3ArajuvumOajrn5LyIsmyur5FMeG/E=
X-Received: by 2002:a05:6000:2891:b0:439:b3d2:3766 with SMTP id ffacd0b85a97d-439c7fae450mr3798988f8f.19.1772632129397;
        Wed, 04 Mar 2026 05:48:49 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:de3f:f927:40ff:12a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439c65e0b23sm7105229f8f.32.2026.03.04.05.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:48:49 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Steven Price <steven.price@arm.com>,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/4] drm/panfrost: Add bus_ace optional clock support for RZ/G2L
Date: Wed,  4 Mar 2026 13:48:38 +0000
Message-ID: <20260304134845.267030-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304134845.267030-1-biju.das.jz@bp.renesas.com>
References: <20260304134845.267030-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3F5BD200B09
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28770-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,lists.freedesktop.org,vger.kernel.org,glider.be,gmail.com];
	FREEMAIL_TO(0.00)[collabora.com,kernel.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

On RZ/G2L SoCs, the GPU MMU requires a bus_ace clock to operate correctly.
Without it, unbind/bind cycles leave the GPU non-operational, manifesting
as an AS_ACTIVE bit stuck and a soft reset timeout falling back to hard
reset. Add bus_ace_clock as an optional clock, wiring it into init/fini,
and the runtime suspend/resume paths alongside the existing optional
bus_clock.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 24 ++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_device.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 01e702a0b2f0..87dae0ed748a 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -70,8 +70,23 @@ static int panfrost_clk_init(struct panfrost_device *pfdev)
 			goto disable_clock;
 	}
 
+	pfdev->bus_ace_clock = devm_clk_get_optional(pfdev->base.dev, "bus_ace");
+	if (IS_ERR(pfdev->bus_ace_clock)) {
+		err = PTR_ERR(pfdev->bus_ace_clock);
+		dev_err(pfdev->base.dev, "get bus_ace_clock failed %ld\n",
+			PTR_ERR(pfdev->bus_ace_clock));
+		err = PTR_ERR(pfdev->bus_ace_clock);
+		goto disable_bus_clock;
+	}
+
+	err = clk_prepare_enable(pfdev->bus_ace_clock);
+	if (err)
+		goto disable_bus_clock;
+
 	return 0;
 
+disable_bus_clock:
+	clk_disable_unprepare(pfdev->bus_clock);
 disable_clock:
 	clk_disable_unprepare(pfdev->clock);
 
@@ -80,6 +95,7 @@ static int panfrost_clk_init(struct panfrost_device *pfdev)
 
 static void panfrost_clk_fini(struct panfrost_device *pfdev)
 {
+	clk_disable_unprepare(pfdev->bus_ace_clock);
 	clk_disable_unprepare(pfdev->bus_clock);
 	clk_disable_unprepare(pfdev->clock);
 }
@@ -432,6 +448,10 @@ static int panfrost_device_runtime_resume(struct device *dev)
 		ret = clk_enable(pfdev->bus_clock);
 		if (ret)
 			goto err_bus_clk;
+
+		ret = clk_enable(pfdev->bus_ace_clock);
+		if (ret)
+			goto err_bus_ace_clk;
 	}
 
 	panfrost_device_reset(pfdev, true);
@@ -439,6 +459,9 @@ static int panfrost_device_runtime_resume(struct device *dev)
 
 	return 0;
 
+err_bus_ace_clk:
+	if (pfdev->comp->pm_features & BIT(GPU_PM_RT))
+		clk_disable(pfdev->bus_clock);
 err_bus_clk:
 	if (pfdev->comp->pm_features & BIT(GPU_PM_RT))
 		clk_disable(pfdev->clock);
@@ -462,6 +485,7 @@ static int panfrost_device_runtime_suspend(struct device *dev)
 	panfrost_gpu_power_off(pfdev);
 
 	if (pfdev->comp->pm_features & BIT(GPU_PM_RT)) {
+		clk_disable(pfdev->bus_ace_clock);
 		clk_disable(pfdev->bus_clock);
 		clk_disable(pfdev->clock);
 		reset_control_assert(pfdev->rstc);
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 0f3992412205..ec55c136b1b6 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -136,6 +136,7 @@ struct panfrost_device {
 	void __iomem *iomem;
 	struct clk *clock;
 	struct clk *bus_clock;
+	struct clk *bus_ace_clock;
 	struct regulator_bulk_data *regulators;
 	struct reset_control *rstc;
 	/* pm_domains for devices with more than one. */
-- 
2.43.0


