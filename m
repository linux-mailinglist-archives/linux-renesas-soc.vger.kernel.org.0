Return-Path: <linux-renesas-soc+bounces-21356-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C61A9B44130
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 17:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8ACDC189D24B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 15:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9623828314E;
	Thu,  4 Sep 2025 15:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iGRn+jWP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5652727FD;
	Thu,  4 Sep 2025 15:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757001324; cv=none; b=Uwh+ijRPadZB90t5eOL9gvTAdCH4Swz6GeYa0YyrPwLd5Q4nF1rfwCJBilzv1ImYWkTM2Rt/9hmD3LXlKTW1JUTSfQ3jLMj0Ii4Oek7RGVcMGDC3Hf0rjeeBDyx/LIgQbGhf8gt1GwkSYLHdtShkrwaaiC8gEky6dTBywbVuAWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757001324; c=relaxed/simple;
	bh=LnEl45Sgzw467sH+nuP0UddpsZnRnFMJuef7ZvwJvG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KttDw1AwJvvg/UTl6RWaQscbdWreh5H0w9VEvjalz50wAHth2cK4DPg5Ne2ciyECWtWwM9besNnpeEPrwiUHtzb3JIhWhnk1CTSLEBzCxZe/wf6amrcLI1ntREXp17Rgk71Tqx1SsfzPwCpqZZrVC/arj7jqRphFrX8uZtucXh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iGRn+jWP; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45b8b25296fso8275815e9.2;
        Thu, 04 Sep 2025 08:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757001321; x=1757606121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ClOixRRDQZ107WogcJ92bGYDOGIgcAVRH+5UUbg4R5k=;
        b=iGRn+jWP6+fPcZaBul/VINXA/gvdSSvjtV9lYTeU2YmmdXttQoTdaIP98tyPvE2BTO
         U6QplLYumwk0Wqw2t7PbtkDfaFAvr+giJLonSdfhEqJyrYpi7YCzOVr+lGgGeGLhqvOa
         1VaUCtpcsA++bA3WWVi9xlLJTUls2RIE/0/LHR5CunnUhYRM2esHnJQdmFHTsYkBaVxa
         9w84OYpI7M4x1SPcggCsgx1geEHnGdD2t15ffRJj78t2lX9lo/oxGIcvml5ETM+cJJ83
         aiUXakbGbUAGHAIBJAMKp4u8kU0NwfyHj1sOjjesV6YbYXZfdPbavWmdisP8a7zKgcGM
         eRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757001321; x=1757606121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ClOixRRDQZ107WogcJ92bGYDOGIgcAVRH+5UUbg4R5k=;
        b=mf+/FxMyUW0xZJNsC8FZ2KSSrmn+c4Pu5lIFDFMCZw9NsdfXMFIqivcm9rROtxyFj7
         7FduN16LCRRPbAOmNOlRqeG07sfDj9kGH4zF5/dRqd9YS3m54E4ITHTVEJItaP5njduK
         QA9R2d/81307OyXR1KNULVaW5Y5JL0Nbxx66fvqa1Y2HCSUkwoMS1B0enUsLIDM4RvRp
         7kCFc8gQyMzitvV7qoXI+HHKLI4KvimtkYYXoBq/K0wOA1fIqWIYk2QyhC0VfiJgj+11
         SG+uGSGCT1C9ZezSDtaj3X9U96cITvqUaW87Pwie3jN2SWDxVPGtgGkFDYCOvj7Ho8rW
         8sRw==
X-Forwarded-Encrypted: i=1; AJvYcCWhC0f5epsUcnEcDQ+vrSLqeBf66Q6FfYZL0A4sIGiPHt9fJuEMROWFQ32aI3Q3fDvOwpPg1gL5O+Q=@vger.kernel.org, AJvYcCXMf04KGuu3xv/qe7u4ceti3j0jyeQ0uB5emLk4XuMK7F8zYt7dNklz5ed/bFCHvNBNqmjI+H/S9jx0WA5t@vger.kernel.org
X-Gm-Message-State: AOJu0YzzZNh9GtDZdBdkgU9Joc+acBhuFQC2AE1csaz+GZWkPj0vywNe
	iPyo2BsR8asuvQPaDmEGejRBmEqBRUenwAKnzGliDqhFU3Ht+XeN4/5P
