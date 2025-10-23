Return-Path: <linux-renesas-soc+bounces-23548-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C98C03867
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 23:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B63AC4F146F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 21:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55DF296BD4;
	Thu, 23 Oct 2025 21:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/k8Ld/D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF6E2D24A1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 21:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761254625; cv=none; b=S/ONyGHIKR1eriPZvvn4fCJLeITrubNG9jVh121cYoe/9UDAweSZlXqQT/kYIjMEVvMQeSoNQ8LMQflq/Fsld0jGW9J9SR48mV7V4/if/7zYlFG+47DNVw4q2yVpmux91mAVN/FbYuJ/84Rfbku3yvRz+6TT2rIKCWfE2J8AN+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761254625; c=relaxed/simple;
	bh=b7ftMXztmPiXn3Lm2lKkQ4uqvmXty9CYVaot2trxCVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oR4ZA22LNRFimVEtrxjAzU3vYYIGhKo0kRxZL92+QTyO5b/2WbVpc23NCzHuirctcHZMQ/bdyopnWYjFuMoT+qCG9vGHly0B7oizoTRINVoFv4vHWIQDLQBldL63udof4IPqP6LLLAGmrnRltYbFIs82iNq/1XCRUweKAbq5iwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/k8Ld/D; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-290ab379d48so12881085ad.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 14:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761254622; x=1761859422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cKvN8vI2wqRAmx/29tE2NEormg2Ex4xdSESzpSEv/Y=;
        b=e/k8Ld/DfLltHavQJu/ATLkIc9QBDPy+DekbbOc8rJIQcgco5P/ahB8o24DIXhGc7+
         oRrKw6VB4GMgWPHfqQpuKzBExwyEsXgnDPhFPPRpS6kdpaSyhTHwN8wMbd7hpf2k+aVK
         tVw3J6FgE9xwiL3UCtxkcoMWZARmstXmSiPFgvkmzB2gxSQY76PeRksyOF/Hi80eTVSq
         kLjA4lneXRd+P7XRBxKzxgxLylrHUOIZEQqlFrr8VzSA6dXEDpp6PciLo0/hlDm3myFw
         q6lKEHFzzQHEOK3838FliUaYRabVKCJLPHe2V4AuQiy9Aune9CNM3QPRa9bUARtFbIj4
         ytpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761254622; x=1761859422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2cKvN8vI2wqRAmx/29tE2NEormg2Ex4xdSESzpSEv/Y=;
        b=V8qgBDYK3Uu4Bdbt+YsiXv6NRm88BNBthI0+BisifHoPmCjMr0DevdB/hJqHRDE62c
         42NnQxwbeFKmN+U33dQXif6lRA5HJfpuo+vQMvKkkIm27A2pvp12okJyyATSb8wsdVTb
         iOTgXTA/r4VrozvHuQawKgmthfItz2E9VIdn71vq7m2g+fms0pxjt1GayWsp1puBPKMZ
         J1zxj4FD6dEcgGqGrk9hmNa1uMpLwPMRvL6S73OlN/bIG/JqOnfOh5JZNbG+poEMgwO6
         2CJI1IwGQxxCO0S4acsKJnGi39PBZGub2ZiVMmgkKfNaHJbnMSXl6gM8rdLEaYo4O0rf
         tJUg==
X-Gm-Message-State: AOJu0YwrR8y1wJHXL+4zPLjTeKLoukjyZPN1krQb4w1CprMakhuRZw6p
	GRSAY4Rr9GIZhszS+0g1mBVo3dGPueypcSEzditnvCfwYwBUoZcSoSao
