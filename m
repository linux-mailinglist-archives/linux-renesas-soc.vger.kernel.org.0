Return-Path: <linux-renesas-soc+bounces-15506-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A573A7E772
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 18:57:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C7043BA1B1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 16:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA8821507E;
	Mon,  7 Apr 2025 16:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hp6qScNM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0C42144D4;
	Mon,  7 Apr 2025 16:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744044744; cv=none; b=h04/6whd9D7tyAPBe2hc/hngMRsmX7vdEB2JkvCNth1F2CbQvz7p5fE1D0ZYydE18fT/yCD+DHZdTfVVeVQeCG6YsbYgTNjyl6O0ahXoZfh7tYVFoEtEovt3C5k03Bo8KYcw7PHbQ0s8/9xKS/NazCjBrNrgu9eCGha+iP6Gm6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744044744; c=relaxed/simple;
	bh=Y4X817r9lOH+nu/l8eZMT49CT0dQ5P+l5GIy7tR+tOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XhuOqL1WwuBXOQ/eqA5pfSwchiD+1SWLvnux6FeiitL2KPGsh7MECJbDduAurnj2bxZx3iC/qEGC1A1bwUw0691LkBvwaF1v5J8xDfRlvgAQ4hMvnuGp7dYf4Uqte/brqOHbtQ0f9dE3fUOOTUUnYZmip7MDEO33lIqwJgoFVkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hp6qScNM; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso5142246f8f.0;
        Mon, 07 Apr 2025 09:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744044741; x=1744649541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcR+RDHa/c9bdAloFl0/VrmlGz9ASr2rJYe2R0+evjQ=;
        b=Hp6qScNMTVhXKO7V1svDkifp8sq1bPsn1z43P49pJX+9jkI2Pqx8r4DfG+g6tVMaXi
         6WCNupkM71B/xt5xlwYf3fBQdeHy6kwoMBWQBUbPoaHH0SyIVz/rbC4wIN7UFy80orY1
         FVde9fmvv7Rb6IrnsWPRmp+MwuLn3TLwC6/aILB9zauelWDm3g9xlsD+ax3extZ9eq40
         kNRLrbAheBGjulVpNlbTPz1UQQ3DfpTllNyXYA/lXNTKvsVc5OFrnUUFJzlgz56OoxFr
         lujYkF6Oa8fI3THOEZBwT0svZcU6r5sXerWMN5KTl1fCP3RW/ZiRjdNhUOwYdxPwPuUp
         wiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744044741; x=1744649541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PcR+RDHa/c9bdAloFl0/VrmlGz9ASr2rJYe2R0+evjQ=;
        b=kLYwOqJoaLSVgUylz9yZCdNXYitnzEushKxswo44SS4YC1VvLzVsvr+C4gqnWI/UPh
         DiDcuft2CuwMhaOwbtFcu+6R6ncXojOwfgRkbZTV40khJoNJpZn0MQE41O5AfF9EcytJ
         z4h/egq/HOMZK/8oEUEsAH5VyD2dsAVslAFGeCHZomJKGsUiMd1CJkK2dWREtTBZ4bTx
         Z5lZGbFkXDvINIYX9iXScitVEGjmbwcgSsNZK04Y9Y4wst39kQtHdiBMsUyShpsH0kzE
         P1ai0BoaozfChaNPcYH6iHNgqdTBL0KEUR4SJJTuqam6o5roSW7zag4ggsO8zCbMxeij
         UwtA==
X-Forwarded-Encrypted: i=1; AJvYcCUwTu4Yzc+iCAFzql1K0Jc1rBKHGUOwjFflNKUfTJYb72fBrtsR7ts6qN1Cd91NRD56tvvX9T9BARz2CitB@vger.kernel.org, AJvYcCVxpUpH55wiCPB5gPC3L4tw4IjpNf5Kc/6Qeui/ZMMSbq67DoAgKprCIYI64+Y5VwEdr4603hTr0Cvh@vger.kernel.org, AJvYcCX1EiC+4wg1pVTwXQzHdFHQUUGmdAuqo2FVQWg3vBejE1BqM6Pr+d8CCE+VqyauGwMSw/JYU6RtkMLL@vger.kernel.org
X-Gm-Message-State: AOJu0YwUtZcYHSdOYbEyrfZTTHBFoi+Fj2lRx1ueooNVuyNi0yBRxdjy
	XK1avs3ZlLpSqdW/FlQiYduI/7QP4nz/9I3CeBqk3SLZI7fUXyVK
X-Gm-Gg: ASbGncsIBkXlteKGMZDeOZDtrg0MK+ag8M5PRy7ESnCfOCYb90+WozgV7x63K1u0T1I
	wyV4Tn23zAMAtcafuo7qpl+NmiEz32d0Nnmc0kv3sXWvXrLUPcESMB2AmTuKZEHBr6EdzD7EvU8
	TRqmCDfJRiz7nGxlPenkLMzFNylyuzCaxpfbYVx6pH4p6z9LEPyPVNWxNvXnhr/EuHCEDvrK+SI
	O4F24WXAOKGgvnQDWCNUJhwbC8k4HtDnDbmPpI0SC9GtsMKPifCDgzoYF012pbXvZ8KKjvIP0Xv
	uopbLrz1o2WUbSAqiJ0Zzwpui/3SYHbXDzml+85tG0e1eW8P62pfXUwkVXUn1EmEj+tKUg==
X-Google-Smtp-Source: AGHT+IHpEGWVIF/bp906RcMZRBJ/ovFacgN6CrJBOWBhVoe3g8ehx9wcRKQtUWbO9LDbYzxU5iYjhg==
X-Received: by 2002:a05:6000:4312:b0:391:48d4:bd02 with SMTP id ffacd0b85a97d-39d6fc79e98mr6939851f8f.29.1744044740440;
        Mon, 07 Apr 2025 09:52:20 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16ba978sm139272305e9.23.2025.04.07.09.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 09:52:19 -0700 (PDT)
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
Subject: [PATCH v2 4/9] clk: renesas: rzv2h-cpg: Use str_on_off() helper in rzv2h_mod_clock_endisable()
Date: Mon,  7 Apr 2025 17:51:57 +0100
Message-ID: <20250407165202.197570-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace hard-coded "ON"/"OFF" strings with the `str_on_off()` helper in
`rzv2h_mod_clock_endisable()`.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index e53cd31c218e..39d81da096b2 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -25,6 +25,7 @@
 #include <linux/pm_domain.h>
 #include <linux/refcount.h>
 #include <linux/reset-controller.h>
+#include <linux/string_choices.h>
 
 #include <dt-bindings/clock/renesas-cpg-mssr.h>
 
@@ -598,7 +599,7 @@ static int rzv2h_mod_clock_endisable(struct clk_hw *hw, bool enable)
 	int error;
 
 	dev_dbg(dev, "CLK_ON 0x%x/%pC %s\n", reg, hw->clk,
-		enable ? "ON" : "OFF");
+		str_on_off(enable));
 
 	if (enabled == enable)
 		return 0;
-- 
2.49.0


