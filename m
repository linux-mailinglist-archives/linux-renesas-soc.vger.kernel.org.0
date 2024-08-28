Return-Path: <linux-renesas-soc+bounces-8445-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7DD962776
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 14:42:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A32C71C2105D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 12:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8B3187578;
	Wed, 28 Aug 2024 12:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUnvqr/S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722A017C9B6;
	Wed, 28 Aug 2024 12:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724848916; cv=none; b=fsgIdZedMcyWjGtRk4VIRA76qp4xa5aTRgIKXDdJkoWwbuPhs3VU0UW1aLw2vOwOEwttvS2qPMmjRhP1BP26OMUyx+tZGddiIXPYELN8Hs2wKy7bztVwLtv7sF3OhJRK34GcYMaSV9hMqwlRX5usBaQXZWHbdoveySGc9l8JAx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724848916; c=relaxed/simple;
	bh=EVsqsOh7AuOJHHI70OdYDK9g/0cONB60DGyYmSQfdjs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tS+JTBjqXdOnBnfBUMc67Mcfg4JczZGNfZjbixwRXQv//AIlG6Z3fgn4W3u0tGSjMybUa+nBuWqHG47DZU/6xBRjP0jLKi9pHX/6g0Hp4amtC3yhaIexjpYHZmvDUVNHXrvGixxUbQQvfvuRTMhnBM7+CQAWG7OLjP0qDy+vbv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUnvqr/S; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4281d812d3eso73607385e9.3;
        Wed, 28 Aug 2024 05:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724848913; x=1725453713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uq9xDoR/8i3b1+7O417dMwtB0UELIAN007JdPhFBNkw=;
        b=fUnvqr/SVk9xrkdACl8gr0Vn8VyQOQ9VKS8zjiwx00vX6HNW4DWCmD+tGK7dlyg10X
         c09ACpyW3i/i7jJjG8wHprFeJiYP05dSpwZyTYJd3Jhkl4KG5P4LiAb4fmSkVf9Ldq8p
         ShXTmdMbYoinf5VMopz0MwBnssxaFeZhCPIUlhx2Tgb9GY6jrHEjnPbomLnk+Blf3z9+
         aYmmfcKjjW/jbvJ2/OZ/RQ1yzmDYj/a17vp1w+rXFrU/FeywfciCoZ0r6nEy1MFhzoe5
         F87a4RqFl/D1hCBO3nYvjexUzrJrE3MNK1sQqUI2/zWh9IXwgtk4ODrLYx+IIhDhYAx5
         2afw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724848913; x=1725453713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uq9xDoR/8i3b1+7O417dMwtB0UELIAN007JdPhFBNkw=;
        b=H3v41OLBTngJbw96y9ifD0mKR68h4LQas0N2UubCGT0SeKzioNZg1ArOG1SCkL46ZW
         xw2VzcURj+W/6B+HX0Z2Kn1AlzvyP/R7wzSIDkYvHTtUdTyMW0tOW1WuHdawVdkwncCb
         ADsQ24l5QkMUxePYAW4uEliV35fC55erv5CsQxBoXg3qpyOCblc+pemTvJW23H1JekEF
         dxh7pGuOwjzDhTeKG1ntpVvHRJGAxKcdFNwbbMbBTjmnfaXE/8UU2JRwRx6wJe22BtKa
         9jzbqRFPU2W4ufA8NEX4Vfm+y22pGD7rxd0ye7Pv94onPpFTpDbQ+gHlC6Qy67JtV6GI
         YkmA==
X-Forwarded-Encrypted: i=1; AJvYcCU2x49vV28d4pESxcGRqUbN75Iqyc1KFZUlEIPJwhJHm9/lalKXsK59rvRJvCe/IShUPcneg5P+4oTcsqY+@vger.kernel.org, AJvYcCVilDZcJFEJqjGbOLO9uYfKH90uM97tz8EiFqxKHrnA72R1FvBDXjBXLHizv6eBkz5e2PBbLVQlUc5T@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyaorg2otLQynDl5oZDgplpw5+gU95QH0sNzttlqPsPLDK7n3+
	ye6/69q3ZqA0xnkVF26WcM82Ek9nayjrNDyi90TSKoPIvYE5t0tv
