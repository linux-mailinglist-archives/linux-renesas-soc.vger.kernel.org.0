Return-Path: <linux-renesas-soc+bounces-6887-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A5E91BF4B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 15:11:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E97C284672
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 13:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 088411BE851;
	Fri, 28 Jun 2024 13:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j7VzlNF1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F201BE25A;
	Fri, 28 Jun 2024 13:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719580268; cv=none; b=WaryxVe2jJx3bKYM6JqpzP9qdcXw1bSY0eK7E8lJUCUynGb+Ibh9nxRXu4f404G5xttEJ/HKNaJtOIKFHsjAh6Pbdu8xVunSemOriFw+Wc4bruxJb4QZLF4e7tqvbB7xvW8pg9NeOLao/hdd6yUMbjh81QNp16JqdFgVuc/MuMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719580268; c=relaxed/simple;
	bh=gmiRWm1ksOpU4eirKsFyK75b4YR6GTu3s+n4pQNJXuE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WCDv5komz3HFNl+BxgBre2inGtMwU+W44Kn6LWv2cDTaeCQeqYbTf4KQa3CU6HEppdTeeUMnJSAf037EAlZdseaC0nWm+lBGT+Zz54XyloCUNyapFmeaMFOJPKba/8G7Xseerkl5sTZ4eRczRPAeM3CFaEXIRaZW2JNuQCwxMGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j7VzlNF1; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42561c16ffeso5050305e9.3;
        Fri, 28 Jun 2024 06:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719580266; x=1720185066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=arH26AOU3MyadiM1Qyn6H/8SbDkkBEfoDv9DbIxp028=;
        b=j7VzlNF19KrQ4GYMj3WhX1zaMkMm+kP4z0gBfKdUHukuuIdgk0l4xGogk3BYJQ+9a5
         PNUOSvsiKPhITUT7tgQJ5JqzmZBesKNEN+SXsYGvRcCv4QchsUwcr8GyKDtTYVo7tQdK
         /N+Fsow2VkWGQiruYvdlMdpXFk4Gp0CX4raokSpGeVa3spvQAQ6oTvS+DMMGeIx2wj9A
         wfgJdcQUIUS0RlPt/J3ub2ZaR7nLrWVITqNY7rnWTGRrNr3FFNBZnV5KCwJDywR2NNhX
         Ss6mP4gs+nWDw90/fD/PJixt9Lvwfpa0sMWMlA4w99K8rOpj51J/3y9ugBY6VtbvQxd0
         MhAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719580266; x=1720185066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=arH26AOU3MyadiM1Qyn6H/8SbDkkBEfoDv9DbIxp028=;
        b=NHP3fxT2z2vESPfITHX4ONAoqmoguHMSyDfcNAtMGOviRKPiG3A5hRPW+nEk9KRpr8
         cG72in/e6tjY7Hp0niH37wQTiDL+HwxIms1NCJpiHwQ5wXd5kun5dyB9SwroafBC1zgQ
         Pol4YkNlHezn8PQkpnK13Ds98q2lkllfmGXRq4c0ECFtKuyRKp3mAXzrZR8StJLrjBUI
         iGyZWupUuC/XhL277MdE5u0961IgGruYMcRGwwT7KRS3H8Ej9XCreWjYGv4ZoDMW2iPf
         +qwS05ftNqwF+selvq770C0T8sa+KGUQ8QbZIwAtrhXugWUrNILizar5pHYA9krlfiA8
         VjuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEu64B8GooUciPRtHkmggjCt/axK68zW4sQ9gXk69WqeY++dXN2/nLEvaVXRY/UrXnQY3KQIbPe+jzcdDytQDUGskMlf7NKWIXjjQRPbjp9o5sWYZdKKbfR3gW19o3IcUtQHN9e7b38za5r5U=
X-Gm-Message-State: AOJu0YxnSCKitNbNxaxJ+wXgpAdO4kcBHKce+C5r3IMxKOg4UYGnRNVw
	ANfRRSnwsuZm5gYrp5/bqIfWnKEO3bpnR8HQWq6bErYsl6Qpjnwf
X-Google-Smtp-Source: AGHT+IEGeSQuONWoEpvbQiQ961s/N9yM9EjuTTYvt05lrZbT3+aX+xcRKPQjvBxYO6ZqnnkY9s41wA==
X-Received: by 2002:a05:600c:2192:b0:424:bb45:cdea with SMTP id 5b1f17b1804b1-424bb45cedbmr58643135e9.22.1719580265593;
        Fri, 28 Jun 2024 06:11:05 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af557fesm35298865e9.11.2024.06.28.06.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 06:11:05 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/4] clk: renesas: rzg2l-cpg: Use devres API to register clocks
Date: Fri, 28 Jun 2024 14:10:18 +0100
Message-Id: <20240628131021.177866-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240628131021.177866-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240628131021.177866-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

We are using devres APIs for divider, mux and pll5 clocks so for
consistency use the devres APIs for module and PLL clocks.

While at it switched to clk_hw_register() instead of clk_register()
as this has been marked as deprecated interface.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 04b78064d4e0..91cf972a20c3 100644
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
+		return NULL;
+
+	return pll_clk->hw.clk;
 }
 
 static struct clk
@@ -1337,6 +1342,7 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 	struct clk *parent, *clk;
 	const char *parent_name;
 	unsigned int i;
+	int ret;
 
 	WARN_DEBUG(id < priv->num_core_clks);
 	WARN_DEBUG(id >= priv->num_core_clks + priv->num_mod_clks);
@@ -1380,10 +1386,11 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 	clock->priv = priv;
 	clock->hw.init = &init;
 
-	clk = clk_register(NULL, &clock->hw);
-	if (IS_ERR(clk))
+	ret = devm_clk_hw_register(dev, &clock->hw);
+	if (ret)
 		goto fail;
 
+	clk = clock->hw.clk;
 	dev_dbg(dev, "Module clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
 	priv->clks[id] = clk;
 
-- 
2.34.1


