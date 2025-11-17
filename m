Return-Path: <linux-renesas-soc+bounces-24683-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4E7C63162
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 10:15:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EE04C4ED650
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 09:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3280328B4F;
	Mon, 17 Nov 2025 09:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="H+qG/l22"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA67328603
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 09:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763370576; cv=none; b=duCUF8QRn3D8a6HAw5igswgaio6tXglqeHyj8mNzBEjeRawpt4n8ah2FT9etvyFfDt8PNU4ryCnb3fvWK15zxTKMtJzZgiuSCfskn9Beri2W0mnaz+nuXlWSUVxuq/i1cVB7MbUqfpjD1WDPeFJMLFsMaJCwZtKpEqdnAqrdYwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763370576; c=relaxed/simple;
	bh=pBI9Hfqe5p9fGS68LNRQ7CQSWjqbWO5yp00qUZ+NqIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O447mcM46m684R9dATb6YX5jo4WhYuPQV8qd9QSFAXkDnObFQW5g3pJgUM3QUZA1V3yz2OtJhcAqX5giC3Lasxd3HmcY3k3FEWhjFHJj+B3KfW6c52FjD+4ggCKOTZ72sm68V541FyiBg41u5zOKgV8tfW89Ej02OUJwes561uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=H+qG/l22; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42b3d4d9ca6so3262170f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 01:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763370573; x=1763975373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfjHCPFht8CT2aoSmw57+NansBy7QzrkmQb7BflVv6I=;
        b=H+qG/l22b4JZbkL7oxSdtqIh3JpNPts6blHilsTw1zyrY07PPtSZGG1hj40JmMqt5h
         z8+aObXIUaGrPisd7rT9baIMttaff1ddW8hYf5hbVuzAMf0jZI8KXK7yB3WNS62+iySS
         HWUcIZ3XPnyWnDSdTZA1kW0QOiOwoJ1uhgpjWDj5CpYDpSE3P/U3S7osyTMgwjm7bKdc
         q/Fz1M6Cvu5VtfSxFq+VgGSWfmSThioi/fzdMstVihNDPg31SIdoEFVvm7CxogaMfLKB
         P3aFJghRHEMV4iLI6mwhK34VjFVQNKAUXwCCN8iAnq2nrHzL618CpQUhbcbAQ6H/i65m
         p11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763370573; x=1763975373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nfjHCPFht8CT2aoSmw57+NansBy7QzrkmQb7BflVv6I=;
        b=Jr5+w20GhQ+h8TEDv6J8r0JFUzyL8EoweHtzdRB93s8KwCAuk/lO9iAqxlRvkouZTX
         yZHsHENiZoOmVYCwCG1wvf/WXjpYRWUjEaGCkMNNGrtS+aiWtYMhgGx7q9kOQv77XTK9
         uqz8DW+9yGmmQ9PQrLK1CQNoCCgWYl07i/+0GksWmegp28UJfbGx3Dg6qUs/VZ9UAdTs
         MzOCj1IuhxdH9P5KdgzrnumN2zMB4f43VPDUe/zR0XWCVLEEd0ne7emJuaGpmI4MOUaE
         T0zp9lyV3OLU/4ktQkAIIEWcduIme6RrDMIP0d74Hh7jb3bJSVbLMZmeGQ2JxBN5J8VT
         gaog==
X-Forwarded-Encrypted: i=1; AJvYcCWD+WOC+cpmDRxN4k1CNz7Tp08D7TmyNN949p57L7FhPqn/ZWP6+xddIvy9nZSqlLag4JzPmEhcds2k08ZxyidfrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLbtHPfOP2k+LXjo99UM+/YJkXplM92fKFfvrWjRBKy4Qcjc7I
	hc8g2TFg5vMC15xO/p9geY7kX4mbxkbPSUsk/SwYT/+TBZNEipS/G5PSQUsnjLfEeFw=
X-Gm-Gg: ASbGncsCHBLzm8h+O3pqxuKME0oJ4noup9jLVytUsO2ZjArm8W69CPAuhdBBb1ueY6h
	9ySv0201C1ps5srMDXvN2TLecQ800cDYY5hXowBJe/fCvEwCdyn+drqEBIY+Jf7hYc9chHMvPPO
	mKnOCMxYc0s2kFUbuFqtPev9kV5b6GJ0bl7BknsI9Qekcwm8T882fhPrjdBiyi95zUxaQFImUPa
	CgPdh3OhSwpN2fiWl/cJqIUREUZWE9xEJXErLsjqCgYiK99DKNkB4BmFzInKzX1HSLdSR54Yc1B
	Z/4dOoduocZW7i4wJ2zm401aVqLp3l9NH24p8Mvbiwf/EUBvbv1ihOvr/OqrZtePfjIiuwbKg/h
	9xca9FsMo/6QjuTjGX/kg6Da6i3N1tuJkkqcRQPw4jS0Tf459F/tzRiEVI8XSYgvvwP0Q0BO34L
	A5N76QLqW0/xENpUK9Haz544X6shVqwg==
X-Google-Smtp-Source: AGHT+IEC4CylV+boIHz5904t89ij/HQn2PhhtSEsjDe3u4uLcYNbMPFPmrQ47kjyJqYS0P2YXwlN9w==
X-Received: by 2002:a05:6000:2509:b0:42b:4081:ccb8 with SMTP id ffacd0b85a97d-42b5934253amr11041513f8f.23.1763370572750;
        Mon, 17 Nov 2025 01:09:32 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b894sm25703786f8f.26.2025.11.17.01.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:09:32 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v7 5/6] arm64: dts: renesas: rzg3s-smarc: Enable PCIe
Date: Mon, 17 Nov 2025 11:08:57 +0200
Message-ID: <20251117090859.3840888-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117090859.3840888-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251117090859.3840888-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The RZ Smarc Carrier-II board has PCIe headers mounted on it. Enable PCIe
support.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v7:
- none

Changes in v6:
- none

Changes in v5:
- collected tags

Changes in v4:
- none

Changes in v3:
- collected tags

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 5e044a4d0234..6e9e78aca0b0 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -132,6 +132,12 @@ power-monitor@44 {
 	};
 };
 
+&pcie {
+	pinctrl-0 = <&pcie_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &pinctrl {
 	audio_clock_pins: audio-clock {
 		pins = "AUDIO_CLK1", "AUDIO_CLK2";
@@ -159,6 +165,11 @@ key-3-gpio-hog {
 		line-name = "key-3-gpio-irq";
 	};
 
+	pcie_pins: pcie {
+		pinmux = <RZG2L_PORT_PINMUX(13, 2, 2)>, /* PCIE_RST_OUT_B */
+			 <RZG2L_PORT_PINMUX(13, 3, 2)>; /* PCIE_CLKREQ_B */
+	};
+
 	scif0_pins: scif0 {
 		pinmux = <RZG2L_PORT_PINMUX(6, 3, 1)>, /* RXD */
 			 <RZG2L_PORT_PINMUX(6, 4, 1)>; /* TXD */
-- 
2.43.0


