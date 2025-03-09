Return-Path: <linux-renesas-soc+bounces-14188-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9007AA58872
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Mar 2025 22:14:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BCCA16AE93
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Mar 2025 21:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B14BC2206B7;
	Sun,  9 Mar 2025 21:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJgnx5Wl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D253F21E097;
	Sun,  9 Mar 2025 21:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741554869; cv=none; b=EO+SdvHqQKEkhRHx/5eN/XwZs6RbBFo12LwkQZd2tKFyOrqeOGCugPSSAOiGBOGs0SmFcK38YkIYaT6ZD/qG995+6C8//6J4KfQycnpcwMXQl4lGvFm1bxYeY2E0xX78Iwh8CuIb+sWuyPr0gdsxeDuNSVzCDpLNUw0prFmfXRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741554869; c=relaxed/simple;
	bh=6EnlHtcPAQHrjaXU7Hw9sqzeoi92vW50TaKacMfMjyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hQgBbcUWjzubu7opkh7UdbRwihw0ui19rTGQ6kVFQqqSrVljSifme04XdbvBkKKws+IPTSD/iIdWWU4lkRrFw/51Suntb0YjPkNm5ChbPdrjG1Pk9KhCoF4gjjOG63MbUHmKyLYNG/JdW7QLbYHs19MSBa8OC4bgN5fqYAmcbdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJgnx5Wl; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso20585145e9.0;
        Sun, 09 Mar 2025 14:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741554866; x=1742159666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHfhS/Bw+59m0t+UTTunw4CckJqGA/E44i/0mpYARhs=;
        b=GJgnx5WlT33XQtGYTkavnGPzfK9rg6JFaXKhwkHcmT9AGHYMJ7amRcjJn/kA+tDakV
         BnLwTkggECn/0aEkS8qwOSeDNeW8z2WF9P0xA7DnG3BfKpSjhNBdlWRnHu6uDdG0toao
         Y4VkVvX1aDme3uRVLPQlKIzitC3Gr3k6XR1yArwbcAPZ7LBLpqHOrfx0r0uaoU2aJ5uq
         JhWvYq5Q/vb7lL0rm4jZ4qE9yMM9KveGvN7dZDzdZhYJYsjdK+nQ2KhS/4Z/qg9hXHRE
         ZZIwG8j9QbNB3U6ZezbnwAlZxE7b6QIyrSFlcesvggSrJVl7rMYEWCuR/BGgBCqgv4dT
         oePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741554866; x=1742159666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IHfhS/Bw+59m0t+UTTunw4CckJqGA/E44i/0mpYARhs=;
        b=AkjHqIqP+O7MicgzNN8zseIEQ3NUtf/Br84LSqCvB1RBL2CnWCNs43DR4yE0Fxk2eu
         rBizZ2WMoywBp+AysfpyUdDlIcCldNxQ+uD8i2l/wfK5RW7BdHU28zoQgId9XA/s5iG5
         hwY+ffinWWCsyoX6ITeONFS2yMexj4HRiX8M/DajC2F7mfXnMTDDPUlQlmFKpQXiouAS
         0QcdaWzS5/ZvuYxQlFXLuFx3c4jWzFERvnZXx4VYk9N87iJmt96yAPeY3Rov4FOWrjLT
         N7zFOckMSb1HO0J/NyriewLcEGo7ecViBWvJsNztDcnGAuC/pGdGq3SAk2br1Y5wODHO
         zU0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUc2u8TnjDlhnuTaUCVnwSPoLC1olLUcH2tkuRrel7yS6MaqROGJZzPkeR0VxiMHPX5mqbLaU90HkUMmWQ=@vger.kernel.org, AJvYcCXHFhF4S+afMBjiyHUduI3D3ntd5uyev0h3w0zpuEzF17MfAV272lWJW7efckdfcoUSxS6E21jdkX+WEHQH06eZORU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo9rqUuQ0pQnw8eyBfCwGxv6Upunqatw0PKrUKF9TOX289yquY
	sdP+kr2Xi9DfpsTUUJa1qD9/GCCxu/PCvwMpRs9ey1YLdyxU1iPZ
X-Gm-Gg: ASbGncsypgQdNOealixZyJUzeOxk5jGGO7o0kD/fm5wzlvN7ftlOiFAxYkhBtRluzPy
	ThEZzhh6PIC2NhGCGwTTtcbPAdi28tEHOyfvYixYraFW43aNOwkLa1RYh4/sIQZZw5ERo0hCedQ
	lRV+NmmxkX/bc9ZKBSzM+dBgai/0sx1VAHuZoIKbIa++vHxdXFsw0mfymfXjMZM5kDMrZICWwcH
	WGw0MPDvWfNdnL3pfdUcfRhVVH5JCTWYCm2Foy5CRoyAY1b4ujTDkRsLlDaIswzWo5iHxE3mf+B
	dTPomJNBijG4zPyINDGETPKD4qXT/lad/gNOeDpfspvgS9Wtl+4zlDsuWKpcqEcXzohdh9ODOg=
	=
