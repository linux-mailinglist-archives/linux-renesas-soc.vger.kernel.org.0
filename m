Return-Path: <linux-renesas-soc+bounces-7339-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D656A931261
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 12:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 071071C2133B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 10:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C7B1188CBB;
	Mon, 15 Jul 2024 10:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GHPufHpv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826B718733F;
	Mon, 15 Jul 2024 10:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721039844; cv=none; b=YJu4NahDoz4edg6cPSYkYWxhGrKcPnAUQjyk5LHraoQz9BiOA2PBFXvh6dRp9pPYNevzX04bno3UTg+3KefnO1KkaHtqlhc70gBDRRPOGz82rhQ0nvpvdcjiFxiDU/zMqMMWspHLKyeDhdrPbeoNhjxYMpfdv4X1qvIc7iVbE1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721039844; c=relaxed/simple;
	bh=v+3ZKFZ7uk3Q8OxhjqJFnhrMdd659oROAEafKCnZ/UQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k6R3oVXdVhOWJu1aHOLsx9d7fqopDjEFKdsqKfdVhi34w+htej7Oqlven9fyF9FtqVpX692aQBki846LlQsLflP+PzBGxj8B23OoyO2t0sOyLB0m6cv0LC1zvzpd/ews+X638Hi+Dsmfbh89BKE8k27ZB/OTqzuTgj6b0LgE6Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GHPufHpv; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so24069455e9.1;
        Mon, 15 Jul 2024 03:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721039841; x=1721644641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sdew01gB0bl9P/JHJilf6xhABUOAqs4+UnEf9iz5nU8=;
        b=GHPufHpvfiy+K22+w9RpYsj9Qe/qzYhdL5dXU7XuDPByZzPF/Ceyxi9qBuvJHqKV9e
         3Ok86LXMe7/yzzUexBWooVlMkGv1MZTpBlyY1yNBSSAVcmxjj7yjvaNZAhtwUX+LZhmw
         T00y0A/7xdON4CICGIznUB/bAxoN22FfEaqkdZhIFrxiHGNc/z+/qSDTjcFsgznZGL5V
         Brk+0+tkVJH+99feFXQKhAmYj4ov+9pXSWZdEIx/XACcY6na0rBKXPwBBFVT4Emmt0OG
         5JPLXUXn8K+3qeOmaqtKhYbtrcVJ+JElTPIy/CvqN+TkKtGftvLbpvirC7Q62QwtYrYd
         dEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721039841; x=1721644641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sdew01gB0bl9P/JHJilf6xhABUOAqs4+UnEf9iz5nU8=;
        b=R1vnQkQSDv4u67HE8Q4kRIHmzhtsXTFUJvIsob5hba65NpMmLokblTLd1A2yciujcb
         SdvLc7zI2WIkUADByl0oizUDRrdIMeGmnhh6qZUJjym4jacpabCpHouwxE4mD06CjjQE
         4zZfNAiJWT3uJNTVGRpttPjc7j+JjBPizadX1alrJubXZtY3lAhFpFu0TFkrcIeFOW/4
         pamCRJJivFNr3b/PeG1oITLXmuE214b8VH7lN7691VkJxoAMewhpxg5HABEkrP/3KFrr
         OLbg9S8baP3511wMEU1CaTYoEJGevSDKaeV4zX/hqqN3YkZTlJNqZhGkZVpA9Wyew0Rx
         UIxg==
X-Forwarded-Encrypted: i=1; AJvYcCUJKDVzj9fm7nGl07eIThR71no7K0xrIH7SQnCJg9s71lK9wn9aGpjgV6vrFvVLH9LNsM6xtHBwKuBsWN7nfWldqhcrBL2rGLz3zQTT4pcbIT2mc9THQtupSnLGPRQlvZG0b6S6s8Mi
X-Gm-Message-State: AOJu0Yw5A64RLkNtD0zASOuypdAxoqSQ+j+lXpCs68Zy0xc2GlOE6Pmw
	Gs402weQ4rZ8C92OeYwpxCa1IWOcFvsK3VkxEE7wNrqkO3xmqLNK
