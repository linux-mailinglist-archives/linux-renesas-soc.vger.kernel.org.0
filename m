Return-Path: <linux-renesas-soc+bounces-20427-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8646FB239A1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 22:05:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 860CF173B5A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 20:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B020730E84B;
	Tue, 12 Aug 2025 20:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="chiz19Ma"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C788330AAD8;
	Tue, 12 Aug 2025 20:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755029039; cv=none; b=lc0F+VhHSJVFER6e82TpzmXUq1Sihdj4JeWMRM/rTjZiwZVl96c1gkMTtdLR/FweZzWSf46JrpyyIrLBAfqaxZHt15osfjSdcJzKT2TNpnsitLWt87mWSzp5YAdiLYt/CJDiEX+hg3wxTF8G+oLCuW6fosEbD3s+YRB2JDtn+Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755029039; c=relaxed/simple;
	bh=OXZgrTKbcTLvu72S432Z2745fimO9BoPfWOPIilkEDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iHyOEYhxaC/1sBjUGivwr33jJ5cyIU2C3UItbFt5J4KypRWrmqmC6fvxVuyb3X2pziz/EonsAtbNwWkOFsPFxWBVBJ85YN5CftjPgC/oXh/UX2htT7p19wYQOPNK5pgB+odtqps6tBwvkzlRIlV3bOxucSCrrU1jx1ShNvQQmq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=chiz19Ma; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-458aee6e86aso39301995e9.3;
        Tue, 12 Aug 2025 13:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755029036; x=1755633836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFi1dR/4tprcYHDqb+FYyszGbI4uJPCR8kmP9KBvDoA=;
        b=chiz19MaRt/UXpIcIakjAI0uOJ6e1cpnu4IDd8EhHMAO73NTmwoxt06fYFaQlSQE1f
         299yDY5GS8LDyCQYRMpVFsXLhufv9xgqbA4si1vAjrVq119gjFQ3rQLWVZGuJbp0HEuK
         CPaR+ACwrT2Y+gxab5wmm0Dbaz77kmbLDuq6P5ZrJKzdbKLHl+/DDjUjhKDzs07wvGZN
         dy3l/00lzTal5GPVkp0FTvAdiW09H7pJ4YcPSjAcyGD5FRQCCWNxsHrhaqpjS18GXtqU
         Xtf8mRcJRSCDnPJZP+4Tq4s8c6V8/zhybnsrMyizLrQ6o77Q4KfyeinE0dfQainLVmI5
         0tow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755029036; x=1755633836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GFi1dR/4tprcYHDqb+FYyszGbI4uJPCR8kmP9KBvDoA=;
        b=aiUmJSWVaGCP5GraWEGDLeXcQNKP/dH/Zx3nvjwen32L3jHR9DmhpVQrcMsntTmBCg
         YLyWgdEYL9ZU80I3bh8plTOYqUL0C96oNPyShdBdcyVYOXxIkXGih3DInwFwWgG0T6sZ
         jnjW5xWsxwVBM1gVjBx/Byf8kCKY/wBW9P1dADQg6qNiUgOycXptSJj4tIhaj3qb+PdJ
         Mnl59C9BK38H3tHS20Y+qG1HbdxXGBk1hoGFOE6Q6BdIJgwsVoegNQ20Di270zG9nmGO
         Bgvo35NRkKjAQSjfUTyVp65qRrjJTuKaq4M5WW3ia2+bL7eRrAqAmLxa9+vmNdMMLuM4
         jPxw==
X-Forwarded-Encrypted: i=1; AJvYcCUB3qy0qF27alrEKDW39vUg1ynoNWccBRYA3L92zauL87HklWJ9TjMnrZihUyzPxeHSHRuS86Vh4qiFNagb@vger.kernel.org, AJvYcCV5/NNnvzrjGgCzMEMfO29KvfqOSdIYJGURUs6Z0HLIYSIPn9vpntmYTMBf73X58a8stwEmZPA1PUsK@vger.kernel.org
X-Gm-Message-State: AOJu0YzR5fpg+ZL80UV8Gz2wTbrWal+WPGDjkGy6ZSfxgdHr8h4YMhw7
	2bad0C+92PrqjV20+Z2IY31YGe00z2kilhNOOf1NiHnKsr2qSEtRQ+Md
