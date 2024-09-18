Return-Path: <linux-renesas-soc+bounces-8997-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E0697BD83
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Sep 2024 16:01:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CA121F24A76
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Sep 2024 14:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9240E18C352;
	Wed, 18 Sep 2024 14:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jTIeW6f6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73D218C029;
	Wed, 18 Sep 2024 14:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726668027; cv=none; b=Ug0ufV4Q8iNWoujPJP3LFEQNa4CJMav0grPZXKwRZIg34BLXiTQjSGDrnKWfD/C4YrKbDMk7R5zhD/mQvdC7qrv8LQudFxn8OuHK8GYEt1uC/zN6/wFUEkvdca9RMJ1IihK7tmaI3ViKFGtbVT2aqjq1woaQzd14XhVsluQ5QCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726668027; c=relaxed/simple;
	bh=KEtGf6HmdMYHaZ9RCRIH2yfhCQ1fDsi0eLvOUTqcDZE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TJkNcJTb5kP1/cJJGh4NDJ2DozmVECmXZBJnJ5GFn+e4bdPBV+cR9RqsUvgn80G1kVsArHlDjCQ85UNV+y9+qn7OUn9wwFZCp+7FFAN5YgjHI2swffWiDKkFGXvLAZqp6MBD0Gvye/Ee5Z6raaPhiY7xZieY0bXWKSqusnZuM0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jTIeW6f6; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42cae102702so46868045e9.0;
        Wed, 18 Sep 2024 07:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726668022; x=1727272822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B5Xbmpy6v6pWsNREd3+6VoQ9i2+Ug3PNQHxuk+oN7X8=;
        b=jTIeW6f6X3lYZG02oSVZJ1kaka6aDZFgiDh6/AoK0Wc3ll0jyIamf7J4SoqTa4ymA1
         Q4eapZQaMkKTN76BlE7m3R2Y3p+S4wAhm7qqMNk8qNgs5OmjpICNzYDUNAs4x6QoJtwb
         5z+pVohYZSJOkZdhvkkkfAAfq2hujgL9VH760f1kOZ3VWvL3hVk+VDYjmVoY1NwQdZR/
         +j4KfgNXM51+Wl939aLh/O6lpOk0bkUxnukEKh4DMd+yMKkc7bu9XcgVuLnb3Y4ioHwa
         p94QWaPcXPQpqvJwY+BtDrGuA5PJ/oFBbcKaGzKwVre1wOrYTALvlB4KOsXXk/a81Pe7
         BgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726668022; x=1727272822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5Xbmpy6v6pWsNREd3+6VoQ9i2+Ug3PNQHxuk+oN7X8=;
        b=egyFI8w05RHINLeYDJjzNyVGxDF7HSYLg4EPawZ+Q2UDwSqRcEcF1BVDbEOsunU1dn
         UEn3o4kUcz198Z7DMXRIAaopsDsbY86Vxx8/JqnnaP69Hr4usbQtUSjZYNaCbsDhFSNC
         BTy/f41QZxDIhF6AxSrgILUeiv4eVgqtiTYNYf7NtGJlHyHoSZ0ZbdanROsVrnYYHddg
         NNQ3OoZpgscuRaWJqKXaBXHZUbyCdfrE8nerh7cAGmuHqfHkzZafQ3LdSJuJr+ojb+S3
         OERxvSjQsgCQzaSug4xrOBudHdovfbxeN2bo54+vcg0F29BK/szqwpqmDHMqG4mynEm2
         sxUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVklqwDWBeCx+I/xdw+AN4Hv8ncZhqbMbqV6Cs51A1yzIalAlj8OUHAVo7IO4v66qb2wG9RJdWTDLg=@vger.kernel.org, AJvYcCWWbqMHFC9we2v7yIbkKQzAlX7yLUaYzq8qZVDD4aLmis9GdRWgrm0VrW4D6mK3zewX2Ng0x8aR6LPUXqym@vger.kernel.org
X-Gm-Message-State: AOJu0YwNu/3pxLc0/qYc1P4y82tBg9HiseVhJf4c+U2Koi7pTIpXO0/B
	yNVl3n3rPP7ahTgek/CwoYMr+EqYUypMX84KpgBe9IYTCFccRSa7
X-Google-Smtp-Source: AGHT+IHbEqPSMCUcoSqtLPyaZBqlpj5Uvorf2iJ37KTJXr9vai7zfKDCPHObgt39844jCP5qA/sv2w==
X-Received: by 2002:a05:600c:501f:b0:42c:a7cc:cb64 with SMTP id 5b1f17b1804b1-42d9070d985mr134813735e9.3.1726668021765;
        Wed, 18 Sep 2024 07:00:21 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7053581csm17765455e9.46.2024.09.18.07.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 07:00:21 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] clk: renesas: r9a09g057: Add CA55 core clocks
Date: Wed, 18 Sep 2024 14:59:57 +0100
Message-Id: <20240918135957.290101-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add CA55 core clocks which are derived from PLLCA55.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g057-cpg.c | 16 ++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  5 +++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index 3ee32db5c0af..d7e88550c1db 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -41,6 +41,14 @@ enum clk_ids {
 	MOD_CLK_BASE,
 };
 
+static const struct clk_div_table dtable_1_8[] = {
+	{0, 1},
+	{1, 2},
+	{2, 4},
+	{3, 8},
+	{0, 0},
+};
+
 static const struct clk_div_table dtable_2_64[] = {
 	{0, 2},
 	{1, 4},
@@ -74,6 +82,14 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 
 	/* Core Clocks */
 	DEF_FIXED("sys_0_pclk", R9A09G057_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
+	DEF_DDIV(".ca55_0_coreclk0", R9A09G057_CA55_0_CORE_CLK0,
+		 CLK_PLLCA55, CDDIV1_DIVCTL0, dtable_1_8),
+	DEF_DDIV(".ca55_0_coreclk1", R9A09G057_CA55_0_CORE_CLK1,
+		 CLK_PLLCA55, CDDIV1_DIVCTL1, dtable_1_8),
+	DEF_DDIV(".ca55_0_coreclk2", R9A09G057_CA55_0_CORE_CLK2,
+		 CLK_PLLCA55, CDDIV1_DIVCTL2, dtable_1_8),
+	DEF_DDIV(".ca55_0_coreclk3", R9A09G057_CA55_0_CORE_CLK3,
+		 CLK_PLLCA55, CDDIV1_DIVCTL3, dtable_1_8),
 	DEF_FIXED("iotop_0_shclk", R9A09G057_IOTOP_0_SHCLK, CLK_PLLCM33_DIV16, 1, 1),
 };
 
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 1bd406c69015..819029c81904 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -32,8 +32,13 @@ struct ddiv {
 	})
 
 #define CPG_CDDIV0		(0x400)
+#define CPG_CDDIV1		(0x404)
 
 #define CDDIV0_DIVCTL2	DDIV_PACK(CPG_CDDIV0, 8, 3, 2)
+#define CDDIV1_DIVCTL0	DDIV_PACK(CPG_CDDIV1, 0, 2, 4)
+#define CDDIV1_DIVCTL1	DDIV_PACK(CPG_CDDIV1, 4, 2, 5)
+#define CDDIV1_DIVCTL2	DDIV_PACK(CPG_CDDIV1, 8, 2, 6)
+#define CDDIV1_DIVCTL3	DDIV_PACK(CPG_CDDIV1, 12, 2, 7)
 
 /**
  * Definitions of CPG Core Clocks
-- 
2.34.1


