Return-Path: <linux-renesas-soc+bounces-21313-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B670B433A5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 09:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 961EE3B3312
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 07:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2240229BD9B;
	Thu,  4 Sep 2025 07:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDGeapiW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E26529ACFD;
	Thu,  4 Sep 2025 07:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756970404; cv=none; b=dy3knVFFGc09X2OFZodCx4+S4i5H+HQ/jLoF4lUI0jhRas1gSa5i7JTfraSphXxjTkhJx66hrDM8nZHWW2urEFL3do3W4mJxxszQhNiJTUW5J3wjTUzKnG27ivEDFU54FgOaL09IWLtWph328FhlIbX2PDXrsxUmhzlyA8+JrAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756970404; c=relaxed/simple;
	bh=Bx+Jvr7i5Unz0rkzf37r2GLsOTkpazPHLYSR7/E2vKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rb6xEn0FzTUXWhTjOUBKg6YE/atuy6NZfutDUodG8Ih6dq7NOHw1zq0aJG1sZdWNY/p/kyRyuDYK1BeAz9xbRp3EPLgzzJ+oQJOSGWadisUQ5gX0Jx4dFLvhPbjg/23M5I36CC2LRVJ7FRpWe2AnJZYkAOHlQNeHWB6M4dWOQq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDGeapiW; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45b9a856dc2so4780005e9.0;
        Thu, 04 Sep 2025 00:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756970400; x=1757575200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHYjJcw5G/yjA1RIZZRKwffTFptFxHUHHqYEsdPHy3A=;
        b=DDGeapiWP0YtUPsHVFivO1lGIqK98fzrJvrtnxtYzPX1Hp1+7WaaaDL6zZ1o78sa1Q
         jyZwF2delwMzQrL5T/rdbKDhKdEc2ezi+DrnGz58DOShSLhGwhkBGZ3OcffcxTwww6rT
         OpP9pfsfGKyj4UwboqxjqPbtaQ52NVLp1FVgLR6T9ePr3gsvMivu9zUus3I/eGhwIXru
         O24OOMhketYE8CxYR0tFXDqjnU3ach33btGwVrDYiiWvgYcLIbr0PcoCaR2QM7+Vzhdj
         vQITr843XmXcokbN8MgiXv+DBbhaorzRIB57ytosu/sWSOdr8TVL+c7uZcxmU45QHv4X
         SB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756970400; x=1757575200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHYjJcw5G/yjA1RIZZRKwffTFptFxHUHHqYEsdPHy3A=;
        b=GcyWl7UAmo5HEu4ukSVVGtkCwIEAlYvDB7m0ZWG0/oZfcBuTcWm2WdRnO7Ha69yk6L
         hSaVjyDF6t94kLFIPeNiuxIijktzFQwlAqEZhyLnolR0v/p4FYJ+eb9Hx6bvjDztnqx0
         75W+abFczYqjSQlGIqW35aRROdxS5hXW464ET62n9oqB4F6uLalpMoabvuPqS8a8TWaZ
         9ZgzMEX9OZwQka+WaAlv0uZ05L1fTpzRAQHPqymlD7iOGnIMw7H2pnEXz3JgFnUPhIHh
         hE20u1XHx4rvNHWV7Jmlp0J5rpuGGg7RzUoF9oOP6+0ynei6u5x62yd9n0FmmhZbVBro
         MfgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD62MT2ZfvNmQMpeEg/+52GG8mGGdG7Mts1PkzEzejZmmGHne7dST5pMWbozzGQSWzIxeXVOcG33TyJaN7@vger.kernel.org, AJvYcCX2/mAm7P2BH+biQX2BxJ/4BpV1+ed0t8IcNmFpiNQ6QSonaw9ugIiXwNZ0fQCtJqYQ8mNI53WkO6vE@vger.kernel.org, AJvYcCXGy9t4BR5cY1eJN6u3lGSGm+QODd3WHbVWnWXFcUCMeMhUECtJk6dVcSJBQAgo/BLXsHBDPZKZ/rc3@vger.kernel.org
X-Gm-Message-State: AOJu0YzalN+3jTwUzYXLGgIiwYD004+19tI+8casyO0ATu+2UbuwGY6G
	NkaaSTGtyn7nVxERDpyTj/4LzAh0RfTW6tYwfPibza6Fi9UKNBgn0eOR
X-Gm-Gg: ASbGnctUkNXrnAiH2J3g9B6aoLReblY8cr8+zXOnAHPXs37iB7MeBerb/7D3VbNb8q2
	amXQOSBtyL4A4CBV3cwz6BlWE28QgArwJ3BGcbzbg4z2JWoEeXfAWZBLDeJUXcXlgFMytcAzqXe
	AWJ3Gw48rhpUQh4l37v2/vYoLGZaNRQUx46AW2QN84+/n15VIvitW0MKYmTKg21tyvXLENuGips
	/dBCtyMO2s9wqIp0gI5r+B3alsdhcFEnBuP+mGaTUU4PLkOuGWChHuibd7weiMPX+hVbd5OAZir
	PBqa14U1ipHNM1s9IQAU+LftwJscTCN3nSoSxxwMQKYG1Yj6LgbbVGMceHkkF8lVtbv7mYPLGNs
	MG3juoEWy6O1jkSlW0pIXpsfvfFumeoCMHG6Y95e9jFGSGRA=
