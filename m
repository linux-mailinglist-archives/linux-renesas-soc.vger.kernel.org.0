Return-Path: <linux-renesas-soc+bounces-15508-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E671BA7E78B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 18:59:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BF34168BD3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 16:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACBC02163A0;
	Mon,  7 Apr 2025 16:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NdUfIu1F"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7ECD2153CD;
	Mon,  7 Apr 2025 16:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744044746; cv=none; b=WT0gj6zGR9ja7LYIUFBRPUuEYMuehQnown6Ou0lF0+YJKg11GB7RQxIF4ngJeDHzUOOozm6Dx5LRVkcLR9A5vKYxqhaccTg5t67Wr3rFd+R34fn07C6PLSmzAl/IOAOzbo7cFhVQwhiQ12Ga9jsNV3LheCnSSpjlrKlLwfWA7Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744044746; c=relaxed/simple;
	bh=NQqAKFm9lKP4gKj4A7p5ufJ0g2L0vgPUQhihTL6aYN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=koIHkMZVzWh3cKXsY+gcK0nP06OgsvHWULkxwydZRNpMmUtB+ZIAcOCESdcY2sAeFWvpipO7YEqOunP7xb6qtgXatwglaHp2chM6LZxxDAmh0THWM6/r5eIL5iPmmFGXA48nnjwvxsJUqd6ciCsK+x+y4h4GhJyt624Sf7PXFZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NdUfIu1F; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso30636665e9.3;
        Mon, 07 Apr 2025 09:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744044743; x=1744649543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvh1Yu//hOtLM62iUyig+O2y+lyb19F5KR0IJmRabvE=;
        b=NdUfIu1Fvyl9qgbYS7Uwt1vKD8S5eGPTz2pPmcKR/em6uJc6x/LQQakG88TclB+E/y
         rDUH0CNOnlwxdscwtZbA9rBv1VIr9GghPGSsuDZ/7pTR7ATD9q/+gL3X9YKsezpBxhkz
         wfNtt+Fx/5S2ZjqaRK6PpZyMCRSKoNbjrkoHZQq00u5C6dkhkNTJuFcLL9lx31Hpgdbu
         UhTsmg9Hvhd+yhtqF5YOP2Sb5PPsq9/hc1qUKkAtUQwNSaZ8Kf5CpEKZBiua1bjUMJgx
         3Nu+S/Z+mXOxMaZpmQctSdmxaICXB4n7eZwp6Kl/2XJG8Hf9bG63PLj+3M0j6k9JO5lH
         NEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744044743; x=1744649543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uvh1Yu//hOtLM62iUyig+O2y+lyb19F5KR0IJmRabvE=;
        b=UFZBuLFOM2ryvI/SUrfMJLuq+HHEKFNA59atO+uKy2VKaTVa6obZrLDCTZyY3EUhAl
         U/+vZgWW/h0jNOsmV4XUSrFWRHOnZFEzxCgKTJ+QXjEMrdgbbaX/EEL6F6bRNzfjtGMg
         TSHF6Zpyd9idSVnVPG5MK4SvaK59FUkdP1D+aRl6ABjofN6MqGbe/FnQirUYOHGdskbY
         IB7gCTchPVUnbFuwkrRPAus9nrRIY5o1XEU+ZGfIabLyvbdaXDn9TyyUt+RZnxALm9U4
         bEdeq0JfXb5oA2E1P0/Wr66rFi5mfEHewQfraaENIWs0ODdih2jwvQcLmkOSiKOkdGtP
         MFMg==
X-Forwarded-Encrypted: i=1; AJvYcCUqxTkqmLpLAqw3LZm5cL0uolM3hHl5cA3IG2R6AtSCArYHnVmP8zg6pr9YpuSdwr07ff4AeJ3wzjcH@vger.kernel.org, AJvYcCUy1ryr99pCimDK0w6l/Os0XdNyBXG3Zer88rYw2OuNKNznNlj+Ge+B16VsNb1yrLN0OS+UgCzlwhVbulyC@vger.kernel.org, AJvYcCVf2uOxwtLlGBvZaWt3J56LOA/9OagF2a3/tgw9Odfn/L6Kc/NPg5iehvxOzlXUVAbq6rmmpFHlV7p9@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmy4+NybEycIjIyn2wqqlXf052liXdROXelWFs7nSkCOikzJe+
	ro7gog9kxB33468AVKE8h7LsrpDLC1Y29M/LWxFlNltSiOe1R4B6
X-Gm-Gg: ASbGnctkGml6czsZ9volw3y7czZsrXT44DM5qXKyK5YKl+x7yMUWLbRPfzf3KHr7mg5
	vARiFRi86Y6/szcEiuN//NgYfUTpVm+Z/G/O2dYjKN7dYyNDPLh1KW+qjgymrYNmpaeFoDuT45t
	cmbZSGoiq2ZYXEhHU+C+ksO332A0Cm1Zk8ytLTPyTE7Su6nEGzxqLewllTUWsNAi6bparU7Ly/V
	dhA+aaN7OIw0DtglfqG7xZLjGjS2V+DoxHcHbotr9MvKaJb2NsBWeqD812ghpg6DFh2lpK2fM8A
	AInv2xgEWm7l1QO3os0Mhh8yU1dfPIh3i5WpWopqBsFo60BaKlZ5xhoJIQTKHZTGXXjpDlip993
	ba0Gu
