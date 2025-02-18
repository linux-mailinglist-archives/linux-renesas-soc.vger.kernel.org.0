Return-Path: <linux-renesas-soc+bounces-13251-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8732DA39B48
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 12:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00B391894B3C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 11:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE27240610;
	Tue, 18 Feb 2025 11:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="emDlw/lz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1DB23F29F;
	Tue, 18 Feb 2025 11:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739879053; cv=none; b=gvlQMY7IZiUCyjphIvz5b6RM785PwCTqHo01bcjRYxMkb2VOdUF8979WDUdLvf9jiG54tQRH3xvTt4XwkngvqbrBnt4Y+ZavjNJp5q0J6gWKAgX7KVaAW277KyQVsQS4WcYOkEcaYu1M931+H46vTA8smnxtVPJIOYqKo5xAGa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739879053; c=relaxed/simple;
	bh=a/nx0v5W8zPHrdzHmAiXYWM/KVbHpWKw6d3pe4Vtq8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hfoKalg3lndVknHH7mNG30UnWMtt09uaiG6/Op0u3VIJ0CNAjtQ34uGL17MqkSnboBtjYJnSEe155m82ZiSl2yxrttY2zxFQIaKQK6/7PXNMwujAe3UNXwOtHFXrbE8QbxPL052IneOlYX54I/6YsmqR6q7j04SbT4ZYlV/UnCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=emDlw/lz; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38f22fe889aso4210208f8f.3;
        Tue, 18 Feb 2025 03:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739879049; x=1740483849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXIltzyBmDltiRnO//siLSwcpmQT4Ch+dy3eT2XAQ+U=;
        b=emDlw/lzzjlhfzAjHR+iO6X6zrkCVdL0x6w9YKiHCnl3ujwrusZgmq6zj/hS06D51e
         wYUqO46/m77qos0Nyu8Dj5Fo1gWCbY8fW7ib4Alq3ksOHe6Y/cwsMW8G0iw+la79Munu
         fjNUj8Zcxhy8NNQPk9Km8TGt+tdv+iDnag71fG2Ach6wXmC/MS5RtqxSCVLBJqWg67wd
         5ZN0EGFmLi8Z71mGWxyBvEzc7IoVxXQK8RVHgh+taY4UOVhtDj+CnF3KP4lN/UQs7R0z
         T1bKm8O3QgGjBLoAZWieEe2k2fZJkMGTTcsuEdj3SPNsjm+ltrz2cmdj+XltM205cnEM
         OGcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739879049; x=1740483849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QXIltzyBmDltiRnO//siLSwcpmQT4Ch+dy3eT2XAQ+U=;
        b=xIraZrzDvQZZS3tPacJTY7kpxx7tMayIhAtx2kAOi/WqIfkNDRm9+LghCXEz1sv3IW
         Y99cbnjgfkkesfWr9BrggK+xJ4sX+/zDutbm/1J9jm3hva6pQnpVkmReoD5T7Q3mGnbC
         DJph8sEBgqqeRtj3TwsHBZstt4eOUEyPHuTpsxKk9rer57O0MMoYHS5tivQbTvqfSnmo
         DUMAoZEkJHn0Aynptn7D9ALei705bB/G7XCL/Pv4N3OengR2cgcrYSokKbB+DusQ9wI1
         51pz+P7AzOGGIJtEA+USfY9Fc/wmyi2U7+/24O/RR1QibsD9XCo+zGQ4GDS60K33RhXu
         LZdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZe5gluHHbsL7mQ5n3lmF0QKjumiSzq0TYL857EBc5RRx2fl0pQc0F3+mYiVVv2cxDM5+Fr7/8ZKtwsvNI@vger.kernel.org, AJvYcCXYY/kw/WxKL2guqHFN3WYwR++fW+wnjeA9Nmf4rJ7xrhxfDUPbndZHo729qTuXMOdBtlRVTJAUJ3o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5FSBo2zHquvKhpDnV3D7t+hEWrdd7aHAuHpoPfR4fVd4oGoc2
	54HU1HIxq+BH5zsoLrcdVNLjS1IksCQF5ehqcn3i785U/GdjYa0Iq/K0avhrNxo=
X-Gm-Gg: ASbGncvfS2YSHQe8+TD5Ured5ZCv8BwumAtxHycuGyjBV3mFQaW5mhIJ1HeqiCRNaE9
	0HDqR4C4fJDsuZCDraujNQRD8uPcIG+lT44o7V4qLQirXmHkOndog+J4zKrD/iZ/IGVVBEQ+StD
	LvPjxbtk4vnMOSyxQI/xELImY1XB5kEVsJfz3hAsILuGhNhWvi2yLeHixFXTcA/X7k5sxPzQ0sG
	90WDl4ECL2/EM5cn/xYPFuCJVyiNLqDMXaCBFTS1pnbSPmmuPPMhLzRcpvTLVZ1oVJ02+rpAgtM
	7qhONOyD9VEYSF82iLz7Yx9+bKpPy2QuU5ge1Y6kXXnY
