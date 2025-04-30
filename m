Return-Path: <linux-renesas-soc+bounces-16546-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0813AA55EC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 22:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77F909C4C2D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 20:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D7D2D29C0;
	Wed, 30 Apr 2025 20:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RjL3vzR2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2412D26A9;
	Wed, 30 Apr 2025 20:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746045695; cv=none; b=mqmb8Ur+/ejzV6D/NtYice649VjJB7baPQlMvw3YJIdkyPorksqi27rWwjVf9dLh0F7Bbpl2+HZRKtPgo6QBqBffhyEfwUQPlwzi/LV5/9wSjwgIQ8fV7lczVG1Mxqc9p8VFB5PTbnLjA+QFOTgG+4n4BY6zbWmZcKI8moNs5fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746045695; c=relaxed/simple;
	bh=VV/pg8YLwFQnxxqs2siRxCPlNz4t70mLfHqgSUHDnUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BjBJb0Rv/rHoaSCquiwka9+vy7Gj3j0YzmV8e188fBJ9JE7wqd8YobLzUrKc3cMAfxIY7qmx7PnuUjXoki3u3mc3aAquBPW9EMar5ZSlA9uqzAFb/d6qsDifYkc+XQavtQanm7GBt3KNnxaOEeLQG581PLrIqC7M1al1Cws6O7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RjL3vzR2; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39bf44be22fso157071f8f.0;
        Wed, 30 Apr 2025 13:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746045692; x=1746650492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zs5IS+IIZjSL2dWZDqgTPqknuqZPmDccKzSPgZKtB/A=;
        b=RjL3vzR2rSrIQVniiW5RDLR/d3DCGoV0jMFPPAgf7ZnHRFGBlnngeFUnnNExSla3Pg
         6ToDUkwj6BFgRqFKDkGkHsM80FREREvapEtFMd1/Pt+Gk8Q3jl3yngYc1HUSpP98l4Vk
         +XuPsaY0Z8aeSVN6j9T9mKYcYROLEubiBSqCdr3wugbXMz0jyhz10Kko6U+L5alXzuhw
         DZqMIVhh47qFWBSgxYRMiA3JAvKpw81l0iWcvItSOS1a9jneQmxQvWeKZ4JaYOyPKlm2
         TTvGJM56X64Ee1LYR8XJ2ZnAUwgLlOttrCW/VM7GTwa7ZDDh/boujbSwSQDMsi4JKlZm
         xSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746045692; x=1746650492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zs5IS+IIZjSL2dWZDqgTPqknuqZPmDccKzSPgZKtB/A=;
        b=Xxt0UQj4z04IUs2LT2qN/TMcBPXIAEPdoXiwcTsv8kWDAtXWXa7mJW9v+zo1iCO3VL
         en38ppqcpkjlIcnMV5qwjNtJUT5c2ib0B9hHw2qbDNusS3086IMWDTDFDYugXkHuxD99
         AiALSg4dB3F88kR6aXyAO76L2SoZDppTynoyZWgysybWTy7+rZBloqgw2FPN6/KvsydZ
         trxhplQ9yLCF2JBO+XH4TYxYv4Gd/WbncWPBFgCqIc98Per5TqBbCz56lQIb6cwYsGHB
         cJz5hDm0RAe/+rZd8qNgb/ho2/ZcP00mcS/O4Qgan6Bpe2JBwj5mA3s8XSQ0uQsCuXtI
         B20w==
X-Forwarded-Encrypted: i=1; AJvYcCVYQtl0i3ZkPDD8qdHYrGq5p8GuaYolcMTvVYKLIpsZZd3wKdAYuBGPsB8Ce7JSmSfnCSxNTmKuJr1Z@vger.kernel.org, AJvYcCXjkM7fEywICNMmxhFQaVrjInmOCg2/DINwabcsjdOXxPbX+l9GV7Sevex7jpAcbbig/96fQz+nolWGffCj@vger.kernel.org, AJvYcCXraXaLSUbvZ6rOS248g7tlWi1bgq1XWo9JDpNKNuZtsuYr5zXuq9LudDmqg5AaYYyYqdKcKLoBo+RWk32YslpU5BI=@vger.kernel.org, AJvYcCXxOzyF97EnDWbKuUKbmJWIjewGLCg8tjolJy/CJhTBeJH/sIW2+4IvdS1SFYR/YoJchkfRQh8XvkAb@vger.kernel.org
X-Gm-Message-State: AOJu0YwQGXXwtY8/FBt0n0eLQCWIixQZ4INqQkiBWY4m5h5M/VqVpUCz
	oh1l2RQjsAnHQwymLXTTaPnFCPWB+PfMuFabWY8ZebbcSGbI+YC+
X-Gm-Gg: ASbGnctMaEBB5olNBeqsHOoPboERSwwABsQXej7RMX53mANIHY0WWAl/E21mK4zAc66
	cGGCBeRda/pxghMMg0nDQ+1kuk2/CA1e5BV1O6maHq+wg/hoysWRW3n9txhlndqTpu9luZ5VQZO
	ToO7gH8S+CT8z2pf7wweWetgOeWk9HpA79VzNuL8H5n3w7HTnV1FBZn/PdkCQhcgVg6Gto9NGOZ
	vFqcRdmX1Pf6oF2OeTDEjZ2YJ8zlpP+5VOYGNMxQ3yfGQ0qO+YYMzvbfnrf0m9xemCo/wNsaarM
	cac016LZBDt1s9yGY/XUWOlIUOG9cuKMRiwkZB2SpM3cQhDn6Xg+LGnC1vxYcCN2a9OpFJQCNEc
	=
X-Google-Smtp-Source: AGHT+IF6WostFapxQBw6ajNHWZp/i5PjEELly2sDADJ+hQXmv+3xRiGu0yOTdYUI6fnh+IIxhIZCmQ==
X-Received: by 2002:a05:6000:2287:b0:39c:1f10:ba54 with SMTP id ffacd0b85a97d-3a09303bbb3mr428578f8f.35.1746045692273;
        Wed, 30 Apr 2025 13:41:32 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c5ac:bf15:f358:81a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca56d5sm18098132f8f.32.2025.04.30.13.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 13:41:31 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 12/15] drm: renesas: rz-du: mipi_dsi: Add dphy_late_init() callback for RZ/V2H(P)
Date: Wed, 30 Apr 2025 21:41:09 +0100
Message-ID: <20250430204112.342123-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Introduce the `dphy_late_init` callback in `rzg2l_mipi_dsi_hw_info` to
allow additional D-PHY register configurations after enabling data and
clock lanes. This is required for the RZ/V2H(P) SoC but not for the
RZ/G2L SoC.

Modify `rzg2l_mipi_dsi_startup()` to invoke `dphy_late_init` if defined,
ensuring SoC-specific initialization is performed only when necessary.

This change prepares for RZ/V2H(P) SoC support while maintaining
compatibility with existing platforms.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- No changes

v2->v3:
- No changes

v1->v2:
- No changes
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 8c7384b95411..66eef39af35e 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -35,6 +35,7 @@ struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
 	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, u64 hsfreq_millihz);
+	void (*dphy_late_init)(struct rzg2l_mipi_dsi *dsi);
 	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
@@ -318,6 +319,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	txsetr = TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLEN;
 	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
 
+	if (dsi->info->dphy_late_init)
+		dsi->info->dphy_late_init(dsi);
+
 	hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
 	/*
 	 * Global timings characteristic depends on high speed Clock Frequency
-- 
2.49.0


