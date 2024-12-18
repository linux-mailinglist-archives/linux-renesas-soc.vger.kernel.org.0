Return-Path: <linux-renesas-soc+bounces-11545-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 302AF9F6830
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 15:22:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7647B18934C6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 14:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C471DFD9C;
	Wed, 18 Dec 2024 14:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nFdW+Qkn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8534E1C5CDA;
	Wed, 18 Dec 2024 14:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734531661; cv=none; b=HhKo+gSlQGxqyQVx4I57oCdWvMt8dEyffxib5bPL8FrtuEQXmh38UofZNq8yrnI8hGvO4XbI5G0Kmz57XxYsu2HUK6KDl1xr4fOhpy29Nhe2moIMeHPNjhQ8NnLbOMoClvGVNm0sXX/d4okKSZnG4Ep5+KSU17qybFxojPE5MDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734531661; c=relaxed/simple;
	bh=ZdUn1eZ8PxzARU+wmajVvceff/9hM5OkdTDmgJirXes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fUAAJ0NatfrcIAX8mXtG/aGkn2PKGuyycvSceQLx5w2vC2YMSAikSLh/5mbViUkqSq7zOyd3fmQHJH6+L2PDSRmX/ENms6DL4SVMwSGEz+dO/rUM+4U4fG6tehvlj7vC2EOgr0sjTyzzitIeKDqB7GErEumNusvaGGPRJoeqpyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nFdW+Qkn; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3863c36a731so4732634f8f.1;
        Wed, 18 Dec 2024 06:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734531658; x=1735136458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/wPRBxwXQr6qi1bj2F1wQGHx6oV7CcRt3Wr/kJbxfbI=;
        b=nFdW+QknA72GgBVNptx+QKtPHtqKvSTgKmQqfciLcZh+RVMLiw58EPNDsK4s0OZrc9
         LVRm9y4eSoyKOix+O3t1X1OeIHZK0YQW7BKsDxzef6BJqjU96YzE5EL+2rfB6DxqRpKK
         AVLHubuMaHBSbwlmwzm2NQ0iYqneW2htO/yEQVawka5TRj/Ed//RKaEQ5X0uz016yd2e
         4jSXQMXbeHhdVUBYDkx1gkH65fVHc13DlNtuQrINtBcZpX6CTb+9Q4f0lXfBfzPz0jpe
         hTZTzcFAx/IJF4Day9/Mgl6pXYPmu2qVsrBRMPgHb4JC9fu17mnWGaZiORR1/O1rP9Ip
         FwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734531658; x=1735136458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/wPRBxwXQr6qi1bj2F1wQGHx6oV7CcRt3Wr/kJbxfbI=;
        b=OsQOWVoCe0WWg8kPv0CXz90zGXoKA59xjrbxAc62UTBijldogauDkhLvspk9g5pBST
         X6XfPulo/3eySWIyKX1FnZIWD71l+Rs24u9QeuEIPs9pt8DYSsJiipcKgbAwkIJU9zEk
         nRzZjgHTvFhH8TQDAd0lXmlvLNl0Aep0/dMdndDDn/Xhsyc3HEaOk7aPL8s6h8P6ET2a
         n8V8xs6d/ZDIhHR3MDbDJj0iTtKQuNXL7aqKVwKtW6Q/n6LEJtHmvrZsztofw/Xk6smZ
         alSnx7RiYrUh9xqQnZpJm0tn2HZ1Z9X/U+zmWm1p0/4Wq9mTB0C7TN4FlPwqRNVFILYU
         YiPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMBWIZf4xFCbgCoahW5U4O/rtuhCJkF3JMfZVhtdMalN2YwewV0Qm2veCz/1MvEM8MN7xOQYVHnhM=@vger.kernel.org, AJvYcCUzu+YzqjJNbUdFMMrI4jiqLyeO22KL6Qfz2T4MxoXtBchW1wrzMfSclku2x22CiXA/qCJvISJkRp2Yp1Kq@vger.kernel.org
X-Gm-Message-State: AOJu0YxRMaZ+swP4uCb0jHW4lQACkeoayr4N5XLIXdvcmrF6LwT1R1Uv
	OJd9qcw1FZqDRobw5iKsrVvYUSKnz3GN7zyfJu+D1nFMV3wNAbYh
X-Gm-Gg: ASbGncsUFCIGLsRhgOwzXTUDJ6oLX1yvp1kbd/GDoMTiIlCXFpi3RhXAqb3nE8E0L4S
	fIITC4frP52I4hP7oZbyjONH+ivsN6odaITZht1IHlbT+OjNkFFk+Cu1xd2uLBscbpASC17nixY
	UWsm+w1dApI6uVYnYAMsmfuJqz1spA+Xy+uAV+L02pY0I591ZHtX0MhBdWPThN4t5BvNfPCcOs6
	4roM46r63Lt06m8VILo2aAh1VPAmBkVL0HuF9TgNKzpNtqfuPqcloplzqsTKQuvhDFe2C/xkYC3
	LFb/ykMspg==
X-Google-Smtp-Source: AGHT+IFy23ae27JfhnUcgRwv/BCbx2Dk5qDQAWbELnkQVOZQ2tGejMuCe/hbp0wK4ILT/cYrsSOuvA==
X-Received: by 2002:adf:b182:0:b0:388:cacf:24c6 with SMTP id ffacd0b85a97d-388e4d4afa9mr2051380f8f.22.1734531657667;
        Wed, 18 Dec 2024 06:20:57 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:9516:68be:c7cd:69f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c801ac68sm14107033f8f.51.2024.12.18.06.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 06:20:56 -0800 (PST)
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
Subject: [PATCH 5/5] clk: renesas: r9a09g057: Add clock and reset entries for GIC
Date: Wed, 18 Dec 2024 14:20:45 +0000
Message-ID: <20241218142045.77269-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241218142045.77269-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241218142045.77269-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clock and reset entries for GIC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g057-cpg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index 856a02ac7ac5..947efb1a5914 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -117,6 +117,8 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 	DEF_MOD_CRITICAL("icu_0_pclk_i",	CLK_PLLCM33_DIV16, 0, 5, 0, 5,
 						BUS_MSTOP_NONE),
+	DEF_MOD_CRITICAL("gic_0_gicclk",	CLK_PLLDTY_ACPU_DIV4, 1, 3, 0, 19,
+						BUS_MSTOP(3, BIT(5))),
 	DEF_MOD("gtm_0_pclk",			CLK_PLLCM33_DIV16, 4, 3, 2, 3,
 						BUS_MSTOP(5, BIT(10))),
 	DEF_MOD("gtm_1_pclk",			CLK_PLLCM33_DIV16, 4, 4, 2, 4,
@@ -222,6 +224,8 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
 	DEF_RST(3, 0, 1, 1),		/* SYS_0_PRESETN */
 	DEF_RST(3, 6, 1, 7),		/* ICU_0_PRESETN_I */
+	DEF_RST(3, 8, 1, 9),		/* GIC_0_GICRESET_N */
+	DEF_RST(3, 9, 1, 10),		/* GIC_0_DBG_GICRESET_N */
 	DEF_RST(6, 13, 2, 30),		/* GTM_0_PRESETZ */
 	DEF_RST(6, 14, 2, 31),		/* GTM_1_PRESETZ */
 	DEF_RST(6, 15, 3, 0),		/* GTM_2_PRESETZ */
-- 
2.43.0


