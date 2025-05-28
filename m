Return-Path: <linux-renesas-soc+bounces-17621-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C655AC6A50
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 15:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02B5816B047
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 13:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C36A286D58;
	Wed, 28 May 2025 13:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWjAUUJ5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8123C1FAA;
	Wed, 28 May 2025 13:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748438769; cv=none; b=e0jiwNzLtazEUOCt8X7Y+AfP6UP9B74tFN0FY/Sl4Q6fOKHHOLGZMyKYIcT9wiu/GG5rqdhZM7Bwtmc+loQbN/KXf6AxIzS8pAJVIpiXeztjauxF5h6Y6PrtxHA8BRJmeV/FV1t/FccmfvrwlaM9eIivJD/QhDOotQPTdHWXDBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748438769; c=relaxed/simple;
	bh=rxep3wf4faA2onypK2iZ/bRRCLhtffcSXOxeWi8D5cg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sVnJsbGA92GGtM0MjoS/SqB2T2a4NSmlM1TdJePeOIsH0N5LZo9Fhz52f+ZLcA8Awhc8/5baNWu5Zw5ZAXkn6Eat+GXAJwVAldFc82GThUN+EC6ppRYBSAulS9aVRN3kYH/YU5EFRs3436O5UXVWer0r7AeClbbhbZ+ASuZb29o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UWjAUUJ5; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-604e299b5b6so1766842a12.0;
        Wed, 28 May 2025 06:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748438766; x=1749043566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ieSLku7E97lhZ4UgdnDAb1QCFNhVxCm/IzChsnoZiEc=;
        b=UWjAUUJ5665ICvx61xNY6FK/9oHtzZc6a4KQT2vCkLxbY9HmJmQN9PvCE8psN6kP24
         TrtFqM3+4XuJP7yi29DrkTTqfMSg5HPA3Wwg+zIbR+AI+L2qKi5Nw6s7zdcglWziqidb
         P06TTV6bOJ+kYFt8+6MwuRa0J6qTQpLl6eChDTqnCDF86MlpHVrwcZrfMg77VKHlVpLZ
         qyUyjry3C6MEws4M0jnTF86M2kpwaw7jpynQ4fjD6R2kwHFeLZKwWwSPFppPNMk6p9Ik
         kvBez8B4rfuyY/OaQha+/XaVz+oEduN/04aOg2MPdZDZQMXcXzC296i3UGuKKqAnxzWa
         l2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748438766; x=1749043566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ieSLku7E97lhZ4UgdnDAb1QCFNhVxCm/IzChsnoZiEc=;
        b=LutXOfge8/OnymtH5ba8fcPsedAmbtgs43SOpWaVvRpbklmp3S4jeNdQnRWHhy4G2n
         PcaKu9RKzzEdokRo7eEWtDWsNi6wsAxcp4l0AWuUPBlEZAUyk+6jv+EJ89dB5ABRCe/t
         93GzfTA10S2olPfoTMF5yPVjjyBNOikHgawRzahDYpaBlNfUt1YqbehYMsioK6myA+U3
         N8xNZFruv11mE0oTF2SFYc1qnxA1kdJdPAWghwtGV1uq5/5e6E4NXyGNaYYErsKSh162
         cuRh8fBUQqMPTJ8BfdhTugVzgK9l0sQpAKAyoRzhhX1ZY7HmiNQeOTxqLxijML25iq0v
         6uQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIJ1P3hnSNpbX921UbzYKdMPx9tkpB231Pca3ZV8L/89UfALRqd8mAys8dzCK9xBzSdsZAThZT6mgV5HD4@vger.kernel.org, AJvYcCXQmg11sfpnl36i9hLkZYtX99HyUS1RLbPjv9F1sNTmlqPtUErbiWctvoW9ia9yCfWudjVW/QpSCCc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTUI0aRYqPYbIkTlXbVF5Do+p0IjP51nm3x73rePt3SyVFveR+
	dOv5gDfbtaVU96Zu+m6Q/jCJc6rVNbB3GKtvvS7wEOnV5g1jizZn8yOC
X-Gm-Gg: ASbGncuLkjeTbX7kBpWkfOyluXiyoVrV/5/mnNP1LJgIj828lnyjY58vbiSeTMnKiH3
	ZB9elTvVaSvztdF02h14E0JmWNlmM3U2IQ8fKXY3Z6gquJyJmcC1uUTrJO2Sf+PWRsYODnzouBW
	GrEApjTbUIjnSlXT9Va14DuW4zMlSXE+5bNI0RhYckDhumJYENnHeDhf0g8wwAqhzxsk8rYWM38
	WP6Jw+JQ5RzAsTfl2U4uSGUv2ILtrlUzDy1agj2L8EkW7mp/EIIUgL1ZvIY7NusH9J3sKN1nbP3
	3b/ESFVdYN+bZrJDHaOLiZ+mzcMjdRoGg4hoNyuUQrU680eXPRFYpxEV5GWTJqU/IGeNrT4obNn
	F
