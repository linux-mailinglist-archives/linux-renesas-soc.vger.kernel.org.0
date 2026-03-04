Return-Path: <linux-renesas-soc+bounces-28768-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFeICCk5qGnHqwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28768-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 14:52:41 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 968BF200BFF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 14:52:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FEE43058082
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 13:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3C739FCB0;
	Wed,  4 Mar 2026 13:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJ6KYkTO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAF53054EB
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 13:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772632131; cv=none; b=l+bWF5EgGWCS3TKv0+IEprkqkCxLjVx/q9xbxc+wKS9cBZ8n4GiNIH0B5lDIxAPlNonmAa6QEMPrMYgbbfbyat5WjJDwMcAa5joGHfdZLIrUTpVN+yeyjx4LqygJA99aWnnpPM4mlw/rZJw8G621lB7hjZC/1IKXYVkiCAFwQnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772632131; c=relaxed/simple;
	bh=K9yAyQq7TVB5m2z7EEZuPp50xx9Dld0vnZ5yoZNf3K8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nV8YUeEEDRyZiS33tFOJMX19/pT9l/bDDrXljqKtlIBUGmnIYojg4FRqm5+/A4C6fFRNz5k0/bgV5t74CDvHWyy6lTY6/TpYjnYEF1zJL1b2dDUkDUGSPmUFjfiuEZzJ2g25SMe7IppZ2fW/ZKrqAHVWe/t3eHX2OqmOgoxmoww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VJ6KYkTO; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-482f454be5bso72198965e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 05:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772632129; x=1773236929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55t9FSDZQXeG7n+Yd3TCO52OZ2a8PizaEtr6ezSNM90=;
        b=VJ6KYkTO8OuqQ6dID7+9rZs0B9MrD6CoYQTorhBF1EZCoNSKtktrtbrmUGQRndpAhw
         pvqAmqevGniAmumCu+DciLgrWpDkllWhX1v6BV+Y5N0JHFcJHQo1wH2RohahnmhVx8QO
         5JkxUn8vt3/UCcEkWQpBZbQDAHxzwHcmXCPsQw3BSip6ygdiXz5C6BNuCt5gesG/Qmyy
         MFtESkAkiVhyaUOfPoKFecOx6PCFFcBtOLCVtj6K2Do812SED/wV2BSvHis9fSylMgn5
         YDrHOJQk4KG3Ierv+JB+13iCd3cp+iAYgCoUZmByHTNxKzMCBNgNmZZ3zrq9ZRnHp2Mo
         iAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772632129; x=1773236929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=55t9FSDZQXeG7n+Yd3TCO52OZ2a8PizaEtr6ezSNM90=;
        b=DtpRn76Mpbb2KzGCMjKc1dgOCI/i8ATAZIJmf5b/Pd8cYpdnA5BHOXlkaxRQ5yqzQl
         FKv4i/Gz6blM+/n4gv1p/bNJE8CVFOv6H0gxbe0M1F1cEsairRQrq/tSm2ftW3K623M9
         fuQuPCVkbUcyR4qbUDTdeNa7COHwCrSQjoXOawzH3EeBFiIh1caveX1fwv63qVFHzEvh
         CIMEIH0M7BKZKBuP3dMZVSOm9W9xICsMc6MeCa+T7bBNAXc7Hx8qN2seELL1XlcEn2fe
         9TV6vqVggdMCQaOBdiS0ADYS/GN8DdkXy7SNKvOKo3zBCZPS+pUHPpO9o+gHvMtJv2s0
         dmjg==
X-Forwarded-Encrypted: i=1; AJvYcCUUR59j/31BDAkSJWCbUZC8rsRpmqpzblRbVIAWRkPzRD2gwq7cNHuWpVRaubVRhZN9GpYtZxKXcrlpPfUcyb1ZBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVEEm2F5GOwTBOvTHl/E7yXOODC6QGKbVSz+Fae2hAi8LUya2L
	JSIoYxI9+JjJYZN47Gc87coZsmmj31F3HBw1PiKmPCdpD5joqm+nAWnP
X-Gm-Gg: ATEYQzzpep5WUwEuAyg3jw+lHetmNyaSDPARn6DJBONMVhb3b4Tf/FtUtjdnRH5SYKi
	X9+Y+TXN+meGkpbwuFbKOp5SfwhD1E6PCU/yYiVAgAHgmsE9eKzX5HGAmfy5bqHg+9ouxX/zm9b
	yhahet7dR0MslxFQBxSirVeibl++GPbGHnA1a8y+R7CSmounLaT5YuUJeSeKJ2UZS7L8e+RpJIX
	hu/UTUnsDic0aSuv1CED1uUUHPUh23GVrGtSPf5Kv1MeXOMD4Uqu1tfPVHkwfxgFqVCVbDb6cZB
	cpiAJAzYoid+HKUem9bHTJTGlYwrEhMSjMkZRmVcC2HZ/h4/zGKtx3ogK+C38AULTpcI3sBfAlt
	jkU0nmV9Z+o3HbjgqtF+7sLYOWiGXcE+GvIrx1nUuNR5KjBeor7h7aNoU1nBZ3GzX0Kw9lkmc/n
	gAJWCHmnGmCCPJGq8x2UA0TcHcMP0a7pU=
X-Received: by 2002:a05:600c:1383:b0:47e:e48f:43b5 with SMTP id 5b1f17b1804b1-48513eae55dmr110310985e9.18.1772632128767;
        Wed, 04 Mar 2026 05:48:48 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:de3f:f927:40ff:12a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439c65e0b23sm7105229f8f.32.2026.03.04.05.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:48:48 -0800 (PST)
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
Subject: [PATCH 2/4] drm/panfrost: Drop redundant optional clock checks in runtime PM
Date: Wed,  4 Mar 2026 13:48:37 +0000
Message-ID: <20260304134845.267030-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304134845.267030-1-biju.das.jz@bp.renesas.com>
References: <20260304134845.267030-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 968BF200BFF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28768-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[collabora.com,kernel.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[bp.renesas.com,lists.freedesktop.org,vger.kernel.org,glider.be,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The clk_enable() and clk_disable() APIs already handle NULL clock pointers
gracefully — clk_enable() returns 0 and clk_disable() returns immediately
when passed a NULL or optional clock. The explicit if (pfdev->bus_clock)
guards around these calls in the runtime suspend/resume paths are
therefore unnecessary. Remove them to simplify the code.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index dedc13e56631..01e702a0b2f0 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -429,11 +429,9 @@ static int panfrost_device_runtime_resume(struct device *dev)
 		if (ret)
 			goto err_clk;
 
-		if (pfdev->bus_clock) {
-			ret = clk_enable(pfdev->bus_clock);
-			if (ret)
-				goto err_bus_clk;
-		}
+		ret = clk_enable(pfdev->bus_clock);
+		if (ret)
+			goto err_bus_clk;
 	}
 
 	panfrost_device_reset(pfdev, true);
@@ -464,9 +462,7 @@ static int panfrost_device_runtime_suspend(struct device *dev)
 	panfrost_gpu_power_off(pfdev);
 
 	if (pfdev->comp->pm_features & BIT(GPU_PM_RT)) {
-		if (pfdev->bus_clock)
-			clk_disable(pfdev->bus_clock);
-
+		clk_disable(pfdev->bus_clock);
 		clk_disable(pfdev->clock);
 		reset_control_assert(pfdev->rstc);
 	}
-- 
2.43.0


