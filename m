Return-Path: <linux-renesas-soc+bounces-20995-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65594B3896C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Aug 2025 20:20:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBAF41B24517
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Aug 2025 18:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4332D2DF6E6;
	Wed, 27 Aug 2025 18:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGlXOGyD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1242D979B;
	Wed, 27 Aug 2025 18:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756318795; cv=none; b=pa/oivgU2TkBpfvPZy59rEGPTZeCpnIL4UARsZg8lsZNGK3Q6plRqO3al0IYzFwnXhRJ0P1KQK5wdkttNgHs90NAN3E7igaG+698ZT9XOMgp2f0xLVjFNPUvGXy871RIkzx5BAi6ZNNoLONzVCq+uj12Ha2XTyNFd0Gpzgihvi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756318795; c=relaxed/simple;
	bh=r1PuEOOcDzXU/cK74wpmAf7V34Q8BgmSaKBfE3J8p7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I4+QL09wgUhFTYFB+3tateMXgUcmNwjDfwanMtl9cTFfuvkjHO+760d4TMBurWeFliJf6ztrB4mz31gBhmwC8Oxuwx1aj7BEr4+1JUwt/e5ENfiG2vmzAH+JfHLXrljEIKjj1E6ERh4cxxfS5W07ybCw3fcQjISPlZ2b/7q5F0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AGlXOGyD; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45a1b0cbbbaso743725e9.3;
        Wed, 27 Aug 2025 11:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756318792; x=1756923592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/I8FQkQums77JVKAZN2X3wL6lH3NdThS9nrylqJ25Y=;
        b=AGlXOGyD/sbOAL22i8zgyLw5cGAflxP0zFbGDmauoScVRBaqxsryQiNAgfkEJ7irmD
         CNjv/VYYrbvnG4IwaqjYivx0I18pb3UH7uZcf4R98H5/44sAk/58a2yF9I421JC4kGaH
         QRtZehPlDCcynBkJ2aTRS3gSIJuAoy001H5fTPWO794RmlQvLQqOiE6wJWPRJx20ys4s
         vr7K0f/h2y0Y4nSeOk1SAl/0nxHigrWIDtFyWHDdYHAKWKAoe4DTpvGLbRHykqku1fwJ
         iszv/0IWgYFvndPEvQEGc4zUSqZ1BKMd5UyXciA0OvdQ6ENeoZqlzXJ83JFKPTeFEopJ
         2f7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756318792; x=1756923592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n/I8FQkQums77JVKAZN2X3wL6lH3NdThS9nrylqJ25Y=;
        b=UOF/Eg0uGrfBeX/DhwjuhePuxYQChAq2Jn3+dlsp3ZhxvBh9sy1JcKreKoOM1qmixT
         Jvj1HVJ6eDfeMvwcRqsH7CEFBh3Pe+VIpmSBv/XI/0vX7K4XvylnSCpoEgrXQAah5djM
         GRBwCwLEt5p9p92q8S8w1j7B3E+o4eylG7Ay2zDPRxQwwg/hdvNw9AiV1kcxfe7Z99tx
         rCkWBhI6qtNUCA3b+LeQgizU/yRPZpM6QV86xV8KaZqVxNh6RSrCVUmMLoCDyAhCmYsl
         E5+eznRnVUdqr0HzzAL0JxCHHXtsbnoPcomneSXtxuHP8HDY816w3ffy+DuK9/UNdeDN
         eKWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9oW9LYpZEtMBzKu/ocsVEquOnTj527QuPuAqGspSujdvdZVyXo1TGJCmzSHiPyA+8K4fPx0eCpn7l@vger.kernel.org, AJvYcCWlGtbbE/IygHZWDSOiY8RYEApWBebRlzVDxWVd07FzjmAYIIYePn3Qtqn/IYUxsogv45AUbWNAH45R@vger.kernel.org, AJvYcCWxjdP54A2fm+qOcfYOsFz3mamcTmRTwzDeDUHus/DWIJMEi9pl2itEZr9oUkjOJBYSSNHC7lz7dq5zesVX@vger.kernel.org
