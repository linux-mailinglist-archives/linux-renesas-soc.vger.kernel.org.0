Return-Path: <linux-renesas-soc+bounces-20419-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4E7B239A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 22:06:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44E4F6E5334
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 20:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 398C81A9F89;
	Tue, 12 Aug 2025 20:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MEZtjmWX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A09F7080E;
	Tue, 12 Aug 2025 20:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755029030; cv=none; b=LSMiwf6OgN4Zo89LhFZoffSLYPpktQ5RSpCGKg+MA7/3RhLvZgV0XpdriSD1M7N1353k2BRSn3ncJo65eweb34riCTsz7A9gXMV2I4nvTI7HJeizBaZUhghl9x0uetjO4OSgyE80l2fQ8NNwj2og6PbayBgEXpoutYZSih4WeyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755029030; c=relaxed/simple;
	bh=CX+7x8soU7ZGDeIi2vozp5wflGjE7t1wjk94rdzKdGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gisa2K7JUm1a7I4zNeblkL0i46SDs6aUnJKyPlb2b5vT5etuD63X/eZuidtE8jwS6tCMD/qrPdwYAg/AuTY8H3VhN8zrRvezDSxOOGwsH491Ua2urXErvZCW5ZE0xY5eVG8lGYcPDbERa32r5iMkGNSwKCrJ2aTOLBHn+2p7DAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MEZtjmWX; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-459eb4ae596so53946305e9.1;
        Tue, 12 Aug 2025 13:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755029027; x=1755633827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gNCZ36zkhlXcA7sA5nGf1ceuH7/B7NBIXeT35lUJSE=;
        b=MEZtjmWXvKugJ4JcZf+KDSv9Rcyovd9/LuypMRgsXWlS/vNJ4PAWMbkeTau9kgVIU8
         gYidapv79cdcuBdIfvzNsQIKFUL055rQUEet62NFDkFckPUJRCbdKzYnszCjESUcquQA
         7l1FA+WBTlvBBVcV+wlcHcfZNkWJ71wKjyMKFs0LnvqsnoSQukGOhz3CiMluqjc6XOqZ
         BZbEGgYhOfU4sMiEBl8l0jJw6Ta37788rZvEwWh5Lfxo5RoGHJMnm+Qx+j0T3U4XXCgu
         PvaKtFrQhpES4HV8rCJpFNMcPuxyyM4dfh8ZsHdig7n7aBHV5BX/S7+kqe79vA5YhrBT
         EfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755029027; x=1755633827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gNCZ36zkhlXcA7sA5nGf1ceuH7/B7NBIXeT35lUJSE=;
        b=jM+0evkfTk3hJA2nDhbvuKD9H8XfITwCbufKFbE7G9m51uRPhgrSgESaJxTt3I9uns
         7ROrPsabtd+x4BJCZs/7oTJkhyjAIW7ks1J1YJc24iqC+327na/iSENuAa2x0DmWovsM
         JbOy/JCIuNH/m2SWeg2IjX2OejGwHVJXJbRBqv2uwiNuQkiaXEpT/6L4AVak6JyHuErD
         0iFB1pzWXUxQiK52fHqpBM+2+Xol11GiPcx0TcR7t3bHKfZvPoQs2vTZlePm3FZ7vO7H
         3bp8ZwI4wA2kdmSK4UKict5a8kqeWTCZsMpzGRJA1XstCHh/yNTIlZiXmgjSoeWZe9Py
         Ohuw==
X-Forwarded-Encrypted: i=1; AJvYcCWHHz25Ae3YfHbbNLo5FLn/SiGcs4riiw3FXIh+RrKABLPXEsivczkA21OOs9sFP4R0yLmebXaBp5gP@vger.kernel.org, AJvYcCXXmfeB0SLEzoZWNYd9AcDCHAFRB+3m1lT1kygRwWeR8qg6VAewLBWnLcfF73aCkavsMuifcQZxkB4xs4Yn@vger.kernel.org
X-Gm-Message-State: AOJu0YwiTUevV+94KiCdUK9ffL5BFq02Dg4zdmvnDKjcuAYt7N0BLJym
	sntecr7ti46ipeqnfJVQDWg1RsXh/Q0g16lBxzNBp02vhtXC9pCCPaa0
