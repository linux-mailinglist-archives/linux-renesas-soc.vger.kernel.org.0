Return-Path: <linux-renesas-soc+bounces-18741-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF288AE8825
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 17:31:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 250473AA7F7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 15:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5398F27F183;
	Wed, 25 Jun 2025 15:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e65UFSkz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2072641E7;
	Wed, 25 Jun 2025 15:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750865465; cv=none; b=QTJ7x/2wSXc60kvTEHUpPx3/Q2mc7baBR1Z3afA2F8xmPI//NzqGc/1Vmd5pvYODaRTlloA744aw3VILZ078Z9mvP2Z+R2yC/Vz7SJXpOED2B0etwT3Csk6yUpYcd2NhScHgnX0l12lQu/lGzgxyx2Fdy0qHRm+yBcG1jkFpcJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750865465; c=relaxed/simple;
	bh=tNlKsYOryVzvbQOkK10QJOn+Onlkf1YZkSYjMEH7GQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oHXZp/prYkeIiWaqpZIiq3lP51QU5cP6jcY2KEfOtwWsQdJXwRfT2uPNAC5XhRJh0MOmSO37J129sMjqTh9wcD9IgSNIWW2BXFHEByy+BY6m+aJnerOQi6Hl2RcAEzn4RA2QGKHgRoNSxQo+yS/lLDgU1tzC/h+faRmFJHiq2zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e65UFSkz; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a6d1369d4eso1227157f8f.2;
        Wed, 25 Jun 2025 08:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750865462; x=1751470262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EU5jRev+QD4eELCpK/XkLJcWGEqm8qLvslpJBMkOuvU=;
        b=e65UFSkzeHGFxeZaap1YbuBiUYgaz9I/gIdKAKaAXhz8tLowMSnkQIKclDZ+Q8JPVu
         W6QRhPkaCPiFMPpV/Zr7GicL3qZ4UREMO5LMGoih3EnE2iU4haY5KtzGf07zFTcICkGV
         LnUElX4iZgwIbcuLTsii+gwxXpuxPzkC1E3IvTb3UdpZH/Rqb570dpFNRCz0l8HOc2Ua
         leZfAqO8zTVjDXn/qhBoIEX0jan9lrBUOdq/SM6DQrC6cLEy53sv6bL5SJv7ZkO+pp1g
         pdXw8IL8VuUwBUGFlVa0oqBkPjuLdwyIJskKagTPBxYq5ee3B1nMVyv4ryYKCkH9gI2G
         vWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750865462; x=1751470262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EU5jRev+QD4eELCpK/XkLJcWGEqm8qLvslpJBMkOuvU=;
        b=xPf38j42OjGlQya1uYbbA8I6tijcPFKAZH3VtdpWh19D47vxyAy5In6y1DVNzRDOSC
         oYrWiwq2tLrN4xhyYs+NMBthA0Rd0G4FmlIkd+py4Z2bjdMk7OQmOCRNUk6kSf/oPI6c
         z/xOGVID9KW+s4CqosouXswuxnD8i3xFZfuB4qeN45gT0vJ3S1VT4fGodkqU6U0SxzPU
         XYkG4DbOsRdHNCjq9WbgMB6hM3oklz0KGqSWHsVT2KjmezTxyaEB5FTPM14pj6Fizhac
         X54Q3Su8tNSoPt+XA6F2VDzThcuhdUYRqm6TvyYp+NmfbcmC7AUc3j6pOPwxNJuXCWx3
         +wrw==
X-Forwarded-Encrypted: i=1; AJvYcCU+N/xQS65g9LE9zw8zDvLk+yI1jMlnwaT/ppj4YuS9laGXOxZHlTy422JG0Snqv38n6ICHUfAFA6M48WAw@vger.kernel.org, AJvYcCUpA/xEIgoHLnm+oscmr5qv3wXE1uKsmfyqovaAm4i2qv90Aow0LGF4l0unVHXA6X8p+90cYK8YUAkA@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7Wl8adgCJcsZ35LFQUdif5UaNFafKTuXuYEKxcPZV4lI5WbUf
	Rv08FtEk2LbSAPTKBZdR8e9GHgumapt8ExS2zbrl/6yoaTYtdqLn3whn
X-Gm-Gg: ASbGncvOLZJhEzeJaIi0fgftANw5crGGMS5+BgTfrmUTV8M/9VayEHIsL3Lo9iIabxf
	BwzDJ6kjBDwLfiiL2RhiCnxljx6d6es6wUlGmpItpXpg7NH2zhEEHYCPhFpVjYRXuqmSOpm9A8G
	DZDEnkfu5jLe2LG16AYLVdAvsPCxpIf+883qoR70Tied/iQ/pNH9hW+1/Bu6LCXVF/fWNrpExU2
	0KeJycQpi7CtS6L3CCwe1Mb/ugLt0Vw8u/eR+JgZtDNSGqN80ZQzeh6ZpmP6P/iUFJg09KTvI6H
	4YQNX56U7GMu2CHTUTFJGsgFG1XRFGsAoAm8k1JFyPByb5acW+vdXeFpfBsnXfBk1eXHq141xpQ
	ebUb1vTIX+OZOmpKzjj+C
X-Google-Smtp-Source: AGHT+IE5IVhIi9CkxWHm/GYdTnVLmm1+bP9Kcw/SD29R82+nrx40X54d+nVd6IftrYyiqG1LPgcUnQ==
X-Received: by 2002:a05:6000:270a:b0:3a5:2f23:3783 with SMTP id ffacd0b85a97d-3a6f2e95f7dmr96906f8f.24.1750865461550;
        Wed, 25 Jun 2025 08:31:01 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c47e:d783:f875:2c7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f296bsm4899180f8f.60.2025.06.25.08.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:30:56 -0700 (PDT)
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
Subject: [PATCH 2/6] arm64: dts: renesas: r9a09g087: Add I2C controller nodes
Date: Wed, 25 Jun 2025 16:30:38 +0100
Message-ID: <20250625153042.159690-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625153042.159690-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250625153042.159690-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The Renesas RZ/N2H ("R9A09G087") SoC includes three I2C (RIIC) channels.
Adds the device tree nodes for all three I2C controllers to RZ/N2H
SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index e57a91adcb68..63c9681116bf 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -90,6 +90,51 @@ sci0: serial@80005000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@80088000 {
+			compatible = "renesas,riic-r9a09g087", "renesas,riic-r9a09g077";
+			reg = <0 0x80088000 0 0x400>;
+			interrupts = <GIC_SPI 614 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 615 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 616 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 617 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eei", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD 100>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@80088004 {
+			compatible = "renesas,riic-r9a09g087", "renesas,riic-r9a09g077";
+			reg = <0 0x80088400 0 0x400>;
+			interrupts = <GIC_SPI 618 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 619 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 620 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 621 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eei", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD 101>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@81008000 {
+			compatible = "renesas,riic-r9a09g087", "renesas,riic-r9a09g077";
+			reg = <0 0x81008000 0 0x400>;
+			interrupts = <GIC_SPI 622 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 623 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 624 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 625 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eei", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD 501>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@80280000 {
 			compatible = "renesas,r9a09g087-cpg-mssr";
 			reg = <0 0x80280000 0 0x1000>,
-- 
2.49.0


