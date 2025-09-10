Return-Path: <linux-renesas-soc+bounces-21723-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCC8B518D4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 16:06:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE2AC5E6C1C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 14:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8778322745;
	Wed, 10 Sep 2025 14:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="EFSce7eS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C266332A813
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Sep 2025 14:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757513018; cv=none; b=C8vJ8dhrISlIjyUQ64bgrZNTbOxS4jixkwDP1TIa6ySYy04TwITEPEW8JA3xW7g9RSfpzm6pSiCCgzBxIqdLzt+jwFcMCkAVCzPFPySAhUJQ/H06m2/iGO9Tp8xlEX6jT+oU8AJmAW9ipMucv2s+3pHir1XXzht9IBIJwJuePdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757513018; c=relaxed/simple;
	bh=jqmkr1CKyO8Kzo8l85xpMLlf222rza5Yy5Zgh4ZGlAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j3fTesHYxWhPvSGAgE/Z9uQ0HfJ+LFrJzajWC6Nt1CC1wFYhXcvblpX5FEN9ozOC9FGdtgiLEzzgGoamdnPfYqlPYtLunP8iLNQQFP/o1JucW8hKuqNVlVaRaFtjWHXF9FLe7stMC2pDTdpfCZOuoqeu/Au1gbPthFFHIQfuB1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=EFSce7eS; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45df7dc034cso7088135e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Sep 2025 07:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757513015; x=1758117815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Vgkpc23fN6nK/odOpcRYynIEnb9BnHAmEaecrAACIc=;
        b=EFSce7eSqx6zfpQ6wOPPxU0GZPZuUGvklkiNZK5NNA9YO8/+1mzj01VrdZ07Bb3uah
         3ipxS+odXPlddvUj3/uW4EY//fonsuTiqsiK3sFFa0qxQ+FHQE9LdWp+qWyz/N/MiSMu
         hoSI6eEjANt14Jyh9H993e5CEzYiTT1oftGwAZhZHuQe30rpLRaPkdA8xI+TzyfxOzOl
         Nk+hT0pnL4Tuqii0S6uC6bv26OuXz1brzukHzW4BUQAOVxfgy6fbVa39KMCnX9Ek5CxN
         hulbFwQjehWfnAxV/zm3/QeQ3U3Tvl4g2ENMb0AYS0iPxOGI3qnqwqkln1RiIfM0cPmV
         1n3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757513015; x=1758117815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Vgkpc23fN6nK/odOpcRYynIEnb9BnHAmEaecrAACIc=;
        b=sdL/8UUcKRsEsFeZ+zEdPB2NF8Mn7fhifR8TeJu7savkV4v09o7eskNeF6ZaMVtq39
         Zd9czmWYfiOGwAme/NlVgOqP6tT8msgYP2/mRBjzOqovfe0c9BzArEIp9hWSinZOMBs7
         6AKxkZeZUp4IyCgCq3WCzDD3hfeI+iNDNdpuuYi+tRx3ZdDV+BH1L6btDwReDFJY7Xkz
         xys+1E2hBuU/VI6RTyqhx5VQXiGRmW3fCd7pf57G3MnZz+ejizuLc4EjdD4YZCIdAv4v
         eoZ8iIPUecnW8dn3Y+0ZmoLKDfHV6mMRdqAJbFmZhpy+YoJTNP4A53FqfgXoEafmzxz5
         5KsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtpN4uHBRshuGpElhlfDRRIx3fsOZHU3pz3X34d/rb+QRHl2uVZIIL1r4V5MPc0Dp6YYmQooN1Ls8GwRPswvBvIw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq+KHLi8xJFhvrjL9veIdCW5pP4hplJj3ya7/DDZ70FW0Rd2La
	heNxCM0QAMlXFpAUKyi54VHMJG6uQrg+IurDE25TLAWoiLi55UIEN6UrJFUxqsT+PRM=
