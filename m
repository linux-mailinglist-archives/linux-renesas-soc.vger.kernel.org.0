Return-Path: <linux-renesas-soc+bounces-17726-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D0EAC943B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 19:01:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 742181C2192F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 17:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38226239E73;
	Fri, 30 May 2025 16:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hn3AqFCy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4829B238C36;
	Fri, 30 May 2025 16:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748624366; cv=none; b=p6H10qmk09H6Q1HCDCbWoQIS1GjymipygqLPjzQ52p955YJRprNtHB/mtMXnb9vnsEFlvqg9fhKIDsPqg0YS1Rk+MWaFbk8dwnB5tk6fM0m458Xj/CwuUt0qA048BRYH1x3q8fVoxZpdQOkjA9jttxl5vwNBUdMMj+jgh7ux6xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748624366; c=relaxed/simple;
	bh=mR7jJwCkdaO9tiiFzSZ4K7TE7BfCp4QuufS8QmjGKXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HA9F+SUR6Ig4XTewf1mAaNwO8nSljrDEqbeJAjFJGeb7XaGsFfCMLCETAjxOMdWyFDXmke4dlvy7l9IxppkCrw3uMWs0CApuU35OwU1Q1gbS6KXSBfhFr2VUJMMAPRme9ARH4ooM9HpdLk1fIDTh4MDWMt5shZSu4J49Ps6rZt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hn3AqFCy; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-441ab63a415so24348915e9.3;
        Fri, 30 May 2025 09:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748624362; x=1749229162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOUnDZksgUPq4aY4rBL8aX+sFVS5jcV32pBW6xfenO8=;
        b=Hn3AqFCyHSSxNGbIlR46chrj52FpV4eKtmJHuoizq3sm4mpDNcuZ4y6+nzmN+CEzgu
         g0zTMynalNCflb7l0o2Cw5XcLYMSaV12NJ4gg0uDToxbCzV/Ui/M+zQzW/kV0pr0TJOW
         CiQH1y2H2frVGTHumcQgyPcf1psJUE6r17l2tCd1UwxVU8c3gjc6KiVK9rHHPcLguXUu
         YdBQTfU2sdV+WdnQE74i04UcGi+xHrHDjYyc9DlZE43JBh2WgTXrsGyEjcMqkYaVeuEv
         +BxSWO4PdPtTx48VhnigZ4klGw7l7XshG1Opwd2+v3pyod8xXr8nAnBtASxY3giPpiga
         TMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748624362; x=1749229162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UOUnDZksgUPq4aY4rBL8aX+sFVS5jcV32pBW6xfenO8=;
        b=NxWpJtIpanHaNvplNhar9P5JanvfObsseAJctZHq1EQ4L1cxx+aITJaOjsndV0uFys
         Z3y4067yl3Es80zeMBQRE+4/wZvQK0MF4pSIu6O0G5BYy+nSlqjO8/VWmeOFYsxczDbw
         jfUhscMzPWuyp40WXwynkSt1KnZbqAmX7oVyIuvoC/OG+r8lpNsHsVq9w3q2tvnT4ydF
         1Ni9R4qRo1obhLq0AJaRpW4pO7dmp3FnnMzkAVW3AEAocrk5LJgLwxomF6AU3G8F3Dbq
         PtRJotjfIwK+CjnWo/FNrtWdMXcdOd/Wz0ZwxsQsEvo5Sc15s6eRJsbTJ2FETnlxEfS4
         eOyg==
X-Forwarded-Encrypted: i=1; AJvYcCUxhBrz1M2HJXRhK69ccwea1LsyBE118CcxCcCbWHu0PZD002DHtTKV50iActU/1fb6PKIWFy7Fp67Z@vger.kernel.org, AJvYcCX2i+voPKm6KOP4z2yA0+vVi5HyIaAjFyKVgzPQXSXsQyCh5MkF7CWmcsFJXDhW9QVcWznfxjLVT8g0pMP/@vger.kernel.org, AJvYcCXVniMT3Z6IbWzyp5/XnXTOhKCoLOzEq/7v7+pziUxzOcYcQ3q+U7wJXUAE50dZaqXe5S4EYAoL4n8ckoy+PKcbvYw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNIJB1rTaTkY4Q3QVBV3NeoYYGbVYv0+gM9HcxKydNgFVIchcx
	YsB2WxhzoSVTdaH4rZrq9CHSQFQybHdC13qAyxxKP2w+jzvHowZ0dWdQ
