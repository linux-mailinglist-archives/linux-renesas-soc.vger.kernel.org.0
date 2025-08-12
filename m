Return-Path: <linux-renesas-soc+bounces-20420-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCABB239A7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 22:06:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE9C46E5BE3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 20:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE302FE594;
	Tue, 12 Aug 2025 20:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LtgLh/rY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674B2238150;
	Tue, 12 Aug 2025 20:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755029032; cv=none; b=QgWQn+mm2PsNqfD84iQaAimJ/JkMT9AC/Yu9W6ZomHKt7Eo+qXYW2Ydy/76TotFcafhBXAmx9fVz56C4CdHvqBNfjMtmXlKGyUcfBVckU7mnTGGCxZV8qYqNNho7ZU42jqqLWI4vfMkbJrHtOPN+7usoFwmxaTQm//KUTp7VL28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755029032; c=relaxed/simple;
	bh=3Qt5OsrJOlG3c77iPHzNv62iG6VALDKFiy2YsVJFlfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b3W5IyPOicPM96N+oVpveTUmRV7TGpi67d5o94ZGrRtJvpoPlWq0BEZhXbY7CqXt10eM7fB7iPckXkmjdZrUMHSspEXQlMcr6FgqR6eaD81QwYQKg/7NugOFKUNElMSOOJxgR3DR2/gmbpeznOesMsL07BVVIaKRy+Mx7m/xf4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LtgLh/rY; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-458b49c98a7so38391445e9.1;
        Tue, 12 Aug 2025 13:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755029028; x=1755633828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSYGymHy9CGxM6QraH/F8fqAWy+fvwQGvRioOEp78fo=;
        b=LtgLh/rYRj/G/HLttyu6NOVdblPuMU2b31Iz+aAkZYk/Gur9Kx5n9AZbv8LGQ5Ar2O
         mUBZ8PFhPjRNfHbCwtLImydu5TYEogMtFzToCYTVVkxsNG0RYlFVQjLQyASMGMninBJf
         o545k9Q/rtZ+esYd7nbgwIF8xQ9CzPPeQszIxf0ulXkbboylEzUC7kTqthkVk57zWMYY
         TnhANo9UYnzR2LlCDY5XUWmKxABO4w8wAWVJZPe7n5YwNyHFwQ0ZN/TaUrLe5ZSXYkyJ
         sRE1XqdER1uq8bfx8ig3OvRcvgxMJbJ1hsd499ZKYZbAbHi2YC73/V0jbIU7OUF/11tY
         USPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755029028; x=1755633828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZSYGymHy9CGxM6QraH/F8fqAWy+fvwQGvRioOEp78fo=;
        b=N//LVtytR9nhETWmvCU/KMKYOaVwOzifxAnbi3YSqDg2fE6tS90wUxST5+GAjVUh4i
         O5AVp+w3CdCJ1PnLrUWoAVYposq1vTBCS7JWdQiHSjMdhWge66hU/F1ZWEV24L/JKMKZ
         WS1x9tqhdSpyUAj5zNZwT5O+hUE+uzaLZPVCanc2RRFsqx+EC/j2+WJYjL3ZffLDwBsy
         LfdntoiKtEvR1Jy31+9lpGXM0npaESLf2z5IBUzVsZ3AzSBm2U8sSr9hbRVmvREGmfGA
         5X0E/mPVya70EzrWLgR8sHm+My1dNVQnc1ga2TVxsFtUdqoQm15n2p+SiSRYOhQCQIcX
         eWZw==
X-Forwarded-Encrypted: i=1; AJvYcCUj/PaTuzzRRxTqTxx+wVJubRk8twNY86EaVuEwVRwG1nZUdhvTeXdm2IP5nfztGiv15eJtkqOeU34IMbhB@vger.kernel.org, AJvYcCUryr48daPPJ68a+jgvZcc8/5QFOn4EEeXOrx53iPo2F/FOoaRr5f4aTsD7WYG/sWFHWqfWlEcMdkdY@vger.kernel.org
X-Gm-Message-State: AOJu0YyF4xy3+Kn+4rTOyAikrljLk4uhxbM0PaV6yuacqX1QhgyJiuf2
	SCB/QSeY5Sh5UMVhjhqSA3Q46/P1tbpOH5EZoZbrEHlP7JZREEbVGkMh
