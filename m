Return-Path: <linux-renesas-soc+bounces-7972-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA15A959833
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2024 12:47:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CC011F22892
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2024 10:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC1C31DE645;
	Wed, 21 Aug 2024 08:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kT0YHZy7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1F01A7AD0;
	Wed, 21 Aug 2024 08:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724230618; cv=none; b=Vf0HJdxojaa/7+y+8CmZKZogFp2shDOMMPJRfXeJ19qPAfjpmx7Yb+PVLk0OYkHjaFlTm0OmIpWlht9fZjkQByjME0vb+ZELEc8WD73lqtHsJ4vrI2zrGgODE49F41utke9tYm+ISo8k7k7U4WLHRdgZqs5RC/01fvlo/Co4TXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724230618; c=relaxed/simple;
	bh=F/Ri4bzWq04j9vKEfoU++4Onzppq6KJO0Wqv2cQVauA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B6awwKyhwu/unUUro+4pOiBxyzO5kdCG4sOw6n0gYKCyZLSs2t311agn2BbkQkPDYddiR93ZtIMFlzUCYC8K5dGT7HHWYaXaB02lcw0rznnSBkfES+DLlAO3/2wtr4aIA/SfjWBPMTWKyO5gs7MF0wbT55ExZDZ2g2uUmhMrizc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kT0YHZy7; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a83597ce5beso90229266b.1;
        Wed, 21 Aug 2024 01:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724230615; x=1724835415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3m1IuTDwdRkFd/jmmLNp0dycrGp/f3AoFpcXVX/r8o=;
        b=kT0YHZy7b5NguYyZUhhQ/fm+ikSTHKpuS9+cPMaGV8IurO+J9aG62JmeXc8Tp5owdb
         gfq3zdvHkopSr38p6HaujlQ7DgHBwQAKU54b4aOgPElKwy4C960vdqTe7umBEX/AiXp5
         VA0hCZ5G2RWKbf/BjcEnMFKK3+TB2xKcmLiU9Em7yJ6d4zm2jmXAYnHKOVHh2+86kNKo
         XtTxXQ9qr4aI/MrwBQmbVH8vVX8f982KOfroGCkelnDnYO5P4O6jX4F0qR3CpO6u9R4I
         4k2q8I6vKh8HQDyxAi2T0v9NNuwDNSRG53miS6tTuuYA+HO1XjEfLu+ROS7nGgWbiW3X
         Hl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724230615; x=1724835415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3m1IuTDwdRkFd/jmmLNp0dycrGp/f3AoFpcXVX/r8o=;
        b=ZDpLwHxCFnKoust8egkJvaGP+vyOIpCCcuBcCdUVn6IYghyAM5qrhN2ZOTXLKVal67
         wnu1SH/2xKSAmFRfYFe6CZfosOQCbP3rAfBZN4fJ2JxaTWOQZPWFVWXvQ89zBSt29Pf9
         DQnj06UrKR3JL7o1dhBPfj5VUp9//zIf35QQs9uDtw16SSP1A2CWoO+6/uR1aArII7Al
         jJPxO12rSAtPV0nT40lzLcnNN/qJ1KD3Z1c7hRsJpJffBuJE7QurgZOIJuUeaAfxB9pf
         qB9VspAa9Ar3uHq13S2Uez6tUpP9EY5FAOi/PmglA8UrpW0QTYs8PnxZU106Eayhh6g/
         eYSg==
X-Forwarded-Encrypted: i=1; AJvYcCU5YAfEp4yz0LPDq2akJzEQ5tqFUp+56sLypcdY8//IR4PNktUzME5ROhxP1KXkFq3aT3ORHt1sxDQWUm0k@vger.kernel.org, AJvYcCXxQCSmt0O2YDgisXrbdLyl1JYb7eAmVe7qs28elqoODUlzrm9PYsvCg3ssaRotwKs1ml/15U80hkv7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5aDvckVB8Vp1i1ubulEY1vftYqeTx8/OHldtZIyBpSNcDTLr6
	PvJb+Svq6a3+jlJsFVfLc0CmoC0VCZOQXSNvAy3mBcoNHTqLnRPU
X-Google-Smtp-Source: AGHT+IEPHlBU6Sg2BsIO/TORm6rGVPk/wRa+iumRehZr1gi1/XLpbcdnZYkqxYZ1+LWXtKxfEUnA8w==
X-Received: by 2002:a17:906:7313:b0:a80:9c1b:554f with SMTP id a640c23a62f3a-a867014566amr185014966b.27.1724230615056;
        Wed, 21 Aug 2024 01:56:55 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:b9a9:40a4:353f:6481])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838cf183sm873416266b.56.2024.08.21.01.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 01:56:54 -0700 (PDT)
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
Subject: [PATCH v3 5/8] arm64: dts: renesas: r9a09g057: Add SDHI0-SDHI2 nodes
Date: Wed, 21 Aug 2024 09:56:41 +0100
Message-Id: <20240821085644.240009-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240821085644.240009-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240821085644.240009-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add SDHI0-SDHI2 nodes to RZ/V2H(P) ("R9A09G057") SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3
- No change

v1->v2
- New patch
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index eb36b3abc2d2..9103335ac583 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -420,6 +420,51 @@ gic: interrupt-controller@14900000 {
 			interrupt-controller;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
+
+		sdhi0: mmc@15c00000  {
+			compatible = "renesas,sdhi-r9a09g057";
+			reg = <0x0 0x15c00000 0 0x10000>;
+			interrupts = <GIC_SPI 735 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 736 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 163>,
+				 <&cpg CPG_MOD 165>,
+				 <&cpg CPG_MOD 164>,
+				 <&cpg CPG_MOD 166>;
+			clock-names = "core", "clkh", "cd", "aclk";
+			resets = <&cpg 167>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		sdhi1: mmc@15c10000 {
+			compatible = "renesas,sdhi-r9a09g057";
+			reg = <0x0 0x15c10000 0 0x10000>;
+			interrupts = <GIC_SPI 737 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 738 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 167>,
+				 <&cpg CPG_MOD 169>,
+				 <&cpg CPG_MOD 168>,
+				 <&cpg CPG_MOD 170>;
+			clock-names = "core", "clkh", "cd", "aclk";
+			resets = <&cpg 168>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		sdhi2: mmc@15c20000 {
+			compatible = "renesas,sdhi-r9a09g057";
+			reg = <0x0 0x15c20000 0 0x10000>;
+			interrupts = <GIC_SPI 739 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 740 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 171>,
+				 <&cpg CPG_MOD 173>,
+				 <&cpg CPG_MOD 172>,
+				 <&cpg CPG_MOD 174>;
+			clock-names = "core", "clkh", "cd", "aclk";
+			resets = <&cpg 169>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
 	};
 
 	timer {
-- 
2.34.1


