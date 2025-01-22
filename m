Return-Path: <linux-renesas-soc+bounces-12314-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BD7A18F44
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 11:08:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9A803A163E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 10:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7DE1F76B5;
	Wed, 22 Jan 2025 10:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kd5IRXdD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D21716BE3A;
	Wed, 22 Jan 2025 10:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737540514; cv=none; b=iQiS0CtapWrucqc3SH/WYP7AaGpNjSbYLa9tXaUOd+iy6GNbICRDbnnQtl+KYSBSdMDRXQssCimn6LjadmNTxsMApHki7o4u9jr4T0m6sBbB7tVrfV6hjIDnJDo5aXy2CdndA0eMOFsA6e8PJTNWCdyykJOaNmWhL6jdjZKvqu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737540514; c=relaxed/simple;
	bh=luVYdt3P52wA/ZVxKoddsAFFZGQ3hHpxLEvdUBQs13g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sxk9WUPw1xH3JjjagTJ+c2g0cM+IxjTUQj3lTJm9vBqHNLy6WGESYj859h619AoZoAM4sjGcticZH3HF5+HUFNzsRhDOchVpzx3xCo8iAGZl27kVwOnsosmUpv2CeG384F6Sqby779kBIjvhG/6mR8DHoEWIn0ZcLfjYVU1pqb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kd5IRXdD; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso46507345e9.3;
        Wed, 22 Jan 2025 02:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737540511; x=1738145311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zlh6+X8naccORN3EbOWflAyNMQgJ3+ZuM84lFpaefzg=;
        b=Kd5IRXdDOYZ4Y0HKEuDLcmRslkO/D6LMwrHdEboH4b9m15b5HZFfko0LUKZVRfRJwk
         hYEY/BtdWe2KkxhsPtFIk3wbDQ+eULXlEkrh1pMlbVQi8fYR5r/FQB+9RLjvfi95ieXh
         qQr04abizXAXOAF5jkM8wutZdBsEWGKsh1i1pmAvOjQQ/0yz8HhGs/pyuH29ssK2y/19
         xkBONnXBmpcARLd0TT7Xv6TuET4TzgTaKWNxea2kYgmn5w+MTkSpyylHbSvoqAJXgjFX
         Hzvrd+5J1TQzTPW1MVUFAVQoydvbRbNnTOmWPU0MR+qOFpoaWLqqKcvQQSk+5qurKbwz
         Bjkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737540511; x=1738145311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zlh6+X8naccORN3EbOWflAyNMQgJ3+ZuM84lFpaefzg=;
        b=rSLkZIvLDx/MwA0q0SVYADym3VTQHmE33iAn7+TgWBCeHVGLKcM/mpjJ8dFnI4NbVB
         NU9CmjEXewxBD0neN+cVrvuTeCB8NgZlQLsyqT1TstpntKyd6ImnQxJxl3p9jnpAwN/g
         2eEui6bHWOkNewFhzAgzHqpMNqA21fuwwXr/80saqdcjBkOvrBZKXkfFKkK1+aoC83GK
         xVesrfOgYM/5+bmxyqYRJjRjqfSw5VP7FcCpI+enG+M51zLNfYZZSXfeaWkV2rKhnXCM
         +xDlPWU6MPif+i08sxHOTjHa0hHvlr0hzvQRd6o+kAXeVJp96US6GEJBPVGpCKMAFdWO
         hRpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP0Xh/0FmJFNFH1xwY7be0ZsiUS1zMXiy7VT+NImkN/xAfxF+xbT5Q+ol0OXEML+h6r4VfUKMF5ERHNq1j@vger.kernel.org, AJvYcCWE8mj9/uHQNNwFgHpycXGeJ+NXyhR5IuwSro32UOP5tXT3qzYkiSYzIKDgTQIrnDCpHUygbnMlHWE=@vger.kernel.org, AJvYcCXFgtRowABjVVJXeDX2zFDG9SBMId238x3060j8tMRl0ymLaNDyEZlW1tCEBuM6eniwLzvdhTur@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9prWkTOMWziiSCfI5GHq8uofUHZGoKQgxt/WVKJFiNkcfzoMr
	YiBJil3f6Aj/LB43ENygAeaMRul9suIQJw5Nds/x/Hwj/xDisvue
