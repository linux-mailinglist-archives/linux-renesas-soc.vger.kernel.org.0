Return-Path: <linux-renesas-soc+bounces-16169-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FBFA93DE4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 20:49:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 753D67B20B4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 18:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 520AA254864;
	Fri, 18 Apr 2025 18:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpCI0AJ7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8355A253B68;
	Fri, 18 Apr 2025 18:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745002047; cv=none; b=XX4Gzr6XO3zK+8OrLvDSe8gYIcyQN14zx8lvyr1eSbO1+v83dn311ilKmqYA5HXRt/Je6vscIsqtHYbJdJhfzN7BUAnsqkM18A4xLXYlzvJPcDUXwFgc0qKHjc68LbOMCXwrIgLGVOk3B6p0edKVIqmVTn4QI01jdQedMwOStXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745002047; c=relaxed/simple;
	bh=lyFec7VEav4r4knMExS+Nv4lUFwooyq8ord6lL5QQF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fDNJvCgCbS+YBlTUE1YaZY0NKS/ydb9K0n3/uBVdZpJm9kniJW43J4TbblAHuFEwgXUmpwZeSb3LFVnySRkVPCxAfjbe3W3v18IvAGeVAU9BcH9wLMdRfEr04IA+wzPKQHNw5xXrqOVwLCWJPZFn5Y7ZwDTdBakk0RKY/PwMJMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lpCI0AJ7; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso1327804f8f.2;
        Fri, 18 Apr 2025 11:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745002044; x=1745606844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5oOkopbDuQL0Q5zhCrtOHmIDTJa5SEh2Wc6sSfhmJY=;
        b=lpCI0AJ7gBju3Klx+ef0ompPtmnoOW8vW4pEz8BMHcg/ifwU7WQxXbdv2QvfPFzYW1
         UT10W2VWWElkcBy4VxdbTKmuRe/SUCnd8uZxtUu7M65jg0r7neUMQsRtk6F0+op089wU
         7W4/ifSg9VLIfUAdOLQpkk0RNnx/NHa3n4P/jzGpqv0N8mQa8vleysH7miwqt3P7qQ0b
         kAUZ8Khu1R5gbYAPCs5kwl2xNZ1rcZjYqnGDql/yvfnLb+HKh4GjGGOWpnRWphI0sbBZ
         7Hd7+5Kr++XgvLlR0psJKd+A/Ev9ivdTh0k132JUZZbFdlp8qb2sxJhfjPaRhYcVE+m3
         2tSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745002044; x=1745606844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E5oOkopbDuQL0Q5zhCrtOHmIDTJa5SEh2Wc6sSfhmJY=;
        b=XIodaRPXxN0D3VgVfhAKTgI1Of0OpJD8pM9fuhcsxXtQFYM06Y+UgbQMv5WgJt8wC8
         tYXaskXJnHXQ3EWUsQacV+hTi/GkSE8c/OBVcITjcGzPUM77ng8TsQTYTYJjeY6iLUb7
         4SixiI5gST7FQSzWxCVj6q1Ovhvm8ruN0peFiYQ/tdzNSbIzNlHg1/OTp1WvRL3S2UiG
         Ku0gshicgT9GDW787LrCUilarGkpEBfUdhj2owL4ZKiP99U7W3+e6BQ9Ja4zbKtJo3VB
         4k7DJ5XJwbhEDzMB/Y6nfKs8Tvz3GfJHg45tPKlw+OvXLPPjz1YESAM5BMTgsqOYsBf8
         RbTg==
X-Forwarded-Encrypted: i=1; AJvYcCUlknxdjTKdICrniXAunXHsT5l3SlVP7+YiJ1RL1Ag6jgQg9Mpatnn96ZWmqI/B1prCYs70z1uZvLBLePXTArB8zdo=@vger.kernel.org, AJvYcCW1YQDK11/WFtC4tT7CCGcSn8fDSvtg8A+8CU1EnuhPEQinto6QSMXd/IX0YuPHqK8OJcVSvqJbPogD@vger.kernel.org, AJvYcCWrX2zZ1jdpjhHUlUD8dXrvhyLUNPUf0oGuVq5OlXWcgnQq1YcWDbDpOahA68zC5rSgOpmFBONxor5d8Vjk@vger.kernel.org, AJvYcCXIADsl5UgyrRlmKbZawMgbuxJU4WcgB2bXilqN3oVWpTqgQuaXQyq7una5vT9DSeJv99ysNcBlQKzN@vger.kernel.org
X-Gm-Message-State: AOJu0YxCWsmmwtkGiMWS00y6Pauc3ZCbP63ARmQ43lIWAdv3g0NOD1zY
	G4vTDncwt9X44Ox1LFQfxlCyMfomAlEuz32LVVEoZe167pshB/Q4
X-Gm-Gg: ASbGncsrcEKYOUzVYiN6xp9uyA4PUJMHWOjuZ1D8FGxYtipA0hNqdvNAextY6DZWoyH
	0uo/dLI6BTwCv9qMXedwK7jyzBJVKbyGjdff7VezVJtRlkmgUgYwkeN0eKO9mmVw8KoQDTPVnxR
	Uk249qLCg+Y3lYLJjiOFJNkkekXjrRlks6K+ZtDvYPgjQvvnfDWJLjuBkFlHbC4/i+d6tENPuFE
	Wn+ryJ8MOXebi3HcJO5psp94EiXoQ4yxir6+/xJAFMKjHwf8A+VM8/rE3nSuuAT0wCPr8NPVBbi
	HmTsgpf9ei8HG84tbiI7fsJM2NlpFRdihARmXst1bpVuqnUZ0YUcXJnGrTibh80M7w==
X-Google-Smtp-Source: AGHT+IGHbgal7IkFtfaM44VjgqN2XQ4CCC4mcvJ6+3sPEawAA3aXDEpE+v2hXgdqx5APUkTFPwXdEA==
X-Received: by 2002:a05:6000:2510:b0:390:f2f1:2a17 with SMTP id ffacd0b85a97d-39efbaf14c5mr3101088f8f.53.1745002043805;
        Fri, 18 Apr 2025 11:47:23 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:36cb:c641:13d7:bd3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4931b8sm3404336f8f.80.2025.04.18.11.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 11:47:22 -0700 (PDT)
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
Subject: [PATCH v3 12/15] drm: renesas: rz-du: mipi_dsi: Add dphy_late_init() callback for RZ/V2H(P)
Date: Fri, 18 Apr 2025 19:46:55 +0100
Message-ID: <20250418184658.456398-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418184658.456398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250418184658.456398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v2->v3:
- No changes

v1->v2:
- No changes
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 36b8ef95f20b..c3bd3b21dd15 100644
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
 	hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, KILO);
 	/*
 	 * Global timings characteristic depends on high speed Clock Frequency
-- 
2.49.0


