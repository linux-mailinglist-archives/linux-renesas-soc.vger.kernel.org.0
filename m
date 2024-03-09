Return-Path: <linux-renesas-soc+bounces-3645-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7633E877211
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Mar 2024 16:56:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29BDB281984
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Mar 2024 15:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DFE54503E;
	Sat,  9 Mar 2024 15:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="fPsI1/3p"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8F5446A9
	for <linux-renesas-soc@vger.kernel.org>; Sat,  9 Mar 2024 15:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709999780; cv=none; b=FpzkKyIYii2EyZxZ5/LBBcdS3Ze1BZlaj/BCma/lXu6pfBasM9Edo0dU/uNAEfnDOXink/JJmuF4n0toQz86mUuImlFmKgV2QYF0qDhCTrnMTs5m5A1xwfOi6oOVwfcYWt+HMkRGEIIV86g7OaNC5/bWwjTArChk/2rf7rSsSkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709999780; c=relaxed/simple;
	bh=4g1Y5GT5W1AEjeBxWBbqTSiZZU58lMknJqN3/qJ717Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gIBW4NQEAsY0dGADkHrYCp/jBeYS7C8XB0HxB6y7gU9Yv8PbBmqhVA41vTNZFHav58TxlmesyRU0xP9/fETll4GjpYRM1zN5qScCw1QG603ILa9Wy26FcPJzsxI3rTghimts/XOAa6kW9zBRm3M/M9Tig56iA3XizdP5PzM2XN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=fPsI1/3p; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a45fd0a0980so82732266b.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 09 Mar 2024 07:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1709999777; x=1710604577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HOV8MBi+0KmAJrFuxuS/oOJ+Jpcps9rwvhwc61sh81s=;
        b=fPsI1/3poCDF0pVc2VoExsCfidQK3mZnj1GB2StNsBO/ivL8y3kYsSKY9VP99WOC/f
         AM/VMb8ykIQAdJRZ5elXs/cHukgpUPajrkzUVBvRmlDeLFOPXYjMOe8dwgxNmv4sW/mC
         p0vjX5XMgk8iAfslsJWQt4kSvUEv3GuClcwYk4EXZ2lN0hPvpB+I7f/jUdaiK5Cd3fiS
         pMfZBwzkKEaikqzm/56Z38nhrkfUxJn4cx3TUJ9Z7nVLY5RPj/wGwsULLVFTGaErnlqV
         r7hX3NALzCnpmtT6skI8G64iqUP5kU7RDMnGDrj9UvdsEBw8n00AAmt79WpM2n9zEBIV
         3e5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709999777; x=1710604577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HOV8MBi+0KmAJrFuxuS/oOJ+Jpcps9rwvhwc61sh81s=;
        b=WYqdULDwXNgLMHB+Z8gdBkFgnP6Tc39ZqlIHkdKTEgswVJOisX1B5DfM08sDjIOrI9
         9W1vh+JTX4S3zRMDm7K1XLIUZGhv4Cf+ndLVc4tQpPCpeSmlWbYz/q+LlGADeIVfvmDy
         cCN/2WLhxPh7A09oyC17nuUQFxnQpesvRj2cy9TPGbvYuCDujKDg/LEKJA3zyLMpx4w9
         c/MzcOljw0ilrmONoEtjHFXabqidhvnzUpEnhD7IoAZCO5ttux9AkOoWQtay/TlqWOYR
         i50203GwQmmk/kp3YVPdl6lnvmeXqK1hLvvw3+rABkXfu7HAXvN7fkPTxyTC7pCSEAXT
         ZtJQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8mBnzizdYZ2wTPINwwQhc+PtpQ5sX3s3ouEyJR5/Q3VsfW4Fw95ADXOyM413kntU789cMh6vQxaGV1Tsui0ANvBInPtkbOhgkW5T7uSKrJ9g=
X-Gm-Message-State: AOJu0YwSF4K3anQYNeRIgAZ/zP2WFDC9V3UfL4qQQwEqeDhNkN518igi
	HbrOLVxkXRQmsX24EpmtzMBammEaeB0PLrPy+ghGAfBTNGZpqSgs2SgT0UY6pz8=
X-Google-Smtp-Source: AGHT+IFwZ9IBZXkSdBB5XWeNW2NTAGZ/rVYMqijtaalPDGHI2tzmKLj4GAZXzYaCb/hQzKoWUIiKaQ==
X-Received: by 2002:a17:906:ad94:b0:a45:6449:360c with SMTP id la20-20020a170906ad9400b00a456449360cmr1265291ejb.49.1709999777283;
        Sat, 09 Mar 2024 07:56:17 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id r1-20020a170906364100b00a4320e22b31sm1025144ejb.19.2024.03.09.07.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 07:56:16 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2] arm64: dts: renesas: white-hawk: ethernet: Describe avb1 and avb2
Date: Sat,  9 Mar 2024 16:56:08 +0100
Message-ID: <20240309155608.1312784-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Describe the two Marvel 88Q2110/QFN40 PHYs available on the R-Car V4H
White Hawk RAVB/Ethernet(1000Base-T1) sub-board. The two PHYs are wired
up on the board by default, there is no need to move any resistors which
are needed to access other PHYs available on this sub-board.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Correct typo in commit s/adv1/avb1/.
- Do not use underscores in node names.
- Move the MDIO bus properties into a septate child mdio node. This
  change depends on updates to the driver and bindings posted
  separately.
---
 .../renesas/r8a779g0-white-hawk-ethernet.dtsi | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ethernet.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ethernet.dtsi
index 4f411f95c674..eb6030ed38b9 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ethernet.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ethernet.dtsi
@@ -6,6 +6,50 @@
  * Copyright (C) 2022 Glider bv
  */
 
+&avb1 {
+	pinctrl-0 = <&avb1_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&phy1>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		reset-gpios = <&gpio6 1 GPIO_ACTIVE_LOW>;
+		reset-post-delay-us = <4000>;
+
+		phy1: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c45";
+			reg = <0>;
+			interrupt-parent = <&gpio6>;
+			interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+};
+
+&avb2 {
+	pinctrl-0 = <&avb2_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&phy2>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		reset-gpios = <&gpio5 5 GPIO_ACTIVE_LOW>;
+		reset-post-delay-us = <4000>;
+
+		phy2: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c45";
+			reg = <0>;
+			interrupt-parent = <&gpio5>;
+			interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+};
+
 &i2c0 {
 	eeprom@53 {
 		compatible = "rohm,br24g01", "atmel,24c01";
@@ -14,3 +58,45 @@ eeprom@53 {
 		pagesize = <8>;
 	};
 };
+
+&pfc {
+	avb1_pins: avb1 {
+		mux {
+			groups = "avb1_link", "avb1_mdio", "avb1_rgmii",
+				 "avb1_txcrefclk";
+			function = "avb1";
+		};
+
+		mdio {
+			groups = "avb1_mdio";
+			drive-strength = <24>;
+			bias-disable;
+		};
+
+		rgmii {
+			groups = "avb1_rgmii";
+			drive-strength = <24>;
+			bias-disable;
+		};
+	};
+
+	avb2_pins: avb2 {
+		mux {
+			groups = "avb2_link", "avb2_mdio", "avb2_rgmii",
+				 "avb2_txcrefclk";
+			function = "avb2";
+		};
+
+		mdio {
+			groups = "avb2_mdio";
+			drive-strength = <24>;
+			bias-disable;
+		};
+
+		rgmii {
+			groups = "avb2_rgmii";
+			drive-strength = <24>;
+			bias-disable;
+		};
+	};
+};
-- 
2.44.0


