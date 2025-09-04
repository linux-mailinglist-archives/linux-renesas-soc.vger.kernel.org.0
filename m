Return-Path: <linux-renesas-soc+bounces-21357-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A34AB44132
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 17:55:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F2BE7AD13C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 15:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20DB4283FEF;
	Thu,  4 Sep 2025 15:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NvVa60W1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C52279DB4;
	Thu,  4 Sep 2025 15:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757001325; cv=none; b=pLrRWrhQREucAbyIwrkM8uJdNZvTZLQbg5ymvCJGuRcWMgz8mlG5KTdd3wPabb8We2QtSwOz3D0MZFJlbOp0r3H4h9tPPw3ksJASZyyu973s5a+iT7LM5etK+v09o5AAhzXquQ2EGw15ETkfxvSiuU9pcpvEqrAjsqyJbHkZIkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757001325; c=relaxed/simple;
	bh=LODLpYIm29IHAEz/C2ylPJJsM4EB69DPyHOZrM8EXy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GwhF1vYoqqZjH9P7TM4eIHI7aMeJKF8GGJaKh1HjmNX8kwuStiwvKo5V0sZSvxsXAlKCnfgIrJdwouRMkNYi50JeiRucrcVz+TO0BFH1/Xicop0jbjR7kjEgynG3IFWPgA1LS9PMb28KrD1ePVwvhKJcHjjfSsZ7BEUzRAuf2TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NvVa60W1; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45b7da4101fso4519335e9.3;
        Thu, 04 Sep 2025 08:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757001322; x=1757606122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFLMQguEjkfrkezxgMQEgsIAslHjm5YbT5ErttJO06Y=;
        b=NvVa60W1UyGKR1DFzeQlbob/ariRMPP1X8VoU52miOXLLPUNvpB+2ncCcZNDMhbs6I
         XkJihqBa263Bp1HYvM34m+UslowtO7TMhwp4OH/wA8f6jysgF69qYXq64Rt6kHSvBdIu
         a8vNwLn9aVhfCkvXVR2VJQfgl7uGFzfstGNXGVyHAEaQdCqXQwa/zTS1MJFANklZka8/
         QQkcOj51YI88XuVq/f809ZzU9j2TZbucUUaT0k0HmJLkkIKGqI2zC0rJiyYHK/LSe9a9
         WSLuTqM65Qtald9N4mHNIqlIAbs5Brpws8DiXuLeLc3FflKeo2R5Kw0nnJDbG/hM65jM
         sTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757001322; x=1757606122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFLMQguEjkfrkezxgMQEgsIAslHjm5YbT5ErttJO06Y=;
        b=qENz76nqkHvEfOGzmlkWfmKrA4+P5Z19JbpxzaDWYEbG/I9z/Fxcc5pncH93a43qH3
         PEnwHw+rukVbZbC3YcYn+YUUv908iSzMeIKCSPAvp8QaYurjV6mNonqHyYjHGKDzWJmt
         nYRvP6ljPjoHxhy6W0G4MnAV/OdQW3j/n/vlOfUZJ3dE7TS7RVJmRSvwn7Wzuizcg9vl
         mALx0Bj1ISI9OLKU/egf5kQMeOTIwPRJicBuB0A8jiNGZcGKG3esPMBEY5qhuYtDAnxY
         rA09FWT90u3vw7dR6tBoPYBEVDlwktpnF3dQAd+scZXp1NxplPDh2bNjiIteWCQ0HkdH
         phTw==
X-Forwarded-Encrypted: i=1; AJvYcCVXEdbJ6PE7N9AGmHNLwQ0xMq7EGtp5lChvLDi0vFLA+PJrPy5WZZQvYBsphm2Nn3wUOMmGmF+qu0R0Jo2j@vger.kernel.org, AJvYcCWM2stD0RpDt/ZZz/MrI6uTWVMSOQgSB4GhJ9m1QYY6x5Dl8iiUBRLiKvTt/SYOos8/ehjyaqEE8MA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+dvdMqpkRogoO9dcc2OqmSd/a5vpDTWEXe/yhtD349aNum7Z2
	o8nStC4cuj0rbRRMs1uGZG3bUZWlepeH5oDb5tCVi/RuahwLOmtwazp6
X-Gm-Gg: ASbGncsh0y/69YY6M5KYavLd/28W3Z0501Zzrs58rilcmsCicNkvZR/4JjphFzKjDr9
	2vDjDkFu25d6zvt0621UsjmMIM7PQ2AhM0My6qsWK5mBVtFD3jx5C7gVe9OehIhgHOeDxIJeBHF
	MIzeDSAMJ9WXP1sWef6G9N4o3eMJZBWznSW+NV8+/vit+qsdKjAv5VacKn6DZYEmrC1gLgkNkSu
	OGcrcIRhB6jSXUMBFyKp/YrFM34VsnYQv22OdG+rYYruTI2iGxFxQqgOpwKPZFsondLZcApHrYf
	XQUUpPIkO4M0TaiYn2Fim3p73X2JXHlcnOCY9kk0EgLYaqMQEzeqJVHN9e6tMkKnHiZMeN85W23
	HefYi4LiDBVABR0yrTUivGbkMMCvrONSjzGEMTp3Z81oF7ThqWIqa6pKKtA==
X-Google-Smtp-Source: AGHT+IHwussefcgAQc+Hp/VqXwhdtH/rTfjOKnxW3eQSw8eqwVe3TK1JAdsNKftvZrQw5HDjulXpLw==
X-Received: by 2002:a05:600c:46c8:b0:45b:7c09:bc0e with SMTP id 5b1f17b1804b1-45b8549c7admr161106735e9.0.1757001321695;
        Thu, 04 Sep 2025 08:55:21 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:904e:70c8:edf3:59a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd064003dsm19485215e9.6.2025.09.04.08.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 08:55:21 -0700 (PDT)
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
Subject: [PATCH 2/2] clk: renesas: r9a09g056: Add clock and reset entries for I3C
Date: Thu,  4 Sep 2025 16:55:07 +0100
Message-ID: <20250904155507.245744-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add module clock entries for the I3C controller on the RZ/V2N
(R9A09G056) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g056-cpg.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9a09g056-cpg.c
index 437af86f49dd..f0a8c5073fa6 100644
--- a/drivers/clk/renesas/r9a09g056-cpg.c
+++ b/drivers/clk/renesas/r9a09g056-cpg.c
@@ -205,6 +205,12 @@ static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
 						BUS_MSTOP(5, BIT(13))),
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
@@ -308,6 +314,8 @@ static const struct rzv2h_reset r9a09g056_resets[] __initconst = {
 	DEF_RST(7, 7, 3, 8),		/* WDT_2_RESET */
 	DEF_RST(7, 8, 3, 9),		/* WDT_3_RESET */
 	DEF_RST(9, 5, 4, 6),		/* SCIF_0_RST_SYSTEM_N */
+	DEF_RST(9, 6, 4, 7),		/* I3C_0_PRESETN */
+	DEF_RST(9, 7, 4, 8),		/* I3C_0_TRESETN */
 	DEF_RST(9, 8, 4, 9),		/* RIIC_0_MRST */
 	DEF_RST(9, 9, 4, 10),		/* RIIC_1_MRST */
 	DEF_RST(9, 10, 4, 11),		/* RIIC_2_MRST */
-- 
2.51.0