X-Google-Smtp-Source: AGHT+IH1DSVdLrc2wBsbZvpGn2hr8dhJhwVGGU++2bVvIZFO1IMB+b3XfaJngqF8cRmkUZkSSoL0/Q==
X-Received: by 2002:a05:600c:4f0c:b0:43c:eeee:b706 with SMTP id 5b1f17b1804b1-43ceeeeb95amr17980455e9.24.1741554865919;
        Sun, 09 Mar 2025 14:14:25 -0700 (PDT)
Received: from prasmi.Home ([2a06:5906:61b:2d00:e951:ba7a:6a53:bac5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ce70d13b4sm64443845e9.38.2025.03.09.14.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 14:14:25 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/5] clk: renesas: rzv2h-cpg: Add support for enabling PLLs
Date: Sun,  9 Mar 2025 21:14:00 +0000
Message-ID: <20250309211402.80886-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250309211402.80886-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250309211402.80886-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v1->v2
- Updated macros to get PLL offsets
- Switched to readl_poll_timeout_atomic() and updated the timeout
---
 drivers/clk/renesas/rzv2h-cpg.c | 49 +++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index e489ce28ae63..76ad037b4361 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -44,12 +44,18 @@
 #define CPG_BUS_1_MSTOP		(0xd00)
 #define CPG_BUS_MSTOP(m)	(CPG_BUS_1_MSTOP + ((m) - 1) * 4)
 
+#define CPG_PLL_STBY(x)		((x))
+#define CPG_PLL_STBY_RESETB	BIT(0)
+#define CPG_PLL_STBY_RESETB_WEN	BIT(16)
 #define CPG_PLL_CLK1(x)		((x) + 0x004)
 #define KDIV(val)		((s16)FIELD_GET(GENMASK(31, 16), (val)))
 #define MDIV(val)		FIELD_GET(GENMASK(15, 6), (val))
 #define PDIV(val)		FIELD_GET(GENMASK(5, 0), (val))
 #define CPG_PLL_CLK2(x)		((x) + 0x008)
 #define SDIV(val)		FIELD_GET(GENMASK(2, 0), (val))
+#define CPG_PLL_MON(x)		((x) + 0x010)
+#define CPG_PLL_MON_RESETB	BIT(0)
+#define CPG_PLL_MON_LOCK	BIT(4)
 
 #define DDIV_DIVCTL_WEN(shift)		BIT((shift) + 16)
 
@@ -141,6 +147,47 @@ struct ddiv_clk {
 
 #define to_ddiv_clock(_div) container_of(_div, struct ddiv_clk, div)
 
+static int rzv2h_cpg_pll_clk_is_enabled(struct clk_hw *hw)
+{
+	struct pll_clk *pll_clk = to_pll(hw);
+	struct rzv2h_cpg_priv *priv = pll_clk->priv;
+	u32 val = readl(priv->base + CPG_PLL_MON(pll_clk->pll.offset));
+
+	/* Ensure both RESETB and LOCK bits are set */
+	return (val & (CPG_PLL_MON_RESETB | CPG_PLL_MON_LOCK)) ==
+	       (CPG_PLL_MON_RESETB | CPG_PLL_MON_LOCK);
+}
+
+static int rzv2h_cpg_pll_clk_enable(struct clk_hw *hw)
+{
+	struct pll_clk *pll_clk = to_pll(hw);
+	struct rzv2h_cpg_priv *priv = pll_clk->priv;
+	struct pll pll = pll_clk->pll;
+	u32 stby_offset;
+	u32 mon_offset;
+	u32 val;
+	int ret;
+
+	if (rzv2h_cpg_pll_clk_is_enabled(hw))
+		return 0;
+
+	stby_offset = CPG_PLL_STBY(pll.offset);
+	mon_offset = CPG_PLL_MON(pll.offset);
+
+	writel(CPG_PLL_STBY_RESETB_WEN | CPG_PLL_STBY_RESETB,
+	       priv->base + stby_offset);
+
+	/* ensure PLL is in normal mode */
+	ret = readl_poll_timeout_atomic(priv->base + mon_offset, val,
+					(val & (CPG_PLL_MON_RESETB | CPG_PLL_MON_LOCK)) ==
+					(CPG_PLL_MON_RESETB | CPG_PLL_MON_LOCK), 10, 100);
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
@@ -163,6 +210,8 @@ static unsigned long rzv2h_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 }
 
 static const struct clk_ops rzv2h_cpg_pll_ops = {
+	.is_enabled = rzv2h_cpg_pll_clk_is_enabled,
+	.enable = rzv2h_cpg_pll_clk_enable,
 	.recalc_rate = rzv2h_cpg_pll_clk_recalc_rate,
 };
 
-- 
2.43.0