X-Google-Smtp-Source: AGHT+IEreM8kmCAI8H8kJr7n4bRfn9dgE4DJmIe8fYbcQ27lrtHp4FTB3nUthyhUf/De1hwygyqfJQ==
X-Received: by 2002:a5d:5c87:0:b0:368:4489:8efb with SMTP id ffacd0b85a97d-37489b32395mr5897219f8f.40.1724848912199;
        Wed, 28 Aug 2024 05:41:52 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730813c5edsm15508226f8f.31.2024.08.28.05.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 05:41:51 -0700 (PDT)
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
Subject: [PATCH v4 4/9] arm64: dts: renesas: r9a09g057: Add OSTM0-OSTM7 nodes
Date: Wed, 28 Aug 2024 13:41:29 +0100
Message-Id: <20240828124134.188864-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240828124134.188864-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240828124134.188864-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v3->v4
- Used hexadecimal values for clocks and resets
- Sorted nodes based on nodes index

v2->v3
- Grouped the OSTM nodes

v1->v2
- New patch
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 35b34c40cdc8..335a6dd17fce 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -121,6 +121,86 @@ sys: system-controller@10430000 {
 			status = "disabled";
 		};
 
+		ostm0: timer@11800000 {
+			compatible = "renesas,r9a09g057-ostm", "renesas,ostm";
+			reg = <0x0 0x11800000 0x0 0x1000>;
+			interrupts = <GIC_SPI 17 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 0x43>;
+			resets = <&cpg 0x6d>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ostm1: timer@11801000 {
+			compatible = "renesas,r9a09g057-ostm", "renesas,ostm";
+			reg = <0x0 0x11801000 0x0 0x1000>;
+			interrupts = <GIC_SPI 18 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 0x44>;
+			resets = <&cpg 0x6e>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ostm2: timer@14000000 {
+			compatible = "renesas,r9a09g057-ostm", "renesas,ostm";
+			reg = <0x0 0x14000000 0x0 0x1000>;
+			interrupts = <GIC_SPI 19 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 0x45>;
+			resets = <&cpg 0x6f>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ostm3: timer@14001000 {
+			compatible = "renesas,r9a09g057-ostm", "renesas,ostm";
+			reg = <0x0 0x14001000 0x0 0x1000>;
+			interrupts = <GIC_SPI 20 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 0x46>;
+			resets = <&cpg 0x70>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ostm4: timer@12c00000 {
+			compatible = "renesas,r9a09g057-ostm", "renesas,ostm";
+			reg = <0x0 0x12c00000 0x0 0x1000>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 0x47>;
+			resets = <&cpg 0x71>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ostm5: timer@12c01000 {
+			compatible = "renesas,r9a09g057-ostm", "renesas,ostm";
+			reg = <0x0 0x12c01000 0x0 0x1000>;
+			interrupts = <GIC_SPI 22 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 0x48>;
+			resets = <&cpg 0x72>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ostm6: timer@12c02000 {
+			compatible = "renesas,r9a09g057-ostm", "renesas,ostm";
+			reg = <0x0 0x12c02000 0x0 0x1000>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 0x49>;
+			resets = <&cpg 0x73>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ostm7: timer@12c03000 {
+			compatible = "renesas,r9a09g057-ostm", "renesas,ostm";
+			reg = <0x0 0x12c03000 0x0 0x1000>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 0x4a>;
+			resets = <&cpg 0x74>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		scif: serial@11c01400 {
 			compatible = "renesas,scif-r9a09g057";
 			reg = <0 0x11c01400 0 0x400>;
-- 
2.34.1


