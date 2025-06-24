Return-Path: <linux-renesas-soc+bounces-18656-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBB0AE6B64
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 17:40:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F5DA7B27EE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 15:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683012D23B7;
	Tue, 24 Jun 2025 15:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nq/1XviR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C292C325C;
	Tue, 24 Jun 2025 15:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750779060; cv=none; b=ZkmBONnq5NIsVktyB7DmBISmrJqD64D2w+MqpOVXtKkw8TxXGI4UXVRO0taj/IUmwD6ZXHdITdPMo/50FNh3XwULOSndRp2Gp8mhT3kV+R65RrV8U4KdJbpWU0ym4OhNbgSCnDXfRqDoCbrG222jKKGfqxIhjmGqSyH5KIq1VsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750779060; c=relaxed/simple;
	bh=yUGUkCQ/QKgqSq2owJYCF7Csfp4O7rJbKmdmg5jjGhI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wvw9sGJbKWRNSiA5louzMsScsbFR/2I7RR1e4wOHpMOIcIhPBrr9hjni6L6wRPzilSHLAvy7DQIkA1NDBtAM2lZlpzTGe3lWwLySq/c8KFQlCwndRmGzXwdFFmIYHcFRaFTkmjecg5UaQBDuuIriFZ1ghuK9F2VsnPknTh/6OU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nq/1XviR; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so489210f8f.1;
        Tue, 24 Jun 2025 08:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750779057; x=1751383857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EHLpUemet6IIELxd+MJr/9Yw9N4ayMnJWVA+rB10Oos=;
        b=nq/1XviRD6ap8MMrHB5yQaOI1xOqMwTdxe64Qffjt1dPUS+8yDBDFzqGFdXs+0QJc7
         XiybZ3U2obRD0myt56/SDc1OC4N5nMZ3K45y/DohGgb8fa4Et7/aCQwXA3v0uloeYUeY
         niVp1d6FWJjRX8MTkHcb2gPQOc1W6NzgTGYAhmKe+TB/XFKe8NLlRbSMzW56z4KwwGWc
         TOA5aJQb9ik90wEMGDkkqTKoN6cXzg/vYIMfG5TmvOAzKDnM+EFJKQAJy/oPF/G2dNgG
         4Ed8NiPvu5zLSxBeVvj9bembP8oEIszIocsWdtil8fwocky//Q8sl12i3YfLgzJNwa/n
         W8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750779057; x=1751383857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EHLpUemet6IIELxd+MJr/9Yw9N4ayMnJWVA+rB10Oos=;
        b=pNE6SHAsuCvDfeZEIr/b32HNVuZE0hc9fGEN9MYZW0u0w/HSZiYxJOF+zbB5ggGdec
         JAoESvZTrsztLW7ExVmGq7kaO0qXDTeSRlmMQaTTh4ZPaLzXVzNWurTvzEDoxNEYSkdG
         F+6h3zLZOQSFZ8Vn/21x6dKAFEQMuzok7mSQc0fRcWSbgLRXh3R5W6MBSxYQ0gv09ek8
         /HU8hrMq8KTuaeTzxTqy3sLxenJWNhNqsLSmWmldGeRVlOyKgYhyzLaQ4LqGT/3YeMPh
         Nuz0KmMvRjVq1BO7Ys1dJIMJIt7jgZRxFhrk1TmIvaA+tuR3PgPf18aHFjjbrY6wjsYp
         4B0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVw7qWKFZqwukGg/eWtytco3JSVkc6kiNOpZ68rFkNtlFvaj/WZlwBg95fKMhikFZhtM8IE2hWY6U=@vger.kernel.org, AJvYcCVKfdEuvMgVS68LP5LgqRmlKk+WPLmWhQ92FtuNiZQTKFEc+wQe89UWoKU2O6KaB0DnFkiIyap6BOi9zeFq@vger.kernel.org
X-Gm-Message-State: AOJu0YzLMn4/1AOTucbO+mknoYvZ5SQxsbUOQanhUZMFOUufAZqIEIp6
	Y4BKB+DeUPrYXglG1sx9/AsSQOpFaho5507n/ZNqMrPW41DDRQChDrfJ
X-Gm-Gg: ASbGncu2WFMlZ+OPT/yBZGbudrHsiXIDBLJ5tvnHrSOw4i/Pk4YxXQ3WUaawqebVYn7
	+5l592XReuCvFyXQ+mIlSaHFY89arAqWmXegtLMRBCVH5PRWkInquUiPrfCFeNMkP5FzekOUHHu
	SGUvZnYLFQj5ozvN/+wAwaOn+1SYju92EY3GPE/DOtugug/qiRhhtPlCTcQHBbz8YGOUBhlxEKD
	6eH0NqRI5WMUuhRpBauW7cR2tUyW5bkN/5NXjq+y+AyOnHXnUzW4cMhJmx6WERN869R0SnGF+4c
	5Gm4ztwSg1hbSROXkWYMeWauXHtBppRu25E9DTLfDQZHZK5lCIco/Vd7ZCpkV9qHXuiDOVFX7bv
	6H/N1whSd1bSvs+wP46ZiG6GCp5vClZg=
X-Google-Smtp-Source: AGHT+IGklZvvIH8UBXTclgeW2A/lv445Ex5WTe7F57VYlm11bLY+pjGlpjXItRWzj1DC+7oOQTRdmQ==
X-Received: by 2002:a05:6000:26cc:b0:3a6:d2ae:1503 with SMTP id ffacd0b85a97d-3a6d2ae16c8mr11886718f8f.34.1750779056588;
        Tue, 24 Jun 2025 08:30:56 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:a522:16f6:ec97:d332])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805112asm2225182f8f.9.2025.06.24.08.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 08:30:55 -0700 (PDT)
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
Subject: [PATCH] clk: renesas: rzv2h-cpg: Drop redundant base pointer from pll_clk
Date: Tue, 24 Jun 2025 16:30:49 +0100
Message-ID: <20250624153049.462535-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The base address can be accessed via the priv pointer already present in
struct pll_clk, making the separate base field redundant. Remove the base
member and its assignment.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 761da3bf77ce..2a17c480bdd2 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -101,7 +101,6 @@ struct rzv2h_cpg_priv {
 
 struct pll_clk {
 	struct rzv2h_cpg_priv *priv;
-	void __iomem *base;
 	struct clk_hw hw;
 	struct pll pll;
 };
@@ -230,7 +229,6 @@ rzv2h_cpg_pll_clk_register(const struct cpg_core_clk *core,
 			   struct rzv2h_cpg_priv *priv,
 			   const struct clk_ops *ops)
 {
-	void __iomem *base = priv->base;
 	struct device *dev = priv->dev;
 	struct clk_init_data init;
 	const struct clk *parent;
@@ -255,7 +253,6 @@ rzv2h_cpg_pll_clk_register(const struct cpg_core_clk *core,
 
 	pll_clk->hw.init = &init;
 	pll_clk->pll = core->cfg.pll;
-	pll_clk->base = base;
 	pll_clk->priv = priv;
 
 	ret = devm_clk_hw_register(dev, &pll_clk->hw);
-- 
2.49.0


