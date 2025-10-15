Return-Path: <linux-renesas-soc+bounces-23111-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA23BBE069C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 21:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB04F1A2305D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 19:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F30C30F7E7;
	Wed, 15 Oct 2025 19:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eO1YonPJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D6F30E84B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 19:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556407; cv=none; b=rOBLbaznUgeyRi9x4U9WoT7dTZfef1vMKnUwwuzG/fO2K5XNAx4/tZZC15oBezS3o0nao6qTWe2wpOTUzExcI75JVwS49uVyqqtdjNRl7ulxovUGVbwQFqFVipXP4XN8/kvqA9Bee37n+vNDu6Xr/ovuhJy9GN6YPyB9qse9jTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556407; c=relaxed/simple;
	bh=x+ZmUnRQ5rJ25UqRzHPT94vrQV/R+L+XBIFkmy2P01w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kqOyIEIyARK9PAD8p3tetCnrDqIOWs5OjIs7z7jBMvi8bLBeUZ1K6hXM0pVMdI5s1im7WXvq8l0I3vw7BiXvt0aogAzp94PuY2KUCiJxu67abl5cXUGMlSKYTYI//AT9sUNoefwwifUQGtTyVciqqH6aaqvvd180E7w9ESoOzgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eO1YonPJ; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b6329b6e3b0so960529a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 12:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760556405; x=1761161205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVdIIHRjhsjhdHyUNhjH9+nTwNCLTUx5F36M27h4XtI=;
        b=eO1YonPJfvS+GPEAS1euEuKC1VKLDrAnQrQ5WBOmAl2/jB8ixMniKy8OIPnWA4apYC
         hIshdSMSLgu6m8yoz8ZcHlc87BD/FUNsVSD/YwqYrWig/9YIA3EZJvnBR9EzO6LMXdzH
         TaPuQ0r5nVWJtKmoGui+8MPCCIjgCAull1ybLBxvmej7JatoXtPTU65wTFFda9qFam2y
         d9mCzi4GN00q67yOkplPImWZOruoV828IsxdWe3j4MnHoH60oSrXMU0HxxvFHfeTZtQo
         qsQigfWULaNc/ZgrFT/8dBw+NxKu1Uvbbt28Lg4Tdudyk6p0UrPTQO0OowzBapBHdxJf
         Gw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556405; x=1761161205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pVdIIHRjhsjhdHyUNhjH9+nTwNCLTUx5F36M27h4XtI=;
        b=wMmhaFRfYOV1AZzm93rioWC5sNviNI5bkVguphv9XuvUtLXLgsih+jqMtBSlcBo0Dp
         vx22aEDwFUKhIiR0kG2KBCBVqZ6Izur6WIGYKc77DnxH7DUhjCcVhQlr+xFmk/5TXfME
         /VpyX7E9DFzIFly+8U2k3uUCPPFj34fw36WtIizMnZ98hRuGBKORClqaiYjsk7QYEjAp
         4pTy80g29jmiTHg0Fz6CCjQraYqY8CvcDFMBR4w351uE70KyisL02Jxx1pnpSDIQNuAE
         831uI78PpYKBHZ5pLqvEDmrTChDI6rs0WDG6DDoU0qjUbwWGtzCf54byUcEMakviUsLk
         cHQw==
X-Forwarded-Encrypted: i=1; AJvYcCXuyNpumai/VKDGXQgpqdXOMUY+SHIuQWtYmVykLUXzxtr8Xlj+XR3FsSnlXJuPSPRLApLgAe8RGVVi+IivVvSiEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPoqqx44Or2+eMgkQHthIeGQRKNqMCO5yDHX788gUlPJRM3Shb
	z9TBl1JdCOzAb3Jw4meYAXF0z3CKsd9TrjI8IdQXO2FiB9CW7jU5cFzb
X-Gm-Gg: ASbGncudWwvprmiC4DwcVdzKqfi5PEW8Mmr8djzBBT5g/b82R7sxNnevLn+gqWHVLme
	4MCisEK69UTnkMAMUlG9bDA0pe3WktnF280eZgstd51RsgfeziKFZwjcTEvgextrvr7WLmEEZNS
	/BPWsMxgo93IDyWDC0mLdkRTLC7VhFvwefXg6bRigYFo+93VOtYKtStN4uAMc8xIFTM1ZL9gQj+
	ReZwc9GVIdwYS/Ugh5O/kYtE2Sd1ssKhs7J/Oe6MWGX4mnLr/h0iXZ93RK9/OzDtMmGv725Yzod
	3zIjkIqWSTgV0pr9m+58r5YPZ5FrMi4E+pakknO4DoiobOcixrskUMgUkT1Nu5+oT703EUbHs+Z
	4AtGmiw0rm5BcPpRT58LOZxP6Gop+bLmgRiEqoqZhX6j55MhEGpuCWcT7DVBmkEZvbUZNEthRjz
	XQGTi2YhIH/Fev6U2Q312AJg==
