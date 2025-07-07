Return-Path: <linux-renesas-soc+bounces-19336-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6122BAFB77C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 17:35:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CB463A7A37
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 15:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0FB71E1E0B;
	Mon,  7 Jul 2025 15:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q8vG7WbT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132CE42049;
	Mon,  7 Jul 2025 15:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751902543; cv=none; b=II7wyMR/qvwBnZ8UAmaH8ebH3vxPNI05Mj5UsC19ASprye+7jq2EPEkYYYW8dhwTdx8dMuAR5Z5OMWbwRbmQxRV6GK+H3spuLIsJxTmu5FBCcGtr8Yz5XnRwrPQ6ucauSuxAD9ZV7k1S46a6I659AZ6wKDBp4akrLgBn6168Dy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751902543; c=relaxed/simple;
	bh=5SeOYMFRyDY6YA4IYASn/RvexwfElUptxO5PNujsrsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rabw77qmjgfsy0QfjA/Ben21RlFp7xAOfE7xEQm4EdsIe7HkBfHEdiZ94ykCYAEEuEZGEzDhpRUVwMBmzZ/PE8Ul/80eKB19rk1ru03lof2C4Hp4B2L+NMPSA1zMUZoKbJz7m5ZI3U+uxdJia2nggPfOlPRuS6283Olu9yFKXWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q8vG7WbT; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a522224582so1275556f8f.3;
        Mon, 07 Jul 2025 08:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751902540; x=1752507340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/H827bsd4aNZUxbb/20aJxEZkDYsP2RgByRXkwpuCs=;
        b=Q8vG7WbTFdhYE4S0kGOg1OJCUyuj9WCFKcDU5fHyCK3fjmMbxxjTji091b6U/jGRm/
         RIS7WkxKgtegBjdOTaJBvnbDp555aVbDZrQtLgwNEbMucliauPtgW6g6tBiVaQ/tHlFe
         K5WOscHFhhXobiejl+Bx8sMM8D6Hs+lrDM8v9poOPNJl6zQSfErw9UXMTiA4d/7Wu0Q1
         gCh7/yFn9nCrBezcMrKqazPNn3l2rsPYOce4oURuC84Oe48Eb02CFEjeGytayYwdII6s
         0/EIpuuxNh4VxruKovE4A7guzZ1XWLUEKg5WP827XeFm2hC95ZmnI5ZbKBPGZiOngnMG
         gMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751902540; x=1752507340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/H827bsd4aNZUxbb/20aJxEZkDYsP2RgByRXkwpuCs=;
        b=CCGF28GyuOtZwtdF1/yFSFtIylg1W9PW7T/S7N8B2jPqR60b8tX2wVu585U5mAIH9g
         D9LBstSKnf8qHRmlXxliSHscC448dUwxF2GmXJIhj8epj8Bd2leuQRTn6s3qRQT6sFbH
         Wn2JRvGiC509LRjVmFDtIueALkaHZ9kBLfWVmvylLEuIX0903OfqbNXA5AYSMNzNIJxP
         +7AsacsDsHyKmBh1lMCUgoaDKzWVx8gNPli8TgjkBk4hV+KZW3j7Xi8gb1vgtfAjMlEN
         Xx3CQoUtYH/zT3SBp9PakP+G+j1rqHH73zDC6KjRA9+CGT2BwVdHNWXExFOZ6CTv+t8u
         Y48w==
X-Forwarded-Encrypted: i=1; AJvYcCVfJSCpAiOTsCGQlEpKRep8qgvgJ9oV8g7BAHcxW/DhSIryxgvWvgPVbRrWQnBbjVAnLDFpmB675d2k68iW@vger.kernel.org, AJvYcCWjPhZKNwpB0HwmFRVgYKATvfKXSJfkA3psv0t4xayqcgXfSY4WtH26MAQ4Oqnay1AgnM2FKYpec+ZP@vger.kernel.org
X-Gm-Message-State: AOJu0YzNk/5mp7UX1vcM3cx/fFGoE6jyfpjiZ2+TRlCLT8JvxIDGP0ou
	wmfgYVc7YUmEuiN6kGwmvfFoGvo5GQMqo/ctRx89LiHnkhanG5X8KgWBeg9xXw==
X-Gm-Gg: ASbGncv6Ta53k+vU9FpCX+WKOuOO0+/xzlZjUv1IHZqYBTphdRc5EnenvWN28ke2olg
	k3LxjecF1Z7J/GsG0POhCzvftwM2O4reoiKEJ98AA/weiIrcetdh6xenkJbWGjc0V9QDqtPLu97
	t0+aL9c/R2REp/dSIZRDr6yDh+dmvfEOQr6k8jlr7z//V6gQQ723qRx086aNj55sjZ/dL6k/pLA
	plB8fYcsYxBgSkWNaVC4JMYZMt73GNvvBFp6MsMhsUXG4wULFdxTcjqLCK54uKilcdwApBt2ZYU
	7HUo+gBYIoVlThSpDbomJc9z4MIkc+VjG7F2yxjpagyqvxAFft0D+FTDqmbMlaxLjW8ThZaRRr0
	qkmKvNNpeZrWSIOuU89QNjoBpLDLHfw==
X-Google-Smtp-Source: AGHT+IFXYzyFXvHDDZprasHRoRXvS8zgGzBpUnsmzlX1vElhIOky0Tblr3hG1idN44vez9Z8x+x6Ww==
X-Received: by 2002:a05:6000:208a:b0:3a5:2d42:aa25 with SMTP id ffacd0b85a97d-3b49aa84048mr6554256f8f.50.1751902539920;
        Mon, 07 Jul 2025 08:35:39 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:d418:e5eb:1bc:30dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b161e8fcsm119491735e9.7.2025.07.07.08.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 08:35:39 -0700 (PDT)
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
Subject: [PATCH v2 1/4] arm64: dts: renesas: r9a09g077: Add I2C controller nodes
Date: Mon,  7 Jul 2025 16:35:30 +0100
Message-ID: <20250707153533.287832-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707153533.287832-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250707153533.287832-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The Renesas RZ/T2H ("R9A09G077") SoC includes three I2C (RIIC) channels.
Adds the device tree nodes for all three I2C controllers to RZ/T2H
SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Fixed W=1 warnings in the device tree files.
- Fixed clock for i2c2.
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 42c3b86196d6..0583a26ecbc4 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -90,6 +90,51 @@ sci0: serial@80005000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@80088000 {
+			compatible = "renesas,riic-r9a09g077";
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
+		i2c1: i2c@80088400 {
+			compatible = "renesas,riic-r9a09g077";
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
+			compatible = "renesas,riic-r9a09g077";
+			reg = <0 0x81008000 0 0x400>;
+			interrupts = <GIC_SPI 622 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 623 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 624 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 625 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eei", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD 601>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@80280000 {
 			compatible = "renesas,r9a09g077-cpg-mssr";
 			reg = <0 0x80280000 0 0x1000>,
-- 
2.49.0


