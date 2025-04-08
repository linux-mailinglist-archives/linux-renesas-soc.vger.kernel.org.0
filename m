Return-Path: <linux-renesas-soc+bounces-15588-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 645FBA8167D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 22:12:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86B8D468909
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 20:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CAE925525E;
	Tue,  8 Apr 2025 20:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YI8mT+Zj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B5D2550B3;
	Tue,  8 Apr 2025 20:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744142978; cv=none; b=lWpZ0TEt8i6TyuGEEulAaIzU0L9Ho7k7uP2z1xRQ33x+f3TJYRuOrwbfcqi2ju8JTyVWt/CMLBvu21ZLrG4DZOzysMonx/rZJJaBW029S5JB3H7+AlKWdeEdStm/WEQPUAmZQEJvioFTlerwQvjrPzA4tmAXf+OYRBBvuOnFrtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744142978; c=relaxed/simple;
	bh=2fmSpNpzAaiI2oOpQEJVpcUTIVaImTqzXtO3vIIHOfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lv/F7EU00AO6K5URt3hMUBLDI//2VuCnMuI232dK58fd3vGx42hDpJQj3pk4+5fn+mWjIarPApwoNrI/xWK0o9q3QXy8NishxGZdytpBA4aEVf1W39QUlq/uBRaV5jmnfxTpHu/ehJXs5236oaFn3ffMQAtijgsKXeT//SGnN3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YI8mT+Zj; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so4854999f8f.2;
        Tue, 08 Apr 2025 13:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744142975; x=1744747775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BjfSn9N6RQVpYgp6fQpeVrb0usOOkYUcuyyG0yCbaw=;
        b=YI8mT+ZjiiIpZzoL52kz2B4hkavh66JPYC6AyGXOaG8bskoAXdb6o/5/vuM/Wwy6xh
         o1flSe/00rpevthIS7lkrfwwAd0tvtk4fjcThxzdeUGWgOJIroiF57XWLJ8V9zJiTY2C
         ecU6V3dBoCAjKKDlKCF3OcQrZ72y0IYJNjlVA6+rpEr1I3QTENPnfcNd69sFes48n8EG
         3LXQdrnxr6I93VSPyOsBQIJ1bzmVxjzN0ln93Y2TeG4r3Ve5DEbJ/V3eHo5VwN5frchr
         HdFkoj5N/q2eyeGBtXxWcLSvqC+vbjC5q5xCijDbKZg0MCnwoPkXHsvqsX9+ry5dP0HM
         P/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744142975; x=1744747775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5BjfSn9N6RQVpYgp6fQpeVrb0usOOkYUcuyyG0yCbaw=;
        b=VXJQi/ZPqBlVlxOgyGXJ5lBmnyViSv0YdOnroTXsT7fPUn6vNIoWG/Huq7uFxxiVju
         xsE5rSPdllbAfk5qpDzTDD/K6JNfrIdJg7EOP3BL/IF48m6odSJytxQDrTAoJA9qznFV
         nk/4JgzkaGN2OfUemyLuuvGtNYocClTmC5g8t3KzaMvIdhdY3zMPz9Za5wcYp3zjfaIG
         z2UxeY0TXlNcxll71F2ajd5Ks5fKoEBq8Dmf5grDRf9MSyeK4iWGfUJdeo5NVHvKnnIo
         OLtoGeo5W8syKQUmPWh57geFalbxYaidjDM4TBYXvWy6uyY2ryWXzmkpcTLI+xcLCcPp
         +HAg==
X-Forwarded-Encrypted: i=1; AJvYcCUFliZEiU9eWCyvP7iycd+eXaunSwlJFygu4QDo7U7VUVmzxqIiE/hH8W5uSqhpeaS44C8dZxNEChRy@vger.kernel.org, AJvYcCVkHGpdgd3VMgTfeBVMdusf0JGGvrNbDRYlsewTYDjvLYxqOgzcNRISKdNPdlUXObGkxQZH6hUJ2gKjV3a0@vger.kernel.org, AJvYcCWb3jbtbXBlG8IBLAhijKEZtohg71iRv8/k9dOL3K7/dMcTw0Pi4nTulZn5KzbHOs3f14rwQFBpa6Bt@vger.kernel.org
X-Gm-Message-State: AOJu0YzYwjVXf8XEAB5bcW1EBWGqv/UVqsBodJ5CURxBvbQf0va8hg6U
	u1VqTnwMXmWgkNapfSLbwHmtkf3uiyOYSaNwF1k3HwacJodIbHp4
X-Gm-Gg: ASbGncuil2r1bbtW9lRyv4xl3mF3OzvG2Sgu0LaSYntV3gTY7cjAMuJXkHroWPi7UxX
	rRo+ua4/E9Hy3U3COYHP6A7RvjVNq1BQqaSU15fR7jDocpGMttZJaFRSCRyTOP6M20OikSpaq0J
	h5LHltrOwjKGFO+b8Eont/GTLyTzk5DcEA96sqLh5rEm+Ul+S4tzOCTg7l7+S22CwGtYPdzHHZm
	j5NWS4dWwBK3glYXVjjNd1pmgWkT3ZmgdHbRXAVYd7Mu0Y+PladQOrkU3edUF8BiJE/XPmbcD+g
	hUe5SN0J3lo7Z94CoEeuJ4Fq9dH22oxwF9okRgSqXIZx6UjnCQ8PTik7Nzo7W3jHOMU3
X-Google-Smtp-Source: AGHT+IE/Px9q/kAEOD2BPdHS4hzgkycMZH57pyQsRNhrFngDQ0eqtEF3I1QiINBxonjKOIPeG6qwwQ==
X-Received: by 2002:a05:6000:40da:b0:38f:4acd:975c with SMTP id ffacd0b85a97d-39d87aba7b4mr371058f8f.27.1744142974670;
        Tue, 08 Apr 2025 13:09:34 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:469:6216:b7f8:fc55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1795782sm174892875e9.26.2025.04.08.13.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 13:09:33 -0700 (PDT)
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
Subject: [PATCH v2 07/15] drm: renesas: rz-du: mipi_dsi: Simplify HSFREQ calculation
Date: Tue,  8 Apr 2025 21:09:04 +0100
Message-ID: <20250408200916.93793-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Simplify the high-speed clock frequency (HSFREQ) calculation by removing
the redundant multiplication and division by 8. The updated equation:

    hsfreq = (mode->clock * bpp) / (dsi->lanes);

produces the same result while improving readability and clarity.

Additionally, update the comment to clarify the relationship between HS
clock bit frequency, HS byte clock frequency, and HSFREQ.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
- Added Reviewed-by tag from Biju
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index ec8baecb9ba5..c5f698cd74f1 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -277,10 +277,10 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	 *       hsclk: DSI HS Byte clock frequency (Hz)
 	 *       lanes: number of data lanes
 	 *
-	 * hsclk(bit) = hsclk(byte) * 8
+	 * hsclk(bit) = hsclk(byte) * 8 = hsfreq
 	 */
 	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
-	hsfreq = (mode->clock * bpp * 8) / (8 * dsi->lanes);
+	hsfreq = (mode->clock * bpp) / dsi->lanes;
 
 	ret = pm_runtime_resume_and_get(dsi->dev);
 	if (ret < 0)
-- 
2.49.0