X-Google-Smtp-Source: AGHT+IGH6NhjWRQzveyywsEHiNFK4CABJe+WM0+dyFghWFFkW3BP9KOOz7lN2b71Pta0/mTCAqJMrA==
X-Received: by 2002:a17:907:9717:b0:ad5:6258:996f with SMTP id a640c23a62f3a-ad8989f78acmr418190566b.19.1748438765502;
        Wed, 28 May 2025 06:26:05 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:7078:193c:ccdc:e2f5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8a19ad462sm107742766b.4.2025.05.28.06.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 06:26:04 -0700 (PDT)
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
Subject: [PATCH] clk: renesas: r9a09g056: Add clock and reset entries for USB2.0
Date: Wed, 28 May 2025 14:25:58 +0100
Message-ID: <20250528132558.167178-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clock and reset entries for USB2.0.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g056-cpg.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9a09g056-cpg.c
index 13b5db79aab4..e370ffb8c1e2 100644
--- a/drivers/clk/renesas/r9a09g056-cpg.c
+++ b/drivers/clk/renesas/r9a09g056-cpg.c
@@ -134,6 +134,7 @@ static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
 	DEF_DDIV("ca55_0_coreclk3", R9A09G056_CA55_0_CORE_CLK3, CLK_PLLCA55,
 		 CDDIV1_DIVCTL3, dtable_1_8),
 	DEF_FIXED("iotop_0_shclk", R9A09G056_IOTOP_0_SHCLK, CLK_PLLCM33_DIV16, 1, 1),
+	DEF_FIXED("usb2_0_clk_core0", R9A09G056_USB2_0_CLK_CORE0, CLK_QEXTAL, 1, 1),
 	DEF_FIXED("gbeth_0_clk_ptp_ref_i", R9A09G056_GBETH_0_CLK_PTP_REF_I,
 		  CLK_PLLETH_DIV_125_FIX, 1, 1),
 	DEF_FIXED("gbeth_1_clk_ptp_ref_i", R9A09G056_GBETH_1_CLK_PTP_REF_I,
@@ -219,6 +220,12 @@ static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
 						BUS_MSTOP(8, BIT(4))),
 	DEF_MOD("sdhi_2_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 14, 5, 14,
 						BUS_MSTOP(8, BIT(4))),
+	DEF_MOD("usb2_0_u2h0_hclk",		CLK_PLLDTY_DIV8, 11, 3, 5, 19,
+						BUS_MSTOP(7, BIT(7))),
+	DEF_MOD("usb2_0_u2p_exr_cpuclk",	CLK_PLLDTY_ACPU_DIV4, 11, 5, 5, 21,
+						BUS_MSTOP(7, BIT(9))),
+	DEF_MOD("usb2_0_pclk_usbtst0",		CLK_PLLDTY_ACPU_DIV4, 11, 6, 5, 22,
+						BUS_MSTOP(7, BIT(10))),
 	DEF_MOD_MUX_EXTERNAL("gbeth_0_clk_tx_i", CLK_SMUX2_GBE0_TXCLK, 11, 8, 5, 24,
 						BUS_MSTOP(8, BIT(5)), 1),
 	DEF_MOD_MUX_EXTERNAL("gbeth_0_clk_rx_i", CLK_SMUX2_GBE0_RXCLK, 11, 9, 5, 25,
@@ -280,6 +287,9 @@ static const struct rzv2h_reset r9a09g056_resets[] __initconst = {
 	DEF_RST(10, 7, 4, 24),		/* SDHI_0_IXRST */
 	DEF_RST(10, 8, 4, 25),		/* SDHI_1_IXRST */
 	DEF_RST(10, 9, 4, 26),		/* SDHI_2_IXRST */
+	DEF_RST(10, 12, 4, 29),		/* USB2_0_U2H0_HRESETN */
+	DEF_RST(10, 14, 4, 31),		/* USB2_0_U2P_EXL_SYSRST */
+	DEF_RST(10, 15, 5, 0),		/* USB2_0_PRESETN */
 	DEF_RST(11, 0, 5, 1),		/* GBETH_0_ARESETN_I */
 	DEF_RST(11, 1, 5, 2),		/* GBETH_1_ARESETN_I */
 	DEF_RST(13, 13, 6, 14),		/* GPU_0_RESETN */
-- 
2.49.0


