Return-Path: <linux-renesas-soc+bounces-15507-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7110A7E779
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 18:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8557C3A778E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 16:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E34215768;
	Mon,  7 Apr 2025 16:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fz9TFMXh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815D5214A98;
	Mon,  7 Apr 2025 16:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744044745; cv=none; b=t9JG9QR8XNAVYHXQLMPun4/5aE5ECriOCopgsTiuZeGGm73LoCTIt8UNgfM5YJmhTMCvIOAcPJi/A01CNTburkr3PKIkQlHovmz8Ook+H++5qLpWtpOqf5j/w8+sYN58HOl4+ovxzl8tfO8rYayWAzD0jQVYP40w383V2WehGGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744044745; c=relaxed/simple;
	bh=Ub2mvo9zKIlgRBlGZjgd8ofnSXpYWLKr/D8XkYyZR/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DZOQklszIslmbf3wwP+JZ/3aV7lhGmfGnc9OteYtymOzaWxzpTMrWuA76cGXmNMRy3qyXZcAEBJDybF/gleQ8HFaJ1L81jGbqcDi9YCL4YlKzNCbeI6E4pDLTTLWJIbguEh32/ThB52/iOo1wGCsws15Bg9PHp1c2wgy+Z9+byM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fz9TFMXh; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so40674055e9.1;
        Mon, 07 Apr 2025 09:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744044742; x=1744649542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HiDR7rX6RIlKdZ13B552gPCTK5zpa56+tmg07upsKtA=;
        b=Fz9TFMXh1VFbVSn8Dp+UUL+SAPBsvYYvaeGAz8EYOWGE9IvZIv3NxEGhPg5kMpcxhz
         VGAd6Cy/p7aIO8k4XLR1RmPZby6qbiIMo0kdAfGMBu8m3qjITg1M+KDmyfZMOQflkhiB
         5g7qto3E3ft0mjkKbAagwi0pjboP2GTDxUYH3MXUiXfrinn+2XnaBGy01CQmh3/x51LB
         UsrURqMthhP/H1zyDPdeg/WKm/XMB+fhqjvjhXTRo21QDWMBzk2JM5b+bmitmhednHCi
         RZGdhmEAvz1TrWDxTodI1OQEuDzDyVls8f/hZEGNFLBoNVcP1glMVljZ+fqgHsTD/qBp
         dajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744044742; x=1744649542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HiDR7rX6RIlKdZ13B552gPCTK5zpa56+tmg07upsKtA=;
        b=dfEgxzAGNYpa0PB5lwKNyXK0cUnyP71yI4r84XGmGXat1wdMVxvWaupPlD9dFTEpfK
         tsAs1JrBVMzhP8Sult3Nfjp4voNXPchyLrvnw5v4HfoYYCzHNWMHrYi3llSg04N7eSMD
         L2ScIaLIfpA7R6z8NZ31yZsjSmDMrReLsJCy5rlDhDss6lsSHKX4T9BujSbMlU1hCEr2
         1/reUc54ocLlQwagkbwjqNh6Tn9U2odZ6+Q+7BGvG2yrv1bUF3Hhs7sgYuPWQMUGKbPn
         IFJ/rqdAHpR1jNxbAJvw9Q0eii8hlpfONngqgEHDwreowgXFkk2vQz4Wt++Ph5c0ufzx
         x9ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUI/zXqyi7vlxy0sQU2mXPV2793o/P5/2F7G2qoewxT85JJZngmWVaDiRgkr2p0MBkaFiTTdvc1r2yE@vger.kernel.org, AJvYcCUOv7TcHaJc/vOkDhU4bCNcp5hQbJdbZLno8oHOpzqgxQCccVTgxs4GWwy1bTGY8Vbtxglk6wbeImVi@vger.kernel.org, AJvYcCUVRLa6bRY/6wNf9qbIYACYPC6bUE6l2cj1j23RjPkoGhqLJMDd1NjNoBhv59dAyLULQmAAf9aoL8BRrGco@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/gFi4UPskWK4HyB40zJwzBwQyESzsI7SGcqubaUwIK2D9OGJ/
	57E+p4EZ4+l+jFAeHowhx0zKIyvm3iT5Rhm9+PbEErJjpmKx/fiM
X-Gm-Gg: ASbGncuOo7kULOqVJ7Fl3mgx9cVp/mfb/pOu7SevBcjEVEaV+Ak/5wLeekZpS/tEgGS
	IP94LIGC4KS04jdax+IxLx6J2k/5m7JjMqbWJUgO9LLrrFy/zNJD7rzgOujH1yc2U+lgQIkIsly
	FZ5bneuhUqOGXWEH9mqk6wUKHEaOQzhIUgo/HBgXtTaSLPajuCkgsq/E9C+TkAxK4kcVMGcc2xm
	Z1h3uNxX0fetDI+QM0CM1NkE43IFs0WW6eyd/kgOksnQFHsPWu3FdUTCoHFQLPvKSxR6Y3UnDTp
	GIhP/CyOfuWmmS/R+HI1MYE9QQujUBYAWdIfe2T1y66E+bq0q2k7eJsFzvUdwatXO8ZjyQ==
X-Google-Smtp-Source: AGHT+IH3l37FY9n9inkoMFozbQMK4VElTyZU3T9RMvlqXU3pafdrWgbx6dLGrFkm+Fn5uJp4Z3WlQA==
X-Received: by 2002:a05:600c:3d17:b0:43d:7bfa:2739 with SMTP id 5b1f17b1804b1-43ee0768c11mr83877185e9.23.1744044741594;
        Mon, 07 Apr 2025 09:52:21 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16ba978sm139272305e9.23.2025.04.07.09.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 09:52:20 -0700 (PDT)
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
Subject: [PATCH v2 5/9] clk: renesas: rzv2h-cpg: Use both CLK_ON and CLK_MON bits for clock state validation
Date: Mon,  7 Apr 2025 17:51:58 +0100
Message-ID: <20250407165202.197570-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Update the clock enable/disable logic to follow the latest hardware
manual's guidelines, ensuring that both CLK_ON and CLK_MON bits are used to
confirm the clock state.

According to the manual, enabling a clock requires setting the CPG_CLK_ON
bit and verifying the clock has started using the CPG_CLK_MON bit.
Similarly, disabling a clock requires clearing the CPG_CLK_ON bit and
confirming the clock has stopped via the CPG_CLK_MON bit.

Modify `rzv2h_mod_clock_is_enabled()` to check CLK_MON first and then
validate CLK_ON for a more accurate clock status evaluation.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 39d81da096b2..c75ed6ed087b 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -579,11 +579,14 @@ static int rzv2h_mod_clock_is_enabled(struct clk_hw *hw)
 	if (clock->mon_index >= 0) {
 		offset = GET_CLK_MON_OFFSET(clock->mon_index);
 		bitmask = BIT(clock->mon_bit);
-	} else {
-		offset = GET_CLK_ON_OFFSET(clock->on_index);
-		bitmask = BIT(clock->on_bit);
+
+		if (!(readl(priv->base + offset) & bitmask))
+			return 0;
 	}
 
+	offset = GET_CLK_ON_OFFSET(clock->on_index);
+	bitmask = BIT(clock->on_bit);
+
 	return readl(priv->base + offset) & bitmask;
 }
 
-- 
2.49.0


