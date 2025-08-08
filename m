Return-Path: <linux-renesas-soc+bounces-20129-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2129AB1E22C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 08:20:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54F9D581715
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 06:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87DF9244E8C;
	Fri,  8 Aug 2025 06:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="hL8cXAX6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8910E23C504
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Aug 2025 06:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754633918; cv=none; b=KuI8usZNWKURxzmibYckEZSXxd/YqZxEB548kLdQ7op/tGObu1McIG2XBPR66Zpmm/2Faljv/WZpJkcmPjwqfss6LWQwALtIgp7XIrrbn9d4uQ9b9mBoN4pdGrEDpqmEWgghtzhIH9BrEWqHpJWM869DKMXVdORdbNNxD1J7rq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754633918; c=relaxed/simple;
	bh=K7/71SKMMpzwaGFKFzf2Lv1zWIeCMhaFITEsUbXeAEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cp7Ju0TrI7TLMTHvwjXA3xqO9kBUNilXl7EJBMYxKLwyWHdKlFhdhm6VTcc/W7AsUBReBI2xXNOePd2bsajuZA0pvsnea7FVaVEO4OklfXmlLHXFROYQi99FwUpgUgAvzkOGEXpVOOrMg0oXYnB+5NxnH5XjcaAu+yAZIvTLJlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=hL8cXAX6; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6157c81ff9eso2737274a12.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Aug 2025 23:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754633915; x=1755238715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pwCItUf8lochLUJYKKJUMt5Wr88pHOpjuGrG4FTd+I=;
        b=hL8cXAX6JvHkWgBov9Qrtvi9oOWD5EtKdxLeEAQg7TZufjXWItR5MWA8nzDvawIwNV
         TjFiDaN5ZLjHuDG6zC66VRBFt1dpWmsnI144JYq9ErZiwvXkbRjUTtvKBbtibx6nYmOT
         G8BrJk8KClGHJM7nw1WbibMxhwMoFRBHTVPoOiZhOw22dBvWO8i+Kf85W9lUwsa5HnvG
         1pPh7VETvO2gIsqbF898AUeDUmRujo9PsMxCau8H/Mn35Obq8HAE+cKDx2gFQN2VhTsD
         CiW94lcuiOiSqXC6wRncYmidRXspoSEpwLlgjIyyC2/4NleXIzYMyYKD7AghiVnJWuNS
         3x5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754633915; x=1755238715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pwCItUf8lochLUJYKKJUMt5Wr88pHOpjuGrG4FTd+I=;
        b=eAmPD16VLU9G4O70toi8LMJSl2Cak0pElIwHtaGKReGlqqPjCmZE2k3uBoE25rSm8t
         dYo8wAU405a42ytbnKEhMMMgJg1s7LvlutoLvql2qXjM2WWcjQlOYrPQmLc9aZQvy/rc
         CRxZrUgIcnZBd01Tfoe392S7e9vTUQ/xZtJrA3Wf3L+YNW8gmeNtnIDjQJlpj8XoQUop
         enRyawpbl8EzjTilArIv1ed+qFlHhmd2q7vIDZ7fPiX1Fi5miJz/IxDIIlscbkGAfKRd
         7G6asU13+7LDO9WK/T5yeCiPQFCUiKFAtEAatf3KsbLpXAOjdTHix/u+V9I3u34LQYho
         2xQg==
X-Forwarded-Encrypted: i=1; AJvYcCWNiB5Tejy3b+MDbACqouhDyFFiMJsk7QVoC8ILgkU2tRO2xvNW+o3zwHndTE0uQV1HU4cJre2riCH4rZTDEz8U4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpB0xNtZSC2vSOmSRad6OPBNKAf9wPf/Ev/BoTPxGNUfVj3oSV
	TpNfmF/EYImiAuGakvuUqtmI0Pa5gxx8JxpWfqESnlkgLs6WAnOJlESkccA+AAz3GbQ=
X-Gm-Gg: ASbGnctWW0MBNejYKBuYhxmcQGvb8OgZX1FJN0k8Z2okTSGlhndMYZ3LttUrz+baW9n
	2DBC35YmQe0NLXytgBPh/pl/JZiwqQpt1dPkIfkayi7rvamw8TBOOxCTe+EXxmPd8lq5NV8f5cp
	vOOOTvaGCt7qnySfYvhBgDJy/0wT1jy1Erd0KVMqJDZc9sAhH8C3Ha+j83dELh2eWneN5B5aVLz
	YrhzkyiqaXnd2ehfmcWWGJ+7u0lstioerkHod8x9EaYGTyNMfQK/I2iDKQTqT96rWev37WOtQfY
	0W4zKGuBFeoSvl2nsO76e2xDMbQOsHp0q936xE0Ax6IpURQ7KTtYJb/uQK1zmsRGOtooKDxbox5
	jTlzsQD2gSCNLTcRli3kJIa2XV6Pgf87lPzxb1i4W71apQHbk3RX4
X-Google-Smtp-Source: AGHT+IEmiE/zbR2dVxwuOYRcd6Is9fffLfNLfVXgzHM7b0VqeTBk1rAyyw8ui+JOUCtHEfB6xw3DqQ==
X-Received: by 2002:a17:907:7f90:b0:af1:8be4:768 with SMTP id a640c23a62f3a-af9c6342033mr152769866b.5.1754633914828;
        Thu, 07 Aug 2025 23:18:34 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a218ab4sm1440488566b.92.2025.08.07.23.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 23:18:34 -0700 (PDT)
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 8/8] arm64: dts: renesas: rzg3s-smarc: Enable USB support
Date: Fri,  8 Aug 2025 09:18:06 +0300
Message-ID: <20250808061806.2729274-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250808061806.2729274-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250808061806.2729274-1-claudiu.beznea.uj@bp.renesas.com>
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
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

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