X-Gm-Gg: ASbGncv8LTV0X99G2b/sbjWI9uYZJOwgYKE7pRdyvBbHh0ekqxKkErgLRIkqyQxmBy1
	YKHTpBq0JY4FgQqchsYdvkHIWE16v7pQfiiamwTSDz8m4Tudc8tFXoagH22KkcDcpXvbiWV2bwh
	PTRRYOQBKyXVcYSR8kJB1c+z7wx6HcbeiF760JDmWC0YSpqKloT4Y/V/r0kZY9UIKC1WQeMq1JD
	xN0e6IXxUBEtR6uNzAFm5QivYj8OwFZUff13m70O/etzem0J61dK3sfJLY5BZsC5yd1MGQre/XV
	hDkByJ1pv9hp4fBTbkoqkeB9+VY9nwcHWHELYpe6z/1d4OhgIHPQUSjX8XmI0fSKfVZagHviNjl
	04mJfCym5kCFfxp95TaDljHQ1+36xRbdG8jkq3v0bqMUQIHAGk+bzRN+tbg==
X-Google-Smtp-Source: AGHT+IEf/oWbTRe7EIHcg/OZ4EJpAIinYADhzY0HwYVLoVSehLuUCRWtgpxsQbkD1pMvvTCoFVy2xg==
X-Received: by 2002:a05:600c:a59c:b0:459:d645:bff7 with SMTP id 5b1f17b1804b1-45b8556a7b7mr111642675e9.12.1757001320898;
        Thu, 04 Sep 2025 08:55:20 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:904e:70c8:edf3:59a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd064003dsm19485215e9.6.2025.09.04.08.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 08:55:20 -0700 (PDT)
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
Subject: [PATCH 1/2] clk: renesas: r9a09g057: Add clock and reset entries for I3C
Date: Thu,  4 Sep 2025 16:55:06 +0100
Message-ID: <20250904155507.245744-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904155507.245744-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250904155507.245744-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add module clock entries for the I3C controller on the RZ/V2H(P)
(R9A09G057) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g057-cpg.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index f94040f9d8a3..e84fcd5cf648 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -303,6 +303,12 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 						BUS_MSTOP(11, BIT(2))),
 	DEF_MOD("scif_0_clk_pck",		CLK_PLLCM33_DIV16, 8, 15, 4, 15,
 						BUS_MSTOP(3, BIT(14))),
+	DEF_MOD("i3c_0_pclkrw",			CLK_PLLCLN_DIV16, 9, 0, 4, 16,
+						BUS_MSTOP(10, BIT(15))),
+	DEF_MOD("i3c_0_pclk",			CLK_PLLCLN_DIV16, 9, 1, 4, 17,
+						BUS_MSTOP(10, BIT(15))),
+	DEF_MOD("i3c_0_tclk",			CLK_PLLCLN_DIV8, 9, 2, 4, 18,
+						BUS_MSTOP(10, BIT(15))),
 	DEF_MOD("riic_8_ckm",			CLK_PLLCM33_DIV16, 9, 3, 4, 19,
 						BUS_MSTOP(3, BIT(13))),
 	DEF_MOD("riic_0_ckm",			CLK_PLLCLN_DIV16, 9, 4, 4, 20,
@@ -462,6 +468,8 @@ static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
 	DEF_RST(7, 15, 3, 16),		/* RSPI_2_PRESETN */
 	DEF_RST(8, 0, 3, 17),		/* RSPI_2_TRESETN */
 	DEF_RST(9, 5, 4, 6),		/* SCIF_0_RST_SYSTEM_N */
+	DEF_RST(9, 6, 4, 7),		/* I3C_0_PRESETN */
+	DEF_RST(9, 7, 4, 8),		/* I3C_0_TRESETN */
 	DEF_RST(9, 8, 4, 9),		/* RIIC_0_MRST */
 	DEF_RST(9, 9, 4, 10),		/* RIIC_1_MRST */
 	DEF_RST(9, 10, 4, 11),		/* RIIC_2_MRST */
-- 
2.51.0