X-Gm-Gg: ASbGncurboMIh2P+cbu/wobV2KVIBf2rG7QFkUvp41lGuylCWKjEFut+7p0GBedmWp7
	4LDXh603Sllu7HP1mUjkBhDcaNpT9xGEeVcSH6ewrSS+duwZGBhp7c1BRCwTwSqW0jJjkycnfQq
	IGZ+RBCru9s4rPGQgMUndTvo9vAUcb1z43I3CGN5F1//kZ2s7NF07JevA4k++mJvhC4vTUT4PYl
	5rcZVJiS5c47Gd9ODcYhHEGN7EtFiYojQPlIL/OYwdyib5wh/AbyiFxQHKJP+zl4Bk4ssH8phHc
	Z9K/qhA45ug0kgUxKOh5XwFp7RI3wWd1I4DVd6ycs29t0M8D+aNNfC6TmPYK8KXpiN5usIdgBSA
	fLKO0GAiMbtkVQDZDaQy9YwFSJuqYa9FAoC8/JkXROWR1jRfB0IFctPqmFVzti4s5OcDM6gniXQ
	pAaz8U7Fe2
X-Google-Smtp-Source: AGHT+IElGvYC2KOcSSrnUCalV7VvdKrlTtFbsnDG7KWfyxGaMvj0aaA8q8/Xt7JR6LG+adb4vYlR+g==
X-Received: by 2002:a05:600c:154d:b0:458:bfe1:4a8a with SMTP id 5b1f17b1804b1-45a165a6506mr3638175e9.14.1755029035826;
        Tue, 12 Aug 2025 13:03:55 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a16dde163sm297645e9.12.2025.08.12.13.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:03:54 -0700 (PDT)
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
Subject: [PATCH 09/13] arm64: dts: renesas: r9a09g087m44-rzt2h-evk: Enable I2C0 and I2C1 support
Date: Tue, 12 Aug 2025 21:03:40 +0100
Message-ID: <20250812200344.3253781-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Enable I2C0 and I2C1 on the RZ/N2H evaluation board.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
index f6437e82a7de..e41b687e5497 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
@@ -12,6 +12,14 @@
 #include "r9a09g087m44.dtsi"
 #include "rzt2h-n2h-evk-common.dtsi"
 
+/*
+ * I2C0 and LED8/9 share the same pins use the below
+ * macro to choose (and set approopriate DIP switches).
+ */
+#define I2C0	1
+#define LED8	(!I2C0)
+#define LED9	(!I2C0)
+
 / {
 	model = "Renesas RZ/N2H EVK Board based on r9a09g087m44";
 	compatible = "renesas,rzn2h-evk", "renesas,r9a09g087m44", "renesas,r9a09g087";
@@ -47,15 +55,19 @@ led7 {
 			gpios = <&pinctrl RZN2H_GPIO(14, 3) GPIO_ACTIVE_LOW>;
 		};
 
+#if LED8
 		led8 {
 			/* DSW15-8: OFF, DSW15-9: OFF, DSW15-10: ON */
 			gpios = <&pinctrl RZN2H_GPIO(14, 6) GPIO_ACTIVE_LOW>;
 		};
+#endif
 
+#if LED9
 		led9 {
 			/* DSW15-5: OFF, DSW16-6: ON */
 			gpios = <&pinctrl RZN2H_GPIO(14, 7) GPIO_ACTIVE_LOW>;
 		};
+#endif
 
 		led10 {
 			/* DSW17-3: OFF, DSW17-4: ON */
@@ -68,3 +80,47 @@ led11 {
 		};
 	};
 };
+
+#if I2C0
+&i2c0 {
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+	clock-frequency = <400000>;
+	status = "okay";
+};
+#endif
+
+&i2c1 {
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+&pinctrl {
+	/*
+	 * I2C0 Pin Configuration:
+	 * ------------------------
+	 * Signal | Pin     | DSW15
+	 * -------|---------|--------------
+	 * SCL    | P14_6   | 8: OFF, 9: ON, 10: OFF
+	 * SDA    | P14_7   | 5: ON, 6: OFF
+	 */
+	i2c0_pins: i2c0-pins {
+		pinmux = <RZN2H_PORT_PINMUX(14, 6, 0x17)>,
+			 <RZN2H_PORT_PINMUX(14, 7, 0x17)>;
+	};
+
+	/*
+	 * I2C1 Pin Configuration:
+	 * ------------------------
+	 * Signal | Pin     | DSW7
+	 * -------|---------|--------------
+	 * SCL    | P03_3   | 3: ON, 4: OFF
+	 * SDA    | P03_4   | 1: ON, 2: OFF
+	 */
+	i2c1_pins: i2c1-pins {
+		pinmux = <RZN2H_PORT_PINMUX(3, 3, 0x17)>,
+			 <RZN2H_PORT_PINMUX(3, 4, 0x17)>;
+	};
+};
-- 
2.50.1


