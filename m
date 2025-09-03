Return-Path: <linux-renesas-soc+bounces-21291-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AC2B42687
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 18:17:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A20AE1BA2B50
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 16:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A5322C0F89;
	Wed,  3 Sep 2025 16:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjhvSAT9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0A228F948;
	Wed,  3 Sep 2025 16:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756916252; cv=none; b=R5781CaFF9DRxNZEQTv8ZNZZWKQuXgAbx3OaKqH4DNOf4xy+i6OskiYYylPrRQNrEqCBotHfSmGhoAY+L3CzmXjPib60XAdswAC+7PdF/FzcqxZwJ6MSAOPd0glu6jQ80vz9H8yQwKjKFDXGoNgDWLEHkGxkYK9smUolN2TDNhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756916252; c=relaxed/simple;
	bh=FjSJsFmFmtQxgmj8+P+bZR5mX5R+vL/ZZpr6mTIkgGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aeAWXUSkeiI9QELUW0KwDvbbOneIbVoTRlcloIZmaU3vXn1eQRSh+XjV1DAyCTpLb9bBDZphwGi5Xj66oxGiV5ixjF71ElzBYb+MTtg37hTpYgaQ7fLf46YMrpGIBSpExzDmAkGaoS/UBj96Fyn50B1buXMy+AqPknnu84NUk+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gjhvSAT9; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45b7c01a708so493455e9.3;
        Wed, 03 Sep 2025 09:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756916248; x=1757521048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/okqN9bKCpoU9t2/g49V1bui3QD4VMJiIMsCcD14P8=;
        b=gjhvSAT94OGwsDfPo06aYQtU2YF2sWu/isD/ESNYHRYctQZeBl3VNChH4RmBcjul72
         BrXuXqMnsr5p7GZUjkEF5iVe1XKtbKNOGe+aAC7vJfMM4ig5r1s9NjpMDotx95Ni6cad
         7E2Fz4M5HhpEXfc6YykQCQwkFQAd1cbF0uBdXneHv6kPlWcOJnedrJUiIJBxD+vUiHw2
         OqcuRsaD0HzQ4LiTucLLgRq6EOhBwoAIULDLxKPVtdqoefjMvdoW3vukaYnsV2MWPdJP
         qhTui2c2GvhmMD+xmyLGSd3TVl8odCihWKxbX8H7ePexGLCurtHoIOo2nlvPeKysxyaq
         yFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756916248; x=1757521048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g/okqN9bKCpoU9t2/g49V1bui3QD4VMJiIMsCcD14P8=;
        b=nbHseJEDpeIzecGGVorY1TOv1TMl88Chz4eKwwfDI+Y6FunCnK01zXS1UyMFUx49pM
         bIII3th7ARerodG6yhuJnUsyk4SU8wsy9RfkKTMlrSl3JXHGO189O4+3xuQFuwfVgcee
         WCYKtc/RAVv+Y8Mk+a8D1RedvvOvAi0E/N7zKxeUUYxCZaclV9t8aLoDeisBhOmLQ8dk
         70rwk7RrpbMu0BcraDgM5GdHcdrRlcvFkmDASsd2yLgV+I8QCuSmB39hppyuoRWDbD5w
         ziKON2sHvM0wO3Pwotm1WQG/GtX945MThRl9MEVaj8epUMX7x5yCJAgLC15XJsEiAeIw
         QJIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXiLcDxxbdShEqAndT6ZKcs8/gLdYUe1RO61gNfetnXIiwi78Z6IJdFz5+66nxxWDjg1tFTZXEXx8Q@vger.kernel.org, AJvYcCW7NU0jgxIVO1fymoruiPbtOoxOxWu+NIxbCwxQMWRQFRCd/eWfYyMEFUJAkE4Ad/dZuwsGZoYauQpTWtoh@vger.kernel.org, AJvYcCW8mkbzZLQ0C0Ojnitae1/yhCI+lJ7agtcnzHUjUXPnLzNxqAPT6iT5eu/0sWuIz83Rt9gFCdJZbaCd9Xo17GnXQdk=@vger.kernel.org, AJvYcCXTsEyiMCTRkrWq0CY6QWG1CMeRIkpOVLTX0/hWrND65XQQNVoIxyKnBZ1spY9pAT3pvYugi34KuqZn@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhw2x9r5VDr/vGJWTN8xIkI24rpGH7GR9TOMHg/T47NCF3+kWm
	LPcqKN323/v0JcgTfnMdvWZls3THmw55hPo2cjqstgANkVoav5scsnCw
