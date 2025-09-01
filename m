Return-Path: <linux-renesas-soc+bounces-21134-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A3779B3EDDB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 20:30:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 608757AAA64
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 18:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E15B932A835;
	Mon,  1 Sep 2025 18:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MNprMwUK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075DF32A80A;
	Mon,  1 Sep 2025 18:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756751409; cv=none; b=s8PYClsfiquX1+LVOJyiZ93EUNa55U9/LQNlu2w2S7STlGSdnXwP/XkGmvDqAgS2cSWWqZprVqKT5FWm6gtFP1MI3ipf92zFIuOebXH4jm6kE3oBbtBpwPsh1U61tO09Bi4YhJAC3Yi4ZyZEUCpepvbZEx2O9yvCgyVSy8k6GQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756751409; c=relaxed/simple;
	bh=+m1HwYthCB50VV95UW4OjpKDfAbdCQ7B/lhi7ByOPlw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DiFR3lpqXGcHnCOSBkIGv6lF/vpDiJd2bCup21KGvvUknOZqyDjbiyOlilgG2EA8LAKVOL2+Pflke45JBPNmt+pics1sBad9YqyTEWUF1hdWwJtxj/bI2nr8cgPosCoUpHRYiTXl94ivj4WK/VNuH111mgOa6mo/mN28aaANzew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MNprMwUK; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45a1b065d59so31892585e9.1;
        Mon, 01 Sep 2025 11:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756751406; x=1757356206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jevDyO7ujX8uyE0CFsUIDad6UsTdR5TZGpIqFPgQngE=;
        b=MNprMwUKBEW0Y07VJkN7qWanfODrAqSocFbskghsHn8x9hoIsfiIVJclAp2WyjLkHj
         S8+bNZ0LDXeapWHN9MYlvb3V3tGZUyKdshWOxXfy7ACeeLEw7YaVW/BnU0p4xt+7xnOD
         CeoBtW3xOw+bY5ZPZ/QGmGU0OpGCTWGukHZhD9j5fPJ9LUZGwByK4iQu+64qPFILYKxG
         o2ixcBfnTr/O5UCyWQP5B83Saq3osdO3wdidLqn7bD4n+we6txlwORrz/8YtbrVbICcs
         ddC+tkUNX93o9ZRwgAKKhadprmn/xuiyoE84oDhzd2VDKOfgkYhUJf+b2jqr/9anDWYt
         j8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756751406; x=1757356206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jevDyO7ujX8uyE0CFsUIDad6UsTdR5TZGpIqFPgQngE=;
        b=SlcUS5+bXLIfkfOQdqBRggPjZLXpestGUf7M77TgUJvvs57A92VFoaj6pBCRCmNCcY
         nq8s2T2H/bsfY7a9Ko7d/Fp1UZULmhjEy09Cfg95WG8CtD2hKr1Pbs6gsvwrz+0zj/gn
         wYI8JICemMiZkDR/dKaVwv2etVEUeRhh68Bp6CYdp+X5TgIumYa88F9LXIXyIuFLY7bJ
         C2gslJ+33OXJ5WfA+/cjnVeg9FNYz9h0aSqOZhcEBOusWywqvIab5WfjtRMdQF4I21lW
         web/IeOM7HNyVrQRm3M8l6tX2yM/LhDlGUJwKxnM2rzD4+VQxJCj17ZuqyzN8cPljVJ7
         EuSg==
X-Forwarded-Encrypted: i=1; AJvYcCVdmWf2YUFlPg+aJW/ksqCCxbyxv6FXlmPSvNmPDmGmSpIx6304X8qG6/uzC8S+I8TpjwLa2s9xaOeH@vger.kernel.org, AJvYcCVni4IxJ0Lm7gWfABNXKeK9IwEiedfdKvfNMoacFzqD3EJmi6NShAWNeOh61gLODguLTad4qYQNcOJ7@vger.kernel.org, AJvYcCXpMZzRVJsIFdyvbaOPro8oVSxmu+FEPWeK8sldNsCF8WwEZQiZ+zd8QzqikfNawt+GfKdWNp/nJQ9TuBCK@vger.kernel.org
X-Gm-Message-State: AOJu0YwsHSs9uSKTaLAvrwIqYoK5jzCcOYYVtamBmAipMkKNOeKEgL4s
	ReQel50kL0eUKmvCpk7xxq++Z7voP8HD/3WXMXx8agp3omonOmfl5JJp