X-Gm-Gg: ASbGncvB8cyKueMP99477vwyCrCzmVSfV7L8a4Yd53xoCXfutA/tX4ck9IzDGxCfIho
	8uANallRUi6+akXY3Es8hNztMFudSKN7li2aw4Qn/ZTfFQeDMZ6U7h92otddGxVbqMHcf2S3/yU
	gJZ+jT2qLkjpnif7VIb2s/VmaBxVU6k1aIyG8sm4Qg6e4jlWcEVtU7CzpjGInz9lCJOa5FA/14l
	eZjZuHdF5VWuI8nAk9iHX3Qb9vpO8jGJ9NqylLVNc0w2G/fHe6rnRvGvFIbmu4Olcmu1GX7otlD
	cADsX5PdcjW1WzBAm6+F/zIsF+yVq9c/eBGbffoqjXlBcUH3gpnlGtPVnVF+hfCEdF7daZ9HZYw
	JFzvCUOPrVubXqDCOqS+a3/bAA8XBRJZ9NfMvLaznnbNS00Zltlbf
X-Google-Smtp-Source: AGHT+IHnE7nzywVvSHlmb2zbeRqa3AQllCmLxwfyN9Q2qj8wPtYZa4cnGeIFXnAXsV38qH1n0GUl8A==
X-Received: by 2002:a05:600c:3ba0:b0:45b:8adf:cf2b with SMTP id 5b1f17b1804b1-45dfb641d03mr9711805e9.21.1757513015047;
        Wed, 10 Sep 2025 07:03:35 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df804bce3sm29523875e9.0.2025.09.10.07.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 07:03:34 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	yoshihiro.shimoda.uh@renesas.com,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v6 7/7] arm64: dts: renesas: rzg3s-smarc: Enable USB support
Date: Wed, 10 Sep 2025 17:03:05 +0300
Message-ID: <20250910140305.541961-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250910140305.541961-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250910140305.541961-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable USB support (host, device, USB PHYs).

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- collected tags

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- collected tags

Changes in v2:
- this was patch 15/16 in v1:
- dropped sysc enablement as it is now done in SoC dtsi file

 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 57 ++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 5e044a4d0234..5586dd43c4d5 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -92,6 +92,20 @@ &audio_clk2 {
 	clock-frequency = <12288000>;
 };
 
+&ehci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&hsusb {
+	dr_mode = "otg";
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 
@@ -132,6 +146,15 @@ power-monitor@44 {
 	};
 };
 
+&ohci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
 &pinctrl {
 	audio_clock_pins: audio-clock {
 		pins = "AUDIO_CLK1", "AUDIO_CLK2";
@@ -207,6 +230,27 @@ ssi3_pins: ssi3 {
 			 <RZG2L_PORT_PINMUX(18, 4, 8)>, /* TXD */
 			 <RZG2L_PORT_PINMUX(18, 5, 8)>; /* RXD */
 	};
+
+	usb0_pins: usb0 {
+		peri {
+			pinmux = <RZG2L_PORT_PINMUX(5, 0, 1)>, /* VBUS */
+				 <RZG2L_PORT_PINMUX(5, 2, 1)>; /* OVC */
+		};
+
+		otg {
+			pinmux = <RZG2L_PORT_PINMUX(5, 3, 1)>; /* OTG_ID */
+			bias-pull-up;
+		};
+	};
+
+	usb1_pins: usb1 {
+		pinmux = <RZG2L_PORT_PINMUX(5, 4, 5)>, /* OVC */
+			 <RZG2L_PORT_PINMUX(6, 0, 1)>; /* VBUS */
+	};
+};
+
+&phyrst {
+	status = "okay";
 };
 
 &scif0 {
@@ -242,3 +286,16 @@ &ssi3 {
 	pinctrl-0 = <&ssi3_pins>, <&audio_clock_pins>;
 	status = "okay";
 };
+
+&usb2_phy0 {
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+	vbus-supply = <&usb0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy1 {
+	pinctrl-0 = <&usb1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.43.0


