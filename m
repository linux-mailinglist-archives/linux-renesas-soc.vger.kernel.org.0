Return-Path: <linux-renesas-soc+bounces-30031-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJ2TCbx5vWmt9wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30031-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 17:45:48 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCBE2DDED0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 17:45:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0790F304B0FD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 16:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 523D23D3302;
	Fri, 20 Mar 2026 16:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbsNvtyR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4069F3D2FFD
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 16:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774024927; cv=none; b=fsvq9Hf0gZHe+GpAvsqWFf8sHMCs4ub4F7qZaqC0OnW0vXoCByr8QEwL0K7UedXtesOWvOV1cFnvdDhxglsGXGQd8+hMuZp3Z2T1BXZd+Z3oVkbHWHZaEbo2u/LwdgHQv4KIUFPp4bXLJZY5y3Zc1GGKrVibAgotutI1GMCd9cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774024927; c=relaxed/simple;
	bh=9gtEy4yg3z6hcSL+ls60gam+3XwsfImvBB3BuItXat4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R8IFZKUdEInFS6ha0tCpUWT9rKRoXPIPjRrLjW43TDwwqpl02+4REJaAB7HkMMylnHuh5g617psma9S9OSBK391hANwKfjOWnC3++QzH/Ujzzf7ZFFl2Ts/uqMAjcdffqnM26UTUEoiZ/rvVa51SXut9ZxtRTEd6FpHHmTDFe1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbsNvtyR; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so15900335e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 09:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774024923; x=1774629723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uiCTexBrx4dMD1Q5L1o5FxLTDC5BhBtXi4Vo6qoAUg=;
        b=nbsNvtyR8D7BAt65dZGDn0xVfoB4ce41z6vYFnH483goHgw2id3wkRdRMXjvffrfC+
         z2P2lJ5khkVdRfU8m5LeBs1IfG2+kCnMthKQ6BukA5IOLpvpak9qvCFR5hx6CnQEPGjW
         MVlxT64ggpgHw5tyut2IFtthTyGi2kKFiyUP2PIZLHOG4Hmf8k5rET0dQWE21dkHR1uq
         P9Jdr4S278BuRINXMKslDIyejhUvl/WX2jrYv+CLe6wW8y1fttqqqeYH/x65WxCh/zud
         53X2BzfyK8q9ohTZhzTtCf2JXeZumAooSdRQDuvRVwstDp8/l6D6J1Ssw3OdEJGl3sSw
         rZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774024923; x=1774629723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7uiCTexBrx4dMD1Q5L1o5FxLTDC5BhBtXi4Vo6qoAUg=;
        b=ZfHZKi6vtcOXuvab7b21RtVDWxCRq+lFURbXKa/urwBqF07lniNVYSuLGBVQT7zjZi
         1DVP0aGPsIiwz1Jaxk/m/nk/sc0dFfLGT//zUe3e1vx8TTO5IIRMaYlCpCMK1oGCRiio
         XBXq2N6+i927rIxg3n+2wkAlESpU8zmt1wXU7/o98DyqjTdNUaQw4+A2CrgGiqEHrjfq
         wOfypJGa3NaVnzx5KUP/fKHwqvtVnFcZmYPS/oH8tqhIFQAn3cquDMVaTjNcjME+ka58
         LvkWNVCtWXdF8jlNMOA50TTIgTO7lcjDxTR8Bqu4gm3in3E+CJ/ROQaoPjf6tngmSThB
         1gOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBmLwJrEIKr9YSeifrJviRfu7x/YhZMAcOsvfDX/i/7zINyxeqKhRvBAI9qtJK/rVXGCmaLBYWoxQu0xr6M0keFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQBl4V3jJKzDlRlbVQ4LwPQ0s+yerUhpkfz7zVVjym6gXNmZ5z
	P7JCBVcX5Yk2CvFwcC0ECyk1Nw1Xbt+X5VpQPOxFDlfByCmvWcU82S0B