X-Google-Smtp-Source: AGHT+IGVCnu598WmCkIbfJRz7edAIP3xCbM0S2mCZqPpf8gdb0q4HT6EihjorD3a1YeA7s6ulRMplA==
X-Received: by 2002:a05:600c:1c1c:b0:424:8be4:f2c with SMTP id 5b1f17b1804b1-4279dabdfa1mr91780225e9.2.1721039840539;
        Mon, 15 Jul 2024 03:37:20 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5edb454sm81153855e9.32.2024.07.15.03.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 03:37:20 -0700 (PDT)
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
Subject: [PATCH v2 1/2] clk: renesas: rzg2l-cpg: Use devres API to register clocks
Date: Mon, 15 Jul 2024 11:35:54 +0100
Message-Id: <20240715103555.507767-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240715103555.507767-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240715103555.507767-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

We are using devres APIs for divider, mux and pll5 clocks so for
consistency use the devres APIs for module, fixed factor and PLL clocks.

While at it switched to clk_hw_register() instead of clk_register()
as this has been marked as deprecated interface.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- Propagate error code from rzg2l_cpg_pll_clk_register() if
  devm_clk_hw_register() fails
- Used devm_clk_hw_register_fixed_factor() for fixed factor clock
- Set error pointer in rzg2l_cpg_register_mod_clk() if
  devm_clk_hw_register() failed
---
 drivers/clk/renesas/rzg2l-cpg.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 04b78064d4e0..1fe71a18cf86 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1023,6 +1023,7 @@ rzg2l_cpg_pll_clk_register(const struct cpg_core_clk *core,
 	struct clk_init_data init;
 	const char *parent_name;
 	struct pll_clk *pll_clk;
+	int ret;
 
 	parent = clks[core->parent & 0xffff];
 	if (IS_ERR(parent))
@@ -1045,7 +1046,11 @@ rzg2l_cpg_pll_clk_register(const struct cpg_core_clk *core,
 	pll_clk->priv = priv;
 	pll_clk->type = core->type;
 
-	return clk_register(NULL, &pll_clk->hw);
+	ret = devm_clk_hw_register(dev, &pll_clk->hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return pll_clk->hw.clk;
 }
 
 static struct clk
@@ -1116,6 +1121,8 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
 		clk = of_clk_get_by_name(priv->dev->of_node, core->name);
 		break;
 	case CLK_TYPE_FF:
+		struct clk_hw *clk_hw;
+
 		WARN_DEBUG(core->parent >= priv->num_core_clks);
 		parent = priv->clks[core->parent];
 		if (IS_ERR(parent)) {
@@ -1124,9 +1131,13 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
 		}
 
 		parent_name = __clk_get_name(parent);
-		clk = clk_register_fixed_factor(NULL, core->name,
-						parent_name, CLK_SET_RATE_PARENT,
-						core->mult, div);
+		clk_hw = devm_clk_hw_register_fixed_factor(dev, core->name, parent_name,
+							   CLK_SET_RATE_PARENT,
+							   core->mult, div);
+		if (IS_ERR(clk_hw))
+			clk = ERR_CAST(clk_hw);
+		else
+			clk = clk_hw->clk;
 		break;
 	case CLK_TYPE_SAM_PLL:
 		clk = rzg2l_cpg_pll_clk_register(core, priv->clks, priv->base, priv,
@@ -1337,6 +1348,7 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 	struct clk *parent, *clk;
 	const char *parent_name;
 	unsigned int i;
+	int ret;
 
 	WARN_DEBUG(id < priv->num_core_clks);
 	WARN_DEBUG(id >= priv->num_core_clks + priv->num_mod_clks);
@@ -1380,10 +1392,13 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 	clock->priv = priv;
 	clock->hw.init = &init;
 
-	clk = clk_register(NULL, &clock->hw);
-	if (IS_ERR(clk))
+	ret = devm_clk_hw_register(dev, &clock->hw);
+	if (ret) {
+		clk = ERR_PTR(ret);
 		goto fail;
+	}
 
+	clk = clock->hw.clk;
 	dev_dbg(dev, "Module clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
 	priv->clks[id] = clk;
 
-- 
2.34.1


