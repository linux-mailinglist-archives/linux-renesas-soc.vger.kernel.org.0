Return-Path: <linux-renesas-soc+bounces-15586-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53543A81668
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 22:10:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E5DF1B8753C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 20:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B08E254AFB;
	Tue,  8 Apr 2025 20:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGZUJnhu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD1A253F19;
	Tue,  8 Apr 2025 20:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744142975; cv=none; b=TnTYvY9kjRY/FwzwIDsZrh32Z2sYZMJR+lb0lXQIMBGhLP1uHHXuOIBua4SctH/3aYi2E65ohVjJ46aYq4nBc7tKVbr/lebGAhV7e4BxSTurWKGmeEX+Kw4TukE+ci8ZYnv9dpj6Ef/AFE5F2a/20Ojp8wcUcBKkn5HGFHONlD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744142975; c=relaxed/simple;
	bh=mr1eapuLp3d6wW65yTIdib6XmyUkHRD5cqpsWCCrUCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CXW7Z5O1+8K2qFdufYCed7+8eER8IihrseN1Va8zGYoYH2vv2YPJZZ9Em/vuAxxoXa+OL/3J6ySMB017yYMzopj+p2cTj+YdGUyqkLvjBW8K62TUMAAQM0ZMK4UPtO+DfOuoaLhv0s9EsutyWC22emLtiCdU3dsYZ60LGDFWODY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGZUJnhu; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so36099605e9.3;
        Tue, 08 Apr 2025 13:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744142972; x=1744747772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iWFQzkzE/YLxJ8JinxrcdW0q0mCjqRMbDDGU3Rpy/Kk=;
        b=CGZUJnhuuX9P/5azZ+Db/R7NqPm4dmvttRuFAZtHTRnZ0mugTZefuj+58eFAEp5TMh
         AxX2gmsTtzKV1O99q86B+ibsBDvdfOPuxyxsR4+hnPAHpaU41K/V1+ObgIMhZDelYXZx
         DFdVOdRL5uc5LouBvjP6VrrDARCCFD6ZW8Izcnp0d+2sW7WE4LA5+OmbHYnGNxIAoooi
         HjolbmZHUsQ/Zl6z2L3IRaWiBXC4UyfxP4oT7Pc0yFygFuhTDQyk4s5WKwGUP6+xpZ0T
         LbYlw8E15z5oA7qVngmIqHoja0rcc0SQmRDMXDtpojqAa74uGsGyMLyTOVVGvknGDIfO
         8fAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744142972; x=1744747772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iWFQzkzE/YLxJ8JinxrcdW0q0mCjqRMbDDGU3Rpy/Kk=;
        b=cXFk5sRT14AvTV4c8zuSilu0eypIUrEphfF2fes5oDDPEGt94Dq/oHWsTZdFff1hLH
         1NNzmqcXAN1lXgB16L9fxxGSzTXuFYGNwMnaw7bfS40K4eIyJXvesK7D3eTiR+nfinZd
         J1GVUp+Pqpoja5cLBMjxXjghkWGAr9nhVYPouD0D37L4pVEn30mHybtlCy9tSzXZc5hi
         QmP6shsqmT1RHv9Vlz3sFrm4CYm6s0rnEXHaFUZSDJC9WKjUGLeKyCODu48HIyx23DBB
         XFg/nj+mW5BD0FU36x+ptSriu3Xxo+nXQ0NUp1c++jOCN6d1C6/DakMjPvT3piuewfi7
         xdiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVS8/UOdQDQfgcMjdG9FCs5PClgPFUg9FG/XGLYvtv1G+lBjkTR8KYD75GM34JQ+P1fsnagFkyHRnyB@vger.kernel.org, AJvYcCXSKKLvF+7DDCJ0MzbhkEEvb8AFxRh9Dxbyhr26tnRYkraLt6TDH1vPydm7BcK0MXWQMk1SNIB0jdj3@vger.kernel.org, AJvYcCXaeg94zAPEOchSC0Alo9qcPff4Tmihi+WxoFCWY4q8nPPP0JeVM/v9XVHBMSb70pAJzqcWeNJNScrSLaq1@vger.kernel.org
X-Gm-Message-State: AOJu0YxCnBrTh577xEF/CqpF2IUOVmxyNLkUyHH6lvVyeuc3YiUw+GAz
	wjEqWOUJrn7p8zDoBsH86NxxRnKivIY0MGvkQnk7H4NXaLtprUTo
X-Gm-Gg: ASbGnctdIa1QW2AL9mt8mjKZNXngTc2ItAN4ayoMhdGVJ8ogD+zJCX+8KTH/0mb6vBv
	EdQuNMygNwx3Iypbju/NPBCX+ntmXVR0xiqu7UgtgkbTf4uXNzBm4rbKzdRrCM9zKfm/+yZLdYG
	5vpoXHVbRBVx+v7pSpN+LpeQmPH0RoxUQ3nEIVqPrWOUZEomiplJGlhC3J/Dm3cSaoz2iCWsjcu
	e7WSORXhO9jie07pB+UYyeKyCRbpLgMrj97Z2XOISYBMv/6XvxLJcdcWtPAahAVkq2ySF7z6b5c
	1UPLvAuTDuJwpAM1Upi5Q7wWmUNMtm9vPU0Q6eGmJNKt+uPM6etGWuZ2tseVq2gtY5ofKcjkbQ1
	CEKc=
X-Google-Smtp-Source: AGHT+IG9TaUmj9LnDdn/kP3lb9vJmEm5lLawrZAi/Uwl+lufn6YZoKeuxbDaqMkZAeTWvzLU1xiGWA==
X-Received: by 2002:a05:600c:1e1e:b0:43d:49eb:963f with SMTP id 5b1f17b1804b1-43f1ed4b5ebmr4037635e9.24.1744142971565;
        Tue, 08 Apr 2025 13:09:31 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:469:6216:b7f8:fc55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1795782sm174892875e9.26.2025.04.08.13.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 13:09:31 -0700 (PDT)
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
Subject: [PATCH v2 05/15] drm: renesas: rz-du: Add support for RZ/V2H(P) SoC
Date: Tue,  8 Apr 2025 21:09:02 +0100
Message-ID: <20250408200916.93793-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The LCD controller (LCDC) on the RZ/V2H(P) SoC is composed of Frame
Compression Processor (FCPVD), Video Signal Processor (VSPD), and
Display Unit (DU).

There is one LCDC unit available on the RZ/V2H(P) SoC which is connected
to the DSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No changes
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index 5e40f0c1e7b0..e1aa6a719529 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -50,9 +50,20 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
 	}
 };
 
+static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
+	.channels_mask = BIT(0),
+	.routes = {
+		[RZG2L_DU_OUTPUT_DSI0] = {
+			.possible_outputs = BIT(0),
+			.port = 0,
+		},
+	},
+};
+
 static const struct of_device_id rzg2l_du_of_table[] = {
 	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
 	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
+	{ .compatible = "renesas,r9a09g057-du", .data = &rzg2l_du_r9a09g057_info },
 	{ /* sentinel */ }
 };
 
-- 
2.49.0


