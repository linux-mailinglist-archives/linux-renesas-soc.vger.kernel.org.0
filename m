Return-Path: <linux-renesas-soc+bounces-8552-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD2B966244
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2024 15:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A0BB1F26359
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2024 13:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C26A61AF4E0;
	Fri, 30 Aug 2024 13:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="C5c25xOG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC211AD5D9
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Aug 2024 13:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725022960; cv=none; b=RbxsaZmWVJRT7YOcxyX+G3cFKA3Bu9ceuTB5TauaEzsINoKeGN/ub6nHfbxbwXEzGsIrb/l/Zni5TxAIQFyzD2/EaZTVVz/KBGZGP63E5quArZMQMG7wdJFPkKz8j5Xpw1p1UkfAhhFEpWfNkCuu5hxOUmTjTwszZipmYX1VQRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725022960; c=relaxed/simple;
	bh=0NDjqlI4uZwZiIKOebtOX/P36Pfw3hvCzMBzvuazjxA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AA3ZqKdtqaTdDSNTxPwROku2AJitBvIonHL9Sodx739ruIfBbmBl4fyUG/aFO/FXEjav9O29IfxNhtJ21Nkd+txr3Xz2AL48jfoISCfFd5sCFikUj371eUUxgR4OWe1AIjkxKxgECwFiZUNc1ZTtW1ku12iT3qbhuUk3kIz5/9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=C5c25xOG; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53345604960so1845757e87.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Aug 2024 06:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725022957; x=1725627757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxknm/UXmtXHlPwjDVhWt1Uw2fradJB++SjLkjTrWtM=;
        b=C5c25xOGTO3E5HYmrGRcDsPdscuZXyeD8MNA/2tcDfcbddbCOGbY0wKENUm4dF/8LK
         yjVwFGvPQ+j0ifJosJmrXisITzRJWl0hJvFNrImZ6rQQEfzIYphkC3mxOVODHr55vbd9
         BYGt63Bao84JCuZvsiupWo70TxnEsUAJrH5wSMb00YHcPQXxTJNsLUbylZE148hYYW5L
         vU5SWhcTdFZd3ug0WeE/HGKBkek22kMQ2DzgfJLXOpUnlPId+2mTjF0jVDMQDstObI5D
         0VPhn9oD18zshrjIomR3B7pOExWNqoC3y8G/QBAdZnyxq1JdEzcHXMc0t4hMmCNoCJuh
         iPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725022957; x=1725627757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxknm/UXmtXHlPwjDVhWt1Uw2fradJB++SjLkjTrWtM=;
        b=CsO0BqGdByjNFGJOaCHNB0/FVBdtLD52tCMDSItGiRjMp1pgTNT3SZev5I8Yvu2hjF
         LsnxqTJpNiOky6LBdW5dJuMEUuFLcgnKyEY0pZskSJo5VOmZ05s6ieFDVGULp143F/we
         aKRn20p2BIZdsLl7JIys50nGi+6L99/oxNGwOOX9xf8g6uk5u4uv6qd4vaeP1pH4K7Io
         F45cvJ3l5ieQlaB1EnwzT0+grlSSIUUTembYRFtrqmZ5OWhq3ARBENk6+WkMd5PkW+4y
         7HC03qzkgFbzBtIs28EF/hb9ZofXumBDjMcZcdL9JQFs23Xu1oW5o2+FR41dfKgWBTsN
         TRyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK5VqIN4Z9OZ+PmBzpSK4073Gi0hUx4yB/jVHGT22ZzlpczLOJiFw81hu22ydykTOhYFfX02FkWpmwBbarGPoXOA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywoh3vB9OHgHdafAiXghLNz36vgsUoF6JxD/0L+m5Muq5KU9Hs4
	ReK+9TtT8v8iazkRCQ1+ds95SbEwoqZ3G18g6YA7p9G5xYMjEZRGo0FdYgWFATA=
X-Google-Smtp-Source: AGHT+IHczdRB06BuoSLQgq8hhYH1CNuoRnBx5DM0ialnn7WYz/l0nKY+9xvSzheB55rdSChNyE4hiQ==
X-Received: by 2002:a05:6512:1328:b0:52e:7656:a0f4 with SMTP id 2adb3069b0e04-53546b93f39mr1386545e87.41.1725022956336;
        Fri, 30 Aug 2024 06:02:36 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba642594dsm80361785e9.47.2024.08.30.06.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 06:02:35 -0700 (PDT)
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
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 03/12] clk: linux/clk-provider.h: Add devm_clk_hw_register_gate_parent_hw()
Date: Fri, 30 Aug 2024 16:02:09 +0300
Message-Id: <20240830130218.3377060-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
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

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none; this patch is new

 include/linux/clk-provider.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 4a537260f655..824b62059364 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -608,6 +608,24 @@ struct clk *clk_register_gate(struct device *dev, const char *name,
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


