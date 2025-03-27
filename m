Return-Path: <linux-renesas-soc+bounces-14936-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F27BEA73E9D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 20:33:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BF02161511
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 19:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5888A55;
	Thu, 27 Mar 2025 19:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dow0a8Nk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CC128EC
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Mar 2025 19:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743104014; cv=none; b=ADBsKrRhVH9Tyo78eQcu80tsiYP7OIW07lOyIN2ThKa228Z54pbaIFIj4IoHafJSUsS5vBUZCJSoesj0Tkz6BqceYLoIW5GOD3BRpl1JLBiAe7nE2xicxDZsUUV2zng3Aqqlfzpvzr2SCZROPDse6iBOPhqJWHcrRPdWl6fqtpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743104014; c=relaxed/simple;
	bh=2o3E+C1GjfecCQxzemKxEefv+1GbIGC6LvzYYruBQ9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MTtKv/oEmIRjKT/06R4oC3EtAtkRwtl7LqVAXItM75NIbBIp7sMVZiO7dYqolnnr/tnxXJhAtJlZvxIFhBBgHA4fFiiS5gKSUHyqDpWn3fb1tZ3aAEWvgT4JLnZQATSBPxpRR/XilFuRw/Lwn3L4wiCRxfCLKk61B2+z88wk+GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dow0a8Nk; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3912e96c8e8so699922f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Mar 2025 12:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743104011; x=1743708811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Po6yTV4MzdW+lNsKocR2qH591RuHR+mDkz0eETkNUNU=;
        b=dow0a8NkZoOLUpcLjauhZnMyN2uooG09dr+rKXZZAIctTMv6gx3y2HghxAweLfg6sC
         exi+AlknN48XHLEZVg85N/XO1j4jIrFTYE1seDpGDdp1n5+26OG7EVZkGFMuozLZUGH6
         hwoKQxUWx+bXUU7AXZfd0+fZId9P1N50sj+hXs5LpG7OhuhYe+7NsZ9QGxaKn9IFf5t0
         Z8nPqToqiso16+4BAa1GpTLzBz/sqD7P4i1r+Q3UynugbEJRvImMNty9Y+2AUK0yLUXS
         qVgtmQARhh/NQLlq66tJ2T2ZL+VRfNJtl2aTEFQ+6k2npd54+lFhFglecTgzSY+fkuqX
         wAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104011; x=1743708811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Po6yTV4MzdW+lNsKocR2qH591RuHR+mDkz0eETkNUNU=;
        b=ZKW00WjQQZj5ccFpbyChiGXIOUzMBGk7LCTyeStXS38gqy14OjQXrT3JYzzpn4cZgK
         7K03/49SQQ9YKx7UdcmTgDaW1xRnhfszVtRy/L3kHsckAWlGOwg6MyYv0xrpsx4a+sdd
         B5zajjvA9Cbgs/t/EjGA1BLYGLHfOHgKo3UzbsC5IMhQYqW56zoLrzu0VtZniCBJi8zo
         YMH8g/LmvdrUjjmYe+98i+n7ZBnNpcGpulI2oaXy1XpMSiAvHm0zb4GyX9hxUA1/t6nz
         /ej8Hc1+w0qPJCRdzaxvlabmSyjInp5KwDrz+hGad/P2gtoNVHl5pSLQte1GTn0W3wuC
         d4CQ==
X-Gm-Message-State: AOJu0YxldgKUtw+fgc3IPaeB/0FuorrWFtmWOTvmNxOs7GJoKM5TIqeZ
	Yg6UjlpVDGe0q6wGMJEpGd8qsnimYLfXiY681kaJCLWBvHghPByl
