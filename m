Return-Path: <linux-renesas-soc+bounces-19979-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FB3B1AA1C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Aug 2025 22:27:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B24467AE4D7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Aug 2025 20:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A79523B605;
	Mon,  4 Aug 2025 20:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Miy7X50C"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80ED236A73;
	Mon,  4 Aug 2025 20:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754339225; cv=none; b=X2xMQZGAEqA+gTqagu5j+hpdPXbkgrXmdlz5G3hzLHvMg3tQzlfTdJnL5J5z+S3YW2ZSDG9GTB+S08Rms34TDqvVEGk1E6YtR/7hTK0cXita38MBXjluIn9ECntQL1wFl7f3GNbIw1s88O5zj7L4UljM/4D9FvVzNEe0eJFgwEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754339225; c=relaxed/simple;
	bh=6F8xOo+r3WQ4Ztrb+pfTrQ0hqMK6HlqSWkgWwBg1wfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NAn3tbLKN+Tx+bpOw919QuHYvykmy2H5pmWJjzgcs33ET+kujWvlxg9c5HbTPYa9kbgYwZxSM/rpN5ZBI2E8z0XKh06PPPExaSLso+TPbHuu6nxya6mBg5x9XABcqyZS8m+GZH4KE1Abv8E0DjuNGCQXbK2LGuIrBXjmxsFCHhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Miy7X50C; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4563a57f947so18923655e9.1;
        Mon, 04 Aug 2025 13:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754339222; x=1754944022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0A2D/grLeZlKkS26LrhAIg9mN3AfC85MpEo727AqVQ=;
        b=Miy7X50CD2JkHm3bOpNiR4GMJp/neD65AwlD6zFCempx8ps9UKJ+VxuwnICIM06SL3
         MOKrTRjw/LXkXWOS/IhPTX57TVacH5+C4bZz+v37wa6QQDToqIgYk8iL1E2I3Oa9JCik
         iBzAKvRznl96grwKQHeOhloq8F0CGo6CUJ09dfRpzw38E3FQ/UBmycryFFI/ovfd6flh
         pk70fmHwzsAH+sotoRj0l77SfNkf8xucDy890D+6hmE2HJFakbpEMMzWvl1HPukybyhR
         nuk5APJTArlpmPJrhDE51yTnLaMn8ArPta8lKc2VoHWKOtY3LWagJAdmzf1LeaBlg1yD
         cUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754339222; x=1754944022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m0A2D/grLeZlKkS26LrhAIg9mN3AfC85MpEo727AqVQ=;
        b=CDUKlhtO7Ks3fRU31yae5LjDrXtbppgKssuYL3u0S9u9dDtul9NBiTZ+5X4VIZy3W9
         CkNHzQFt4WhgZfP+2XXF2CS2xP0UuZPqK1ToBeOW1gqJzfSmrVrgKlTDfA8yi4sWuyCr
         zKx7DlzSYWYU4t0svJJHmINWjpdL7fVEC7eTlkWj41cFW8ipIZzIFRncFcwH5npdFHu2
         tr+7otFOGHepmGqsCbT/2RFrV75l1IwsAFlNBpZe+dDtgyQksTDrGwAxv6sTqj+C0ZR8
         P4YDj55fjLt+W0vxiKh+0z5juCNnS0Ty1bLy9+deTzOvfoOMHYYfz+KIGwfLOk/gfvq3
         7m5A==
X-Forwarded-Encrypted: i=1; AJvYcCURjIFcv22OQPe90hXognpNQjwqdZeXLHsLRg/JfZ08/e4XMW0EiliWcne0JWWlC7n41lI2OcKRyNMn@vger.kernel.org, AJvYcCVaUCkiHxHDboa9Qk03FFqrmCO+2YmfcG7HPDSWxnyRD7NYk5ql+TY5WyRMHw0bppYVNrrvlXiPkGYZy2GK@vger.kernel.org, AJvYcCXebSYBo2YD0RT52SzIujEErducyQ/uyWjTRd9RSCI7VOXAM44aHnJ5tEzK/Rfmh6wl6oSjZZxX/L0n@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0vOI1M/DwMDbIrbVDYrYTot3cVHLI5dbq0toIf1k/PuroM2RL
	giMD2AeSDM8IKVfPCbQ1M55YiKqcFYAL6ij4GFg4G9a0pcuVJczx8j92