X-Gm-Gg: ASbGncsG8qugYN69PtjmnXdfpVUEQrJv9Nhtbxl9fhRVWc5UlCEFyAVXEMaZHR6BL0O
	YhmDKrNJlWg/5c3+0QcqJEPX2d6Y76+nmUJyFNvv/6wFfRxj8i1whyD96qYkBTpB5lPaRBmHJxK
	jUJPgY8FGw0eT5eEvKlcmr4lGbgChgmX6Ta2pFFTyDDT9wNb1cbReeyGjaaBOD2yL8kkJM25ksX
	6T+E0erMeeEwZ7TQo4gIUcIg+FqIh5v6VzKIA69gW7aJ4OARth/Yquxwu1C4IqmejnqOHGGpZ4B
	FhReSzlHX7kl+xQV9VwHMh/E/AsFgdP3qJxTDVkOz4slSuYYivEikL09Lcd51FUJ64BKwaH0wYZ
	wYp8EFfcr9O8t6V0k0MFxwRf6+Qr8FhZyDY+yGmwZ76I1kaOLHdQNgf4QYOw1BgLP4wDHHOHgWG
	WYRnhvyRx6Qt7ZJKe0mfs=
X-Google-Smtp-Source: AGHT+IHLpRymwxlIY49ur7/eBpA0+xSc6MFYG9nQg0/RBKGpI1hkFbbBfk37IK7CSagsTjoNI9nX2w==
X-Received: by 2002:a17:902:ef4c:b0:290:7803:9e8 with SMTP id d9443c01a7336-290cb659d58mr328809585ad.48.1761254622394;
        Thu, 23 Oct 2025 14:23:42 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:ef2:36b5:9454:6fa:e888])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946dda7949sm34306965ad.3.2025.10.23.14.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 14:23:41 -0700 (PDT)
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
Subject: [PATCH 3/3] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable DU and DSI
Date: Thu, 23 Oct 2025 22:23:14 +0100
Message-ID: <20251023212314.679303-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023212314.679303-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251023212314.679303-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable DU, DSI and adv7535 HDMI encoder on RZ/V2H Evaluation Kit.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 5c06bce3d5b4..3e314f397541 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -34,6 +34,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		port {
+			hdmi_con_out: endpoint {
+				remote-endpoint = <&adv7535_out>;
+			};
+		};
+	};
+
 	memory@48000000 {
 		device_type = "memory";
 		/* first 128MB is reserved for secure area. */
@@ -90,12 +101,36 @@ x6: x6-clock {
 		#clock-cells = <0>;
 		clock-frequency = <32768>;
 	};
+
+	/* 12MHz crystal for ADV7535 */
+	y1: y1-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <12000000>;
+	};
 };
 
 &audio_extal_clk {
 	clock-frequency = <22579200>;
 };
 
+&du {
+	status = "okay";
+};
+
+&dsi {
+	status = "okay";
+
+	ports {
+		port@1 {
+			dsi_out: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&adv7535_in>;
+			};
+		};
+	};
+};
+
 &ehci0 {
 	dr_mode = "otg";
 	status = "okay";
@@ -161,6 +196,42 @@ &i2c3 {
 	clock-frequency = <400000>;
 
 	status = "okay";
+
+	adv7535: hdmi@3d {
+		compatible = "adi,adv7535";
+		reg = <0x3d>, <0x3f>, <0x3c>, <0x38>;
+		reg-names = "main", "edid", "cec", "packet";
+		interrupt-parent = <&pinctrl>;
+		interrupts = <RZV2H_GPIO(7, 1) IRQ_TYPE_EDGE_FALLING>;
+		clocks = <&y1>;
+		clock-names = "cec";
+		avdd-supply = <&reg_1p8v>;
+		dvdd-supply = <&reg_1p8v>;
+		pvdd-supply = <&reg_1p8v>;
+		a2vdd-supply = <&reg_1p8v>;
+		v3p3-supply = <&reg_3p3v>;
+		v1p2-supply = <&reg_1p8v>;
+		adi,dsi-lanes = <4>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				adv7535_in: endpoint {
+					remote-endpoint = <&dsi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				adv7535_out: endpoint {
+					remote-endpoint = <&hdmi_con_out>;
+				};
+			};
+		};
+	};
 };
 
 &i2c6 {
-- 
2.43.0


