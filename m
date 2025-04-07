Return-Path: <linux-renesas-soc+bounces-15505-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F3DA7E784
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 18:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A23BC16BFA6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 16:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E532215058;
	Mon,  7 Apr 2025 16:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PXKbRxHU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D925213E9E;
	Mon,  7 Apr 2025 16:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744044743; cv=none; b=RTh8V2mMa1jz8ZqEML9so4CNSgtjNDT0EAs5QjBXPOx1vs80ZMntttp9x6sfGmqB5udbEd14t5Zp7NsWbGKc0ltRywachsi2oOTPHWBgvPCrFb2afyYwaMpvEyoTJEo/vNgpoephXgb526GnLmPtiOrQBjTpoDEUBuT2/dZHHsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744044743; c=relaxed/simple;
	bh=t23BigdHXTVLwdoDkMWMAn1WR1DFwTXnH8PIGUd0HWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k5qTzpRR8lLy8GSxSh4q5PnskZjL3/Mp8urPOUF42DweVcjh0yYjqNY7CsGHXFLTn0wjVE4guN32MlDFlIWIXbWu2UJVu44r4M+C3HP/UL+z9dXCeSC0oTmdiL2+Y3M1WEXWivcTli7UfCKPRhYPAlzqAFBn/ilS9k76MuQsi+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PXKbRxHU; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso29454275e9.0;
        Mon, 07 Apr 2025 09:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744044740; x=1744649540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hic8lAphkKhUOBEdKa+KxeuQM+tNn6kxbBP9aFXKdok=;
        b=PXKbRxHUzi2p7SUswoNIoyw3+KBD++RrvvDIje3Z3Q6BpgSXvv9Hi2/MBYpXfYVR0D
         s7cKFMlrbDQlBmp6WC1DDcK+stmNJB+js75NM+kVo7WxDxGfP6RqN3Usq0vdT/5s5xEU
         70byVflZeNoK+j+V7Na7qo75uEEz/tK54rUk1xcFrYfF2H/isbjUM9UcU3FHs0/rY20g
         cRnogEoF0MSKeUDP/89q+HVW7wJoi5d/C7RNOM4plPqQqG3DONb47X3YSAQbaibyL/3b
         cpZCm6x4T5e27lTjxcgooIrUahNKO8KysDP3L9+wcrldkPJe4EuezI0HwG/oT6Wd1Fzk
         5DTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744044740; x=1744649540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hic8lAphkKhUOBEdKa+KxeuQM+tNn6kxbBP9aFXKdok=;
        b=llc4GB57gTGpyzNCK2nvhb51Ekda4KaTkG6xJldC01pYxDDIrRgp3B3Ilsq5Pgdi2m
         y8BrjFDN5vvUJrcU7Tpj/DiwvSYvogVz9K19EQkw2ccqGeC/BY9cNJeIQ5ytjffKptUZ
         Zt5uU7x+0ooZI2Me3T87Deg8DtmE3nl/6W69Wyj5aomuebmtExcUvYiIDtwcKhSpyE8i
         nDHVXNH7gfcd0o0BXN93450+1Q39/iGBdWXmT1t6hvu0MGbpl6M33tC3L3mrxWWYsqWT
         ufEOhvVLZLs0hfR6iVihzAYPwWpJh2xwMJEl/v6n6zZGjO3/hJVlXaqG5umhuqserxlE
         px9w==
X-Forwarded-Encrypted: i=1; AJvYcCUAixwz7Filfzr7nUfREdwJSWTLA7hZCYdKDpFjea+WO4Y3fYNhljcB3MqQNnzHGQj2qChe7ITrisoe@vger.kernel.org, AJvYcCUa2D1oPPWqqWgrdT+etSIO3hnj6ERxRp6dmJIs6NkZcPnSVtiaUT2QyHWuWKNLORJyrOxqnuWV0jwG@vger.kernel.org, AJvYcCXbraHenS7cQPfZLtu8yR8P5rLo6pzhLTKa83lBNYYmESKIOmvPfulvuhad6UIjpusc/+gMoJgJXojwhJFL@vger.kernel.org
X-Gm-Message-State: AOJu0YzxVHqfBAe0T9OFrSA4ifDdDpEBXNg5Q9bI/+ztQtWhEUUidJfj
	yoeB8IWCdPMlfALoXOZnEZnkQb8au0xdz42WFEhWwn7tinufDA8/
