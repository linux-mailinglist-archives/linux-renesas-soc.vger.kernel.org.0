Return-Path: <linux-renesas-soc+bounces-15034-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB52A75121
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 21:01:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CEA018954F0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 20:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EDDA1EEA5D;
	Fri, 28 Mar 2025 20:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QdrjEhcS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712B01E98F8;
	Fri, 28 Mar 2025 20:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743192090; cv=none; b=GOws51c3A9I3xpYlb3nVO1eIke+Mj05klIgudZThwA8268sejLzUH9W80EMYdJDaxEoWcxzS5JT6LFAlBwmzBaRFi2XyL/nPNYZwecojcxQxWFHUwzAnlxipi8lNVoOt1nDShZEX1/iacX3dV2OmfxMz61IsQEOdjtkMJBRz5zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743192090; c=relaxed/simple;
	bh=Jy25g5ku5K05bnFAmVpuZgxFbixeJ/5lwipk6/jdG2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N1HoXGSYvRn0xjJpAGe315R9P/jKZEdnVzHPU4swEIWH0ie7m7pKkw71RbmQfomHx+t5VEKBX/thmyh+/anIwxF1aAWV7oDeOC9TlSSvIrJ7kpdQt+QQcDVNuMCikOH45qpqgRbOOw/PXcGp8XDSln4nmR5bbK0TWJcjQWLO544=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QdrjEhcS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso18455405e9.0;
        Fri, 28 Mar 2025 13:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743192087; x=1743796887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3jeUZRmxaWjIp3nx3IiMr1zlX1ebkwMyBUYGf/OK98=;
        b=QdrjEhcSS1OiLSXrOlwJSzL3z7Z+tn1xA26sd9LBrIdA6FHHYomFN6MP5hX71yVi6E
         TiHDwR6iy22gLuveQJY/w+fqZr1qAxgwhPIdQBrV44xNCF2uvl6Mf9QG62UUmwhJwafL
         ena+wfdlTGijh/uetPF8YPRUejTLSLd4HrXdITus82vTuBpe4IVFhJI1ihyWBeAW3Fna
         vT1XtBCz7egg2KIE2TnaWgdx6MT7sONjv1IS1RlT88Gs96UzDajQuEPyysicekf/qzbi
         d0UdmLLhIfSn/vi9DweH2vZ0lkjSF3znRumh2DJuIHJrlgg0DVQ1dL96TANIaV1UaC24
         XFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743192087; x=1743796887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V3jeUZRmxaWjIp3nx3IiMr1zlX1ebkwMyBUYGf/OK98=;
        b=lffY7UziT2dfCwH5hxMriunijHYlDNHL3xXCpkN7hqz4yxcDvFrJZodIocMRzNNRtT
         lyMmW8FhmE7NqYtgPKxwNPWzLBwkAKo9V30bzAEuIXeMiDkoFXXO5VSEvdsyk6XIdjH1
         PDkQHWh2fNPVWr3G5gh5/kLxn9A6YPt0bAj/66W5jjFiBKG5Q43C7pBxeHJveFKfDOur
         26cj6ptf/Q74qJjsX0w7ZGAuG1+wb09Qr2guwiTj7r67K9vnF1JozLnyASYKne/H25GY
         ZTEnFQnTUeWKqZEzP+WGBx1MOytx3Ju4mAjkDRqjh+0GtQSQDUWF9GucfbvaeFxiwuYS
         WR2A==
X-Forwarded-Encrypted: i=1; AJvYcCUfo9V677Qg3uGIiIn7ztD6fq7diwZkCozKo0O13xgA/RB3eJEiJkXGzgVOPCXqFvA8abM5NPc545ogvLKF@vger.kernel.org, AJvYcCW6HaGZcFXsXxv+LjKhX31yVw9T7ci9aVvU52qVnUdws3wkTJIkkkO+wHfEfy2CD4GHVfyqqOZ97Yab@vger.kernel.org, AJvYcCWjMo8msS8Y36RT65p1PNDSD4xXpEI0mmtzMqhcZG1G0a1drdv0T+9ml0hKkss0jYSWfvxIVgWiusqk@vger.kernel.org
X-Gm-Message-State: AOJu0YxAndK8WkV+Q13Hhrqvu4riUg7m2QBNCas0TU+1SqJNSP2WqfQx
	qeX5k3nFTFDOInyHFsDtl0nZ9CMzVHcM3U1AZhVAjzapArcLVVwW
X-Gm-Gg: ASbGnctomAKOiboiy3KMK9TD0TD6WB+hcfLuluh8Kd0ecDsyJmIyNnYuFOi+Zo/xhZs
	gi/qYDSI8fQ9u9GRqapy4xJbjtbcvCEA+BLpPD97WDdgBLlfUlcJM/V+eGYmPipdVY5g5LceLea
	FYUau5I6qFcaWcyEXfEbQfdHhfPfBTHbXl65cPtFTeHkKCYoOpLhqqgCzZ6VQlP/JSvm14bV2FA
	5u0gYSy8u4whSUDTvp0Oidw9b9EJqDFWEHjGAF0ca4DB7lLeuYZuJ8k84XOoLuK7yRdB0xgK66R
	b1NR/0wfklCzHI+dd1ncva03S/rv03ezvvmjU5cfQ3SC7pQD62YeCkpjSnOsW4IYB0S4HK0GW1V
	2oA==
X-Google-Smtp-Source: AGHT+IHCQXvBKq354MzaMySI3MBLz2GNDpm/cuGn729v2/ipYHeF0Y4wgOzvDvG6z1gtsAfb3H9GfA==
X-Received: by 2002:a05:600c:4e07:b0:439:86fb:7340 with SMTP id 5b1f17b1804b1-43db62b70b3mr7884295e9.30.1743192086510;
        Fri, 28 Mar 2025 13:01:26 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:b400:d08:873:badd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fcceaaasm37930955e9.18.2025.03.28.13.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 13:01:25 -0700 (PDT)
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
Subject: [PATCH 3/6] clk: renesas: rzv2h-cpg: Ignore monitoring CLK_MON bits for external clocks
Date: Fri, 28 Mar 2025 20:01:02 +0000
Message-ID: <20250328200105.176129-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250328200105.176129-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250328200105.176129-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Ignore CLK_MON bits when turning on/off module clocks that use an external
clock source, as they cannot be monitored.

Introduce the `DEF_MOD_EXTERNAL()` macro for defining module clocks that
may have an external clock source. Update `rzv2h_cpg_register_mod_clk()`
to update mon_index.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 24 ++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h | 28 ++++++++++++++++++++++++----
 2 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index dec97f731e3a..e6a3c673879f 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -566,6 +566,25 @@ static void rzv2h_mod_clock_mstop_disable(struct rzv2h_cpg_priv *priv,
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
@@ -688,6 +707,11 @@ rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
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
index cae807aa53ef..0277871e298b 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -180,6 +180,10 @@ enum clk_types {
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
@@ -191,9 +195,14 @@ struct rzv2h_mod_clk {
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
@@ -204,16 +213,27 @@ struct rzv2h_mod_clk {
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


