Return-Path: <linux-renesas-soc+bounces-18290-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDDEAD8ECC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 16:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DF081E601B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 14:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 511A02E7F3F;
	Fri, 13 Jun 2025 13:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2IEU9JL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696E32E7F0B;
	Fri, 13 Jun 2025 13:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823004; cv=none; b=eP/PKZ9CT4NVdYzkiWS6QE12CdaF+hyPNndh//+toOI/dVDOL4vhcOzbWllp/nIyC/1IYu14L/qZDX14HSuYUGeg/FbcQQfQPby0l1a3Is1bUoS9u09uHuHB4o7LO3FhuV8C6/JbIBdUZUs4ouPmxrQQBc76jQEfyqNkSWWZLGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823004; c=relaxed/simple;
	bh=o9W4kFCOVJeJ/YZc7gwj/pR4T7V717EtMi56BeL6DQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mkiv1jOaS70wDt83yo471AHR51zAfYLcwm7dxld6tqzGuzscCY9VbPww+//kQEr6HE8xDSstWSkvUilQNgu319xIZRQClGgp9WAOxkem46sdQ7k38yxIrgOW8kYsahyfVm4FlJa1QkHp506+f3dfZhM0dW+FGdvwHs56mqRAIbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2IEU9JL; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a522224582so1226363f8f.3;
        Fri, 13 Jun 2025 06:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749823001; x=1750427801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nPksibYxIFUlBdk/l5/snxnqcgsHHCD7l6/l3HiKhc=;
        b=e2IEU9JLgRxK2+3JzE6FCEHaaaGbftY87Fe/ZFx2jktltW68LCVFQmY54AcFIsqVkf
         n+kAipuFCx0IwCamc0hX2fN1dpzIJdnk/afZuEHbSZ9VieovK7sd04XkHKqM2oy8y/1k
         cHjFFU3vKNI/UIRxqKtvN7PCj2mNJiKs3El0NbL9pf/isI1rvLzQVdTheoMxrxufiEmi
         jmkxMiIQDO7LAHPWTyen2dP08onTinHQEgGfuzLu5cFUvzYr8duIN1z5/MFSmOqea8ap
         AtGXGbXFBBOAit9TR4CgVKcd3GcFgg5WDS1UxfO39AqlbduEEcX3PrDIp7pifBsHk6n1
         YL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823001; x=1750427801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8nPksibYxIFUlBdk/l5/snxnqcgsHHCD7l6/l3HiKhc=;
        b=LgDpF9w7ArtCBoiYrv7uXHw/Lx2+6u16MXUetAIhoPNo05fKoyxuqRfyDce65osbO6
         R01xJ+V7H35psCkjq1sMWs6942mGcwg2KDGCiscJsuFiwaxx6jkeBuibvFE5olVvmujz
         sePalvVxq01kMEilYPCNG9XJ/+v+FjXo91veQl7PCJGHgE+jtC/f7ZNo5ta+dlfK4Pz/
         /Joq/lpcggjBmIHKhUye22WM/Hqk7mRwB/BIcnxXgm0mObenMxihS52X44ELJzGGKQRn
         oWEpEpI8xo45tBkFLBARHxOuo4t1JWsp/sWyvZYf1A7z9ADdATaCsFXm8c4ZiETK22Sx
         3qYg==
X-Forwarded-Encrypted: i=1; AJvYcCXQh3y+vv29kcNaN4qRhsXxJlpySIB81Zwyma+dG2womTps4SuKdXJI/wG0LwMRX1d5wg1BgIOdMnwg6vRI@vger.kernel.org, AJvYcCXoITqEWtz/vydnnzKYow7FINFn9qLfkx/KMRrBgUnuC9UGUVEKepLDvwLCT3L1OPSkLIevsOO5+vSS@vger.kernel.org
X-Gm-Message-State: AOJu0YyCzDZxMM442XajAunGr80rjfPMVRNeiUKYuZR+PykLqshy6SL4
	K4dXjUL2W5NyaQctMhXKgLgf+H901riIsSREV6rtZuNMu9JwzVuypG/p
X-Gm-Gg: ASbGncuLkkavGfy+VoPu1wWuAuVyWKCOJ7C+cZG4pWIXf75c3Crlx9JQZNJ4wzxSkwn
	00F6et3zcozbMK69mAYeEyn0m4OvFveXk43rmDBGR2jFvgx4dIliLozJsVUHpv8BdRFnqkfC93Z
	OFcxmrREehldptgUN6Sceew0Jf90xUDyLoowi+2Dax//86j6S3aMNDEYSlpMAPo3VqeVAjvk3Bs
	Vj9MI+SRb2Qt7OV4VamXMsvx3yw2XcbQ+z7O2vASFz3D7QCT8wYVfg5cGxBEOqH3A/9fuhtZEcS
	6ziVps/i0Elc3FOktM0BaxAzaXN9RS5q7rkSvoGQO58GRUaNZtM+L75zVRXk0+MFN74QZp9cZ3B
	gK4/hDYldoW99AvAUvpB/
X-Google-Smtp-Source: AGHT+IEHQ50gFYxSY8JZlGdesxfpZUu1V3vdCNUrNoBd3inpZhglKaVP+QJz/uvMNjMfrTD1sTcKFA==
X-Received: by 2002:a05:6000:2909:b0:3a4:ef2c:2e03 with SMTP id ffacd0b85a97d-3a5687577bamr2668337f8f.33.1749823000584;
        Fri, 13 Jun 2025 06:56:40 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:2c2d:5496:6768:592])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b089a7sm2404489f8f.49.2025.06.13.06.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 06:56:40 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] arm64: dts: renesas: r9a09g077: Remove GIC_CPU_MASK_SIMPLE() from timer node
Date: Fri, 13 Jun 2025 14:56:12 +0100
Message-ID: <20250613135614.154100-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613135614.154100-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250613135614.154100-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/T2H SoC uses GICv3, which does not require a CPU mask in the
`interrupts-extended` property of the ARMv8 timer node. The CPU mask
macro `GIC_CPU_MASK_SIMPLE()` is only applicable to pre-GICv3 systems.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index b531e393d8c4..c756a7c3cda2 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -274,9 +274,9 @@ sdhi1_vqmmc: vqmmc-regulator {
 
 	timer {
 		compatible = "arm,armv8-timer";
-		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupts-extended = <&gic GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+				      <&gic GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+				      <&gic GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+				      <&gic GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
-- 
2.49.0