X-Gm-Message-State: AOJu0YxlXtLdugZygq+fMwMzalU9EcfoXIqT7pG3LPDZ+06xlULVbkOo
	XnNqee2PxF1+jWNNBSsT6bQJ3jRht/YPtvYdR08IMCbqWsYjGdYtlO7k
X-Gm-Gg: ASbGncs4rWfU6X+n/3m10akozWptA8BMq3Y34eftwJxSh8A+Z0Uvitua6Zjbl1p9SDg
	9w0yccWWwsZ2hxKvcNoJuTNSNig+7yQXCokFjHIsbr7MvyaZ90QANcW2MLAG1VfmbHqjNMQnxFO
	ZDkDV+e9czcfv8DbjlBbE/vE37LZ4V48Fcin1KJvp73+g1+F8h1G0cm9md6PUtS0Gv0bd7492lv
	2S3oILZshzp5UiTVKD/cTaqN/3Y2WXdhiWHhdDVr7ik7gQqeN6NuDTLkPOvn6odzTpiu9PZVr/9
	C0Wt9axm3PtYdRXEYvx/ZJY9gUVtC8ssBFogMhCl2LwWyRmikZGQVV5fLRjGRr/XAcmFJpTTkK7
	nfIala0FINMDaGHF9nvwGsf0J1Mj8ezp5Bz2e65OfXCWHdTKnNWuQh8ch
X-Google-Smtp-Source: AGHT+IFplG3/84s2HCEr4pOH0LbvQjJRlR8yf1lK3XVZKVjglA41WVrIdwM3NdWT0B6DNPI0yKQJOQ==
X-Received: by 2002:a05:600c:1e85:b0:458:bc2c:b2ed with SMTP id 5b1f17b1804b1-45b5179f402mr183554455e9.7.1756318791657;
        Wed, 27 Aug 2025 11:19:51 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c546:df97:4816:d7e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6b1cdf05sm24604485e9.1.2025.08.27.11.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 11:19:50 -0700 (PDT)
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
Subject: [PATCH 2/2] clk: renesas: r9a09g077: Add Ethernet Subsystem core and module clocks
Date: Wed, 27 Aug 2025 19:19:44 +0100
Message-ID: <20250827181944.2750142-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250827181944.2750142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250827181944.2750142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 drivers/clk/renesas/r9a09g077-cpg.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index 1fdd764f9b91..1d3717cc4533 100644
--- a/drivers/clk/renesas/r9a09g077-cpg.c
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -72,7 +72,7 @@ enum rzt2h_clk_types {
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
-	LAST_DT_CORE_CLK = R9A09G077_USB_CLK,
+	LAST_DT_CORE_CLK = R9A09G077_GMAC2_PCLKAH,
 
 	/* External Input Clocks */
 	CLK_EXTAL,
@@ -166,11 +166,22 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
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
+
+	DEF_FIXED("GMAC0_PCLKH", R9A09G077_GMAC0_PCLKH, R9A09G077_CLK_PCLKH, 1, 1),
+	DEF_FIXED("GMAC1_PCLKH", R9A09G077_GMAC1_PCLKAH, R9A09G077_CLK_PCLKAH, 1, 1),
+	DEF_FIXED("GMAC2_PCLKH", R9A09G077_GMAC2_PCLKAH, R9A09G077_CLK_PCLKAH, 1, 1),
 };
 
 static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {
@@ -186,6 +197,11 @@ static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {
 	DEF_MOD("iic2", 601, R9A09G077_CLK_PCLKL),
 	DEF_MOD("sdhi0", 1212, R9A09G077_CLK_PCLKAM),
 	DEF_MOD("sdhi1", 1213, R9A09G077_CLK_PCLKAM),
+	DEF_MOD("gmac0", 400, R9A09G077_CLK_PCLKM),
+	DEF_MOD("ethsw", 401, R9A09G077_CLK_PCLKM),
+	DEF_MOD("ethss", 403, R9A09G077_CLK_PCLKM),
+	DEF_MOD("gmac1", 416, R9A09G077_CLK_PCLKAM),
+	DEF_MOD("gmac2", 417, R9A09G077_CLK_PCLKAM),
 };
 
 static struct clk * __init
-- 
2.51.0


