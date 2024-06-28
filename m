Return-Path: <linux-renesas-soc+bounces-6888-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C62AF91BF4C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 15:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F1E91F2448F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 13:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6D41BE867;
	Fri, 28 Jun 2024 13:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hxxNDeJV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F07D1BE842;
	Fri, 28 Jun 2024 13:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719580269; cv=none; b=VoTTepLUJ17m+plTmSnU6G2dTgFemEtbcBIArisIP6ga/thpSbypVzv4rrJQkA9BMzgQ88ikw0ytyf+Q7UZnNVTqTPc1PPt7gAkNzg3QIA/J33dg9x6rgv0nSqEE2J79QNUsieU0YTbNl2F0gBze8YNAX2pMq0K/vC5MATmTLkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719580269; c=relaxed/simple;
	bh=nhPH/+k5ngyB7bXSTPk8QGcDmq88LYCXXlU/3rmIlcE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pnOw4tGxzIvqcn0urUUWsWdXbRRr4Kpx0kOxOR16trQEWrA0/L0DwDphgny9fx0EorpKecuBsS4Rr0NYvGNZJOMiHvyt0lz4PfK/wFd+PZa4FzgGMOLOllYbqvV1+doZxdDNVO1nJqt2ImplVHBqj6E4a95k3Aeup9fm/AFKGLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hxxNDeJV; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-424720e73e1so4772555e9.1;
        Fri, 28 Jun 2024 06:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719580267; x=1720185067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rzeL8Oif6bmQzjAUqtXm4BViAp6++YaRx5ML2H5ATZ8=;
        b=hxxNDeJV/1MNj9f2tYLPlVJq5W6zrgRgwydl6J7o54PPUB7fMcy+HcwvanhjGUvHsG
         2DnlzX7oytmPVADfnkxEbNR80mo+cS3puZGtm8edZ1nYuAaLjG+anyiPcRLdx5tfoW7s
         SjY2BSPlQydbqsrPV5MP6lzvoL5e25CdrOb49Rcd3OGJwn/efmty1Iecj5wUepQJqFdL
         3gGjmaJIu8ZwceEiTfAyX1f8QhbqVi6vPLGl+K/ImYEikhuqEDR4biz/JhlB2TKUiLB8
         hajjHT89RkaDVdQ3Bt6I+R4QV4KNIc/k+gKI/5E8Zug+ijS9XhGDBwlldZrNIPU1YCrD
         5JjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719580267; x=1720185067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rzeL8Oif6bmQzjAUqtXm4BViAp6++YaRx5ML2H5ATZ8=;
        b=se4TqObzdjNiKcdGPf+FniORxC//4UjLBqcwRrMLKx5HTL6nidJ6FDGrLXTiQBpNQn
         tHjLgsAWrmXHnsFZSUSQ6DD6ymO4A4Q7Frd60RK2Q7Q7O60vAuAI4I5/tkyFQIVLtmhC
         dNd9qS8UyIbLx4zmYUNk76ScSlO8QP7SEJVfV+5pLUs93L7+48evUlKlrHvbOEyXGK6C
         WIHnjmJlTOF4q91IuI9/S+wwJDe+tN9mGs2fHz0y45UkYDOJXhxRnwWHlM+8huGBRyFa
         a4j1v89Sd7KrVaTx2kIt5kRucsUp0NXFR53Py5IiIb0/kJEf8XjLmacUisTgquy2ItbS
         ifQg==
X-Forwarded-Encrypted: i=1; AJvYcCVZ2vtegS/0Tea9v1ShEuzrqB3WGcIE291KuksVvm205QnPTGc6mZcIuYBOu894Msk2SIh99lq6B3XCI3UUfWiIe1tJnmx9VQxY8Zy47p/ZZ4fdLQ/hXGXlZx7K9TIilgbVXHBWsu+cmlHnDXo=
X-Gm-Message-State: AOJu0YwlGMFrif6kQ0cgGpiOJCiCX4WVg9e3+X1lcYUT33o5H2YOcXWL
	NjeWiz6/kNW9JF9M80mYIU15uLFnf+wPVHv9ecxLMdjla3vDUFrf
X-Google-Smtp-Source: AGHT+IH0v7DZqfFSvcmnByMk81MJcstSxCHztKOrPHQE8fsdfDubHKVIgGqKLeFqZ6v7Qq3zFTwVnQ==
X-Received: by 2002:a05:600c:4496:b0:424:a578:fc7 with SMTP id 5b1f17b1804b1-424a5781156mr73741775e9.3.1719580266653;
        Fri, 28 Jun 2024 06:11:06 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af557fesm35298865e9.11.2024.06.28.06.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 06:11:06 -0700 (PDT)
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
Subject: [PATCH 2/4] clk: renesas: rzg2l-cpg: Simplify rzg3s_cpg_div_clk_register function
Date: Fri, 28 Jun 2024 14:10:19 +0100
Message-Id: <20240628131021.177866-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Refactor the `rzg3s_cpg_div_clk_register` function to eliminate the
unnecessary `base` parameter and streamline parameter usage. The `base`
pointer was unused, and the `clks` pointer can be accessed directly from
the `priv` structure.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 91cf972a20c3..129067b090bc 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -339,9 +339,9 @@ static const struct clk_ops rzg3s_div_clk_ops = {
 };
 
 static struct clk * __init
-rzg3s_cpg_div_clk_register(const struct cpg_core_clk *core, struct clk **clks,
-			   void __iomem *base, struct rzg2l_cpg_priv *priv)
+rzg3s_cpg_div_clk_register(const struct cpg_core_clk *core, struct rzg2l_cpg_priv *priv)
 {
+	struct clk **clks = priv->clks;
 	struct div_hw_data *div_hw_data;
 	struct clk_init_data init = {};
 	const struct clk_div_table *clkt;
@@ -1149,7 +1149,7 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
 						 priv->base, priv);
 		break;
 	case CLK_TYPE_G3S_DIV:
-		clk = rzg3s_cpg_div_clk_register(core, priv->clks, priv->base, priv);
+		clk = rzg3s_cpg_div_clk_register(core, priv);
 		break;
 	case CLK_TYPE_MUX:
 		clk = rzg2l_cpg_mux_clk_register(core, priv->base, priv);
-- 
2.34.1


