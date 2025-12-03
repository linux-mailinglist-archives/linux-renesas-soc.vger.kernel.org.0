Return-Path: <linux-renesas-soc+bounces-25534-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DFCC9F05D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Dec 2025 13:51:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D51383A4D4B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Dec 2025 12:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E38D7FBAC;
	Wed,  3 Dec 2025 12:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4fNf2Z8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B779578F2F
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Dec 2025 12:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764766270; cv=none; b=eG9kWR/rDGMzT17W2WCOOW7TkvuNRUjhF935OUYvCeOSJlzeWy4O3p5/cQunYtJZABCnog8434sYF4DjabeiMh3EDfLNNBu/D3pEMc3j1K1PItPxqfGMrJD750Mmn4smM7symKOi+ubAauUrgYj3jS86FBGW4/9xKhPsx7N22pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764766270; c=relaxed/simple;
	bh=GW8h/c235Is3/EoOIqedLCuqc+CS8/UGyWUOhUeT2kk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bkpcR8REq+Y3uoQcQcoQ7CDkoxt2B6wezU0O1FXpbsMRGhMkIQrgbfMxmK0rDuhsieaWpmT+DPEzZ8Lo3LCJ9KpK0q2WSBUmsdfIJMj7W0DlKkbUvLUwDofQR6D6A/q32GS4QN6fGjy9JSOCf3Ro464Q91zpkdNBSZEaRPkaoAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X4fNf2Z8; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso62242385e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Dec 2025 04:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764766267; x=1765371067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YCzEMZqIE6VK/l17z+67juAL4QIkZUzs5waT5RdKcHs=;
        b=X4fNf2Z8jWCf9TNjGXuEWePjkntj7mjPptA8H8dRJTi7YoqAzqpruwmRNXyKZyeLyc
         1eUxlC170iMmsNEnN65edSxjVw2oaMmilin7usZKXCcUF8MtlgTsXrBu1Ta/R1XPfl1X
         IY4wb6EFbzS8njSZE08IOm0gczsyYQhLGmoAz6Su80vn340QAjYnPvH7sWeyjHL+2GZ7
         1UImOsenUG7pB8g2y/aRW37oMI3Z//dIVGIIjmTEJnbVhr2CMyRc0KzUdCl04u6gB1XD
         PJE3XpscOCYrzYW+DM81btIPTSavqYQ0ghmagBttbqMjCUcVL1bTV4BxCHS3vz6Mz/rB
         1DQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764766267; x=1765371067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCzEMZqIE6VK/l17z+67juAL4QIkZUzs5waT5RdKcHs=;
        b=VWbmMGrsN9m969mWcEqu9gqhoxgqD3AMlZBorK0ULQXNMu5ni/LuAG10qc3T+qAUQ2
         ZE2xC/8QxFtV9uMSiRLB0AoLdXynWvtJZCh4UQSd1QEkJ3s+kgBpF3dwQdZRjazsG6S6
         1qods1EkyrDlGzOQ/+0DVogVXM1wMZW1Ri6GSytWGvMjjuJFR6Hj41go7ziNQ3/8duc4
         1k7Zetr40BbxqECvAmBoZlj7jqrV3QnDJY9j37IwvBlGWKGZYXog3Pj0V0F1SO4mdh2K
         gLu2bCb7NEluvQsUTTJ7NXF67WWG6QKJz2C980EF9BScVmi0O2UsTczRydmG+FyAJJoO
         BWoA==
X-Forwarded-Encrypted: i=1; AJvYcCXmF95v2uMqjz/TcImuy1mW5xh4ypwfKu5aPOo0cfVb3OwjRQC1TTSzL/dd/CvlGULhmF4RxJusVW5X0spBDfSYsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhXQfkm1DnQb/VeE/DSW11bqspjaw7/kXTMT1rViPjHUYydREP
	7gML6FFRa7vWknilc29dtZdfyT/4emkibizzpKjtieVMkMGOgBmAOLS3
