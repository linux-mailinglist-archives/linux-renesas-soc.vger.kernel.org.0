Return-Path: <linux-renesas-soc+bounces-11542-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E74C9F6825
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 15:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3B511892606
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 14:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 522AB1BEF9E;
	Wed, 18 Dec 2024 14:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3y5I2zd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749F01B0417;
	Wed, 18 Dec 2024 14:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734531657; cv=none; b=oWLEBhNC0I5QZ+BO6hDjrT6lZGkC0X7lBIhPAsM/i0sFa9hV7hYvqaltq2N9cJtRHDH6Vy8W8Ty5aI2bIkIQDTIoGIs0JHEWspP2Upk3ioqDEQ6nwg6jdNVhozAzqrd5wRqlfcz4y7LWkIOvlLbVcGPXC7CVphk0XFcnw7qhhbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734531657; c=relaxed/simple;
	bh=9tmBVqrl3cCt1vbcckJCfwPjMaR/yc9CnZVg0J72dCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fM1z2DvvLb21262/X5PQXAD6bmqd2b84hpboCc1vQY6EE79rRYue6xHA+CLy6SK+RUBQByF3rTWa+4PRa/yEhr/QWvLA1vRdgpD0B+ecyV7qfHrF69GqYl/NsV7fcBOIsAN749LI6N1oz1r3EDZoHUXEnmSw0/KcoYREjC2mOfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3y5I2zd; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-382610c7116so3542382f8f.0;
        Wed, 18 Dec 2024 06:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734531654; x=1735136454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g17UO33YdBwmO7DGR3pIPrhlIJblMqxcqNmPlgeEQYo=;
        b=Z3y5I2zdR5xfVfDOYM/Wc3oV25J/qjYHMfgYP0BJi31x4aTttaYG9t3ZhSESWAI4CN
         UPLETMITef0jJZKrj/n7TBBUlfr+fJN/pDhcoUuKJW0aioRXSI8L8BNC9+I4Bvfrj/+0
         y46GgBRyiq2RZbZoz0W7JoMj/NeWihQlQ5JEiXCBqzvWeoCs2PfhU4dzqTOdAUZ5cWiM
         /9R6Vcb5wIrypg+izPV4Zq6Ic4YND6hZN+AAobZNeKurajyOXoKtLAIcwCg+PBUcTR34
         MroM/zhMVl8QqoYa+OjDU7Ct+/NL3I+Oniy5M46MxE4KJ/4PMADGWhLbqWuM0lAtqH5K
         4HnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734531654; x=1735136454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g17UO33YdBwmO7DGR3pIPrhlIJblMqxcqNmPlgeEQYo=;
        b=OCB5zrFkMr08CP191WVg6L5U+xdmWUrPI5l5qW3LgYuX6b7KP74QBHrrocKy0dRdxz
         7QW2TvpsxHWJrHSXKqaq82BFq0JfbX54Ri2vfWU+J6SEyqHKGncH4A0kMUfKLE2FUBeW
         0j4dbwWaix8P6YSiO6n9Bs3FUuK37FVvMS+6TpUSXPrb7dEYcaLwq5lUYhbw1MVXrcLu
         reFQKoCSLvlZiUjF+8Hi8B9u50hgGR6hHBv2ReIKDqg3WEEpDgYda62VjyeAEZ4Nbj/z
         UNXN4DURHsnatVYb49Tz1tx3Og1quugJqg2ORf+/KxhcC8TrvoPkrBIkpWwudhA/K5hB
         ljbg==
X-Forwarded-Encrypted: i=1; AJvYcCUZVTfdKIauZLECTJmGtfGCmsYxxi/BMt/pRSkjWQSsMImTk+dgakMTtLX/Ze0kHAIL5bIpXiQbcXY+E+T+@vger.kernel.org, AJvYcCVDYg26Gd1BazzuJXQXfVDLIYfz3xvVtS1SbYSYIVOS1ZWX4r9WfKcymbzILFTn29/DeP1X4i4AQlw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjANhyqLtk1H8oXoz14DpJB1Bfn8vNQ9PeuX8nGuk48qHdGx74
	3p1INSehtqlQwyRjUseI+08FElsGLb04ZX/nwyn1YDc9cq0CIUvw