X-Gm-Gg: ASbGnculxpR8/ShzRPAWFybMuBKsSWJ2MbDBBVXIj5jX/1MeyOnU7o9Y1hnSZlHycv0
	fHbXkfTQdg9CaL7oD0GVMh464DbIZzNzff2M4z+2GRfy7d3Gcgy4j63VKFEJsQKWWieIyM2AbSr
	t2tXfoZ3VlJuQwp9vR297IWMCkH3do+qNqz3UafMc7lZj3XcZsroj5vcO1oy/50kHyY/oFnWwUR
	gYCK8+WonCavqlCJPlYkT745pl31esVqh+jMEi3bxhLXryiBAMq/PwKMzWJ1vIST9huvVgpLJsM
	hnvq+B//wppHesob5z2WPH8Lyc8VJESGHS/6nzn68mnvPoKqOwDqH9powO5RpTUaa1kIag==
X-Google-Smtp-Source: AGHT+IGy3ZOS8KzqDAMyxv+21WpszkAi8w1E2+47kujzk4qdSeW23iwgax240idSWYDg9o6+lBCUpg==
X-Received: by 2002:a05:6000:2ca:b0:391:487f:282a with SMTP id ffacd0b85a97d-39ad178c955mr4206711f8f.50.1743104010906;
        Thu, 27 Mar 2025 12:33:30 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:c36b:2e01:9e11:8d7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d90001531sm4039265e9.40.2025.03.27.12.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:33:30 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RFC INTERNAL v2 1/4] soc: renesas: Kconfig: Enable SoCs by default when ARCH_RENESAS is set
Date: Thu, 27 Mar 2025 19:33:15 +0000
Message-ID: <20250327193318.344444-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250327193318.344444-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250327193318.344444-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable various Renesas SoCs by default when ARCH_RENESAS is selected.
Adding default y if ARCH_RENESAS to the relevant configurations removes
the need to manually enable individual SoCs in defconfig files.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/soc/renesas/Kconfig | 42 +++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 49648cf28bd2..40197421ff62 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -65,17 +65,20 @@ if ARM && ARCH_RENESAS
 
 config ARCH_EMEV2
 	bool "ARM32 Platform support for Emma Mobile EV2"
+	default y if ARCH_RENESAS
 	select HAVE_ARM_SCU if SMP
 	select SYS_SUPPORTS_EM_STI
 
 config ARCH_R8A7794
 	bool "ARM32 Platform support for R-Car E2"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_814220
 	select SYSC_R8A7794
 
 config ARCH_R8A7779
 	bool "ARM32 Platform support for R-Car H1"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN1
 	select ARM_ERRATA_754322
 	select ARM_GLOBAL_TIMER
@@ -85,6 +88,7 @@ config ARCH_R8A7779
 
 config ARCH_R8A7790
 	bool "ARM32 Platform support for R-Car H2"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_798181 if SMP
 	select ARM_ERRATA_814220
@@ -93,11 +97,13 @@ config ARCH_R8A7790
 
 config ARCH_R8A7778
 	bool "ARM32 Platform support for R-Car M1A"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN1
 	select ARM_ERRATA_754322
 
 config ARCH_R8A7793
 	bool "ARM32 Platform support for R-Car M2-N"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_798181 if SMP
 	select I2C
@@ -105,6 +111,7 @@ config ARCH_R8A7793
 
 config ARCH_R8A7791
 	bool "ARM32 Platform support for R-Car M2-W"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_798181 if SMP
 	select I2C
@@ -112,18 +119,21 @@ config ARCH_R8A7791
 
 config ARCH_R8A7792
 	bool "ARM32 Platform support for R-Car V2H"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_798181 if SMP
 	select SYSC_R8A7792
 
 config ARCH_R8A7740
 	bool "ARM32 Platform support for R-Mobile A1"
+	default y if ARCH_RENESAS
 	select ARCH_RMOBILE
 	select ARM_ERRATA_754322
 	select RENESAS_INTC_IRQPIN
 
 config ARCH_R8A73A4
 	bool "ARM32 Platform support for R-Mobile APE6"