X-Google-Smtp-Source: AGHT+IHNPfqOadPG/QcoOX+PkR/zOStrzQCU66Xm3vpJbYQMwZZPipQ99y+TS5nYIeIgDzVU9ubw7w==
X-Received: by 2002:a05:600c:4713:b0:43d:b3:f95 with SMTP id 5b1f17b1804b1-43ecfa35e5dmr96826025e9.28.1744044742694;
        Mon, 07 Apr 2025 09:52:22 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16ba978sm139272305e9.23.2025.04.07.09.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 09:52:22 -0700 (PDT)
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
Subject: [PATCH v2 6/9] clk: renesas: rzv2h-cpg: Ignore monitoring CLK_MON bits for external clocks
Date: Mon,  7 Apr 2025 17:51:59 +0100
Message-ID: <20250407165202.197570-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Ignore CLK_MON bits when turning on/off module clocks that use an external
clock source.

Introduce the `DEF_MOD_EXTERNAL()` macro for defining module clocks that
may have an external clock source. Update `rzv2h_cpg_register_mod_clk()`
to update mon_index.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 24 ++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h | 28 ++++++++++++++++++++++++----
 2 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index c75ed6ed087b..dca0940b3df9 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -569,6 +569,25 @@ static void rzv2h_mod_clock_mstop_disable(struct rzv2h_cpg_priv *priv,
 	spin_unlock_irqrestore(&priv->rmw_lock, flags);
 }
 
+static bool rzv2h_mod_clock_is_external(struct rzv2h_cpg_priv *priv,
+					u16 ext_clk_offset,
+					u8 ext_clk_bit,
+					u8 ext_cond)
+{
+	u32 value;
+
+	if (!ext_clk_offset)
+		return false;
+
+	value = readl(priv->base + ext_clk_offset) & BIT(ext_clk_bit);
+	value >>= ext_clk_bit;
+
+	if (value == ext_cond)
+		return true;
+
+	return false;
+}
+
 static int rzv2h_mod_clock_is_enabled(struct clk_hw *hw)
 {
 	struct mod_clock *clock = to_mod_clock(hw);
@@ -691,6 +710,11 @@ rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
 	clock->on_index = mod->on_index;
 	clock->on_bit = mod->on_bit;
 	clock->mon_index = mod->mon_index;
+	/* If clock is coming from external source ignore the monitor bit for it */
+	if (rzv2h_mod_clock_is_external(priv, mod->external_clk_offset,
+					mod->external_clk_bit,
+					mod->external_cond))
+		clock->mon_index = -1;
 	clock->mon_bit = mod->mon_bit;
 	clock->no_pm = mod->no_pm;
 	clock->priv = priv;
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 97054f207113..c64cfead6dc1 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -192,6 +192,10 @@ enum clk_types {
  * @on_bit: ON bit
  * @mon_index: monitor register index
  * @mon_bit: monitor bit
+ * @external_clk_offset: Offset to check to determine if the clock is external
+ * @external_clk_bit: Bit to check to determine if the clock is external
+ * @external_cond: Condition to determine whether a given clock source is external;
+ *                 it can be either 0 or 1.
  */
 struct rzv2h_mod_clk {
 	const char *name;
@@ -203,9 +207,14 @@ struct rzv2h_mod_clk {
 	u8 on_bit;
 	s8 mon_index;
 	u8 mon_bit;
+	u16 external_clk_offset:10;
+	u8 external_clk_bit:5;
+	u8 external_cond:1;
 };
 
-#define DEF_MOD_BASE(_name, _mstop, _parent, _critical, _no_pm, _onindex, _onbit, _monindex, _monbit) \
+#define DEF_MOD_BASE(_name, _mstop, _parent, _critical, _no_pm, _onindex, \
+		     _onbit, _monindex, _monbit, _external_clk_offset, \
+		     _external_clk_bit, _external_cond) \
 	{ \
 		.name = (_name), \
 		.mstop_data = (_mstop), \
@@ -216,16 +225,27 @@ struct rzv2h_mod_clk {
 		.on_bit = (_onbit), \
 		.mon_index = (_monindex), \
 		.mon_bit = (_monbit), \
+		.external_clk_offset = (_external_clk_offset), \
+		.external_clk_bit = (_external_clk_bit), \
+		.external_cond = (_external_cond), \
 	}
 
 #define DEF_MOD(_name, _parent, _onindex, _onbit, _monindex, _monbit, _mstop) \
-	DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
+	DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit, \
+		     0, 0, 0)
 
 #define DEF_MOD_CRITICAL(_name, _parent, _onindex, _onbit, _monindex, _monbit, _mstop) \
-	DEF_MOD_BASE(_name, _mstop, _parent, true, false, _onindex, _onbit, _monindex, _monbit)
+	DEF_MOD_BASE(_name, _mstop, _parent, true, false, _onindex, _onbit, _monindex, _monbit, \
+		     0, 0, 0)
 
 #define DEF_MOD_NO_PM(_name, _parent, _onindex, _onbit, _monindex, _monbit, _mstop) \
-	DEF_MOD_BASE(_name, _mstop, _parent, false, true, _onindex, _onbit, _monindex, _monbit)
+	DEF_MOD_BASE(_name, _mstop, _parent, false, true, _onindex, _onbit, _monindex, _monbit, \
+		     0, 0, 0)
+
+#define DEF_MOD_EXTERNAL(_name, _parent, _onindex, _onbit, _monindex, _monbit, _mstop, \
+			_external_clk_offset, _external_clk_bit, _external_cond) \
+	DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit, \
+		     _external_clk_offset, _external_clk_bit, _external_cond)
 
 /**
  * struct rzv2h_reset - Reset definitions
-- 
2.49.0