X-Gm-Gg: ATEYQzyiQw0cBVPcKwWKdGIPtDCGtuzoXTnJ+eXNDjUH3pn8LmWsG1RPpAK6+WYHjs1
	PQ/OMpubEnp2Ec9RcE6GwXW/puC/Uahl597p8r1bVsCqOw1yK6Vhh6vr5nQ1lssMtJavDkQHxEv
	U2rExuTA8uoi9HKy1Un2RPVXKk0nY+FXEAV6AQAUAtxJjx/NvVD+Xmg4GWyYZXWj+lvVjMES+h5
	4rmeYwMemi/pTouXz0pYvHVCBmD+nfhyfb+xlKC5lLnYpBEDTJcCvMqzzx8elultmiaJMNBZ7CP
	HTBNREajE1jMLntcDHWItdW589AuLGNYCk0NBgSxOZ9JLiEXJ80vr64hq3RPtWjtjvtbp/QxfpX
	hkkCq3bJfCXuq0pwS5fGNZiIskO64PajidX86FNllmif7mCieWq53USIsg5//QpjvZHKZzUP8yR
	r6ju2ydA3DQ+puvD8nFXPX1MIkh7Dvqmw=
X-Received: by 2002:a05:600c:35c1:b0:485:3b50:fe54 with SMTP id 5b1f17b1804b1-486fedb2545mr63880305e9.11.1774024923408;
        Fri, 20 Mar 2026 09:42:03 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:5b93:d2b1:bc5c:9231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703650sm7016575f8f.20.2026.03.20.09.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 09:42:03 -0700 (PDT)
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
Subject: [PATCH v2 3/4] drm/panfrost: Add bus_ace optional clock support for RZ/G2L
Date: Fri, 20 Mar 2026 16:41:49 +0000
Message-ID: <20260320164158.487406-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320164158.487406-1-biju.das.jz@bp.renesas.com>
References: <20260320164158.487406-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30031-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.860];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,arm.com:email,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 5BCBE2DDED0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

On RZ/G2L SoCs, the GPU MMU requires a bus_ace clock to operate correctly.
Without it, unbind/bind cycles leave the GPU non-operational, manifesting
as an AS_ACTIVE bit stuck and a soft reset timeout falling back to hard
reset. Add bus_ace_clock as an optional clock, wiring it into init/fini,
and the runtime suspend/resume paths alongside the existing optional
bus_clock.

Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Dropped duplicate err assignment
 * Changed the format string of dev_err to "%d" and simplify the dev_err()
   line by using err rather than the same PTR_ERR().
 * Collected tag
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_device.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 01e702a0b2f0..7fed22d555a5 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -70,8 +70,21 @@ static int panfrost_clk_init(struct panfrost_device *pfdev)
 			goto disable_clock;
 	}
 
+	pfdev->bus_ace_clock = devm_clk_get_optional(pfdev->base.dev, "bus_ace");
+	if (IS_ERR(pfdev->bus_ace_clock)) {
+		err = PTR_ERR(pfdev->bus_ace_clock);
+		dev_err(pfdev->base.dev, "get bus_ace_clock failed %d\n", err);
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
 
@@ -80,6 +93,7 @@ static int panfrost_clk_init(struct panfrost_device *pfdev)
 
 static void panfrost_clk_fini(struct panfrost_device *pfdev)
 {
+	clk_disable_unprepare(pfdev->bus_ace_clock);
 	clk_disable_unprepare(pfdev->bus_clock);
 	clk_disable_unprepare(pfdev->clock);
 }
@@ -432,6 +446,10 @@ static int panfrost_device_runtime_resume(struct device *dev)
 		ret = clk_enable(pfdev->bus_clock);
 		if (ret)
 			goto err_bus_clk;
+
+		ret = clk_enable(pfdev->bus_ace_clock);
+		if (ret)
+			goto err_bus_ace_clk;
 	}
 
 	panfrost_device_reset(pfdev, true);
@@ -439,6 +457,9 @@ static int panfrost_device_runtime_resume(struct device *dev)
 
 	return 0;
 
+err_bus_ace_clk:
+	if (pfdev->comp->pm_features & BIT(GPU_PM_RT))
+		clk_disable(pfdev->bus_clock);
 err_bus_clk:
 	if (pfdev->comp->pm_features & BIT(GPU_PM_RT))
 		clk_disable(pfdev->clock);
@@ -462,6 +483,7 @@ static int panfrost_device_runtime_suspend(struct device *dev)
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