+	default y if ARCH_RENESAS
 	select ARCH_RMOBILE
 	select ARM_ERRATA_798181 if SMP
 	select ARM_ERRATA_814220
@@ -132,6 +142,7 @@ config ARCH_R8A73A4
 
 config ARCH_R7S72100
 	bool "ARM32 Platform support for RZ/A1H"
+	default y if ARCH_RENESAS
 	select ARM_ERRATA_754322
 	select PM
 	select PM_GENERIC_DOMAINS
@@ -141,6 +152,7 @@ config ARCH_R7S72100
 
 config ARCH_R7S9210
 	bool "ARM32 Platform support for RZ/A2"
+	default y if ARCH_RENESAS
 	select PM
 	select PM_GENERIC_DOMAINS
 	select RENESAS_OSTM
@@ -148,18 +160,21 @@ config ARCH_R7S9210
 
 config ARCH_R8A77470
 	bool "ARM32 Platform support for RZ/G1C"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_814220
 	select SYSC_R8A77470
 
 config ARCH_R8A7745
 	bool "ARM32 Platform support for RZ/G1E"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_814220
 	select SYSC_R8A7745
 
 config ARCH_R8A7742
 	bool "ARM32 Platform support for RZ/G1H"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_798181 if SMP
 	select ARM_ERRATA_814220
@@ -167,23 +182,27 @@ config ARCH_R8A7742
 
 config ARCH_R8A7743
 	bool "ARM32 Platform support for RZ/G1M"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_798181 if SMP
 	select SYSC_R8A7743
 
 config ARCH_R8A7744
 	bool "ARM32 Platform support for RZ/G1N"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_798181 if SMP
 	select SYSC_R8A7743
 
 config ARCH_R9A06G032
 	bool "ARM32 Platform support for RZ/N1D"
+	default y if ARCH_RENESAS
 	select ARCH_RZN1
 	select ARM_ERRATA_814220
 
 config ARCH_SH73A0
 	bool "ARM32 Platform support for SH-Mobile AG5"
+	default y if ARCH_RENESAS
 	select ARCH_RMOBILE
 	select ARM_ERRATA_754322
 	select ARM_GLOBAL_TIMER
@@ -197,6 +216,7 @@ if ARM64
 
 config ARCH_R8A77995
 	bool "ARM64 Platform support for R-Car D3"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN3
 	select SYSC_R8A77995
 	help
@@ -205,6 +225,7 @@ config ARCH_R8A77995
 
 config ARCH_R8A77990
 	bool "ARM64 Platform support for R-Car E3"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN3
 	select SYSC_R8A77990
 	help
@@ -213,6 +234,7 @@ config ARCH_R8A77990
 
 config ARCH_R8A77951
 	bool "ARM64 Platform support for R-Car H3 ES2.0+"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN3
 	select SYSC_R8A7795
 	help
@@ -222,6 +244,7 @@ config ARCH_R8A77951
 
 config ARCH_R8A77965
 	bool "ARM64 Platform support for R-Car M3-N"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN3
 	select SYSC_R8A77965
 	help
@@ -230,6 +253,7 @@ config ARCH_R8A77965
 
 config ARCH_R8A77960
 	bool "ARM64 Platform support for R-Car M3-W"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN3
 	select SYSC_R8A77960
 	help
@@ -237,6 +261,7 @@ config ARCH_R8A77960
 
 config ARCH_R8A77961
 	bool "ARM64 Platform support for R-Car M3-W+"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN3
 	select SYSC_R8A77961
 	help
@@ -245,6 +270,7 @@ config ARCH_R8A77961
 
 config ARCH_R8A779F0
 	bool "ARM64 Platform support for R-Car S4-8"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN4
 	select SYSC_R8A779F0
 	help
@@ -252,6 +278,7 @@ config ARCH_R8A779F0
 
 config ARCH_R8A77980
 	bool "ARM64 Platform support for R-Car V3H"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN3
 	select SYSC_R8A77980
 	help
