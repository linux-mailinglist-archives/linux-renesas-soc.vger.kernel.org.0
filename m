Return-Path: <linux-renesas-soc+bounces-17727-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C324AC9440
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 19:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BFF950524D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 17:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095A22356C4;
	Fri, 30 May 2025 16:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0+Hy4As"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB281A2C11;
	Fri, 30 May 2025 16:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748624366; cv=none; b=kdw7fPSHbeLIv6vH74+1o82bfkl0ujDpSBKPUMX7eyomtUV5CmAUIUs+IT899zmtUNT3yNaEDZDxPjP+Y5unxoXPSFUCd/e4nTg1qXwMYpHaCxn+Mz5i4/1/zD2+0FS7QuRG4rSZ6Q7dTH4VQxcvfAdaxZrM8TDSK02NxLyTKyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748624366; c=relaxed/simple;
	bh=ZqTY3YA9TdVdGLWBdhnZUntqAWnz5rnlCo/g7iMCw2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gUl+8APzIDOkhbpvLOc/zuoimqAMdwtM65sYqX0QvotGi58z9x1mMVs9i1qJeMi4lJ8hFIFKq9cFQBFc+yoJT9u6+jHOk/gSUTN0PQ8CgagMfARXgGUerz+sopeBU9iHdiQ6qFBH5fjx99CqCg+piwojUyvR1xDekIWFZ9A9BJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0+Hy4As; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so23479905e9.1;
        Fri, 30 May 2025 09:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748624363; x=1749229163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Bsc1oUMW4VytILKq6eucAsxCxsFRVs9NwyCg9qybzg=;
        b=A0+Hy4AsJj83/EvCavF5JUryCnEMS5AMBG9lbIHRtlvPPLB5s6ocJ6lGxFl8Kwbxk5
         gjDQVMDVjU3ry9ZeQponIMSKcLJzIIxPkXfLsIKbXRCMQKM4DkflnwjXkW+Pdljmr08R
         rAZtXM20UnIzCqoMVvHaJO3n+VjrVE5mYYBwPzcCOlWcGpYCnfO2yC8L4TDIfP8jr7Qb
         91Cm9wBart3BGujpsR26F1Z0oyMnlCBSzyUzTZVAJOmOqeDyzN4DvyzK8aUyDroyTgHC
         w/ffKkxG0lcdPxF1h99nLsYCOSM0wLgAHgZBKDqJId0c09XPTKgn6H3Ba3UEdtdbcbkS
         0EbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748624363; x=1749229163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Bsc1oUMW4VytILKq6eucAsxCxsFRVs9NwyCg9qybzg=;
        b=kuFhM3Y9fFrZWsAe+/8vdWDjd1y2rVGrApHSv1jf27MQY2zP9xgz4qGAIYT3eO8FmP
         NinEKqdZ97fuAh6ISxzVsLV1rxO6/AYz76OSEhc4p5kttOYeO9CqVnJg81/XSVpaKB7O
         o1UN5gBuNod7In0ee440bAVV1md4GGC2OCV3WOE6o7o9QclUo36Ews58kRd+7zuUj54k
         h3fJl+yhEABcYQNjfnXH5Gc5Z0FuCsoiXJebFFAl/mxQR/FkYMW9Jsk1uNUe7Lezm2K2
         ZE97LiYKquyLczLqMUjtNi8iaebIcJst7cur0Vs6EseJgyKUNBsfSLfvfN3rCFloGRLK
         e6LQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+NasdRlSqb6xMDb0TzDyZnslxVF4LCrtOU07p4RTUvjmUbOyhI58MOK8sQ5Ll7R0DptX4vZLZ6LeuuyWj@vger.kernel.org, AJvYcCXd8X4qZsm5g9lKnQ0xzsFWZqCT8r0tEAJxPohn1hgRmIaoIa0j7b9HluvRAkzJiHYBndVPFaK0dnca@vger.kernel.org, AJvYcCXqc/TaJyuypJKNRJ3JsVhhG4e1yTnxtQrUpDhZfMeSbt3y4psbd/14o2rc+KGYYFFHt+bP7HU0uB5kCJGnG5RISc4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yykvmg2VDm9OKvLuhh9hXgdBjgxr+QKjeDt4Z/4sQPpuyseTauv
	D2Ax/HCE5tMFDyZ/QCXugLDoGV95i0nSUK2i3s6VbZsJ2twuOHIXlNlt
X-Gm-Gg: ASbGncugaBYjwmv6OK1gMxCxWcnUl69B1AWQ8NrkBtlugctMmehqF1RmcilrN8EoUrs
	tcg0K3A2I4ihmdhwuN960jdQRbTrbPXrrYfFpUkYI22MmCOp9XlkYRoeYSX4oKYFD1SE6224qQV
	O9lYJ3ZKsfWDx/F8BWrAvZ496YETKbxJW+rFJKmCCFLDuyYv+DLBEphrnUmLGgwjirFpNuIAPA/
	Xv8ETPWdiyqbK9n0buMoSQJc3wEeZZdrtrsJICtZw9fmd5FQ19MZUoLVBDBPSQAFrbqZvKIJOkQ
	OOu0K4pX77tAmZ6RIoEbnQWfzl4gc0dKIKN+zQX4Uqk7UfrVUxlCHzWlV4caYMGsjc9WMTDgHTM
	nddXeXkGesUOYbtozxwwd
X-Google-Smtp-Source: AGHT+IHX1pqPaNodbBcNM0xGNtsM6i9wiutFQO6+/zneQQbRJcqE/FktY/zMJOvdCcgJNOK4kMrYDQ==
X-Received: by 2002:a05:600c:620f:b0:442:e9eb:cba2 with SMTP id 5b1f17b1804b1-450d6452cadmr53521755e9.0.1748624363359;
        Fri, 30 May 2025 09:59:23 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f9efa3sm22733455e9.9.2025.05.30.09.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:59:22 -0700 (PDT)
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
Subject: [PATCH v6 10/12] drm: renesas: rz-du: mipi_dsi: Add dphy_late_init() callback for RZ/V2H(P)
Date: Fri, 30 May 2025 17:59:04 +0100
Message-ID: <20250530165906.411144-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v5->v6:
- Renamed dphy_late_init to dphy_startup_late_init
- Added Reviewed-by tag from Laurent

v4->v5:
- Added Reviewed tag from Biju

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
index 506b5503a725..ebbc6ac45484 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -34,6 +34,7 @@ struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
 	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, u64 hsfreq_millihz);
+	void (*dphy_startup_late_init)(struct rzg2l_mipi_dsi *dsi);
 	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
@@ -320,6 +321,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	txsetr = TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLEN;
 	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
 
+	if (dsi->info->dphy_startup_late_init)
+		dsi->info->dphy_startup_late_init(dsi);
+
 	hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
 	/*
 	 * Global timings characteristic depends on high speed Clock Frequency
-- 
2.49.0


