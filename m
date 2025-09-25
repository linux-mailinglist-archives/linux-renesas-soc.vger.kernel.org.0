Return-Path: <linux-renesas-soc+bounces-22371-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6C3B9E8D8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 12:05:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6252A381D94
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 10:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A6702EC097;
	Thu, 25 Sep 2025 10:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="HQ8X46xz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3892EBBA6
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 10:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758794655; cv=none; b=nkFGnmIzinvcXzGBpv6qWXENIk04Xxp6InGK/seVn8WMW9KjXjv4fOpjDNjkPGi6KfcnSggSABNzxJ6a665kyFOX/smbqxsFOqy46ZYHL+38WUs4FSd3qwLtdjDZdQ7JEmbo0e+wl0u7iRDA1EsssZfj5M4fCnc1hLUP6q0CU5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758794655; c=relaxed/simple;
	bh=XpFBJey+ByIazsodLfpMhNdQ/WoR4c/GvaYbI6wtGhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q/oIQr3pRAnxBRtEZBGyEy8lo+67y9ciwWe9utjwAS0O+H6SG9oyieov1Yvij7QAYczm9fWrPdvC3kUMdvypqv+rL5DgLK/JLK3APfdkqlsOiDNTc9ey2q2haLtOOx3cVMW26hRIqns5gQ9IjeEaTqrBTbODYhp19D5zRu6mtG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=HQ8X46xz; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3f3a47b639aso492286f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 03:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1758794651; x=1759399451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6PpEMiRGTWSEM77dtjFizoMhXPMleLOSmUBWuk2Lec=;
        b=HQ8X46xznXUqJ1lKecX4eHIKWJALQ1fwUNmBqa822JxZhQ2F2E/F1Pz29rvNsaYX9U
         ahcuniN97uLLf3GhD2YrYf1e9qKql5j/cIdH83us3GFL/+eiqmdSuAhH5myFIzZQJdze
         3dsSG2WG9xkp+p7UPbNpk6dX02OLhGxOjOtBJrYtx6F44gnhfDp/TLBR/5tTVOWiWb1R
         TGC0PI975OfDlMYkMF0BHuRjykNRCCODVt+MuFFx8trbjClZCUv50Dag0VPkcvyOTIeg
         kLUOyUHJ6FOm/0lHza00L4M+601oMc4M+6S7qaNBDCtk3cR8j/KmnDeitnFFDI6fwlbo
         0kFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758794652; x=1759399452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6PpEMiRGTWSEM77dtjFizoMhXPMleLOSmUBWuk2Lec=;
        b=NPQGR+LH38iz1/4Xv/2B9SBW6luNE5mIcO2ivZYcHa0jySc8/tXIvj7E5o0q/GFdur
         NTPaRGaShjBdQKY6z0Gu0g6J1DsDxWB9Wm5+QiM7zE9z62H81EOsDcEI3YwWNMEYZ5K9
         D0my+0TUN1yjF0ONKJCvGa8Zjm/HgF9LPuDyHr5ypxVer9CZQjc23AWC5rY4WscNEvWO
         9gNJuVAACYk7d/BbGMWUG0ZrhhonpFKjYlCtXXrzCYuN9PnMKkLuVl3IEBfRkhpCbgVQ
         wdmLUVqWDGwMXRMtMD5okTO0iRLGTKkLGcnpkBvPCbaeeT8OI8sT84ZLfLadAb5+gMVA
         Bz5A==
X-Forwarded-Encrypted: i=1; AJvYcCWywiiuQQniqqEF+mjm0vWQhp0yCJhXmBgaM70za18VuZQhc1py8IlL3jYsz8FRNc6EMq5ZvWZwn+JOBw8XY9V9kw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfpF/AboePUg5W71c3CRw88Ab2cStS2aATUQLGOIMnwwrsSz8q
	L8i7t5lwOQmJ7WKtgS6tue41h0TTKBYxJuJ8SzdtkGWJi7cMUuZAOL8EVF3Kh79a7XI=
X-Gm-Gg: ASbGncuIZGiNN/6VZRcXLMQsXy1bdMDos4J25RkDMZJYSJeWrmtCme2iO9GJV/nWK5t
	aXGrxFHgfLnBZIl9eg1ruhAJA6hfvbUU3jFXUDBpHt9DIwcSlINdzTlS5Xgp9DF25SH7XPDaGNS
	HhsXZDewUTgT1ZxP0k2D0sDyCuLekzX9xsmMbiUG78C05JHw1O5BporucvOIo/diq6/7OPhnAsc
	GUYKOUEsMXgPXYO7TEATegXKlQa3H/cR3AlrO9aVlWE8R4kJ2RlFC1OlHP0LBCOM/UhYZi3Mdsv
	Y455OKRijkg0xaLkPjpTIA8fJPxuFH1ierKf5Vr8jAADH3/X0xRsMGV7k/BQxDFv6clq/3XRfQL
	9xe6Z4Y1F302UVce/nylkaPtH981tdjbpz7UAmfS5Z+csOejmfMSp
X-Google-Smtp-Source: AGHT+IFuvYevjM7vQzCnTge/GrcBdvmEa0etUZbryGQtO8C2Khk/jcVZo4763k4ceZ8z+zJy80YYMw==
X-Received: by 2002:a05:6000:2dc9:b0:3e0:2a95:dc90 with SMTP id ffacd0b85a97d-40e47ee195dmr2667700f8f.35.1758794651152;
        Thu, 25 Sep 2025 03:04:11 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb72fb6b7sm2501122f8f.2.2025.09.25.03.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 03:04:10 -0700 (PDT)
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
Subject: [PATCH v7 7/7] arm64: dts: renesas: rzg3s-smarc: Enable USB support
Date: Thu, 25 Sep 2025 13:03:02 +0300
Message-ID: <20250925100302.3508038-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250925100302.3508038-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250925100302.3508038-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v7:
- none

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


