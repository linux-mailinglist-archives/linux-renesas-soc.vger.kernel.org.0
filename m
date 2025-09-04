Return-Path: <linux-renesas-soc+bounces-21362-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11630B443C4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 18:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB3791C87058
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 16:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB542FDC26;
	Thu,  4 Sep 2025 16:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LxsOQrZX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58782F361B;
	Thu,  4 Sep 2025 16:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757005157; cv=none; b=oDSbiUzIwmE9FHF07eMkJIuaTClHnXB6QuLwlfth3cOCB7bdSPJPlUyI9fyqDaIMfdhPiDFsY8M/NKSZ30X/OKIOP9TcqWsIZrpomWTpYMLMlumBblIj8k8BA0Wd2SdsQS2uNIAucfZjQMfz3j0/eQKmjz3fLGhxKwL77PYDAOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757005157; c=relaxed/simple;
	bh=zF8XAAPX2mkRY6+uFRZOBqwCofJ4F/UIVAp0/+HgaOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HT+kDZxdo1b7Z9mmpZAFF7tpW1GlOde6h4RWvm2oUo3sBBjMxboGc/Pr7L3urTKNSPkokQxIAr0v2M5hc70JpJeus8p5iSgeMCyxen2EG49UO4eIb64rYbXIofL6HXlKzZ3MLYfoGSGk+3wq7BnVQZZp2CMDunN0C2rS0iNuXAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LxsOQrZX; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3dcce361897so881031f8f.3;
        Thu, 04 Sep 2025 09:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757005153; x=1757609953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFB/NNGYLf7J8e5RRR6Ay8hW0CG+lXR5EqHYLaJvCJA=;
        b=LxsOQrZXGFehr8E93uMR9f5+adVmy1ZvfnZj0NQTanYaI9L26J8rTJDX+0tTEhQ+yr
         29iL6vBT1gMLi2O7pUX2cbywCxCDOgpcKdT/8zKC0fVm/rMqdFiwKOB/6EYs2c4obEmN
         lbjAV56UbAwNFBYmcVxuhkPmC+KMPMeBseDJGT/iMFv1dRnxGJooowymr8extf9MycD2
         7Dzr7T7escWlLpQWZcpMsAbybYYq5jUTHjKB1RDK9xdPeSFfKnQMt/3CRiWt/QgPYw0e
         K2DUuBv8La4E9g74f/kyIqnhkRn2ssI3Hg+DihcpkZD0uD6yzluqCGAHxR/O7qYWT0os
         EogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757005153; x=1757609953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFB/NNGYLf7J8e5RRR6Ay8hW0CG+lXR5EqHYLaJvCJA=;
        b=eRdQfjk71woItCf9r4AwDtwyIjc8UIpQfjA1whpiY0+D6ljZAG1+YudXxgmsuDeyn5
         fN20XuFakPwEi2l8lE4RCZb76PJG4Nk9bcXn6kzYQAfmk5uvUccqLh++uc2GUdgh7WOB
         Fy0JqhPlOwdP6aNBW4soacbASgLmDiqR+uf+s7D8BZaEqGgruVp/S6FwTIR23ezovXH0
         B2z8UIquuVeKzcbaECFjCx/vj9AY1n91e/En5NMnRrNc/JFOrvnZn0dZVPxuPKVvxBw7
         a+2bifPUblbek638dLLs4tcI7JuNV92DBwCbyy7rGzWWyul8KDaJCluSkcviPQXl8k0x
         b8oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUliJX1PFpburo773HFZFOH21pxQdR6JFCgYMI3Pq3Ni51ybxXdDWAsbfHrqF4PojigQxDVGZ7dD4dKlR0s@vger.kernel.org, AJvYcCXARw3VBLmnDgDiSnbiyJMsXHi5WKTT7wF2hzPYSY2a7B78wZ/D9wD7mOi6Z/WYXuPvJPtrUJCmgRyQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyIaOkIJFkDf0JiiqQTtbItT2+leEZUOkzj3D2TpUgZfQUHn4DG
	PF4QhzAzypjYcybiuH0EqAFRDVuSIlpnjKRpULiCjUZ8b2mQi6iFAlAo
X-Gm-Gg: ASbGnct1FKaPTnsqTJVRi5QJ52cH0/t0NRNaXanb0DvDNnFhxtIgRP3xsgIcOfXYEtf
	aC91eiGGfu2mn6BFRYQ8Q+T9IydiojVNcTCySAMY7+k3iCJ6zgX+x6lE16jbu0f985haEL88u5o
	mYTjXqs75MLCkC6g5oLGMR8eUbMZMB5DtJ8PMmtdX0vkPL8gMqjuRkjl8NWrehgSiuiR+vo/2vs
	HyTnqgG7ue7lDmsrBfk5MPL3l4tLZZNLmGBhHba0QbtDAzfAJ36hFDvkMr1oKMiYe5YtRmK6cdl
	LwdbKO2I3Nm/Bbh4ZY1SUwfJCmwsGlNwwoci6A+ZEXyL+7kuG3yVaLcl2ubQ2ZCQn8BFRg10sii
	hJ5MmLTBTA1pvf/qSMc8z81xH46KGXneNTiIboe5+Tq9DemHka6g+v53SaQ==
X-Google-Smtp-Source: AGHT+IEkWdi++Ae3Bd7fNiQCiZ2rD3XXClu7u+MVoH3GBmaxIKQUR/0bLkFeF8QVQ2It0nSazriD3w==
X-Received: by 2002:a05:6000:24c3:b0:3ca:8031:4b38 with SMTP id ffacd0b85a97d-3d1d99cbafcmr15334465f8f.0.1757005153166;
        Thu, 04 Sep 2025 09:59:13 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:904e:70c8:edf3:59a4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf34493b8csm27633141f8f.59.2025.09.04.09.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 09:59:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
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
Subject: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add I3C node
Date: Thu,  4 Sep 2025 17:59:08 +0100
Message-ID: <20250904165909.281131-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904165909.281131-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250904165909.281131-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add I3C node to RZ/V2H(P) ("R9A09G057") SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 806ce7901803..6eceb3018efd 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -607,6 +607,39 @@ scif: serial@11c01400 {
 			status = "disabled";
 		};
 
+		i3c: i3c@12400000 {
+			compatible = "renesas,r9a09g057-i3c", "renesas,r9a09g047-i3c";
+			reg = <0 0x12400000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0x91>, <&cpg CPG_MOD 0x92>, <&cpg CPG_MOD 0x90>;
+			clock-names = "pclk", "tclk", "pclkrw";
+			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 675 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 677 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 678 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 679 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 680 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 681 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 682 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 689 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 690 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 692 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 693 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 695 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ierr", "terr", "abort", "resp",
+					  "cmd", "ibi", "rx", "tx", "rcv",
+					  "st", "sp", "tend", "nack",
+					  "al", "tmo", "wu";
+			resets = <&cpg 0x96>, <&cpg 0x97>;
+			reset-names = "presetn", "tresetn";
+			power-domains = <&cpg>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		rspi0: spi@12800000 {
 			compatible = "renesas,r9a09g057-rspi";
 			reg = <0x0 0x12800000 0x0 0x400>;
-- 
2.51.0


