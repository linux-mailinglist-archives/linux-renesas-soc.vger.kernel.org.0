Return-Path: <linux-renesas-soc+bounces-18733-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F736AE8607
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 16:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5166F1894F9C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 14:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D52F2267F66;
	Wed, 25 Jun 2025 14:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ia4MoVq+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3DE266EFA;
	Wed, 25 Jun 2025 14:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750861043; cv=none; b=orBw03soAPDHR41+E6sFfSxmwLK3tYNWB1WArTDhaydOC7hpzjWTrv0GHcGE05RzEuNM9xp88ZTawMDjLok1oygK/P8ClBpwK3gxgQ/kgKAG1HmGSbCaKHp7XgvBim4JB6KhPFAkcOfGn9ZofkCoN+OyeFl65l5Ja6DGVZcv/sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750861043; c=relaxed/simple;
	bh=T3T4B/EgjCOcgobjU2/eb+v+8EkMm7rIjS/zYG2A0VA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mEk3pOawcueEWrj7TopGw8k7RIR6BdHi5UgZwI8n3nJVdO6iDf5oR59v8ZPlfS+KnYZRh47b0QpGwJlakLDUHrGtObapnbxZHdnugPJVGBHb6HzgAi+SK1fN+5zS+gMdMXd02RttETSD/beeCn9RZMVs4qrqeBk+VSjIKS+ewxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ia4MoVq+; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-450cf214200so58192055e9.1;
        Wed, 25 Jun 2025 07:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750861040; x=1751465840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+6aexemoa6TrhWM6bdU7hYQWr3l9qlRXvN00Dniv4g=;
        b=Ia4MoVq+yGYHrc/ym7BuzBlYlFLp2Bu5osoFSX1GXDLT1aHRydyiNVHWaX6ySVZfiC
         JPGz0qgQ+JcV012aJlgnbEz5jzu8pH7NhAahg4QXbI3LXWm5xa+9bbYHXY+lHqf7AHuE
         ASgcHJKI87MVslQ7KmyM13TYH16HAllngUTwrNjkntIhNmaPyYo+konMg61udY9UaI9M
         IB/2IBqZT2XJD92FPpFAq/qukrP51gJ1ojEA8REHGKxID+AMKuBVddyatBW+52CU3MpE
         +OMm62fRqKd3x7CmEZRqMFVbWF1uOTcLtKJAffSGC3MvDJa0zTVUpE9a9I96ynWBUU+Q
         MhGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750861040; x=1751465840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+6aexemoa6TrhWM6bdU7hYQWr3l9qlRXvN00Dniv4g=;
        b=W/Wrw6GdW9+T/zrA26IqPTSiUnT7Xt/O6Sk90SMuyRuZi4XDyL/Wxa317AxJ/GSczY
         RP4Fc2vELnPNkLyovPAMc9Wu+jDjMmo3Iok8RvTStANMqrsLUA0ElO7AmHJaPFpUdI4j
         TlJX9WEwQi245mJZFA04rb8ueg3S4BxHTv49G7FoJL3ttLkH/Ssuc8SlY8IMlIyu3UPJ
         TfvaqCG6fKvTJTA4Vj15Ra+WUpkuzT3+zv69J3tXs6Vl6DzxcMwJCIVlc8K5PThJrHv6
         eVByuRCcRO0FQMlVHvxCB+LJ/b8XjMNJtjco+CIs1vpFuE0hH9l+/FvPgu8tAqz31JbP
         4hBg==
X-Forwarded-Encrypted: i=1; AJvYcCUc1QYxtCuZbxiBU0EDDT0WRdwBZt/hIi/hPbEFIBC9mEomtbNVy1MTg57LbA50+68t8KWTmapxdCdR@vger.kernel.org, AJvYcCWYivIgyCPspC3uGmY+LniCrq/keGfDkB96gv5/ABJqZ/x06R9Q0RReGPX8LUlKRdwtffdj7HvhlKcU@vger.kernel.org, AJvYcCXUzSwy1oPH4x7g/U4vdYjqyk81ZALiWUEnmDwZWLnsrqeI34iL/EEZVJJI6Zr8W2NoOfEP7HmDtI4FEbbF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0GR2T7PG1K0XE+zxXRuK2KvisMuyB+PC5updj/DzjrKg9vkiM
	LiCJJCjYJnkmZAO8pDA0PmMZ5anFXZaaNwYVXkrVgO+twji7pJNOY7Az
X-Gm-Gg: ASbGncszfdX4NA0oTMclzgE2g2qZS8VLQGEL3MZau2X8hFVWbcGnl7SEVOjxvee1Nzr
	T2TVvSpFo4/sYI0fKpuHiv6TsvCIqmebkAw3vKWJ6HyNecp6JGiFNJp+3ri+vts1FhdlTMY31VN
	KneOSJzz4BtsD/XxAAH4iFYiGH5k5Dgw0DzzojIroO+dJTIJ5vXmlUH8KPFW1iBcMFJEEiAfV+R
	BPQU16paGvktbUp49t1CfUyrTxp0SPRySJkCAJm4dzGFOL4Inp4eNLzfhnk90qU9LrG7LYpHdJm
	2sN2FSvs9sBWyyiAUMYQO7Ztvv2ejcO1lk7QKu9ofmb0skjb/px4pjLcc8hberz8+MEQ3GIwtBd
	ITnsLLpbFsnh9jjC3187K
X-Google-Smtp-Source: AGHT+IEOi7zAxpAzlfswU03K/n4Rf9hQmWXx+JyTsPIqnl/OhUykYfA/kEDapnjd+yKTxy47RCGj0g==
X-Received: by 2002:a05:600c:674e:b0:43d:b85:1831 with SMTP id 5b1f17b1804b1-45381a4afb9mr34745185e9.0.1750861040038;
        Wed, 25 Jun 2025 07:17:20 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c47e:d783:f875:2c7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538235a85bsm21609425e9.23.2025.06.25.07.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 07:17:18 -0700 (PDT)
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
Subject: [PATCH 3/3] clk: renesas: r9a09g077-cpg: Add RIIC module clocks
Date: Wed, 25 Jun 2025 15:17:05 +0100
Message-ID: <20250625141705.151383-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625141705.151383-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250625141705.151383-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add RIIC module clocks for: iic0, iic1, and iic2.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g077-cpg.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index 93862d84f95f..ed1e94cbd267 100644
--- a/drivers/clk/renesas/r9a09g077-cpg.c
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -154,6 +154,9 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
 
 static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {
 	DEF_MOD("sci0fck", 8, CLK_SCI0ASYNC),
+	DEF_MOD("iic0", 100, R9A09G077_CLK_PCLKL),
+	DEF_MOD("iic1", 101, R9A09G077_CLK_PCLKL),
+	DEF_MOD("iic2", 501, R9A09G077_CLK_PCLKL),
 	DEF_MOD("sdhi0", 1212, R9A09G077_CLK_PCLKAM),
 	DEF_MOD("sdhi1", 1213, R9A09G077_CLK_PCLKAM),
 };
-- 
2.49.0