X-Gm-Gg: ASbGncsvQmYmQuUUSmGMQNpXVMENeKktfzQNEN89z0OGeR5LqN2DJt8mUBOtt+o6/YF
	rEgrVDag1LrduMwayKIl8dZqBVPbLWsQ21r0QwA27eP74YI4PrUmtjIwx/jm0O7YpJAUuJocizW
	zEYF1js74nbAIyIWH/bsSBLsn1s39iZ6356CpNzOnwjImfyGkhFCxEoXhd44/n+FCnlawCqtEN3
	kKQo0xobE+QvQmCsyVmo8dlv8t90KPqZfYjFnhXbXfwa+UMj60b13C5SNsE3cGXzaodK1O9WAaH
	oQREKs2/WkWbi2s418Vmn4hc3y+9x9+E30uhim88HvTMHftWbQFKv8Lq2/GZkbAz63m+kQ==
X-Google-Smtp-Source: AGHT+IGxECAOPlisZzoRyl5ma5z1rpqqMgA27pGjUKS53MT+25NNgxJlX60ILBGhaQlT53O1ANTexw==
X-Received: by 2002:a05:600c:34c7:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-43f0e55b4e6mr1718695e9.3.1744044739508;
        Mon, 07 Apr 2025 09:52:19 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16ba978sm139272305e9.23.2025.04.07.09.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 09:52:18 -0700 (PDT)
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
Subject: [PATCH v2 3/9] clk: renesas: rzv2h-cpg: Support static dividers without RMW
Date: Mon,  7 Apr 2025 17:51:56 +0100
Message-ID: <20250407165202.197570-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for static dividers that do not require read-modify-write (RMW)
operations. This enables the use of the generic clk_divider_ops instead of
the custom RMW-based implementation.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Co-developed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c |  5 ++++-
 drivers/clk/renesas/rzv2h-cpg.h | 12 ++++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 4123c30e8663..e53cd31c218e 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -380,7 +380,10 @@ rzv2h_cpg_ddiv_clk_register(const struct cpg_core_clk *core,
 		return ERR_PTR(-ENOMEM);
 
 	init.name = core->name;
-	init.ops = &rzv2h_ddiv_clk_divider_ops;
+	if (cfg_ddiv.no_rmw)
+		init.ops = &clk_divider_ops;
+	else
+		init.ops = &rzv2h_ddiv_clk_divider_ops;
 	init.parent_names = &parent_name;
 	init.num_parents = 1;
 
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 00b52b459aad..97054f207113 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -37,12 +37,15 @@ struct pll {
  * @shift: position of the divider bit
  * @width: width of the divider
  * @monbit: monitor bit in CPG_CLKSTATUS0 register
+ * @no_rmw: flag to indicate if the register is read-modify-write
+ *        (1: no RMW, 0: RMW)
  */
 struct ddiv {
 	unsigned int offset:11;
 	unsigned int shift:4;
 	unsigned int width:4;
 	unsigned int monbit:5;
+	unsigned int no_rmw:1;
 };
 
 /*
@@ -61,6 +64,15 @@ struct ddiv {
 		.monbit = _monbit \
 	})
 
+#define DDIV_PACK_NO_RMW(_offset, _shift, _width, _monbit) \
+	((struct ddiv){ \
+		.offset = (_offset), \
+		.shift = (_shift), \
+		.width = (_width), \
+		.monbit = (_monbit), \
+		.no_rmw = 1 \
+	})
+
 /**
  * struct smuxed - Structure for static muxed clocks
  *
-- 
2.49.0


