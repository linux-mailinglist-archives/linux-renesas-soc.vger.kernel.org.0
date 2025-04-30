Return-Path: <linux-renesas-soc+bounces-16541-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A392BAA55D8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 22:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71D471C232CE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 20:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A6822D1129;
	Wed, 30 Apr 2025 20:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CG7hUE9g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC712D0ACA;
	Wed, 30 Apr 2025 20:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746045689; cv=none; b=ClNvOWuMsKkFu11oNH4BI9t92x0AlAcZyP+y6jA3GSNbhCQ9xKc0U45S7AbA/7fFN8KetGQ74ZtB/wT9+RD6Lte3hHNz6kh8yeGfY0PAmZqHCg6Xz4/dLLBQb0gvZ/Z1Ae16jTojODYsXNPW4k6ahEf3xn5IplqQG64CvBAE1Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746045689; c=relaxed/simple;
	bh=m2WVpGudjVYKghVXuslACSMVKgAUc8Yti8rw1zX7zm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=auLJXoq7zbRfUkL0FqvLcWp/zPMqRRizZpty42omWQYcKjcJ+MO7t7YYKdGMva/8zCbs/Jtti2CrDrIld70GHToqmQbbt72IEjojsrlPDsHYHU6Q5/GB/jR8eRipX4QrnwiWVgQ0PK3HJNzhcTMDcvJoOkW5+Fs26p17n0vs85E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CG7hUE9g; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so126871f8f.2;
        Wed, 30 Apr 2025 13:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746045685; x=1746650485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FmVRNDgJPoOZl+FC+46sU6QYP5fUdspzcddo65eVNA=;
        b=CG7hUE9gqwNhieglhI32GYj0nEWTpB1Kb8QiiByDc1RZ0+U3/7OlIRBs36AMaKVA4q
         Pz/IFahiYhk3QHmAOBwnkwMxq+Qq8WXTXnS3tBL2u/XiFtql1DpkqIQfvMje0EC2n7YB
         RQwy6PvZo4BWZ6Wj0DufbKDctJ+fR428kmTw6pb9LL/cdjBnEIXQzyt/VkBbL0j5Nakm
         hUeCr9Es+ezA1IboHwn18cj9LJVkw+Cc+kwvZE/RcFBIJGq1EQwzGdQ+JrZEmulLvPUb
         Fk3Oeytz1RHtptOxWRY2goePwQWNYfXHg1SXqjbN0Fk0E9wNcqSzFbqOehpM/tAFQdwf
         4fhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746045685; x=1746650485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2FmVRNDgJPoOZl+FC+46sU6QYP5fUdspzcddo65eVNA=;
        b=E9XHNns539AODi4+CI0/ePJKefXK3mpf87E7rVX/wGeV9U4+aWuSnFlu1GfqsjIR7c
         CpsOrLSwbaD+d72EV0OZIM3VOXbGQsiU862the+k+2e3llPN5nnlqyq7JChd89b15PNV
         1XV+VMKwKJYl/81/wSuFQRmab7r9UoW5ivGwNIUHr/2D48Vpq3kDrRrKVQYTY96B0bHj
         UZOb2HO7bgnNX0lCOw5M8yZYr+jgBcMSkmqzxMcg01Du4d5e7ILYuroaT3qkFabNtAtS
         i7zqWRIosqQ4NiOLteTy1Os1BlSG3b8Tsczj/mRiAq+tY8NMna7LBGpizPxd2b7fZ0+i
         974Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfL1LjVN8dHFc8NyGqsZTDtG1NHbA8XWvxcazzmeHjj7z+dN8+5r4OLU0vJQJ7ZIDZsB3Fyyf4sdb1wp7F@vger.kernel.org, AJvYcCWBalFMpc9ONCtR1IDZ9K5soSdzyhoxKLxJKpKXCR6LzEkLK9M0iAJrIL1dkAkJD/PKfMYTJ5nk0/nM@vger.kernel.org, AJvYcCWDH46OtMKRpnF7Wqbifruz1HQSWOiuBDtB+7NIvnCcFd38svNfKler2rSp6lNz2A1UE0fVl30QtKsFYdb0kXRu844=@vger.kernel.org, AJvYcCX2ylCmFnBj6Qs6CHbKU9hsXpsPo5+/V5FHoZtYelQDX1IbbIVg8rlEvyxjeA5xCvnI+B+Nre0EfcLY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw18MclKhGHsDWkNxiTrBxZdX4bAcozeTnf5oBFRbkt/VkveAJs
	XOjwEBoWS3c/G4RARc0PseANFC1oADuigJ7oc8sCWgu/25ZTkIXV
X-Gm-Gg: ASbGncuAIwPIli/+pNnzUQd6qvOli5UzDABUHOLlA9Klzr9ltWlTkhOSHCwP1QR24pt
	f2c38RMrsJRgtOrV0Yvr/WiR7iT5QhmKuZ1VLVrWfU7cmlqMndWoWp7AygE6ldgD2/mcWckyPWO
	nZERhjyD+ZWEblR6qWrGsX+gNF/MicIZ6EmZNgC5N91Qq7XSYln4zBBE3cOdNrFffP4n/3jA0j+
	8kSCcLu4OMZ8Vw7zKGidiWz02JckwuiSdWa9c3C2BfW2vPwNPJx/ueTj72cWAWWH0b22hWJe6Ok
	gfdKAoYDOywDYv4FX2glwiIJ2keW86w8YrWsQ3bQOxf1vA52SU06KSrwYb+PTltA6mOoOUz/78G
	vdzhCnG/YDg==
X-Google-Smtp-Source: AGHT+IH9VR/VG4GN6DoM4fsKWmDGoKDTPJxSI0HLkhKGuQTGv3jCyVAJF+y5EeS1rD6wkxPX1n97wA==
X-Received: by 2002:a05:6000:310e:b0:39c:13f5:dba0 with SMTP id ffacd0b85a97d-3a08f760dcemr4921596f8f.13.1746045685394;
        Wed, 30 Apr 2025 13:41:25 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c5ac:bf15:f358:81a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca56d5sm18098132f8f.32.2025.04.30.13.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 13:41:24 -0700 (PDT)
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
Subject: [PATCH v4 07/15] drm: renesas: rz-du: mipi_dsi: Simplify HSFREQ calculation
Date: Wed, 30 Apr 2025 21:41:04 +0100
Message-ID: <20250430204112.342123-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Simplify the high-speed clock frequency (HSFREQ) calculation by removing
the redundant multiplication and division by 8. The updated equation:

    hsfreq = (mode->clock * bpp) / (dsi->lanes);

produces the same result while improving readability and clarity.

Additionally, update the comment to clarify the relationship between HS
clock bit frequency, HS byte clock frequency, and HSFREQ.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
- No changes

v2->v3:
- No changes

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