@@ -259,6 +286,7 @@ config ARCH_R8A77980
 
 config ARCH_R8A77970
 	bool "ARM64 Platform support for R-Car V3M"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN3
 	select SYSC_R8A77970
 	help
@@ -266,6 +294,7 @@ config ARCH_R8A77970
 
 config ARCH_R8A779A0
 	bool "ARM64 Platform support for R-Car V3U"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN4
 	select SYSC_R8A779A0
 	help
@@ -273,6 +302,7 @@ config ARCH_R8A779A0
 
 config ARCH_R8A779G0
 	bool "ARM64 Platform support for R-Car V4H"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN4
 	select SYSC_R8A779G0
 	help
@@ -280,6 +310,7 @@ config ARCH_R8A779G0
 
 config ARCH_R8A779H0
 	bool "ARM64 Platform support for R-Car V4M"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN4
 	select SYSC_R8A779H0
 	help
@@ -287,6 +318,7 @@ config ARCH_R8A779H0
 
 config ARCH_R8A774C0
 	bool "ARM64 Platform support for RZ/G2E"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN3
 	select SYSC_R8A774C0
 	help
@@ -294,6 +326,7 @@ config ARCH_R8A774C0
 
 config ARCH_R8A774E1
 	bool "ARM64 Platform support for RZ/G2H"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN3
 	select SYSC_R8A774E1
 	help
@@ -301,6 +334,7 @@ config ARCH_R8A774E1
 
 config ARCH_R8A774A1
 	bool "ARM64 Platform support for RZ/G2M"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN3
 	select SYSC_R8A774A1
 	help
@@ -308,6 +342,7 @@ config ARCH_R8A774A1
 
 config ARCH_R8A774B1
 	bool "ARM64 Platform support for RZ/G2N"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN3
 	select SYSC_R8A774B1
 	help
@@ -315,24 +350,28 @@ config ARCH_R8A774B1
 
 config ARCH_R9A07G043
 	bool "ARM64 Platform support for RZ/G2UL"
+	default y if ARCH_RENESAS
 	select ARCH_RZG2L
 	help
 	  This enables support for the Renesas RZ/G2UL SoC variants.
 
 config ARCH_R9A07G044
 	bool "ARM64 Platform support for RZ/G2L"
+	default y if ARCH_RENESAS
 	select ARCH_RZG2L
 	help
 	  This enables support for the Renesas RZ/G2L SoC variants.
 
 config ARCH_R9A07G054
 	bool "ARM64 Platform support for RZ/V2L"
+	default y if ARCH_RENESAS
 	select ARCH_RZG2L
 	help
 	  This enables support for the Renesas RZ/V2L SoC variants.
 
 config ARCH_R9A08G045
 	bool "ARM64 Platform support for RZ/G3S"
+	default y if ARCH_RENESAS
 	select ARCH_RZG2L
 	select SYSC_R9A08G045
 	help
@@ -340,6 +379,7 @@ config ARCH_R9A08G045
 
 config ARCH_R9A09G011
 	bool "ARM64 Platform support for RZ/V2M"
+	default y if ARCH_RENESAS
 	select PM
 	select PM_GENERIC_DOMAINS
 	select PWC_RZV2M
@@ -348,12 +388,14 @@ config ARCH_R9A09G011
 
 config ARCH_R9A09G047
 	bool "ARM64 Platform support for RZ/G3E"
+	default y if ARCH_RENESAS
 	select SYS_R9A09G047
 	help
 	  This enables support for the Renesas RZ/G3E SoC variants.
 
 config ARCH_R9A09G057
 	bool "ARM64 Platform support for RZ/V2H(P)"
+	default y if ARCH_RENESAS
 	select RENESAS_RZV2H_ICU
 	select SYS_R9A09G057
 	help
-- 
2.49.0


