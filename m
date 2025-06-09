Return-Path: <linux-renesas-soc+bounces-17989-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EADEBAD27B1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 22:37:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09A2A3AA1DC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 20:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B27A022259D;
	Mon,  9 Jun 2025 20:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQwd7Em3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEF9221F25;
	Mon,  9 Jun 2025 20:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749501425; cv=none; b=oDCt5sup5u2BrKjW4qi1wLFYZlcTvTTil2oyQX6k1UYkjAdHTeYh6J+mJBsEo3Ez1fCLUQJXVD+gl9E9YEFRlIF0CqN9+QuK99zAvYPWr+ppjV345X+1maZMV4wWo1xr6DpcLy5T3Pi8oZwHuhwlKAQAaZcMahOkCCFLTCiuliA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749501425; c=relaxed/simple;
	bh=EA42iYzWvqQbQLyQ/tySYiX48uIdK0VG+Qa9gLcPBKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k5mzshyx4To0Rm2nha20qFXPiTNlQITw9vz8uh+L2JCGWB6+Rgy+fpygGkOAtAk4dKEBZi3Kt+bCEZvqNz57uzIVGXnAL0lFxo5ednKzBRo5Sy3/gc/H07ixeuqLOOt7+jWz8HwByGnLr6oBD0xnRmYepNLgetO9jVHdRQ0AZiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQwd7Em3; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-451d6ade159so39546245e9.1;
        Mon, 09 Jun 2025 13:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749501422; x=1750106222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ge6BBwbv/DLVMbN5fPFrnaeRH0FBWp67S7bClwywKw0=;
        b=NQwd7Em3bDJ3jFjVGKpuRbCs+1W7kUVIBBD4FOUs6a1fzB/ybQeUrIrlbC5k0szR2j
         0XYz1JQ8IGKf0+l02DfSzN/MewnTapT3gvNxLHSmCUe6RHngqHbvXwL6Tj8GJ5jsisoi
         6l12JtgkGyCW5gTYP1AVi+Pj5zZBcWMT75jU2RfXlx809AgODebe+GL1itEE3Dr9HT3K
         gh8k83BrFvVfJAFcaxTaS3eosRV4UcPtCwTCCzBXhNNDB1MD/Az6b/yCgCqbZslpEeEO
         Oy+eme5fpow3bVxtZaCsfwd4jF2UzlyD1zwTKhEupObaNdiv/BQ6AYVZ2ob0HuibNet1
         +MSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749501422; x=1750106222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ge6BBwbv/DLVMbN5fPFrnaeRH0FBWp67S7bClwywKw0=;
        b=LizOrxAQY6v6aet9iCg4UEmBZttFBAxAcdVB9duaiyt0DKWXIGw1sXJkABQvYeh10F
         YcruaM/cxWmBulWkkgSwq1xk8Daf9Eub4I+EAeV5E2qRhu/DiajHNkXKE5H7v0T+KxLI
         ORTPUFqSXUow3a0CVxJNkdqevSduiFysEi2Gw8JgeWuiv9YPQ1pQ4MVGFlo5d+In2mS/
         RjSfSVIfL5mJgqLObjDFK32BcoekKYhdfvsvuqba5pMvIFkHCJfowuS6+WJXH9/eNND8
         s0fcTKKG5Nt/3CeC+WUkuWxZ6QUBbLhYtC17Oy2O1/yAD0uoptMyFAQ4Hv6UaAiXQixK
         xryw==
X-Forwarded-Encrypted: i=1; AJvYcCUdWnkKCD/QuSffRmtvF4EwB9dYbG0gMwP9YhkEL1/j6GKptxxBCGHYqm6ZK3pSC2mZsCvLvbqLmBSo4MpY@vger.kernel.org, AJvYcCV+LHD/qiLRtABqUWVEQcyN71Nu735L0NfTvPqmFc2GxoMnrDmGEqe30xVReBJST2i9uGI3pK0PfdKZ@vger.kernel.org, AJvYcCWMA57kz/JZSUbBPvdKEeP0eTXv37Z4A16cVoTgcvFaJ0p1yzOlliUwWdj/M1CLt7cH1ZNjpfqqecCP@vger.kernel.org
X-Gm-Message-State: AOJu0YwnrefqbpqYeyqoieMxmpqvOLGGa9e8z/51GxBNwjsdd4kTQE4G
	mceBEh/jvvGrlqLPAvGwb7BPYP59KZ+/ZUzIrVfPg8QXpmnqvc1qklGm