X-Gm-Gg: ASbGncuG188g1hGJpR9nlyN3LAauGGhCzybvZfgIjdW5BPVyr2SSXv7cS6DbfYCzmiW
	oDFKnnI2q3SVxH2rMEQYEQmzFHX8ZzuZw2VgTG6kyGPGAgivnWPRh3/PZVrqNrS2jMOInXPiBWN
	RPVC8ZEAlgrWyjC04zHFaf7ohgGGV6RlVnvC8tWAGpl+pMmHC4AwLkKZqCOSohw0g87XFE1qSuj
	Ilc4v1F1ZATGYVC6LM60UbvqIax//iFnmFTTOoy7Ql3bzPH3R4NNxH5MZt3zSF4BSobSjVyobMv
	ZwPk3QdA4A==
X-Google-Smtp-Source: AGHT+IEJUQOo3uYoWkP6M4yW2w+umZSx5Uf/nQl/QX8/jpX4Zo5fL/mVEUOSEej8ij836pYJ4hqSdg==
X-Received: by 2002:a5d:64e9:0:b0:385:e3d3:be1b with SMTP id ffacd0b85a97d-388e4d574f5mr2745400f8f.28.1734531653533;
        Wed, 18 Dec 2024 06:20:53 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:9516:68be:c7cd:69f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c801ac68sm14107033f8f.51.2024.12.18.06.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 06:20:52 -0800 (PST)
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
Subject: [PATCH 2/5] clk: renesas: rzv2h: Relocate MSTOP-related macros to the family driver
Date: Wed, 18 Dec 2024 14:20:42 +0000
Message-ID: <20241218142045.77269-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241218142045.77269-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241218142045.77269-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The `CPG_BUS_1_MSTOP` and `CPG_BUS_MSTOP` macros are exclusively used by
the RZ/V2H(P) CPG family driver and are not required in the SoC-specific
clock driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 3 +++
 drivers/clk/renesas/rzv2h-cpg.h | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 23c89b0de38a..38edddfc42d9 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -41,6 +41,9 @@
 #define GET_RST_OFFSET(x)	(0x900 + ((x) * 4))
 #define GET_RST_MON_OFFSET(x)	(0xA00 + ((x) * 4))
 
+#define CPG_BUS_1_MSTOP		(0xd00)
+#define CPG_BUS_MSTOP(m)	(CPG_BUS_1_MSTOP + ((m) - 1) * 4)
+
 #define KDIV(val)		((s16)FIELD_GET(GENMASK(31, 16), (val)))
 #define MDIV(val)		FIELD_GET(GENMASK(15, 6), (val))
 #define PDIV(val)		FIELD_GET(GENMASK(5, 0), (val))
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 9be5a312fa96..810275eba473 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -35,7 +35,6 @@ struct ddiv {
 #define CPG_CDDIV1		(0x404)
 #define CPG_CDDIV3		(0x40C)
 #define CPG_CDDIV4		(0x410)
-#define CPG_BUS_1_MSTOP		(0xd00)
 
 #define CDDIV0_DIVCTL2	DDIV_PACK(CPG_CDDIV0, 8, 3, 2)
 #define CDDIV1_DIVCTL0	DDIV_PACK(CPG_CDDIV1, 0, 2, 4)
@@ -47,8 +46,6 @@ struct ddiv {
 #define CDDIV4_DIVCTL1	DDIV_PACK(CPG_CDDIV4, 4, 1, 17)
 #define CDDIV4_DIVCTL2	DDIV_PACK(CPG_CDDIV4, 8, 1, 18)
 
-#define CPG_BUS_MSTOP(m)	(CPG_BUS_1_MSTOP + ((m) - 1) * 4)
-
 #define BUS_MSTOP(idx, mask)	(((idx) & 0xffff) << 16 | (mask))
 #define BUS_MSTOP_NONE		GENMASK(31, 0)
 
-- 
2.43.0


