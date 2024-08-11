Return-Path: <linux-renesas-soc+bounces-7795-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F19494E30B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Aug 2024 22:51:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1FE3B216AF
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Aug 2024 20:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2276116631A;
	Sun, 11 Aug 2024 20:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhOKYmDs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D5515F41F;
	Sun, 11 Aug 2024 20:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723409419; cv=none; b=pUQ1ttU5IACU82ocBb6q1XGlF/p85Q89c3n51f1nlhvFeWMFRjd6k5uvNMwXqCM9AyRme7Sj34joz9mhGzI3rxhxoMJRQ8Fb/xb5VRugCdmLYDTJ4qCgoo959MQcGlHRjSzDFE3M+rzJKGNcgsZG9sSBC9aiPIj9EdMaDWUkYeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723409419; c=relaxed/simple;
	bh=l/Cjwv7FmmAKcauy4kkterN2+iEIZC3U2qcHosD5azU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qrD5kaSeAK4LbS5v/Na/V9DtHNz1JI6CyWRgTOh/n7AASwWrBILSCIGTCEB72ZJoK+Ty/CpHzEwT/JKqY0mVYGgaBwk66KNvOiDJyqhs+rkLYYGqZlZKOLBVr2syDZ1U4gI4gUfjIOFkwM1EbZrcs8WA7twW97kv4qhQ4boawZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhOKYmDs; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ef2cce8be8so39985161fa.1;
        Sun, 11 Aug 2024 13:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723409415; x=1724014215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fi9xPJ5+1kwyturD/C/uGHyiMV38ettIrscYigOoLvU=;
        b=hhOKYmDsy7u3dSSGvVA3WyIYtnS9asQpvk7Fe8S4DHb9f7a/DiqcMFnCgVMnQkHO2/
         xYkYqjcYx/nm32stEqWGVmA+c6PUP0EyaAXpDBqsBw7LVnPyL5dROu97KUSuUtZgPIzF
         zv95sK6Seu5d74PprFLFsQybD1YHTIy1faTd34K9l5FesRDGkWPk9TgKpfbdiE9Mp2/W
         JagyH3c7d//GkYEtDLE0i5ZOaB8T0CoCt1E8A+JXhx8sot0gKWpI3i6MdVChvy6e8HL0
         f8LSsdpWK8EBD/+W4NprkLJ8ML4zdxw351fb+OTn7BqJcxuwnDvLnG6dvNPwW0wqinVC
         9RTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723409415; x=1724014215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fi9xPJ5+1kwyturD/C/uGHyiMV38ettIrscYigOoLvU=;
        b=XA7TOG5UO1gfnsTX4norCNude899Ecae17aWVtNvP+WzwuyBPjqalgkZLoqqiajqm3
         SoWAanE7BuIg99jGEdm+zjrNMklxUa7ZREac/QZoPC8/2oE1o67quazNZe8lIRjYtyER
         36/9jYxYcD3weScfqkd9lkUlAcnwQn5AmudW5CBG+nsDNNPcnawxFtMNz8kEdG7nId0j
         T1rMxyPi8OXvBFOdRy28bWhgwXcpcbAxDOLIIkdN5vtnZOjMd7pnj4Cv/d1GnvdupHAP
         xjw4SgbHfFRnmArNpmFe6TMlQW7o0JgXdCEP+4CjgdUShQWZuI7QHhg3ikK4uYctYuFl
         luvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhbPTfl+2+FzlRpyMQATCBBXOA+B9EDDKJkJ9X/47ZqdWdrlGhZ+d3VI9Hf0A155gwREkTF5jHkoMt1BbiILYf8MCqyp3MOAHXeGkCg9AfYfjwJOXHyl4QYr0OALpPg8zXJZrlj8nkhQ==
X-Gm-Message-State: AOJu0YzN8gSNkOzv/ef1Je4StMUzvAwkG8ZWGhuKyiCpyPxnEXfG0dUv
	ZCAuMsdcSlL9ycEMUJCGH6qVe0wyC9uz5O92QCp3945NyBuggLA1kYcKohP+0cs=
X-Google-Smtp-Source: AGHT+IEk0d36F7Y8nRTelV+jNkwIR+tkO8ZISS64D55qCAq41HS4cq9IX1SUMxUM4P2ygttqk9yt1A==
X-Received: by 2002:a2e:a411:0:b0:2ef:2e1c:79ae with SMTP id 38308e7fff4ca-2f1a6c5add1mr54590571fa.19.1723409414872;
        Sun, 11 Aug 2024 13:50:14 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c750f0absm76421845e9.17.2024.08.11.13.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 13:50:14 -0700 (PDT)
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
Subject: [PATCH v2 3/8] arm64: dts: renesas: r9a09g057: Add OSTM0-OSTM7 nodes
Date: Sun, 11 Aug 2024 21:49:50 +0100
Message-Id: <20240811204955.270231-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240811204955.270231-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240811204955.270231-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add OSTM0-OSTM7 nodes to RZ/V2H(P) ("R9A09G057") SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- New patch
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index cf890026e284..3d6c3a604ec9 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -121,6 +121,26 @@ sys: system-controller@10430000 {
 			status = "disabled";
 		};
 
+		ostm0: timer@11800000 {
+			compatible = "renesas,r9a09g057-ostm", "renesas,ostm";
+			reg = <0x0 0x11800000 0x0 0x1000>;
+			interrupts = <GIC_SPI 17 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 67>;
+			resets = <&cpg 109>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ostm1: timer@11801000 {
+			compatible = "renesas,r9a09g057-ostm", "renesas,ostm";
+			reg = <0x0 0x11801000 0x0 0x1000>;
+			interrupts = <GIC_SPI 18 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 68>;
+			resets = <&cpg 110>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		scif: serial@11c01400 {
 			compatible = "renesas,scif-r9a09g057";
 			reg = <0 0x11c01400 0 0x400>;
@@ -142,6 +162,66 @@ scif: serial@11c01400 {
 			status = "disabled";
 		};
 
+		ostm4: timer@12c00000 {
+			compatible = "renesas,r9a09g057-ostm", "renesas,ostm";
+			reg = <0x0 0x12c00000 0x0 0x1000>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 71>;
+			resets = <&cpg 113>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ostm5: timer@12c01000 {
+			compatible = "renesas,r9a09g057-ostm", "renesas,ostm";
+			reg = <0x0 0x12c01000 0x0 0x1000>;
+			interrupts = <GIC_SPI 22 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 72>;
+			resets = <&cpg 114>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ostm6: timer@12c02000 {
+			compatible = "renesas,r9a09g057-ostm", "renesas,ostm";
+			reg = <0x0 0x12c02000 0x0 0x1000>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 73>;
+			resets = <&cpg 115>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ostm7: timer@12c03000 {
+			compatible = "renesas,r9a09g057-ostm", "renesas,ostm";
+			reg = <0x0 0x12c03000 0x0 0x1000>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 74>;
+			resets = <&cpg 116>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ostm2: timer@14000000 {
+			compatible = "renesas,r9a09g057-ostm", "renesas,ostm";
+			reg = <0x0 0x14000000 0x0 0x1000>;
+			interrupts = <GIC_SPI 19 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 69>;
+			resets = <&cpg 111>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ostm3: timer@14001000 {
+			compatible = "renesas,r9a09g057-ostm", "renesas,ostm";
+			reg = <0x0 0x14001000 0x0 0x1000>;
+			interrupts = <GIC_SPI 20 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 70>;
+			resets = <&cpg 112>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@14900000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.34.1