X-Google-Smtp-Source: AGHT+IHVKi/cV7fqS4z+WCA9pQ+my7yP6izOKVPb4B/RTv5/4/6M11SQWU79YdqRa3MIlVCqKZW64Q==
X-Received: by 2002:a05:600c:1d20:b0:45d:7d88:edcd with SMTP id 5b1f17b1804b1-45d7d88ee4amr27233445e9.30.1756970400198;
        Thu, 04 Sep 2025 00:20:00 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:904e:70c8:edf3:59a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e8ab832sm270962835e9.23.2025.09.04.00.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 00:19:59 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 2/2] clk: renesas: r9a09g077: Add Ethernet Subsystem core and module clocks
Date: Thu,  4 Sep 2025 08:19:54 +0100
Message-ID: <20250904071954.3176806-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904071954.3176806-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250904071954.3176806-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add module and core clocks used by Ethernet Subsystem (Ethernet_SS),
Ethernet MAC (GMAC), Ethernet Switch (ETHSW).

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Dropped adding GMAC core clocks.

v1->v2:
- Dropped an unnecessary extra line in core clocks
- Sorted the module clocks in ascending order of their IDs
---
 drivers/clk/renesas/r9a09g077-cpg.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index 1fdd764f9b91..af3ef6d58c87 100644
--- a/drivers/clk/renesas/r9a09g077-cpg.c
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -72,7 +72,7 @@ enum rzt2h_clk_types {
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
-	LAST_DT_CORE_CLK = R9A09G077_USB_CLK,
+	LAST_DT_CORE_CLK = R9A09G077_ETCLKE,
 
 	/* External Input Clocks */
 	CLK_EXTAL,
@@ -166,11 +166,18 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
 	DEF_DIV("CA55S", R9A09G077_CLK_CA55S, CLK_SEL_CLK_PLL0, DIVCA55S,
 		dtable_1_2),
 	DEF_FIXED("PCLKGPTL", R9A09G077_CLK_PCLKGPTL, CLK_SEL_CLK_PLL1, 2, 1),
+	DEF_FIXED("PCLKH", R9A09G077_CLK_PCLKH, CLK_SEL_CLK_PLL1, 4, 1),
 	DEF_FIXED("PCLKM", R9A09G077_CLK_PCLKM, CLK_SEL_CLK_PLL1, 8, 1),
 	DEF_FIXED("PCLKL", R9A09G077_CLK_PCLKL, CLK_SEL_CLK_PLL1, 16, 1),
+	DEF_FIXED("PCLKAH", R9A09G077_CLK_PCLKAH, CLK_PLL4D1, 6, 1),
 	DEF_FIXED("PCLKAM", R9A09G077_CLK_PCLKAM, CLK_PLL4D1, 12, 1),
 	DEF_FIXED("SDHI_CLKHS", R9A09G077_SDHI_CLKHS, CLK_SEL_CLK_PLL2, 1, 1),
 	DEF_FIXED("USB_CLK", R9A09G077_USB_CLK, CLK_PLL4D1, 48, 1),
+	DEF_FIXED("ETCLKA", R9A09G077_ETCLKA, CLK_SEL_CLK_PLL1, 5, 1),
+	DEF_FIXED("ETCLKB", R9A09G077_ETCLKB, CLK_SEL_CLK_PLL1, 8, 1),
+	DEF_FIXED("ETCLKC", R9A09G077_ETCLKC, CLK_SEL_CLK_PLL1, 10, 1),
+	DEF_FIXED("ETCLKD", R9A09G077_ETCLKD, CLK_SEL_CLK_PLL1, 20, 1),
+	DEF_FIXED("ETCLKE", R9A09G077_ETCLKE, CLK_SEL_CLK_PLL1, 40, 1),
 };
 
 static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {
@@ -181,7 +188,12 @@ static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {
 	DEF_MOD("sci4fck", 12, CLK_SCI4ASYNC),
 	DEF_MOD("iic0", 100, R9A09G077_CLK_PCLKL),
 	DEF_MOD("iic1", 101, R9A09G077_CLK_PCLKL),
+	DEF_MOD("gmac0", 400, R9A09G077_CLK_PCLKM),
+	DEF_MOD("ethsw", 401, R9A09G077_CLK_PCLKM),
+	DEF_MOD("ethss", 403, R9A09G077_CLK_PCLKM),
 	DEF_MOD("usb", 408, R9A09G077_CLK_PCLKAM),
+	DEF_MOD("gmac1", 416, R9A09G077_CLK_PCLKAM),
+	DEF_MOD("gmac2", 417, R9A09G077_CLK_PCLKAM),
 	DEF_MOD("sci5fck", 600, CLK_SCI5ASYNC),
 	DEF_MOD("iic2", 601, R9A09G077_CLK_PCLKL),
 	DEF_MOD("sdhi0", 1212, R9A09G077_CLK_PCLKAM),
-- 
2.51.0


