Return-Path: <linux-renesas-soc+bounces-24050-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1494EC2DFB3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 03 Nov 2025 21:05:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DC4644EE2D6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Nov 2025 20:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5070A2C08CB;
	Mon,  3 Nov 2025 20:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D0Mpr3v6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B038022D9F7
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Nov 2025 20:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762200280; cv=none; b=ERAqFw3E2eRqv2u5jQ3pwy7h4AmsfBzrBfi130PUIG0W0O1EynDPP194on5i9okhynotkmfZf2lWBQDMcsLha41QqRarxFFZO+y9dPY7KF8pIKXZq9PCKQpGFuOq8jDra0OeDtl1j4sCdjzqALf7gJCmK440Xpj9JGh7LedGnXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762200280; c=relaxed/simple;
	bh=AZdYyx6RpwPUgCLeQLU11abdKBjIkYuZ0XaZ7R6y/uQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZFKxaBjzu7xJBWmYKvE7cAjaxZaiZx/QQJlsWJDu3+G2vNd37fsXo0zuTXwKg2rYdLqUCaNb4jsPnakVLhDRJcyv4SAcefsMLxmtF/LenRfzzCHjMhItXZHu8o9O9DPPoTQafTc6jLZQSF+4w/eliwDNRx+EmHeQsIFd7K5+Kxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D0Mpr3v6; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-29524abfba3so33901635ad.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Nov 2025 12:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762200278; x=1762805078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KU8vOhsYeve0BAEDeA29AU6RRX8D+x4TzBHh/hEXcc=;
        b=D0Mpr3v6ChDffqntNNMvpdenMYNIBb0SXNXQPp/gayn18vMtMDioKMoA0+KOBc4SXd
         tEN609gMwyxBhF0aRnc4HqSQpWHT/fWCqSU0v9BSl/aTNpzZFmgcGwx4+K6KQ97lCuew
         UqpguQxgJGUiw9/s+t3vw+mB4vRgxk+J2dePSR8v6mJ/EWxIRZ6jqT1x9fPRWFsrek3r
         gl8qdUcy0JZxCngDy9aijM2KOYdCy0rjUq5KpfCvEf2MbV9/qtUhBOhz0MLONEMrPlAz
         n0EWr7gxmrlHnz4iRDNW5UE4XtK9xV7fi8xmQ0Ubsc2CEBdhNONcOgc93eus9unevxk/
         ROHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762200278; x=1762805078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1KU8vOhsYeve0BAEDeA29AU6RRX8D+x4TzBHh/hEXcc=;
        b=Zl4sG+CU3po2MkvABa1BTJ/fO3zeo0FKe08yP3Ja/OPcSeyDY++6jEKCTZX4ORBQUL
         5+N5uWM6lu8lw85JnmGc/CKoS3xVfOOoctXKpIdyqFLrRE+wOmkDJmybPlglaA0appw1
         r3lCeQ9rP9YBD4GQIWfa11ux+ay3+mO4NJHqgejPekAprTcrxTKYpQ5MEsCFt5s/105Y
         msDYF5PMQfqiTO7WHmWDye23p44OvhkuosuQXS5z+fYFmZIRZ7GT6h8EMjjpSvq/zFwi
         9aGrG+Nfozaqfbt2RB3O8wXeKpgLeeqK9V97NQZM8bgRMV1VpAGRDHNRa1IU5GrNZShl
         BGng==
X-Gm-Message-State: AOJu0YwBSivU0tdlHgjDgMZa3Y4uTmIKAHt9nu4lUImwnahFYEjbvKmB
	p5iD0s+cDS3giXQHyQ8yRmR06+lbrw1sftvVf6B2RSc2jcTJkZUlBCfF
X-Gm-Gg: ASbGnctdZmAAmMc6VpGaq3YgnHBpPxakGMK1ZsEgAvZbiBI0HijvUOKhwyT3bTwWcDr
	LVEFLowSEd66ktnVhQlkWK6at+t9OOgBJN+O5ydf8WcZt/F6pOeNHALUGs+qZUTx57NgoftctKr
	YieE7vi6UUa10UaqpmaoXMdToH7+FimAUp9RMVFVMVyTUbSy6pI94qLDE06LqF8zutf2WWLuBHm
	Y8w+0/FsiEY1Y/2J8LO0CcwBXjbbbLz9vaZDvEWLPT+Kd1OKU18GCPVr1hhif+dfQXl751UgBAH
	mlJdD20HpF028wLQ5LvA4qJmd4seW5CT8wz/nuQaTdx4j7voK/FxZkUK+o1oEyEEd2ph/mrEWbG
	nee2fZ7PY3DKZvL+KQHLSdDam3OmeFmCfjCJZ21mZJBSWBFNRimfg4fsFbJPOYl6M5/o2O/37j8
	5qgOG36ZNZGUbndG3UysCPM22fSEd4rXs=
X-Google-Smtp-Source: AGHT+IFaGFmj5djONFtqpiguTfM//9A4h/IvZW11bx86sItz9BafR6a9BGtxwXan7fS5UfrTlhSXbw==
X-Received: by 2002:a17:902:e5cf:b0:295:7b8c:661c with SMTP id d9443c01a7336-2957b8c67cbmr97452575ad.26.1762200277157;
        Mon, 03 Nov 2025 12:04:37 -0800 (PST)
Received: from iku.. ([2401:4900:1c06:600d:df45:8e1:7a61:1482])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952774570bsm127494895ad.99.2025.11.03.12.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 12:04:36 -0800 (PST)
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
Subject: [PATCH 3/3] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable DU and DSI
Date: Mon,  3 Nov 2025 20:03:49 +0000
Message-ID: <20251103200349.62087-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251103200349.62087-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251103200349.62087-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable DU, DSI and adv7535 HDMI encoder on RZ/V2N Evaluation Kit.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index 066e66b5d51a..5459465b81f5 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -33,6 +33,17 @@ chosen {
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
@@ -82,12 +93,36 @@ x6: x6-clock {
 		#clock-cells = <0>;
 		clock-frequency = <32768>;
 	};
+
+	/* 12MHz oscillator for ADV7535 */
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
@@ -145,6 +180,40 @@ &i2c3 {
 	pinctrl-names = "default";
 	clock-frequency = <400000>;
 	status = "okay";
+
+	adv7535: hdmi@3d {
+		compatible = "adi,adv7535";
+		reg = <0x3d>, <0x3f>, <0x3c>, <0x38>;
+		reg-names = "main", "edid", "cec", "packet";
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


