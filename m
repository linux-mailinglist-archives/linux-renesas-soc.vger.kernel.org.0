Return-Path: <linux-renesas-soc+bounces-26416-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD80CD02B8B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 13:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE148300F8A1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 12:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112F54F2FA2;
	Thu,  8 Jan 2026 12:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXrAUs97"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1C14F29BE
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 12:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767875681; cv=none; b=Wnhq+GXuV8UM34aaj+2JLwcASjrPnEq8v0i9moiaUcrDU7M818T2eFCaiT5x6WFa7pav78p7Hg246Nou6tnPJ8ZARFsBdnjrOoFs+juDgAOzoUIY+EQMdwZJ/T0T2QrrQIMlJSYFl2Yq8XwBgA4sHZ3aPb1f116U4TtsvpuOT38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767875681; c=relaxed/simple;
	bh=VFIU6oRaDH9Q5I6u83icDPhX1E3PIl7DXyKWm0LGw7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MRA8YQRXSq0cJ/zYa8cWV4DNzWZ+ILllEoXJJ6p3ysVItu2PCKD8Oe3rQ8OZ1LC/XuUv9huCtuiYEkI0bHsY9PD9ImJMp2MlUPtFcroUy2p+A92tAdfHxWBVPy/7j3FpukYkuuQgp8UhSAhUpxkCnzMlbnCVx/ohnhUI3s0Sffw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JXrAUs97; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b843d418e37so315280566b.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 04:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767875676; x=1768480476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWpdF/L1lGPO4cNpY+tbEjaN0of/AygjMtoXE8dzuSc=;
        b=JXrAUs97wMSdFRyYng+BqDMx8QmizXXQY1Iv8PI6lFAM317xdY/vWE0Ve85ILLasCd
         04doTZxbw5CxEsfh5AOHj7YwMZbpf5QPXVU23YxEbTkPWQOHYKQ9jl8ulewJRz4ve0/z
         PAAda5OPSBIFd9vmgIsV4AZouIKUc+HEr+qVgrnkp5hq+MsbPzShrsInSVc281BSrdUZ
         oQkPSvuH2poaEg5UoFAisQouAcikcsa/qNlyX3UKxBaLBDBixXSQDza8YuyLvXb1TQqi
         L4wGq0ITOYF0MWbVCpd3/I4VpubwU3JjR2+gssy17+usIUCp1/Nikgz8Zc84beUshQJn
         rHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767875676; x=1768480476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fWpdF/L1lGPO4cNpY+tbEjaN0of/AygjMtoXE8dzuSc=;
        b=lfHkEpCey372lCHXIl9SLWnQPQWzGaVQqTQj5/OiHVwYcTYdhu3eh9UO36Em6SFSyS
         xm/LOQYrTMcJ1HgbliuCiGZ+67p7tJxYFmTbhHlKqCREmZlrBZWR6qiHdwxdOBlsXH6g
         NbuVtxsGIYxrnn5XfpxgAxliJTsD2fF8nhO64jPgWx53pf50Jy21jwUv0HB44nIxjOQj
         PwPiO6wI1gmbmUS7M0sih1ap+Guxi+CS/OxRsCNZeu4BWCEVOdOaipZwBMSl0JD1YW0O
         sow0oLnGhn0Dr9hPmkEfjXTxxZfc20iJv6MLSNSFpBIS+UJKiM5JL3aj+OWmJq32p9CI
         Kopg==
X-Forwarded-Encrypted: i=1; AJvYcCUfGpUZzinkjm4s+o9R9WqmH51fq0CqGNyD9raxiZ7o5MNNhwA+0TZJeSp1eJuyrSfs+Yd1M+4o84z/coPtANSNNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzO+nRZQRxlvO+z7PpFUr6gqvtoqRcf6fECtnT+to1wdPT7p/Tk
	pKeGh43+pMmRMpgzxxiAlrm+YoZZnzPqGCov2CVdMqLncC04K2vrfi06
X-Gm-Gg: AY/fxX7ToQLJCjj4tTZXyNqO+Q4oTq5PCC8QOBo0y64OCaI3nqq9Cn+uEds7hU2sysb
	Dwzd8+/u64UTakv2lv8dkN6yeqhZ6JbrnTrbwpI6DfnbOdj67vHsuS2YOZyMzA/Ug1JbDQrWD1G
	2BD9gC8ty9kChNhdB5d3KAFLMcX2X5JFykM9h2VsluYifTD6qNehmdboCSzGa9yEG4fnm5FYE63
	gvIwM8KFj4e+iC+3ftuFsZxmsFmlRel0ilu7lvM+7Gt4j0QQ8bKoo2fMRcUhOMelfo/e/5iVY8A
	r1GxH8rk77yaohtGKQII6UlgmKKgTuiEz4ZlPco5LD0pRFW8y8SyX1dfPFfDp3fnnd6g9F/xeOx
	uvXQpRFEvYgmcCVvyLxjeprSs09at182xXQXVaecWraQ8by02Thdp3BHgjKw7/rF/B4xI/anfFH
	oc6E+CLfPb+x83LDqSomPCZn0wP+JRdyZR/ks=
X-Google-Smtp-Source: AGHT+IGig9B7upsLQy2U4wXWc33e3+oUXUybZoUQZ8HJCrrwThoX1DnTNrMbMy5YFQG+q8WoWyq+OQ==
X-Received: by 2002:a17:906:ef0c:b0:b71:ea7c:e501 with SMTP id a640c23a62f3a-b8444c593c2mr701325766b.4.1767875676040;
        Thu, 08 Jan 2026 04:34:36 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:a172:15fe:21c8:edf5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a56db21sm780412166b.71.2026.01.08.04.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:34:35 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 1/2] clk: renesas: rzg2l: Deassert reset on assert timeout
Date: Thu,  8 Jan 2026 12:34:27 +0000
Message-ID: <20260108123433.104464-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108123433.104464-1-biju.das.jz@bp.renesas.com>
References: <20260108123433.104464-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

If the assert() fails due to timeout error, set the reset register bit
back to deasserted state. This change is needed especially for handling
assert error in suspend() callback that expect the device to be in
operational state in case of failure.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
 * Added the variable "mon" in __rzg2l_cpg_assert() and used in
   readl_poll_timeout_atomic() instead of reusing "value".
 * Dropped the assert check in error path and simplified value using xor.
 * Added Rb tag from Geert.
---
 drivers/clk/renesas/rzg2l-cpg.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 0bcf64b152e0..f670c6408ea1 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1647,6 +1647,7 @@ static int __rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
 	u32 mask = BIT(info->resets[id].bit);
 	s8 monbit = info->resets[id].monbit;
 	u32 value = mask << 16;
+	u32 mon;
 	int ret;
 
 	dev_dbg(rcdev->dev, "%s id:%ld offset:0x%x\n",
@@ -1667,10 +1668,10 @@ static int __rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
 		return 0;
 	}
 
-	ret = readl_poll_timeout_atomic(priv->base + reg, value,
-					assert == !!(value & mask), 10, 200);
-	if (ret && !assert) {
-		value = mask << 16;
+	ret = readl_poll_timeout_atomic(priv->base + reg, mon,
+					assert == !!(mon & mask), 10, 200);
+	if (ret) {
+		value ^= mask;
 		writel(value, priv->base + CLK_RST_R(info->resets[id].off));
 	}
 
-- 
2.43.0