X-Google-Smtp-Source: AGHT+IF429mp8r0/H9MppSYzvlU+QM11GgGTXHrnGbTDKrUdpxTK4JlPMHayXHI1AqGbIXjQ7D1TkQ==
X-Received: by 2002:adf:ce8e:0:b0:38c:5fbf:10ca with SMTP id ffacd0b85a97d-38f33f511c0mr12535462f8f.39.1739879049214;
        Tue, 18 Feb 2025 03:44:09 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:6940:cc67:5b00:b151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25915146sm14997029f8f.56.2025.02.18.03.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 03:44:08 -0800 (PST)
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
Subject: [PATCH 2/3] clk: renesas: rzv2h-cpg: Add support for enabling PLLs
Date: Tue, 18 Feb 2025 11:43:52 +0000
Message-ID: <20250218114353.406684-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218114353.406684-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250218114353.406684-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Some RZ/V2H(P) SoC variants do not have a GPU, resulting in PLLGPU being
disabled by default in TF-A. Add support for enabling PLL clocks in the
RZ/V2H(P) CPG driver to manage this.

Introduce `is_enabled` and `enable` callbacks to handle PLL state
transitions. With the `enable` callback, PLLGPU will be turned ON only
when the GPU node is enabled; otherwise, it will remain off. Define new
macros for PLL standby and monitor registers to facilitate this process.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 57 +++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 1ebaefb36133..d7230a7e285c 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -56,9 +56,16 @@
 
 #define CPG_CLKSTATUS0		(0x700)
 
+#define PLL_STBY_RESETB		BIT(0)
+#define PLL_STBY_RESETB_WEN	BIT(16)
+#define PLL_MON_RESETB		BIT(0)
+#define PLL_MON_LOCK		BIT(4)
+
 #define PLL_CLK_ACCESS(n)	(!!((n) & BIT(31)))
 #define PLL_CLK1_OFFSET(n)	FIELD_GET(GENMASK(15, 0), (n))
 #define PLL_CLK2_OFFSET(n)	(PLL_CLK1_OFFSET(n) + (0x4))
+#define PLL_STBY_OFFSET(n)	(PLL_CLK1_OFFSET(n) - (0x4))
+#define PLL_MON_OFFSET(n)	(PLL_STBY_OFFSET(n) + (0x10))
 
 /**
  * struct rzv2h_cpg_priv - Clock Pulse Generator Private Data
@@ -144,6 +151,54 @@ struct ddiv_clk {
 
 #define to_ddiv_clock(_div) container_of(_div, struct ddiv_clk, div)
 
+static int rzv2h_cpg_pll_clk_is_enabled(struct clk_hw *hw)
+{
+	struct pll_clk *pll_clk = to_pll(hw);
+	struct rzv2h_cpg_priv *priv = pll_clk->priv;
+	u32 mon_offset = PLL_MON_OFFSET(pll_clk->conf);
+	u32 val;
+
+	val = readl(priv->base + mon_offset);
+
+	/* Ensure both RESETB and LOCK bits are set */
+	return (val & (PLL_MON_RESETB | PLL_MON_LOCK)) ==
+	       (PLL_MON_RESETB | PLL_MON_LOCK);
+}
+
+static int rzv2h_cpg_pll_clk_enable(struct clk_hw *hw)
+{
+	bool enabled = rzv2h_cpg_pll_clk_is_enabled(hw);
+	struct pll_clk *pll_clk = to_pll(hw);
+	struct rzv2h_cpg_priv *priv = pll_clk->priv;
+	u32 conf = pll_clk->conf;
+	unsigned long flags = 0;
+	u32 stby_offset;
+	u32 mon_offset;
+	u32 val;
+	int ret;
+
+	if (enabled)
+		return 0;
+
+	stby_offset = PLL_STBY_OFFSET(conf);
+	mon_offset = PLL_MON_OFFSET(conf);
+
+	val = PLL_STBY_RESETB_WEN | PLL_STBY_RESETB;
+	spin_lock_irqsave(&priv->rmw_lock, flags);
+	writel(val, priv->base + stby_offset);
+	spin_unlock_irqrestore(&priv->rmw_lock, flags);
+
+	/* ensure PLL is in normal mode */
+	ret = readl_poll_timeout(priv->base + mon_offset, val,
+				 (val & (PLL_MON_RESETB | PLL_MON_LOCK)) ==
+				 (PLL_MON_RESETB | PLL_MON_LOCK), 0, 250000);
+	if (ret)
+		dev_err(priv->dev, "Failed to enable PLL 0x%x/%pC\n",
+			stby_offset, hw->clk);
+
+	return ret;
+}
+
 static unsigned long rzv2h_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 						   unsigned long parent_rate)
 {
@@ -165,6 +220,8 @@ static unsigned long rzv2h_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 }
 
 static const struct clk_ops rzv2h_cpg_pll_ops = {
+	.is_enabled = rzv2h_cpg_pll_clk_is_enabled,
+	.enable = rzv2h_cpg_pll_clk_enable,
 	.recalc_rate = rzv2h_cpg_pll_clk_recalc_rate,
 };
 
-- 
2.43.0