X-Gm-Gg: ASbGncsoh7d5TG1TTPNTYqqh+K6ADhNAS/hT4SAdQR4C7++NCs2fWwtT4MhZbsos/YL
	7NE92tegyQSkTEgf9ueIJpv+8pyJIYcuRv5R2lmh5ciptUM+QGytjP21Vv9unLVTPLf1ObZ96gv
	EJM/rz95mmDt+MwQmhCv157RV4ZOPgzplXtQtX4gPAp6mX4O5ipZhRm9GWiaBy81RNd2EjiD9DE
	PLNYxGQ0X8yMuJrEEOg+0tAJzYvVkZ+c5Ylv8kEhYfFc5T5VY4lBeDUkrl/sLIp0Qzx1qGvlqWl
	hh6Hpx+Uvb5VPKbAzjlpnXWcjgK+/lLmc7ruHpyC60uwxg/exHg4EssLUl9DUcHUotHnDfk6rtm
	YWOUFUcpbbiZp5GKmcCB/j2uxo4JzQd0K7GzRsD1E8vzlkw9OL3Ymj1zkAsUhqJ7M/U9/3TCCyx
	9wTjlPq87f
X-Google-Smtp-Source: AGHT+IHjJcbmt6QEsKvFXpVelH1J0WEhEzqBsxkPPRird1uydi5KA9Fi9HN0QWyPaIPXX2GVxj8UJw==
X-Received: by 2002:a05:600c:4f05:b0:456:2139:456a with SMTP id 5b1f17b1804b1-459e0ce7d7emr8461045e9.15.1754339221934;
        Mon, 04 Aug 2025 13:27:01 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c469319sm16396126f8f.54.2025.08.04.13.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 13:27:01 -0700 (PDT)
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
Subject: [PATCH 2/2] clk: renesas: r9a09g077: Add USB core and module clocks
Date: Mon,  4 Aug 2025 21:26:43 +0100
Message-ID: <20250804202643.3967484-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250804202643.3967484-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250804202643.3967484-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add module and core clocks used by USB.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g077-cpg.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index c920d6a9707f..704d14d31e87 100644
--- a/drivers/clk/renesas/r9a09g077-cpg.c
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -67,7 +67,7 @@ enum rzt2h_clk_types {
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
-	LAST_DT_CORE_CLK = R9A09G077_SDHI_CLKHS,
+	LAST_DT_CORE_CLK = R9A09G077_USB_CLK,
 
 	/* External Input Clocks */
 	CLK_EXTAL,
@@ -150,12 +150,14 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
 	DEF_FIXED("PCLKL", R9A09G077_CLK_PCLKL, CLK_SEL_CLK_PLL1, 16, 1),
 	DEF_FIXED("PCLKAM", R9A09G077_CLK_PCLKAM, CLK_PLL4D1, 12, 1),
 	DEF_FIXED("SDHI_CLKHS", R9A09G077_SDHI_CLKHS, CLK_SEL_CLK_PLL2, 1, 1),
+	DEF_FIXED("USB_CLK", R9A09G077_USB_CLK, CLK_PLL4D1, 48, 1),
 };
 
 static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {
 	DEF_MOD("sci0fck", 8, CLK_SCI0ASYNC),
 	DEF_MOD("iic0", 100, R9A09G077_CLK_PCLKL),
 	DEF_MOD("iic1", 101, R9A09G077_CLK_PCLKL),
+	DEF_MOD("usb", 408, R9A09G077_CLK_PCLKAM),
 	DEF_MOD("iic2", 601, R9A09G077_CLK_PCLKL),
 	DEF_MOD("sdhi0", 1212, R9A09G077_CLK_PCLKAM),
 	DEF_MOD("sdhi1", 1213, R9A09G077_CLK_PCLKAM),
-- 
2.50.1


