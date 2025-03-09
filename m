Return-Path: <linux-renesas-soc+bounces-14187-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A58A58870
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Mar 2025 22:14:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24FCB7A4708
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Mar 2025 21:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 709F7220681;
	Sun,  9 Mar 2025 21:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l70Y3QPU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93F821D5A9;
	Sun,  9 Mar 2025 21:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741554868; cv=none; b=GZNjF1iiW6X52iXWuBonHIe7XouC+bFvJ4/G9M51eldwjh+dSOlh7GvsEYg18DCLHZ4s5l/yrTC1N3KCQnS5S/aQW/CKffTODiuoEkmAySwr2e284TeGyKM9aiXNAFryRElr8obNK0kx1Nnmr3zy+I1mgi54+eGIIssH1nk0ZjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741554868; c=relaxed/simple;
	bh=Ctb3XdJaw1yEZi06F78U/2yJIF/pTdQZx9Potu1zAF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lzb6nOoqLfEuD+YbKr3piXKMeVC57bPKMUwFYmtW+GnHtG5bkmZj5pUzSdz3DGSpnyMVcoKniEji59m/Y835m0N087jy6hQoXFSOyXVy3FtlMVxlOSy/U1UkRf7F0xQElnbZWRTSJm9BbXCFDRMxT26y9x/D5R+n8UdDoY+T+8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l70Y3QPU; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3911748893aso2213268f8f.3;
        Sun, 09 Mar 2025 14:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741554865; x=1742159665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQsVu3V7iTkYEpNppecMtm9vo+fb/bvtnYLC+K5awKM=;
        b=l70Y3QPUP15y2p11PdSJaSCN5rcMvKrxd4ZMgXaWdUQLP43fWIK7hgY3scwU7CB8/D
         ypJ8ZlrFSvBOnmLgnUxOxKyre7ur2zwpgPJQNCdaIbcDk1wLb5T2uQEZuHFzH7wiUD0x
         IOSEn7W4Veu2vZg9an/CTpNpnxqnBff/UZUbXsmOdBjr5dhFovQ9buEb0IMXRsPO+1L+
         kN8W3XYR2JcSYfvTdL0/laHnuA7Pm6SdEBECpOeyPUnmccGLXBQTmFZGayyyMVJOt2V2
         AEi3I1I86CbvULio9mDD0aIs+1S0+GvAfhUsE2OAvPDmN7Zf9frMwnVME80WuF6LRNr6
         tgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741554865; x=1742159665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qQsVu3V7iTkYEpNppecMtm9vo+fb/bvtnYLC+K5awKM=;
        b=t9Avjq03683SDql6ksWCp8BD/LrN1Eh8+O5vUmn6yRUw0uGs/QzmTvWBPJuqEaudca
         rECkaMGM/+7wvEj1FPPcfhBYeKV64t+TR1p7sYts9acqRn0l8Gmb/9gPI64jkUI4gNEp
         sMKXf2Jio+b+jz81QZJh1HZ8eCS607fBnFOt5zgVK+FZF91aYpHbXCjqysBTiXh/3ztb
         4DR7woQDg2L0hzvgqL/i6sea/rLvjvQXjhL951gwyRJUeDT0VtlTGIFLfAQkr5slR9k8
         FMiPf01mUSD/ghrPP3sjwp8/GmwRfFtNeXwmcET/Zv8/tymYyq6OBxPNigNZJc77wJKE
         dXPA==
X-Forwarded-Encrypted: i=1; AJvYcCVHUvnerzseuvE/7Z0VAPnUOocXeXCqcb3bjSZ5hErfepfmvoTd/41tmA2joAcn1YB3opjyEtRfRjxfjsA=@vger.kernel.org, AJvYcCXjFKkiM8vzVn7miV3np89BD1PJcb3m8ilFjfS+Gu1WTjlNfFFRHBjN6yW4F7KEQGT+huGy0OyALZeBQ3TR+YZzLqE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4+tgBOXGJOd93pPCIltXHvtLVC5mNAfqlzuihpsXtlwqNS2x1
	DAc8ab8sphRwwP5e0rbjt3OZP0zWL+83dGc+yDSgxG7OgHNtPOa3
X-Gm-Gg: ASbGncs2srNp5W0wjcLV9WlA1Dc90xYm84Ey9eT/kjXdj3+5l/87H3MxbLuixYWWOue
	csVJzf1dxAK5nLkGcMiTKhJfISDN2oWeWBdETLe0yuMI+VwfXZ5WvhkQlH2kXNQIYeEWPlTq6I1
	JXXMMTMzShSdyIMTt2GZG+6jeHBieuEQ7Rl0vV3Y2w7RYZftxZtJhvHU6KsS9RuQxeyuXOfk5UH
	ePRxDMxPN0hCeU1sSFlPIiJ9LWeKkf0mj4tNEEnQlcw8HTln63LMr/9wqsjIF2SsljiE/64OaaK
	qMX0yrn5m0pN/od5nuYwQ2Y8N7Smus1hktyuZ2t8Yi4v3CvmgcisbLkIj7poHzBHvF+U/rfAUg=
	=
X-Google-Smtp-Source: AGHT+IGUIWLdyFE/AX8vkaEOfJOg5Gcqr6TEZTjX6eN4222W7kkPwwOcDk+uL3P+elhwAd+QmBK6BQ==
X-Received: by 2002:a5d:6c66:0:b0:391:4763:2a with SMTP id ffacd0b85a97d-39147630139mr1587245f8f.47.1741554864782;
        Sun, 09 Mar 2025 14:14:24 -0700 (PDT)
Received: from prasmi.Home ([2a06:5906:61b:2d00:e951:ba7a:6a53:bac5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ce70d13b4sm64443845e9.38.2025.03.09.14.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 14:14:24 -0700 (PDT)
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
Subject: [PATCH v2 2/5] clk: renesas: rzv2h: Remove unused `type` field from `struct pll_clk`
Date: Sun,  9 Mar 2025 21:13:59 +0000
Message-ID: <20250309211402.80886-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Remove the redundant `type` field from `struct pll_clk`, as it is not used
in the PLL clock handling logic.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- New patch
---
 drivers/clk/renesas/rzv2h-cpg.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index d115a810a46b..e489ce28ae63 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -97,7 +97,6 @@ struct pll_clk {
 	void __iomem *base;
 	struct clk_hw hw;
 	struct pll pll;
-	unsigned int type;
 };
 
 #define to_pll(_hw)	container_of(_hw, struct pll_clk, hw)
@@ -199,7 +198,6 @@ rzv2h_cpg_pll_clk_register(const struct cpg_core_clk *core,
 	pll_clk->pll = core->cfg.pll;
 	pll_clk->base = base;
 	pll_clk->priv = priv;
-	pll_clk->type = core->type;
 
 	ret = devm_clk_hw_register(dev, &pll_clk->hw);
 	if (ret)
-- 
2.43.0