X-Gm-Gg: ASbGncuknEYLnApz0ny0AdKY25mT14lxXc2dheZAkNdYj9bQzdDNqVcbu+5KDZt3iIy
	OAQPuHaMvXI+xsyN/J/M0Mljwl8r0Zb4zHQ/6n29S3dweM7jL2bsZUOaguHaXoBzCJsUhP9YYr+
	e7hBEmyp7XtdygILHqKM9ILKKmBu2V0VaGv8qga7J59eHFXnqx+Hnk+kl0rh79vYQzbF3sb6yfL
	aduokW/Ns4Cw/9OhC87+9Yoa0fE5pQDmiwihl4e1Is8yPGyw17dgoPd/WWnl0ePZZADCb8FhO6+
	Ckjeq8tVLL4J+D3FBpuQVinLycXoKbBqMtgU5jbm+DI6GpqaW1m11aS9LK5KoL+bCo8fGUOogxF
	u7CDIE2KEeeTEbwNTyqLIlawGjjRdlku6Dt8LXYU0BTVn6Q==
X-Google-Smtp-Source: AGHT+IH8K9JVr4Nc6rfphqos2+5hYeTA5moI+YCtHjp7isnlSGe73215dkUfPeBxpLBB8ZgaLjOa6g==
X-Received: by 2002:a05:600c:138c:b0:45b:75f0:2d66 with SMTP id 5b1f17b1804b1-45b8553da82mr67720775e9.4.1756751405955;
        Mon, 01 Sep 2025 11:30:05 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca6c:86b2:c8f:84d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7f53a947sm93602505e9.3.2025.09.01.11.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 11:30:04 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: clock: renesas,r9a09g077/87: Add Ethernet and GMAC clocks
Date: Mon,  1 Sep 2025 19:29:59 +0100
Message-ID: <20250901183000.1357758-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250901183000.1357758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250901183000.1357758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clock definitions for Ethernet (ETCLK A-E) and GMAC (GMAC0-2)
peripherals to both R9A09G077 and R9A09G087 SoCs. These definitions
are required for describing Ethernet and GMAC devices in device trees.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v1->v2:
- Added Acked-by tag from Conor.
---
 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h | 9 +++++++++
 include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
index 0c2ce81a8744..a9e88b0c502d 100644
--- a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
@@ -26,5 +26,14 @@
 #define R9A09G077_CLK_PCLKL		14
 #define R9A09G077_SDHI_CLKHS		15
 #define R9A09G077_USB_CLK		16
+#define R9A09G077_ETCLKA		17
+#define R9A09G077_ETCLKB		18
+#define R9A09G077_ETCLKC		19
+#define R9A09G077_ETCLKD		20
+#define R9A09G077_ETCLKE		21
+#define R9A09G077_GMAC0_PCLKH		22
+#define R9A09G077_GMAC1_PCLKAH		23
+#define R9A09G077_GMAC2_PCLKAH		24
+
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__ */
diff --git a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
index 70ee883f2386..c86ffa68f87c 100644
--- a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
@@ -26,5 +26,14 @@
 #define R9A09G087_CLK_PCLKL		14
 #define R9A09G087_SDHI_CLKHS		15
 #define R9A09G087_USB_CLK		16
+#define R9A09G087_ETCLKA		17
+#define R9A09G087_ETCLKB		18
+#define R9A09G087_ETCLKC		19
+#define R9A09G087_ETCLKD		20
+#define R9A09G087_ETCLKE		21
+#define R9A09G087_GMAC0_PCLKH		22
+#define R9A09G087_GMAC1_PCLKAH		23
+#define R9A09G087_GMAC2_PCLKAH		24
+
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G087_CPG_H__ */
-- 
2.51.0


