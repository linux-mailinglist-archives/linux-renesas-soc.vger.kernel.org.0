Return-Path: <linux-renesas-soc+bounces-6889-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E36DD91BF50
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 15:11:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 127D61C21132
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 13:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E44B1BF321;
	Fri, 28 Jun 2024 13:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUftKyfm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13C01BE87C;
	Fri, 28 Jun 2024 13:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719580272; cv=none; b=H1Fxe6p5CGBMcF3DgNLOVUY/LwbCYOHIWukww9Z6nQLGgYvuogFE/zyhE2FdfdKYnlw1sKjejhPcMV4Wn9C8MxVsQMhA8qbvLByiJu0PUlD8n4OJ1rj/L5r6PCBEkIM1CJnTM/w+1mS53INqRSSHZ4AO6Arfr5SER+PuTpeZXBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719580272; c=relaxed/simple;
	bh=+dIPkRM0YOxo0jvItiwo4DDnagEyhkveoV4JRE2iHdo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rzga8u1ATyPl4OOg8Da3sIuLMr/ueKvBtNr+8WZkB0CDhRIcFdyfpxyTq213Z7tKXLiDkwAR1MyS6cMi/gx4kQc/nxtZ/cUDnmrtip8mwbkVRJD5orpq2cEILbOfpA++S+ynnYILhDVYSDHY9rb8nKjUT+ltaucea9kvOnHYqrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUftKyfm; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-424f2b73629so6046795e9.2;
        Fri, 28 Jun 2024 06:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719580268; x=1720185068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yk0mlobE0PRXXoTJHYCJGXL8OWaeUpXm7YvVsBYZ2Uw=;
        b=VUftKyfm/pwgH5z+EMiRmN5J5zZUFkQjZ4LlYFbbalvMMRjqORgk1FV+BcfQqVmHT0
         DtXVnv5/QeqtAOc5d8YKUjautN4FOyeWbzGduP2JzYMkpz7WDsijxpsLcGHhrWdwe6F3
         yHkOa9YCYqytFskACPVDxEQPr9sDAaoByVXouRALSQjBiu1ylk+oc6gRmAgCqd6N2GgQ
         Fn2Y2o9q2oX05D09JSNzjtFrlqkVujRueXZAS7+G+Gu++TaANcRMr+Yp2lINC1854ZJX
         lmltlvuM9ii9D6jhDrxH4CmN4D1GCPO9iVu7ls+lHnPmFeBQJNI9DlZPrBFegnIfrmy+
         7Npw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719580268; x=1720185068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yk0mlobE0PRXXoTJHYCJGXL8OWaeUpXm7YvVsBYZ2Uw=;
        b=oHBJmEE1YQzR7To0FHHl+8EJ6ac1B8EGq/kbHIkbBNwF+HtGT9zff+F8QXubh3i09b
         DkR8ezOVTfZE0EZroOMMhtJlYfDygpX6JVMw4+jbpfN3XVwZ1/QwOs135RLtxQ6Yijzm
         kxNr0w7Sbj9dsiYK/lb4NZqeSO+b8CzUFG1k9lZCOYkLzXA5Q15TiFBZTuHhj0KAPuoq
         K/nD1AN/hfTbxyg0PB76H0pKZEs8yO3K8xzZYNbHeQ15IXtXgQB4bx/DpVssY9yXvwZT
         fuNo1JTkYCTmuBeujI/JMrrB4BSU6KV3kSddZYla+Drs8jiyTJ0hrY9ILoIaa9d+eTE7
         Jd6w==
X-Forwarded-Encrypted: i=1; AJvYcCXkp81PBEvL2v52/FjHZMNICPs4nqEHzP41H9OCOOKVWbYIfS2Gda5u9fEn0xgX/ItG7SYEkA/3J3x/xbUmaKtiktRZAcK1szR2IqS5WN9NOawWYnJpI+8ndZFPGu6dGs31ByA3SdgEB/ZnRmU=
X-Gm-Message-State: AOJu0Yykx01h+tdwmf53GaZeqw7TfEGyK/kDWGwAZlqpHKSLG8i1k8o3
	/31Q+Tp20XaV0t9DU4g61rbPK1tNafiwJ4lMvDfQOeSP61Hdcc0o
X-Google-Smtp-Source: AGHT+IEcH9yoYKLJro8HOXhWE18TR9Wl438Cw6ePYsdmnc4bqQx/Gj+tgpItJEtq0k6cTIPY9JHPSQ==
X-Received: by 2002:a05:600c:1d2a:b0:425:185c:7a55 with SMTP id 5b1f17b1804b1-425185c7b75mr60586735e9.40.1719580267815;
        Fri, 28 Jun 2024 06:11:07 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af557fesm35298865e9.11.2024.06.28.06.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 06:11:07 -0700 (PDT)
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
Subject: [PATCH 3/4] clk: renesas: rzg2l-cpg: Remove unused base pointer from rzg2l_cpg_sd_mux_clk_register
Date: Fri, 28 Jun 2024 14:10:20 +0100
Message-Id: <20240628131021.177866-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Refactor the `rzg2l_cpg_sd_mux_clk_register` function to eliminate the
unused `base` parameter. This parameter was redundant and not utilized
within the function.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 129067b090bc..d72d95e0a7ca 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -508,7 +508,6 @@ static const struct clk_ops rzg2l_cpg_sd_clk_mux_ops = {
 
 static struct clk * __init
 rzg2l_cpg_sd_mux_clk_register(const struct cpg_core_clk *core,
-			      void __iomem *base,
 			      struct rzg2l_cpg_priv *priv)
 {
 	struct sd_mux_hw_data *sd_mux_hw_data;
@@ -1155,7 +1154,7 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
 		clk = rzg2l_cpg_mux_clk_register(core, priv->base, priv);
 		break;
 	case CLK_TYPE_SD_MUX:
-		clk = rzg2l_cpg_sd_mux_clk_register(core, priv->base, priv);
+		clk = rzg2l_cpg_sd_mux_clk_register(core, priv);
 		break;
 	case CLK_TYPE_PLL5_4_MUX:
 		clk = rzg2l_cpg_pll5_4_mux_clk_register(core, priv);
-- 
2.34.1