X-Gm-Gg: ASbGnctOiFhRdzUGYN50AACFR3bT9AjIgqtPSsRSDJAQsblkw69G3KPAFlfGjrW9Hmq
	rhypRu2gzwmNd48j011eYgZp1YqKp4ZRE7LYwFXqNPY5dGbkUWd0c6tflANUoX4us60MdqygQ5/
	t2MTGAIvrKbmpUJkOjMWj0qa4kCBuSSuXe6xvsWSjm7zjrY3JwVGgTYHtn9xoH3W+bzBpV0pNs/
	z34JA9GGXnxMV+lywC/PgPLI9s7y9thyTU6VaFDz/4sZSz/B5ZX0fIfZBq6H0fWfrLQ2A3IlxtF
	A6v0hidqWVWbwz3rJoGsAd+gMq87iUE4cwPuV33FTSZBaeL0rvr/HDEohiII4vnWIkWcEYhjG7z
	ju+IAmBNKOJ3y/bVPYkoXe3mDEVAbulDYp042qYdKjV63oZjIM7y8P1TQHeLWzAgcMa9SWZHsmA
	==
X-Google-Smtp-Source: AGHT+IFU915I+lq37XA+LWqRUDG2tg0cb6BMlX9ETllYUNp4Wh9ikGPt3C/R0rBOdNSGKfaig9+Wig==
X-Received: by 2002:a05:600c:4587:b0:458:bfb1:1fc7 with SMTP id 5b1f17b1804b1-45a165a8000mr3193915e9.6.1755029027569;
        Tue, 12 Aug 2025 13:03:47 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a16dde163sm297645e9.12.2025.08.12.13.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:03:46 -0700 (PDT)
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
Subject: [PATCH 02/13] arm64: dts: renesas: r9a09g087: Add DT nodes for SCI channels 1-5
Date: Tue, 12 Aug 2025 21:03:33 +0100
Message-ID: <20250812200344.3253781-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The RZ/N2H SoC exposes six SCI controllers; sci0 was already present in
the SoC DTSI. Add the remaining SCI nodes (sci1-sci5).

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index 4da21199d22e..7dcaee711486 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -90,6 +90,76 @@ sci0: serial@80005000 {
 			status = "disabled";
 		};
 
+		sci1: serial@80005400 {
+			compatible = "renesas,r9a09g087-rsci", "renesas,r9a09g077-rsci";
+			reg = <0 0x80005400 0 0x400>;
+			interrupts = <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 595 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 596 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD 9>, <&cpg CPG_CORE R9A09G087_CLK_PCLKM>;
+			clock-names = "operation", "bus";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		sci2: serial@80005800 {
+			compatible = "renesas,r9a09g087-rsci", "renesas,r9a09g077-rsci";
+			reg = <0 0x80005800 0 0x400>;
+			interrupts = <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 599 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 600 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD 10>, <&cpg CPG_CORE R9A09G087_CLK_PCLKM>;
+			clock-names = "operation", "bus";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		sci3: serial@80005c00 {
+			compatible = "renesas,r9a09g087-rsci", "renesas,r9a09g077-rsci";
+			reg = <0 0x80005c00 0 0x400>;
+			interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 604 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD 11>, <&cpg CPG_CORE R9A09G087_CLK_PCLKM>;
+			clock-names = "operation", "bus";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		sci4: serial@80006000 {
+			compatible = "renesas,r9a09g087-rsci", "renesas,r9a09g077-rsci";
+			reg = <0 0x80006000 0 0x400>;
+			interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 607 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 608 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 609 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD 12>, <&cpg CPG_CORE R9A09G087_CLK_PCLKM>;
+			clock-names = "operation", "bus";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		sci5: serial@81005000 {
+			compatible = "renesas,r9a09g087-rsci", "renesas,r9a09g077-rsci";
+			reg = <0 0x81005000 0 0x400>;
+			interrupts = <GIC_SPI 610 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 611 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 612 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 613 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD 600>, <&cpg CPG_CORE R9A09G087_CLK_PCLKM>;
+			clock-names = "operation", "bus";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@80088000 {
 			compatible = "renesas,riic-r9a09g087", "renesas,riic-r9a09g077";
 			reg = <0 0x80088000 0 0x400>;
-- 
2.50.1


