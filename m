Return-Path: <linux-renesas-soc+bounces-15230-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F13AA7771D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 11:02:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE7AA1888521
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 09:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A2701EC011;
	Tue,  1 Apr 2025 09:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YWKfV+tF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF641E991C;
	Tue,  1 Apr 2025 09:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743498126; cv=none; b=e8d+hrpPoNPTKnFTMXiydShKL80gIRBk9Bk2dDOhSqtoPa0J3If/wH+HtWHFLWCkrSs7HbvmIyOei+gG0mmlN5POutq8U68aIVEbgz2d0Th8hG+AVUIFPRHNV3DiRmQ+hO0T3G7zc2TH5srq2kRUqWfCgpxR/d0aBhL3gbzT0sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743498126; c=relaxed/simple;
	bh=7E5jxNA+dv8KfFrdN9GMYSVDy8UFdvYmr3SM2c8Yfxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ra4NZCG+6veFD3iU0/vvlkmZLi8SKRKhA0ANL/xkMVlT3+qgxyaOvEX909PmNUv4sEHMjOJV5UwnoXqg8iavGyfJVbQkzzyT8raJ+e6DcavMrvm87sUvx+ZtiMwf4PwSlcA/7XQcBqFR5zd46SRHSAcxp+Wp6DpqCNse65BBrf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YWKfV+tF; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so42609205e9.1;
        Tue, 01 Apr 2025 02:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743498122; x=1744102922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=da95LwKsEKhn5X9Yib2ftWvbSxtT4UgZuzjrOIRyx4c=;
        b=YWKfV+tF484CWYN6U74vReBz0q3jXkACRorxSP/wsI7XQMfN1kNbl6OKRaSh/5BsQp
         TumykUWsfnTj3tKSMHAfLnS+BVgvs7o7AfV0RZt0NLUx+Q6su70vQYLd6oKkKkEMnWBr
         em22Smw0GJaKi20z/70n5abOhqDI6+kpc0ZDcGnOl2bJSX5qkkA3SN9hUFE9Wb3YjzCf
         p3ycnphn2qpRkzwNmPs4MoESsmOwK/9VHBd7JlN0tozxkdf7hEd8BIVXUvTv7XglfVm6
         xgOLZeX7TD/ZqpFivdpz1y+WDP7wN2QeM/f4Fuj5PTdKYlLX6gNMqi9LgdjrGuapGhMh
         /VvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743498122; x=1744102922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=da95LwKsEKhn5X9Yib2ftWvbSxtT4UgZuzjrOIRyx4c=;
        b=eRkvXbHnxNlFi8USNIishV+678fKVl5JTZ/UGYcgDSyra/JuJLZFvIaYAThP4xXUlv
         WlvLZymW0uVnc89o8RDiytelDFTwtdqlWUzaTGJ1m41eqSxzVNS6gtj1dRsNdKnJ2RVK
         cCD85UkchYHCOyuOyHCdgGfwcUG5Lk68JHKlP4b+F4EF4glYpcZ1G9u3H8jEmHSrg7Fs
         gu9/FXNCgv1ZoZddz6qgTSoWfDueVCuPZxMM4L+aqMWMJzPKOvyquspNAgo8GJkbUKmW
         hhrTyrjzJFIdqK/R6j8E/qgMQFBahpJxkvLtbMkGgZ4Zsfv2u9ZCpjVidmCjT0htpU6d
         VpxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuQQTryysZNXd7m+h+nDg1iOa5xTO1t8aB5ONL0gPHgpX9wuaxGnq2Z46Gf4fQG5SGp7rXSNz40XLgMjg=@vger.kernel.org, AJvYcCW+hQx3MlO9v10JFaWqWQJUfAF3zIncx29iPFDMI9YuPvR9B71V1DkVMc97B5qq1LQD1YLt5g9yjku0XDZb5FvWqKg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXMfYT9dBh94qV5FkTHLbg8xWw+0AO2vp/ftdoGnGnL9z43OXw
	s3YY3DwYWCW8GX1RhOyuRQGoARN+U2syBP/WzZ92lHZAmvNxmIFj
X-Gm-Gg: ASbGncsSVcBJjvXu+TfmnjmMqCXHb8bSKNes848Gvbs4n43FuhOoa1/oYGnHW7/BiuY
	PlIcVTKCeSbk91HJ/h1tnXFJaHg5Lt6sj8n2UQHkvagnT57I1XpwvxI2wGueLEUqru5FHLbw5P8
	S4oZ4Lyy6JG/hHL5Enp1pGLMe9xJW2x5U3E429JbUIf4DC01K+PMhKFDV/o1BOkWUdDTDmw+mAX
	pUujVEWHqyfJvlpYwvw1MR73RUQdm25YCOUtsyeZKoZH8Hvswuu+PS9Q9OTmaNNA3/WJqoEbB52
	QpxTKM+pC3orGHJaLUTxiEIg1MWiyP7x7Bj2VQ9n32PyZB3OZDXK2+kRs53ZcXQp0NOBxg==