X-Gm-Gg: ASbGncvNZ2ZLPVxFbOD8ldQTfw8V5g6XLs80qOO4p/NPYbUpOXWnFo1NrLFnIi8lxvV
	6kIomt/xsuGAtt+0iQwBeXJ7Llhu/kjBLZZKytO40xuQ4ZfaphrUdq6wXn79yacVOeewa+bOUw+
	zjBxqOpndj3fD5oH/F2D16ng3Qyw+zio367THQPnhAIiE4L/7vWaGRZaeKML3sO7Nl5liEQYdn4
	lfOC07IFaaO4Pzv/uNglUwjGCeJPdRsk6IsOzj4alKVgRYg7jNjEEpvRvK/juQNwXzYfE/24IHF
	uBlKy2GQUV+kV2VzM06aiQ==
X-Google-Smtp-Source: AGHT+IG60UaoegR5wJyiNK8bJc9DKXj2qQjK8fuC5/c7COhBypJNta5zrgdvPCxOhFFhunlS8jrBiQ==
X-Received: by 2002:a05:600c:1ca7:b0:431:44fe:fd9f with SMTP id 5b1f17b1804b1-4389142776dmr188932355e9.23.1737540510473;
        Wed, 22 Jan 2025 02:08:30 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:a122:369d:8ba:d349])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31d98d7sm17893095e9.30.2025.01.22.02.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 02:08:29 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH] clk: renesas: r9a07g043: Fix HP clock source for RZ/Five SoC
Date: Wed, 22 Jan 2025 10:08:28 +0000
Message-ID: <20250122100828.395091-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

According to the Rev.1.20 hardware manual for the RZ/Five SoC, the clock
source for HP is derived from PLL6 divided by 2. This patch corrects the
implementation by configuring HP as a fixed clock source instead of a MUX.

The `CPG_PL6_ETH_SSEL` register, which is available on the RZ/G2UL SoC, is
not present on the RZ/Five SoC, necessitating this change.

Fixes: 95d48d270305ad2c ("clk: renesas: r9a07g043: Add support for RZ/Five SoC")
Cc: stable@vger.kernel.org
Reported-by: Hien Huynh <hien.huynh.px@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g043-cpg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index b97e9a7b9708..da5aa015790c 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -138,7 +138,11 @@ static const struct cpg_core_clk r9a07g043_core_clks[] __initconst = {
 	DEF_DIV("P2", R9A07G043_CLK_P2, CLK_PLL3_DIV2_4_2, DIVPL3A, dtable_1_32),
 	DEF_FIXED("M0", R9A07G043_CLK_M0, CLK_PLL3_DIV2_4, 1, 1),
 	DEF_FIXED("ZT", R9A07G043_CLK_ZT, CLK_PLL3_DIV2_4_2, 1, 1),
+#ifdef CONFIG_ARM64
 	DEF_MUX("HP", R9A07G043_CLK_HP, SEL_PLL6_2, sel_pll6_2),
+#else
+	DEF_FIXED("HP", R9A07G043_CLK_HP, CLK_PLL6_250, 1, 1),
+#endif
 	DEF_FIXED("SPI0", R9A07G043_CLK_SPI0, CLK_DIV_PLL3_C, 1, 2),
 	DEF_FIXED("SPI1", R9A07G043_CLK_SPI1, CLK_DIV_PLL3_C, 1, 4),
 	DEF_SD_MUX("SD0", R9A07G043_CLK_SD0, SEL_SDHI0, SEL_SDHI0_STS, sel_sdhi,
-- 
2.43.0


