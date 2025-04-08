Return-Path: <linux-renesas-soc+bounces-15593-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF29A81695
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 22:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5A651B68739
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 20:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FC462571A7;
	Tue,  8 Apr 2025 20:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZ68drxO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BC1256C68;
	Tue,  8 Apr 2025 20:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744142985; cv=none; b=lssQyha8bwdjjjUBDucC1H9zVnxU/DrulMDj+Tr1YrwX60h3FOpQn8xCmYm4PJcxDxoI2FS+mYgDVItEdeLh7EFRp1RHi1MzWVy/e9ANa6Fmha0hsKkooWVCQVtCnYLv79Ua6vi1hULYNzNUg8Zq5ge34C10P0lDYeb4rrKbzJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744142985; c=relaxed/simple;
	bh=p5jNvswfRJW/T3BDAgS1vWAuGSRF+lvbwNsZQ9zhVm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JrZ0qInubUMLfyN42ttwHxNpO7tVNbviktcZszJGhOSnURqJSxj1h+IkFbf/ODKnS0OFEWzi+f6Z9pLA/9mZqdiixev5DZR7Cjr9TclNfc5GsP9A3nfuUCeVm6H3sF9v5NATyqC5VU1Q6vi5ILh7/dLJ1pbYay+sMkscTfp0byg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZ68drxO; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso30306f8f.1;
        Tue, 08 Apr 2025 13:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744142982; x=1744747782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D5UKgKQvaXs6YrCZVC7gLgiEaU1R+CcaX0kl6BJO5kk=;
        b=gZ68drxOTkC6f42Pmk5dS4bLwsnz7knC35sHCh+tEMkuovDnkBvy0Nx0vGUaTvpBV8
         T92so0PgUfNMNWRbhrwI2vHCDDABnNIA6LoEt8bIjwtjlmZwh+7i1PjYia+faGINUC6R
         fGO0rXeY4UXJ4JKBZg4MG9GNLYfax779dZAiGd6fvBws4vIK5QWdI2luq2N+tzBlTPbw
         JxeETdMF7zvA3Z/7gD8HrLHI1shaPr4gfZYHN/0OGzDToargZMot6rypiA6NzNSaYrn0
         2AOp9kaxbjxQDwq/HBqNgirigHAP3LsbJlXEI2oL7N1Eb7aWspxUN0DI01RxyAR0tKpJ
         5xfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744142982; x=1744747782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D5UKgKQvaXs6YrCZVC7gLgiEaU1R+CcaX0kl6BJO5kk=;
        b=V42Bzpc0lm+oTIGF/SetjCnxakr7cXmAZ5O5kQg9J+K7y3LNHoBHeNFSBcycHSKXFD
         PS/rHucn2X1Y08afAAbM4TA96nCj3GAtT1Cmf86mwQZvotsvE4Sru5euFMAfKYGN+37f
         kOo76DQ0WnkSGdVIL8ydYUbdRl8mcxMWGxmkWRd8XAuElvambU31B+6+NZJfeObtDYYA
         mtmx1f2KrSDi0LNxkwJRZhW5ytyy2nf7Pg9ZJgg77QH7fbwOaJu4XT682452gOz4IVwY
         Tmf49OH/3OjRN5abFHzSBZsA9n5UQRTci5GC/WZThLQAz/SGVZ6eu0GZd3bIWXpPZGfL
         vZqA==
X-Forwarded-Encrypted: i=1; AJvYcCWZTUGHJyjIvgTlAJ49lGOWGmV6eMC1IkWIiL2+UDjB2olA6L08q1akk6QtJKSh19uuGnq+m2dipFJP@vger.kernel.org, AJvYcCWZa0LHfV59RL8lzZOW3IdM9V9hRSGxVT/0yED0iIdZS257sdw7VTQ4oaajHWKeZw6mKHz/d9Lbmhat@vger.kernel.org, AJvYcCXx7vPLoI7AHbsFKPLMbFkpqUggrspocKdXbrpqwUUmOR4tqwSSmZTQBIj68rtf/RAXkDAyFf5gvS2kY2eg@vger.kernel.org
X-Gm-Message-State: AOJu0YwkogLI1C9ENh4DBFIrZF2m+H1are0h7jtI7Uk50zrd+wA90ULR
	oltYqycuJf78RMWUR9I9SsWNvdQu6xLKh85hVAwQLBlGjRRQwg3V
X-Gm-Gg: ASbGncsgQvzL04viJ9JUjsjA7fp9sw0rpZVFaP69mXKAMEWr4WdmhCL0V8S0qEFkm7+
	DilHkiiOA8dpLt3TGPFUDk4N9f/LMc3L5toxrFRwbTFUxAGUNwwJdXTe7H+qBt5JHoFzOx7XCvC
	DeJmNDwWxHgIwRD8FqTAaL5fiZg0XJVbCOJgCzfBhNxhNtwtOCF9vw+JhaQNOYU7RUF/JCeABxz
	yHPLrp23Zkn/MIUsHAJsYMK5Dx6as0yU8IaOWSHYT2EnMsZl9vtSjeYHwCB4Fg4MvcFdeQQGIBd
	9DEf4j5X/JJRxNiWScpy5ZK8W+1OG8fFfua49gDs70iM4OVraLndMg4rV+6mUpN6F27O
X-Google-Smtp-Source: AGHT+IG7VxLPR9y5rEEZM8VlKr+o3RYut3+7teErCX9saj503WzjEEkkStiitVXuJWUJ2hjvjmD4+g==
X-Received: by 2002:a5d:6da2:0:b0:39c:1258:d12c with SMTP id ffacd0b85a97d-39d82110bb9mr3987088f8f.28.1744142981592;
        Tue, 08 Apr 2025 13:09:41 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:469:6216:b7f8:fc55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1795782sm174892875e9.26.2025.04.08.13.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 13:09:40 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 12/15] drm: renesas: rz-du: mipi_dsi: Add dphy_late_init() callback for RZ/V2H(P)
Date: Tue,  8 Apr 2025 21:09:09 +0100
Message-ID: <20250408200916.93793-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v1->v2:
- No changes
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index c8be7428c4d7..85f23a41911e 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -35,6 +35,7 @@ struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
 	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long long hsfreq_mhz);
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
 	hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_mhz, KILO);
 	/*
 	 * Global timings characteristic depends on high speed Clock Frequency
-- 
2.49.0


