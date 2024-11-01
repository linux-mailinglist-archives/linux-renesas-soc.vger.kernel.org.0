Return-Path: <linux-renesas-soc+bounces-10250-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3489B8E4B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Nov 2024 10:58:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 068501F235AC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Nov 2024 09:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 472F6186E40;
	Fri,  1 Nov 2024 09:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="YrXWyvte"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99AB161310
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Nov 2024 09:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730455065; cv=none; b=NQzQMEfJ//KVo4s0LpufAyzLBO/P8D6OLN74Jl7dnaYGE3fluKqI1oldrM0jrIH04KGcydl80VuFKHfJFqa5WPiwfI7mwpIrJRnuuCGQu9tSQqlr791UWr90STytAbOguYKkzkgQMfvrQDIOx/RhL2YYMUkWI+QfzlQInF8yxmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730455065; c=relaxed/simple;
	bh=S+F2FkEdi2w5OLkb2FF8IDO/kgC5BfFXc48xK0PQxEU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sjqTBtDi8hNfyLFVNa9onyL3dq0psmg92bRsX5GQYBSzCU2y5oinriyPxwNOmOnF9ODvpPcY9jNLf7MgndRlmJogwbA4ZV+6McKKgRKETZK4VTt7OreHcy/wF1HZlf1/KYbAEErWSNOj02UwKk5VaiaVubWAuz1/4o9pkzSMknc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=YrXWyvte; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5c9150f9ed4so2448993a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Nov 2024 02:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730455061; x=1731059861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ewtg0K16I6vEI9VCro/VP2IXg7P8FX0BQ2vY0LS22pU=;
        b=YrXWyvtemX2WGnv5ubtRDUhTK7QTIqTHAEEtO37tJi3TGtO5qMEHccZZIU4b1rRixV
         5KMAy1JPN1GjnLBcAEam6x/+cNejTDUnRnO09cQ+9A+LmSzfFX5DYoYXnCHiS/t713ZU
         4s1mfJxgD/VtMt6DC88DOmF3HLSRnG7uvnHW3goK7tqKhfhQkBY8kL34Obu4iMFgHgQm
         Md3YxmL6GNYahpg7tlG83y/vP3vKFIxeKrRZF2kQ62l0qJdk9+6xscRMU8+R9DsgxqfF
         kQvnKTrzUP9Qu45hBJzBL31OQXGynjYBW9aQXwmicpExEbWPb4WMuf0A5DeG6KC4N6P4
         0wGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730455061; x=1731059861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ewtg0K16I6vEI9VCro/VP2IXg7P8FX0BQ2vY0LS22pU=;
        b=NKNYBo040OPzX152NkLGLk2kZkpJTHj68UUEu9ieYqGK6R54st9tHK+7+dt8hDDQd1
         FS8ZmISwZrZ2DHpr0Twk04FRmcgCHeCKRXLOZd0r0LLa0Jzp5Z7UJ/j/Np3ef/aLpW1E
         HAOj5TIAQSreBImUxl37Q6pNA5g4QR11yiusPegX37csdiDo0PmkYVpIIFbrC4aNnyS7
         RXVayuLAfzxLMPrFAjW2PuDnbGaZYpLaAdBNzndQDXezyutvlskYX7R2f7DvftOQXTqE
         E9yIUWfHvpHTdjXkXqe4Dcha3QFMmvafcqFcbvfL33Tlpt6VExRCwF2HvmfbnIsMY7DU
         FJOQ==
X-Gm-Message-State: AOJu0Yzp9Y3F4+BODWUzDAu93OdFxk2huyQ+024W6f17dJYTb/4YYJ/Q
	gGu/2XbnuvXtFwZf85Oz+8a85RASTJATS6/3MxMaNkzQ0IMPk+oN3owi17ruMuk=
X-Google-Smtp-Source: AGHT+IEFGiN/u4W5r9i6MtaqopU2l9fL1FFrDwTz4s8iqC4tcmgZL2qm6/VdNeHlxydCj5OuRaUwEA==
X-Received: by 2002:a05:6402:350c:b0:5cb:69bb:ba8e with SMTP id 4fb4d7f45d1cf-5cbbfa78a8fmr13489266a12.34.1730455061093;
        Fri, 01 Nov 2024 02:57:41 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac7c8d87sm1364136a12.76.2024.11.01.02.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 02:57:40 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v6 2/9] clk: linux/clk-provider.h: Add devm_clk_hw_register_gate_parent_hw()
Date: Fri,  1 Nov 2024 11:57:13 +0200
Message-Id: <20241101095720.2247815-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add devm_clk_hw_register_gate_parent_hw() macro to allow registering
devres managed gate clocks providing struct clk_hw object as parent.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- collected tags

Changes in v5:
- none

Changes in v4:
- collected tags

Changes in v3:
- none; this patch is new


 include/linux/clk-provider.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 75444e250a78..a49859ef3304 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -622,6 +622,24 @@ struct clk *clk_register_gate(struct device *dev, const char *name,
 	__devm_clk_hw_register_gate((dev), NULL, (name), (parent_name), NULL, \
 			       NULL, (flags), (reg), (bit_idx),		      \
 			       (clk_gate_flags), (lock))
+/**
+ * devm_clk_hw_register_gate_parent_hw - register a gate clock with the clock
+ * framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_hw: pointer to parent clk
+ * @flags: framework-specific flags for this clock
+ * @reg: register address to control gating of this clock
+ * @bit_idx: which bit in the register controls gating of this clock
+ * @clk_gate_flags: gate-specific flags for this clock
+ * @lock: shared register lock for this clock
+ */
+#define devm_clk_hw_register_gate_parent_hw(dev, name, parent_hw, flags,      \
+					    reg, bit_idx, clk_gate_flags,     \
+					    lock)			      \
+	__devm_clk_hw_register_gate((dev), NULL, (name), NULL, (parent_hw),   \
+				    NULL, (flags), (reg), (bit_idx),	      \
+				    (clk_gate_flags), (lock))
 /**
  * devm_clk_hw_register_gate_parent_data - register a gate clock with the
  * clock framework
-- 
2.39.2