X-Gm-Gg: ASbGncuXME1cpjs+NgTpTowXAxN8WW/fuKQeuhH3agxigpBqUi5SbTqEfII8YeBAzG6
	QoNmKG+AC9zV+tBk4OnoTkeCPsT8NL3qTu2nfYHVLUqeQFTLEWSCfqYOpEB34XulVicoPN/LnwJ
	rk+vdKfc3p0OdqW3zLCRTov/myOuRHmzEPjj1584KOYzltOdvyLDblEVd5jhLav03e4FoOl2szx
	dI67ReC1rfVKAHD8rgumtWpw/qwB4gRdiMTTo6g42fgl0Xyib8o+Vx7G+nYqvoDwAQ+ks+smNAe
	PdA1XzQyQSVhqtM59xft7RQl2zbd9FJdS6Jm4xBNsutBntHulKCFoePoaPBtpWQiZVtoXVUJNvl
	CpbkKry8ryvZ7oldPH5qYNItnqNWDCdlEyYmHvAi4VIFhfUFCXgttTUGK
X-Google-Smtp-Source: AGHT+IG5fCsD9RpqHsN6fdU1xDs5FlEGumpRU6I9wG0qe9GQCj5TyawUM1xwIAow1pLMVJ+8FN259w==
X-Received: by 2002:a05:6000:2486:b0:3de:b99d:d43 with SMTP id ffacd0b85a97d-3deb99d10camr2123919f8f.19.1756916248033;
        Wed, 03 Sep 2025 09:17:28 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:9019:aa0f:b6e4:7952])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3db72983560sm5645734f8f.1.2025.09.03.09.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 09:17:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
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
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v8 1/6] clk: renesas: rzv2h-cpg: Add instance field to struct pll
Date: Wed,  3 Sep 2025 17:17:13 +0100
Message-ID: <20250903161718.180488-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903161718.180488-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250903161718.180488-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a two-bit "instance" member to struct pll and extend the PLL_PACK()
macro to accept an instance parameter.  Initialize all existing PLL
definitions with instance 0 to preserve legacy behavior. This change
enables support for SoCs with multiple PLL instances (for example,
RZ/G3E we have two PLL DSIs).

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v7->v8:
- Added reviewed-by tags from Geert and Biju

v6->v7:
- New patch
---
 drivers/clk/renesas/rzv2h-cpg.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 840eed25aeda..e2053049c299 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -16,20 +16,23 @@
  *
  * @offset: STBY register offset
  * @has_clkn: Flag to indicate if CLK1/2 are accessible or not
+ * @instance: PLL instance number
  */
 struct pll {
 	unsigned int offset:9;
 	unsigned int has_clkn:1;
+	unsigned int instance:2;
 };
 
-#define PLL_PACK(_offset, _has_clkn) \
+#define PLL_PACK(_offset, _has_clkn, _instance) \
 	((struct pll){ \
 		.offset = _offset, \
-		.has_clkn = _has_clkn \
+		.has_clkn = _has_clkn, \
+		.instance = _instance \
 	})
 
-#define PLLCA55		PLL_PACK(0x60, 1)
-#define PLLGPU		PLL_PACK(0x120, 1)
+#define PLLCA55		PLL_PACK(0x60, 1, 0)
+#define PLLGPU		PLL_PACK(0x120, 1, 0)
 
 /**
  * struct ddiv - Structure for dynamic switching divider
-- 
2.51.0


