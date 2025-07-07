Return-Path: <linux-renesas-soc+bounces-19337-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04567AFB77E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 17:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5050D1668AE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 15:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BC671E9B31;
	Mon,  7 Jul 2025 15:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IbQyp19L"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B135B86323;
	Mon,  7 Jul 2025 15:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751902544; cv=none; b=FL6ngUQxpK876/LANMfNNf6AvPTUdQwybbQJqvWrqDxK/X7sYJ4XYGFL+ayP2hr5JaJucGXQqofsP9wiEgF/8OBOdAMSbpLdznHkwRf4NSyjblXqqJRWr26cImNlKS54mnNhkmA6WsSGj1oYV1FYeQdrWwgQqC3YLs9dhZbzRyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751902544; c=relaxed/simple;
	bh=K0oYyw6Qn7CXYu2O2pj0JUiMVzSXP0hFGuFLaxxveEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iv3WqroP8M1YmbbXsJheH3SnHW7a1N448+qyJlclbz+P1Yy+xCrd+sm2Uncil7nb67Rnx4/CIRPAqpcveWzS5X1UwWDs5u/7mhU3wEgOk0diue22lRrT4M6k6LhEKwTKnwkgMoS+vQvAUkkkV/3ItdjrvsyF1sRenz/FFNJy9L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IbQyp19L; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-454cc6e987dso1168525e9.0;
        Mon, 07 Jul 2025 08:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751902541; x=1752507341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0cK4iLd2aKPi4WmqlmzuEwtmzjF2xWxcguvzvfMK04=;
        b=IbQyp19LBeX3Dzc0EfcIliRYwbZW9znpEv/2JoaIEviMK4n4XAWesCKehR9msi9wqI
         ZOzaDNq7fF84GnaklARaYxnmLyApBZ7hhalTfhx3wzILuDrbOBD5R1n1sWE7BXorY/ji
         6dIWZHgaII3CqdIu05S8h4g3f9eisiUCBu84St7fovm86yZOOZUXxqdxvAC62eO+VrpN
         CdTXecd5LbIrqoF+yG7yQ1cJUlvQeGTkzn29gvUrhSPFcE2U8rX/vjKjuY7Lu3R4dWal
         xYbuVw/bDm/IYbczjeqV5xmqGsp/sXkpNaw8wRKo2QJOXBZ+InsWQcp3IW+2ILBhnDKv
         nepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751902541; x=1752507341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B0cK4iLd2aKPi4WmqlmzuEwtmzjF2xWxcguvzvfMK04=;
        b=hUbWVBuO+NbZIWr0AwzTaG2ZaUV1I6AZ6kGnow1OQae1ywAMJSx+N2EoCyfRm9TsGP
         b2rpm9I3ufXpYZjb/SJNxlwSMul9Mf3gESxSE95DMphV1JNZVxELrMurZoC3tzTAE403
         WNWXSZORKG6QqiY+0cibLw5u4hqI+5zINDdBNthPn8j1MVwU9YCjc6oBAtDuPmtrdikp
         5PPxhrbP+zBANC78una/PZD7Uo01nUlqYiIAJXckUYgn00/9no7Lct4iXPpx0Lfyrq+7
         IV4AQcTO0qJZXZa1RPkLfd6rbJZgjkq51f/SItSo8S/z2Drf0lpSGhJiEMzrY3NFUCWW
         jb2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/48PfnlivkFsdxZYWrS8BkAJ362ImHqxJK4ZjVV273wqYy6bB4gYspv+4D41hhYoCWJAGG6HGuZG1@vger.kernel.org, AJvYcCVD6wpY+FvXf20t3cTGRGQ9tGhJ3IRDo3WBxG/HW32qW2Lo6Nv2QCxLBPUdSIv+g6hdKvZTjwNyySI19DCf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7OJmRNYJzO3irIGdf6mw8iXolRBhYSTDLswL0ojhK3A82ke3l
	n6Dbjb7hVZLtNoubgKEAQ17PSmC112MBcZY+it4TgIUOBXP1DOG+5PrL
X-Gm-Gg: ASbGncvGJqf1pR62nEa+MwFH34/jfLClOkovATrqdnMIaVtHq13X/d1f1dU9lDuGZ9b
	QetL/sWOm3+qmW8BmszeonKhQoiWknCy3EBDV08TTee0DNpe675GmbTvrqKV2EWOBtjcIaPL6XY
	+6IcuFWOT/Pt2qnfeXLl34Z0E/n3tBN4bYXIzOcYprF2rQNHYYToEXhwGr64voF80tiUJ+V5BAM
	ipFj8u/g21/BXvynfB/yvkk7H0k7Wl6HaoxiXcPx6FsYw1Vtxp5mbx9ugDJ0GEfBRc1UY+o1gvU
	XhF1P1Re7gtmwGzXPRGgGvLRXOYGjSJvM+JSYUyWSko6ovHQiX2Ul6snYABHOGDNvTxg5hlV+Z4
	abw0Paf3QoQFwYkdd+VE=
X-Google-Smtp-Source: AGHT+IGZCck+WUskVgqL6iFW9PKieV0mkXSKITeMCepnOxMqO1btUTw9YtgewVf0A5yH9XCVHAWdXA==
X-Received: by 2002:a05:600c:620f:b0:442:f904:1305 with SMTP id 5b1f17b1804b1-454ccacc9cfmr2544515e9.6.1751902540755;
        Mon, 07 Jul 2025 08:35:40 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:d418:e5eb:1bc:30dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b161e8fcsm119491735e9.7.2025.07.07.08.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 08:35:40 -0700 (PDT)
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
Subject: [PATCH v2 2/4] arm64: dts: renesas: r9a09g087: Add I2C controller nodes
Date: Mon,  7 Jul 2025 16:35:31 +0100
Message-ID: <20250707153533.287832-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The Renesas RZ/N2H ("R9A09G087") SoC includes three I2C (RIIC) channels.
Adds the device tree nodes for all three I2C controllers to RZ/N2H
SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Fixed W=1 warnings in the device tree files.
- Fixed clock for i2c2.
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index e57a91adcb68..7452aca6b05b 100644
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
+		i2c1: i2c@80088400 {
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
+			clocks = <&cpg CPG_MOD 601>;
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