X-Gm-Gg: ASbGncvlrb7Xoz3Xi3O6ThScD5WKLUsUz481/EDS8IE2xPVjz7wr/hzkbS4iHUKo14x
	rS0sW6Ob9zRzRH3sZMSA1vByBXKfCS4PNozmKu436Rc65HEQeXK4P3bpO3VZjbT9Snpr+ifDJ1N
	KwTkuGGRWu4De09JD9c5Byd9zhUbg5ikhZ2A3FLb2ATFpTYuWcr4+JZdKrVU5AuJjhWh9aExpcx
	5x/lXlxR3Tf/XbfytqjGk8vGRzXTX+jjed2dSp0SKMz39IoGFoeGPIzld2a3t3pGT+6tYLAHuEv
	tEKwz4vNPZHfCc7OiUfFlCcDMyXwVLZoDkKwRZa8kFG9spNIH+moWCnYs7PShWGTMxpsJfEs0Il
	voRNVJnwtufL2ZQFlv+pq7dB5LXx8qi9ut+lpQIX8hIwS7TDIUhZErIaU9zP4xbuBLAf3GpSgTz
	mcuUYdrwc+E2EKXxNduRlKmhHYIDTvcq11Jd19J9n4ebenh8JQ2MoMgij7YzKnkhwofroE0eFZy
	6s=
X-Google-Smtp-Source: AGHT+IHD/zjKzRKH5eirr7x2/CUknGJg4LSn2AKabfK6OTVG6+bpUp20UCdcJb9nbkTrsFpVkoSKNQ==
X-Received: by 2002:a05:600c:4f54:b0:477:6d96:b3ca with SMTP id 5b1f17b1804b1-4792aedf781mr21716185e9.5.1764766266787;
        Wed, 03 Dec 2025 04:51:06 -0800 (PST)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a7975c8sm52651595e9.1.2025.12.03.04.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 04:51:06 -0800 (PST)
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
	Simona Vetter <simona@ffwll.ch>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] drm/panfrost: Add GPU_PM_RT support for RZ/G3E SoC
Date: Wed,  3 Dec 2025 12:51:01 +0000
Message-ID: <20251203125104.67596-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G3E SoC is embedded with Mali-G52 GPU system. The system hangs after
STR in the following condition:

STR -> Wakeup from STR -> Unload panfrost using 'modprobe -r panfrost'.

Fix this issue by asserting/deasserting the reset during suspend/resume.
Rename the variable allwinner_h616_data->default_pm_rt_data for data
reuse and make it as generic GPU PM runtime data.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 7d8c7c337606..e553f183c780 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -976,7 +976,7 @@ static const struct panfrost_compatible default_data = {
 	.pm_domain_names = NULL,
 };
 
-static const struct panfrost_compatible allwinner_h616_data = {
+static const struct panfrost_compatible default_pm_rt_data = {
 	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
 	.supply_names = default_supplies,
 	.num_pm_domains = 1,
@@ -1056,6 +1056,7 @@ static const struct of_device_id dt_match[] = {
 	  .data = &amlogic_data, },
 	{ .compatible = "amlogic,meson-g12a-mali",
 	  .data = &amlogic_data, },
+	{ .compatible = "renesas,r9a09g047-mali", .data = &default_pm_rt_data },
 	{ .compatible = "arm,mali-t604", .data = &default_data, },
 	{ .compatible = "arm,mali-t624", .data = &default_data, },
 	{ .compatible = "arm,mali-t628", .data = &default_data, },
@@ -1073,7 +1074,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "mediatek,mt8188-mali", .data = &mediatek_mt8188_data },
 	{ .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
 	{ .compatible = "mediatek,mt8370-mali", .data = &mediatek_mt8370_data },
-	{ .compatible = "allwinner,sun50i-h616-mali", .data = &allwinner_h616_data },
+	{ .compatible = "allwinner,sun50i-h616-mali", .data = &default_pm_rt_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.43.0