X-Google-Smtp-Source: AGHT+IHREbNY6slwOUJkrE/DJtsWTRfTWlTBvTnWDGtVse0ltw6lWAIOsVjh6nsKIzkZpRWe8cc8Vg==
X-Received: by 2002:a05:600c:6c4f:b0:435:edb0:5d27 with SMTP id 5b1f17b1804b1-43d9105c99fmr131948585e9.9.1743498122382;
        Tue, 01 Apr 2025 02:02:02 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:cd7b:4630:9a98:b82a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fcd0738sm148391545e9.19.2025.04.01.02.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 02:02:01 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Russell King <linux@armlinux.org.uk>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/4] soc: renesas: Kconfig: Enable SoCs by default when ARCH_RENESAS is set
Date: Tue,  1 Apr 2025 10:01:30 +0100
Message-ID: <20250401090133.68146-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401090133.68146-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250401090133.68146-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index 49648cf28bd2..4990b85d7df7 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -65,17 +65,20 @@ if ARM && ARCH_RENESAS
 
 config ARCH_EMEV2
 	bool "ARM32 Platform support for Emma Mobile EV2"
+	default ARCH_RENESAS
 	select HAVE_ARM_SCU if SMP
 	select SYS_SUPPORTS_EM_STI
 
 config ARCH_R8A7794
 	bool "ARM32 Platform support for R-Car E2"
+	default ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_814220
 	select SYSC_R8A7794
 
 config ARCH_R8A7779
 	bool "ARM32 Platform support for R-Car H1"
+	default ARCH_RENESAS
 	select ARCH_RCAR_GEN1
 	select ARM_ERRATA_754322
 	select ARM_GLOBAL_TIMER
@@ -85,6 +88,7 @@ config ARCH_R8A7779
 
 config ARCH_R8A7790
 	bool "ARM32 Platform support for R-Car H2"
+	default ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_798181 if SMP
 	select ARM_ERRATA_814220
@@ -93,11 +97,13 @@ config ARCH_R8A7790
 
 config ARCH_R8A7778
 	bool "ARM32 Platform support for R-Car M1A"
+	default ARCH_RENESAS
 	select ARCH_RCAR_GEN1
 	select ARM_ERRATA_754322
 
 config ARCH_R8A7793
 	bool "ARM32 Platform support for R-Car M2-N"
+	default ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_798181 if SMP
 	select I2C
@@ -105,6 +111,7 @@ config ARCH_R8A7793
 
 config ARCH_R8A7791
 	bool "ARM32 Platform support for R-Car M2-W"
+	default ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_798181 if SMP
 	select I2C
@@ -112,18 +119,21 @@ config ARCH_R8A7791
 
 config ARCH_R8A7792
 	bool "ARM32 Platform support for R-Car V2H"
+	default ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_798181 if SMP
 	select SYSC_R8A7792
 
 config ARCH_R8A7740
 	bool "ARM32 Platform support for R-Mobile A1"
+	default ARCH_RENESAS
 	select ARCH_RMOBILE
 	select ARM_ERRATA_754322
 	select RENESAS_INTC_IRQPIN
 
 config ARCH_R8A73A4
 	bool "ARM32 Platform support for R-Mobile APE6"
+	default ARCH_RENESAS
 	select ARCH_RMOBILE
 	select ARM_ERRATA_798181 if SMP
 	select ARM_ERRATA_814220
@@ -132,6 +142,7 @@ config ARCH_R8A73A4
 
 config ARCH_R7S72100
 	bool "ARM32 Platform support for RZ/A1H"
+	default ARCH_RENESAS
 	select ARM_ERRATA_754322
 	select PM
 	select PM_GENERIC_DOMAINS
@@ -141,6 +152,7 @@ config ARCH_R7S72100
 
 config ARCH_R7S9210
 	bool "ARM32 Platform support for RZ/A2"
+	default ARCH_RENESAS
 	select PM
 	select PM_GENERIC_DOMAINS
 	select RENESAS_OSTM
@@ -148,18 +160,21 @@ config ARCH_R7S9210
 
 config ARCH_R8A77470
 	bool "ARM32 Platform support for RZ/G1C"
+	default ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_814220
 	select SYSC_R8A77470
 
 config ARCH_R8A7745
 	bool "ARM32 Platform support for RZ/G1E"
+	default ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_814220
 	select SYSC_R8A7745
 
 config ARCH_R8A7742
 	bool "ARM32 Platform support for RZ/G1H"
+	default ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_798181 if SMP
 	select ARM_ERRATA_814220
@@ -167,23 +182,27 @@ config ARCH_R8A7742
 
 config ARCH_R8A7743
 	bool "ARM32 Platform support for RZ/G1M"
+	default ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_798181 if SMP
 	select SYSC_R8A7743
 
 config ARCH_R8A7744
 	bool "ARM32 Platform support for RZ/G1N"
+	default ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_798181 if SMP
 	select SYSC_R8A7743
 
 config ARCH_R9A06G032
 	bool "ARM32 Platform support for RZ/N1D"
+	default ARCH_RENESAS
 	select ARCH_RZN1
 	select ARM_ERRATA_814220
 
 config ARCH_SH73A0
 	bool "ARM32 Platform support for SH-Mobile AG5"
+	default ARCH_RENESAS
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