X-Gm-Gg: ASbGnctPdIStYqF4fd3Um1+hk4bpxWk56gu4KzqiXdZOtY8ZKgIP44eP5Pz+g3sarSZ
	egjWYTLSulDTYk6q2LD9wv2QePbNXaS4If5P56WwFIHsfcblxbkaYV+qTTLjXOOkIGjU6BmCQJ1
	v41dH2pnbJ/mcMFYJByEsP1c1qbcC9My9qqsrzAIYdcf5xZynUMiqf76SHmXU6YM83qL2n82k/o
	p2OMxRbgB61IlsqxxJgIiOTFlK62d47/gVlmnUMQkpDEUAQGVTuNWJGQWxTSTG+qEbd/kjWa7ce
	kTvyRfpOOucqMIAkxwoySwcbw81lvYsMooM7FLRoIcRH0DZxAWl7Fs8ImkZLozXG0HDqCLBLOeq
	9JfUxaltlew==
X-Google-Smtp-Source: AGHT+IFzgn0QIVlghz5vyCIu/2/JW6FdsqCQ2bsc/449AIyFpCyM0aAnMLMWoMv9bJ4cXTfP+tlr6A==
X-Received: by 2002:a05:600c:524a:b0:450:cf01:7310 with SMTP id 5b1f17b1804b1-450d6515d10mr42199455e9.12.1748624362159;
        Fri, 30 May 2025 09:59:22 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f9efa3sm22733455e9.9.2025.05.30.09.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:59:21 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 09/12] drm: renesas: rz-du: mipi_dsi: Add feature flag for 16BPP support
Date: Fri, 30 May 2025 17:59:03 +0100
Message-ID: <20250530165906.411144-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Introduce the `RZ_MIPI_DSI_FEATURE_16BPP` flag in `rzg2l_mipi_dsi_hw_info`
to indicate support for 16BPP pixel formats. The RZ/V2H(P) SoC supports
16BPP, whereas this feature is missing on the RZ/G2L SoC.

Update the `mipi_dsi_host_attach()` function to check this flag before
allowing 16BPP formats. If the SoC does not support 16BPP, return an error
to prevent incorrect format selection.

This change enables finer-grained format support control for different
SoC variants.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v5->v6:
- Added Reviewed-by tag from Laurent

v4->v5:
- Updated RZ_MIPI_DSI_FEATURE_16BPP macro to use BIT(0)
- Added Reviewed tag from Biju

v3->v4:
- No changes

v2->v3:
- No changes

v1->v2:
- Renamed RZ_MIPI_DSI_FEATURE_16BPP
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index fd5d4551f39d..506b5503a725 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -28,6 +28,8 @@
 
 #include "rzg2l_mipi_dsi_regs.h"
 
+#define RZ_MIPI_DSI_FEATURE_16BPP	BIT(0)
+
 struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
@@ -37,6 +39,7 @@ struct rzg2l_mipi_dsi_hw_info {
 	u32 link_reg_offset;
 	unsigned long min_dclk;
 	unsigned long max_dclk;
+	u8 features;
 };
 
 struct rzg2l_mipi_dsi {
@@ -644,8 +647,16 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 
 	switch (mipi_dsi_pixel_format_to_bpp(device->format)) {
 	case 24:
+		break;
 	case 18:
 		break;
+	case 16:
+		if (!(dsi->info->features & RZ_MIPI_DSI_FEATURE_16BPP)) {
+			dev_err(dsi->dev, "Unsupported format 0x%04x\n",
+				device->format);
+			return -EINVAL;
+		}
+		break;
 	default:
 		dev_err(dsi->dev, "Unsupported format 0x%04x\n", device->format);
 		return -EINVAL;
-- 
2.49.0


