Return-Path: <linux-renesas-soc+bounces-8444-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D9B962773
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 14:42:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C370C285DD9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 12:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0866183CC6;
	Wed, 28 Aug 2024 12:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akZ3+Wib"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D43178CC8;
	Wed, 28 Aug 2024 12:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724848914; cv=none; b=WWgqtaas2kAqWhgVexJfNxE2NGmM42iQUOYN+rfALpU3fbRyHGJUFzirpojC+3H7bLIvwLG+FpNBnqQIkpS30CGTTzFIp6WaVUbgKiwFKQF4uvD1Ym6N8/hdP/VXUEvtGoDYSiQ1Bm8VsQAVNX4FfFDfPpU9mvcpbk87VnyI9cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724848914; c=relaxed/simple;
	bh=y0ixUDuGhfscJjVzRibFB6SYX6ts/vXAzp7pPL9Fp8s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wk566jthnofiLDseam5gvwdCqG71DtIPB7oTboU9lC78svkV789tw8OyKFzceqkHciIeIKw17We6cpvSwXVMaP5i7jsVGQR1a8zmz8joxWjbIlCZ+Hlvp5YyNbgw55GuJHu9dHzQfaBZ5OtYcvzrSPFJlgZh7I+MSjdvADP2ooM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akZ3+Wib; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37186c2278bso306093f8f.1;
        Wed, 28 Aug 2024 05:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724848911; x=1725453711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGkA7R5CrgphB5+ia/p3z6B8rpKW+6YBTKvD6C2OfKI=;
        b=akZ3+WibSUnjsGWQ+b4C8fjndpDwbWFk0bHXQya1kIRHBriR9KTnhGBaQWMvhHkzL0
         XnX9VJ+3xrV39pB+LD3Yyl5ViXo3GpoYQ/9u24JTly4RCh3csKLldPkU0frbhc+DVqZa
         xKbtKlwdoxuORA37p8Ue1yNyrrgOCHhr7cMSwYr1qQB4oNawQb/CiJtakV1zWvnoTLbf
         BJMzUX9IpvpTslnx6MA7u0EitKcUSkhY0a9blNvwrEHijmeY76phNDTgSEOZnuo69Y/b
         0P7bEVp1V1ZVA8o7dN7mD2COzf9I0C5Weh9C1t2LtNbammPeIt3d8SZYMW/B9YvAhklS
         l4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724848911; x=1725453711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CGkA7R5CrgphB5+ia/p3z6B8rpKW+6YBTKvD6C2OfKI=;
        b=DIsSN/v7SK3NnpN46/82unRJnGJuJBr9ExBjp/tyQFcVqU1kcA2N5JpK/LkjIsHzjN
         oqo770JAWcFLh2vAQuEqfZXADWdsSrLHAHhkJMkeMzXJ685hlexN/87gokxQ1nrWwC7p
         vS5LoIKszvEsQFDAKJACQAaP1iw7Og/pL7wKwqoURoSI3KnIRf1ve8edexzP56BoUSsQ
         Vnjs6ZEPRWsg+URfI2zxdfKd2SBEXb0Jz+DM+8ugOXCJ+IhnWGDC49d/dvGDO2RyobMk
         LM5QVKEdpIdlz4T3yfNNAEcofRSJA1urcrnR1LpJq0Ak0EUSaoT1u2fFylDkpZKYWw/4
         C7cg==
X-Forwarded-Encrypted: i=1; AJvYcCUX14acbLdLQTD/r1ekYeKuwVXqWwcftu2Fk3DVgdU+nRId845L6UIyrihVwUItSJfkD8/i6o5t0L9UBj6y@vger.kernel.org, AJvYcCWLXU1RbIZOcbeYGxSoEqB/bE35hxj7o/WTE1WajGZ2l2tLbD7DcayeknpZtLYzls4/MoTp2TElG3fS@vger.kernel.org
X-Gm-Message-State: AOJu0YxnzCEmRAnskZz+EX696HhqKWvE29Zqa6GlvtPC9N23QrKxGsnY
	9o/ZSOQituVTxvC7FvAW0vh4Sbk5bC9j92HJcvflea42I6X9Cm+L/xx04TiVbDI=
X-Google-Smtp-Source: AGHT+IHfRSXu3w7a/4b3UEF/q/lmZ7Zcng/xfHFtPySH87P94t3hEvYanEcSW7M/rWdP2aMiUz8uLw==
X-Received: by 2002:a5d:4dca:0:b0:368:6bb:f79e with SMTP id ffacd0b85a97d-37495f30dbcmr1272605f8f.4.1724848911018;
        Wed, 28 Aug 2024 05:41:51 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730813c5edsm15508226f8f.31.2024.08.28.05.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 05:41:50 -0700 (PDT)
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
Subject: [PATCH v4 3/9] arm64: dts: renesas: Add initial DTS for RZ/V2H EVK board
Date: Wed, 28 Aug 2024 13:41:28 +0100
Message-Id: <20240828124134.188864-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add initial DTS for RZ/V2H EVK board (based on R9A09G057H44), adding
the below support:
- Memory
- Clock inputs
- PINCTRL
- SCIF

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4
- Updated 'renesas,gp-evk' -> 'renesas,rzv2h-evk'
- Renamed file r9a09g057h44-gp-evk.dts -> r9a09g057h44-rzv2h-evk.dts
- Updated commit message

v2->v3
- No change.

v1->v2
- No change.
---
 arch/arm64/boot/dts/renesas/Makefile          |  2 +
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 61 +++++++++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index fbd214a1a638..f4b1bf3823c1 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -137,5 +137,7 @@ dtb-$(CONFIG_ARCH_R9A08G045) += r9a08g045s33-smarc.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
 
+dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h44-rzv2h-evk.dtb
+
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-ebisu-panel-aa104xd12.dtbo
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += salvator-panel-aa104xd12.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
new file mode 100644
index 000000000000..47f6f2bf6925
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/V2H EVK board
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+
+#include "r9a09g057.dtsi"
+
+/ {
+	model = "Renesas RZ/V2H EVK Board based on r9a09g057h44";
+	compatible = "renesas,rzv2h-evk", "renesas,r9a09g057h44", "renesas,r9a09g057";
+
+	aliases {
+		serial0 = &scif;
+	};
+
+	chosen {
+		bootargs = "ignore_loglevel";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x1 0xF8000000>;
+	};
+
+	memory@240000000 {
+		device_type = "memory";
+		reg = <0x2 0x40000000 0x2 0x00000000>;
+	};
+};
+
+&audio_extal_clk {
+	clock-frequency = <22579200>;
+};
+
+&pinctrl {
+	scif_pins: scif {
+		pins = "SCIF_TXD", "SCIF_RXD";
+		renesas,output-impedance = <1>;
+	};
+};
+
+&qextal_clk {
+	clock-frequency = <24000000>;
+};
+
+&rtxin_clk {
+	clock-frequency = <32768>;
+};
+
+&scif {
+	pinctrl-0 = <&scif_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
-- 
2.34.1