X-Google-Smtp-Source: AGHT+IF8rWJttxUtF2GuEZ7phZVM28kjaWV2XPPnFipU1q3jMXIrc6ZJZA0GsIhMSL21BS4p4TDQyg==
X-Received: by 2002:a17:903:350c:b0:26a:6d5a:944e with SMTP id d9443c01a7336-29091b4a521mr10160085ad.24.1760556405421;
        Wed, 15 Oct 2025 12:26:45 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:c7d3:f449:63fb:7005:808e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-290993102c9sm4427005ad.24.2025.10.15.12.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 12:26:44 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v11 2/7] clk: renesas: rzv2h-cpg: Use GENMASK for PLL fields
Date: Wed, 15 Oct 2025 20:26:06 +0100
Message-ID: <20251015192611.241920-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace the older FIELD_GET-wrapping helper macros with plain GENMASK
definitions for the PLL CLK1/CLK2 field masks (CPG_PLL_CLK1_KDIV,
CPG_PLL_CLK1_MDIV, CPG_PLL_CLK1_PDIV and CPG_PLL_CLK2_SDIV). Update
rzv2h_cpg_pll_clk_recalc_rate() to explicitly extract those fields with
FIELD_GET and cast the KDIV extraction to s16 to ensure proper sign
extension when computing the PLL output rate.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v10->v11:
- New patch, split up from patch 3/7
- Added Acked-by tag from Tomi
- Added Reviewed-by tag from Geert
---
 drivers/clk/renesas/rzv2h-cpg.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index ff688dc88ba3..9c4c5dfd5593 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -49,11 +49,11 @@
 #define CPG_PLL_STBY_RESETB	BIT(0)
 #define CPG_PLL_STBY_RESETB_WEN	BIT(16)
 #define CPG_PLL_CLK1(x)		((x) + 0x004)
-#define CPG_PLL_CLK1_KDIV(x)	((s16)FIELD_GET(GENMASK(31, 16), (x)))
-#define CPG_PLL_CLK1_MDIV(x)	FIELD_GET(GENMASK(15, 6), (x))
-#define CPG_PLL_CLK1_PDIV(x)	FIELD_GET(GENMASK(5, 0), (x))
+#define CPG_PLL_CLK1_KDIV	GENMASK(31, 16)
+#define CPG_PLL_CLK1_MDIV	GENMASK(15, 6)
+#define CPG_PLL_CLK1_PDIV	GENMASK(5, 0)
 #define CPG_PLL_CLK2(x)		((x) + 0x008)
-#define CPG_PLL_CLK2_SDIV(x)	FIELD_GET(GENMASK(2, 0), (x))
+#define CPG_PLL_CLK2_SDIV	GENMASK(2, 0)
 #define CPG_PLL_MON(x)		((x) + 0x010)
 #define CPG_PLL_MON_RESETB	BIT(0)
 #define CPG_PLL_MON_LOCK	BIT(4)
@@ -231,10 +231,11 @@ static unsigned long rzv2h_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 	clk1 = readl(priv->base + CPG_PLL_CLK1(pll.offset));
 	clk2 = readl(priv->base + CPG_PLL_CLK2(pll.offset));
 
-	rate = mul_u64_u32_shr(parent_rate, (CPG_PLL_CLK1_MDIV(clk1) << 16) +
-			       CPG_PLL_CLK1_KDIV(clk1), 16 + CPG_PLL_CLK2_SDIV(clk2));
+	rate = mul_u64_u32_shr(parent_rate, (FIELD_GET(CPG_PLL_CLK1_MDIV, clk1) << 16) +
+			       (s16)FIELD_GET(CPG_PLL_CLK1_KDIV, clk1),
+			       16 + FIELD_GET(CPG_PLL_CLK2_SDIV, clk2));
 
-	return DIV_ROUND_CLOSEST_ULL(rate, CPG_PLL_CLK1_PDIV(clk1));
+	return DIV_ROUND_CLOSEST_ULL(rate, FIELD_GET(CPG_PLL_CLK1_PDIV, clk1));
 }
 
 static const struct clk_ops rzv2h_cpg_pll_ops = {
-- 
2.43.0