X-Gm-Gg: ASbGncvig++MLbVDqbPzQ0aKOfHhUPK/y5vu5f48tuAzxiyJMztU2X5JtsijI9MGnw4
	euQwUTMNCq+HvWP1IxO/9UDreHWZspTVSpUOi96Be2skGrbcFbXKpfgLvcoxvqxqjP5e5OriveC
	/pIKprpJpsVO9HsPGdJgbqi4UfU1cSp2mkP2YfCX5zKdXRRL7IuG1BrimB7EUXV2kH47WVbEsvi
	mP91MCh2vaE+p7en6mx6dnJexkAnCZXkp449rdEPvfeQSKfShFJzocUEHJ40fkaLXNDomfC/spG
	GhoWyN2tHB/kuWM26eF4Tu1mPfZpd1JtH3RYxQaDhrKZpsRCxHcNZMKecWuuQjz6dFgSkkBGRTE
	SZrps02/BwlFwr7ltA5T2SzSBvxli9O5ZH6H79dQOHgOYcWxPC2IgDLzavkvyWmfJfhRJgRK3DA
	==
X-Google-Smtp-Source: AGHT+IHgKELYXi5O/rx6VUdrXqcoVcU/9HSaGjA+c/DRavVIQRDK3IbaYQ36Vs8+Q5O/ryUgwJlX0w==
X-Received: by 2002:a05:600c:444d:b0:459:d8c2:80b2 with SMTP id 5b1f17b1804b1-45a165bd9fcmr3091595e9.7.1755029026387;
        Tue, 12 Aug 2025 13:03:46 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a16dde163sm297645e9.12.2025.08.12.13.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:03:45 -0700 (PDT)
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
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 01/13] arm64: dts: renesas: r9a09g077: Add DT nodes for SCI channels 1-5
Date: Tue, 12 Aug 2025 21:03:32 +0100
Message-ID: <20250812200344.3253781-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/T2H SoC exposes six SCI controllers; sci0 was already present in
the SoC DTSI. Add the remaining SCI nodes (sci1-sci5).

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index b16fd9259d8d..8ee88b8e8f33 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -90,6 +90,76 @@ sci0: serial@80005000 {
 			status = "disabled";
 		};
 
+		sci1: serial@80005400 {
+			compatible = "renesas,r9a09g077-rsci";
+			reg = <0 0x80005400 0 0x400>;
+			interrupts = <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 595 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 596 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD 9>, <&cpg CPG_CORE R9A09G077_CLK_PCLKM>;
+			clock-names = "operation", "bus";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		sci2: serial@80005800 {
+			compatible = "renesas,r9a09g077-rsci";
+			reg = <0 0x80005800 0 0x400>;
+			interrupts = <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 599 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 600 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD 10>, <&cpg CPG_CORE R9A09G077_CLK_PCLKM>;
+			clock-names = "operation", "bus";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		sci3: serial@80005c00 {
+			compatible = "renesas,r9a09g077-rsci";
+			reg = <0 0x80005c00 0 0x400>;
+			interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 604 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD 11>, <&cpg CPG_CORE R9A09G077_CLK_PCLKM>;
+			clock-names = "operation", "bus";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		sci4: serial@80006000 {
+			compatible = "renesas,r9a09g077-rsci";
+			reg = <0 0x80006000 0 0x400>;
+			interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 607 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 608 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 609 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD 12>, <&cpg CPG_CORE R9A09G077_CLK_PCLKM>;
+			clock-names = "operation", "bus";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		sci5: serial@81005000 {
+			compatible = "renesas,r9a09g077-rsci";
+			reg = <0 0x81005000 0 0x400>;
+			interrupts = <GIC_SPI 610 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 611 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 612 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 613 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD 600>, <&cpg CPG_CORE R9A09G077_CLK_PCLKM>;
+			clock-names = "operation", "bus";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@80088000 {
 			compatible = "renesas,riic-r9a09g077";
 			reg = <0 0x80088000 0 0x400>;
-- 
2.50.1