X-Gm-Gg: ASbGnctRMffKdQCEC1lYch/7/ecu12b5gKEOtzujf3DwNJdFbKFmaqRBIqtOU4wgjh2
	BvvIrWLj1xe9sQO+vTpOuSCdJxoBbj0v5w8WaR6E/fgqedYMODKWj4GbLoihfk/cmnBHJQSvpT8
	bFzh9glaFijJE5rERCwKS05u3yUztmGlYR04PKkmRw+cLBQzH3C6A1FoKKZWQC6vBrN2YGblxu9
	PlskzH46N7oc+N40bbQFSprXiEznREj89/SSmnraQN1wvEkPGuDAknKCC2T/cTgnOGdJQwivVpt
	sAW+7+GD3noZI9uEsQY0YLcpO99wObbmV7S9oZe75c+u01gMwnanYk8UMpO07J9LzmoG4ctPoG6
	C/AVc9iBkbChcOy8mIuY=
X-Google-Smtp-Source: AGHT+IEI6xU1k5RA1xYNtKDWCi1D79OGqGN+5XyedMJ03xErEPDK/RJDwOBMTIoeZgyPo0pysz8ddQ==
X-Received: by 2002:a5d:64ca:0:b0:3a4:e609:dc63 with SMTP id ffacd0b85a97d-3a531786ab4mr12390525f8f.20.1749501422062;
        Mon, 09 Jun 2025 13:37:02 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730c73d2sm118240345e9.30.2025.06.09.13.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 13:37:01 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/8] clk: renesas: Add MSSR support to RZ/N2H SoC
Date: Mon,  9 Jun 2025 21:36:52 +0100
Message-ID: <20250609203656.333138-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609203656.333138-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250609203656.333138-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clock driver support for the Renesas RZ/N2H (R9A09G087) SoC by reusing
the existing RZ/T2H (R9A09G077) CPG/MSSR implementation, as both SoCs
share the same clock and reset architecture.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/Kconfig            | 5 +++++
 drivers/clk/renesas/Makefile           | 1 +
 drivers/clk/renesas/r9a09g077-cpg.c    | 1 +
 drivers/clk/renesas/renesas-cpg-mssr.c | 6 ++++++
 4 files changed, 13 insertions(+)

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 45f9ae5b6ef1..6a5a04664990 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -44,6 +44,7 @@ config CLK_RENESAS
 	select CLK_R9A09G056 if ARCH_R9A09G056
 	select CLK_R9A09G057 if ARCH_R9A09G057
 	select CLK_R9A09G077 if ARCH_R9A09G077
+	select CLK_R9A09G087 if ARCH_R9A09G087
 	select CLK_SH73A0 if ARCH_SH73A0
 
 if CLK_RENESAS
@@ -213,6 +214,10 @@ config CLK_R9A09G077
 	bool "RZ/T2H clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSSR
 
+config CLK_R9A09G087
+	bool "RZ/N2H clock support" if COMPILE_TEST
+	select CLK_RENESAS_CPG_MSSR
+
 config CLK_SH73A0
 	bool "SH-Mobile AG5 clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSTP
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index d8d894a15d24..d28eb276a153 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -41,6 +41,7 @@ obj-$(CONFIG_CLK_R9A09G047)		+= r9a09g047-cpg.o
 obj-$(CONFIG_CLK_R9A09G056)		+= r9a09g056-cpg.o
 obj-$(CONFIG_CLK_R9A09G057)		+= r9a09g057-cpg.o
 obj-$(CONFIG_CLK_R9A09G077)		+= r9a09g077-cpg.o
+obj-$(CONFIG_CLK_R9A09G087)		+= r9a09g077-cpg.o
 obj-$(CONFIG_CLK_SH73A0)		+= clk-sh73a0.o
 
 # Family
diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index 206816a2df23..8002e1672b46 100644
--- a/drivers/clk/renesas/r9a09g077-cpg.c
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -13,6 +13,7 @@
 #include <linux/kernel.h>
 
 #include <dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h>
+#include <dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h>
 #include "renesas-cpg-mssr.h"
 
 #define RZT2H_REG_BLOCK_SHIFT	11
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 4a5ac9eef9cc..5ff6ee1f7d4b 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -941,6 +941,12 @@ static const struct of_device_id cpg_mssr_match[] = {
 		.compatible = "renesas,r9a09g077-cpg-mssr",
 		.data = &r9a09g077_cpg_mssr_info,
 	},
+#endif
+#ifdef CONFIG_CLK_R9A09G087
+	{
+		.compatible = "renesas,r9a09g087-cpg-mssr",
+		.data = &r9a09g077_cpg_mssr_info,
+	},
 #endif
 	{ /* sentinel */ }
 };
-- 
2.49.0


