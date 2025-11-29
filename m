Return-Path: <linux-renesas-soc+bounces-25395-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 72650C946BC
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 19:52:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EC3AF346AC8
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 18:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB76262FED;
	Sat, 29 Nov 2025 18:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="np6Ld+VP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038722580FB
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 18:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764442332; cv=none; b=uMQNe9JVQxceuID4X6CFSaRswOgnc6G2e5Rj/7mf2ZANh2/Qbu3r6wzYoRQbCVCyG5yE1stI9qIBu9fpE9wfRae4FDEx3GckWG7FU69899hWiwBvhcY89o0NfNWNNUy51EhaCJSN7L6lg+sNFldTf8WHiHuN2PVSGVdMWaeqkg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764442332; c=relaxed/simple;
	bh=eGV43zXNZwLcVcE6qLhrYD3w4h0RrIYzFcW/RThrSwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RtmvaAv0RjgMgWy+q4yrTTgei+PSAHmMwMznLPVzqcbh2M3cfXVRzg4rivaxU/2QTpHikg+JNDYQwVUeDsL70QmXy0SC/HXyQvbPOE4E6kKFk82zd03Lwi3U2JipJ8QrabxC1RritbdlVTJwejQ9IuNKRNJWniD1+3EU+VwvALU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=np6Ld+VP; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so27777195e9.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 10:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764442328; x=1765047128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2K73nwpTtZLJt98+4WIYLIupevL2M6bireyDzJbZ3Ug=;
        b=np6Ld+VPGSUpkMUnizuVtgOCVT3MAROiRBnaxqa3LU6zu9JGcVIdetPwmLkKQYDOMF
         SG8X+i/PPhSOYH2iqR88y+2E64VulkNws+p5Y9w9fcqd+DwIl+VUrKs8HJZtOCO77q2h
         JzldL3DtyA2OxybAwAuKNbJJx4TKzKsScw2V+eXKRPTrUhDFQ0aj0pGzHXlcZh160NAj
         2b89ARv1M69Uy6K8hziYenN4uzlb3/rFJZExI1r2xMDdujy89Uda9YfiZ7D7KvLl/8i2
         qY5UanIa71PDf+6B5tCpYfwoDzaRPO9qlJLM7AeNnN7Squ1ZAxxDDRvzgyVm3HgZTQu3
         Dmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764442328; x=1765047128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2K73nwpTtZLJt98+4WIYLIupevL2M6bireyDzJbZ3Ug=;
        b=fR6YC2YOo7u5oSLUUfhuXQIyBVN6mFcmjl0ayApvYezN25ay/lx4qQT/vLY42jK4Hk
         5/Cb4vsqPq6SwDOb4JI3d2rEP5YFbiyLJuzSdbIBWACKrRvd/R8N64FGs5S6CRwFoePU
         YTI1j4M5Au+l3q2nQNDgk39pq1DBxsbHQzs7KgZKyeL7SZ+536ffISEkhORE7yimCwEM
         6QYef1mAHAWC/rqrr86FSfHH7PrigpcA5cVDgEMlAQR4INLcKY+8Vbd0v5Tk/zxUk472
         XXOfZLXmHVpDonGJl8EdZ1UmbRP+r9Ea6xuJgzpB2jWTH30Xw/gV8ydr94JFcCwZK6HT
         fcJg==
X-Forwarded-Encrypted: i=1; AJvYcCWqE1m/PjbcMEyZ/L4A6vdLsZIwkp5////jb/dd8TtR4q4nrP/iF/J7cRes9IpGyF2Ke1jLjWnN6TYfkxN63OtRJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWpgMWbOxOdqPcTbIwcNWQhKcJwXZLY/8SSjpC252kvBVTrJxK
	gVLnNF/gkmxZd1QqPvO9gxPFi75gdr98fPwsB/J5VJ7etpOBvJfTN/rD
X-Gm-Gg: ASbGncvX/v61wxOjWF1Wxxmbx2q1zTtDlZ4IxDlr0iCi30jxqBsRUTrlFYpHbLa6PWk
	CRY+aYSouW7Z5ywl1f21gkQF+KTRMD7CbgUjek0eNymYwrcJIgb3NFwItMMWgR1ns9XECXO1eIA
	gG5+D4GLAF8MA6W7Ygw5I/rSyOKC6Sr7U4OJu0147gL38ZRt3a8unWhwzZTQBUDvc5/gJ/bQjZQ
	/gxmNlLoqBvuu3JOboF2dg1mT6v69H2/ysQx7Zmpwzy0T6fpSwbFHXMYZdgsXhMK2qxdbFxmO5a
	ufqzVl+EDMkYbBzVRCyt+QHOXqXnm4bq68Sn93BizvBgKWzHv3DJG2jgxbIkVvrBxV91uZTcL/c
	3ij4C4mRyhTk/sDBVrHnjzHf4j5emBqmnjGscX5R+vzjdl+Q5NhWrnPnO66YhslqQFUn/Yj9ngl
	l2Hcm1udnJX1p53C2UHMznJs+UUJeYaY6XWvoGoOJkvS/TZGN3weoQQWDdZFIM9KU69uhkmo+N2
	jzf2UrWqqncguV6
X-Google-Smtp-Source: AGHT+IFSSRU9nZJg5slEDozvAjxyejJ7ZTFz1HkUkQ1jF7r+FT16cfOI8lRbu19eL7jLdf5EECfspg==
X-Received: by 2002:a5d:604b:0:b0:42b:43cc:982e with SMTP id ffacd0b85a97d-42cc1d0cf55mr27087914f8f.36.1764442327972;
        Sat, 29 Nov 2025 10:52:07 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d613esm17442067f8f.11.2025.11.29.10.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 10:52:07 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 3/4] arm64: dts: renesas: r9a09g047e57-smarc: Enable rsci{2,4,9} nodes
Date: Sat, 29 Nov 2025 18:51:58 +0000
Message-ID: <20251129185203.380002-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251129185203.380002-1-biju.das.jz@bp.renesas.com>
References: <20251129185203.380002-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable device rsci{2,4,9} nodes for the RZ/G3E SMARC EVK.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Rearranged pincrl entries order by port number.
 * Updated the comments to reflect the board signals.
 * Added missing pins CTS4N and RTS4N.
 * rsci2 is guarded by macros SW_SER2_EN and SW_SER0_PMOD.
 * rsci4 is guarded by macros SW_LCD_EN and SW_SER0_PMOD.
 * rsci9 is guarded by macro SW_LCD_EN.
 * Added uart-has-rtscts to rsci4.
 * Dropped rsci{2,4,9} nodes from renesas-smarc2.dtsi as RZ/G3S does not
   have RSCI interfaces.
---
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 58 +++++++++++++++++++
 .../boot/dts/renesas/renesas-smarc2.dtsi      |  7 +++
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     |  4 ++
 3 files changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 50e075745474..696903dc7a63 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -12,6 +12,8 @@
 #define SW_GPIO9_CAN1_STB	0
 #define SW_LCD_EN		0
 #define SW_PDM_EN		0
+#define SW_SER0_PMOD		1
+#define SW_SER2_EN		1
 #define SW_SD0_DEV_SEL		0
 #define SW_SDIO_M2E		0
 
@@ -37,6 +39,9 @@ / {
 
 	aliases {
 		i2c0 = &i2c0;
+		serial0 = &rsci4;
+		serial1 = &rsci9;
+		serial2 = &rsci2;
 		serial3 = &scif0;
 		mmc1 = &sdhi1;
 	};
@@ -140,6 +145,28 @@ nmi_pins: nmi {
 		input-schmitt-enable;
 	};
 
+	rsci2_pins: rsci2 {
+		pinmux = <RZG3E_PORT_PINMUX(1, 0, 1)>, /* RXD2 */
+			 <RZG3E_PORT_PINMUX(1, 1, 1)>, /* TXD2 */
+			 <RZG3E_PORT_PINMUX(1, 2, 6)>, /* CTS2N */
+			 <RZG3E_PORT_PINMUX(1, 3, 1)>; /* RTS2N */
+		bias-pull-up;
+	};
+
+	rsci4_pins: rsci4 {
+		pinmux = <RZG3E_PORT_PINMUX(7, 6, 5)>, /* RXD4 */
+			 <RZG3E_PORT_PINMUX(7, 7, 5)>, /* TXD4 */
+			 <RZG3E_PORT_PINMUX(8, 0, 6)>, /* CTS4N */
+			 <RZG3E_PORT_PINMUX(8, 1, 5)>; /* RTS4N */
+		bias-pull-up;
+	};
+
+	rsci9_pins: rsci9 {
+		pinmux = <RZG3E_PORT_PINMUX(8, 2, 5)>, /* RXD9 */
+			 <RZG3E_PORT_PINMUX(8, 3, 5)>; /* TXD9 */
+		bias-pull-up;
+	};
+
 	scif_pins: scif {
 		pins = "SCIF_TXD", "SCIF_RXD";
 		renesas,output-impedance = <1>;
@@ -176,6 +203,37 @@ usb3_pins: usb3 {
 	};
 };
 
+#if SW_SER0_PMOD && SW_SER2_EN
+&rsci2 {
+	pinctrl-0 = <&rsci2_pins>;
+	pinctrl-names = "default";
+
+	uart-has-rtscts;
+
+	status = "okay";
+};
+#endif
+
+#if (!SW_LCD_EN) && (SW_SER0_PMOD)
+&rsci4 {
+	pinctrl-0 = <&rsci4_pins>;
+	pinctrl-names = "default";
+
+	uart-has-rtscts;
+
+	status = "okay";
+};
+#endif
+
+#if (!SW_LCD_EN)
+&rsci9 {
+	pinctrl-0 = <&rsci9_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+#endif
+
 &scif0 {
 	pinctrl-0 = <&scif_pins>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
index a6e8eb730096..b607b5d6c259 100644
--- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
+++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
@@ -13,6 +13,13 @@
  *     0 - SMARC SDIO signal is connected to uSD1
  *     1 - SMARC SDIO signal is connected to M.2 Key E connector
  *
+ * Please set the switch position SW_OPT_MUX.4 on the carrier board and the
+ * corresponding macro SW_SER0_PMOD on the board DTS:
+ *
+ * SW_SER0_PMOD:
+ *     0 - SER0 signals connect to M.2 Key-E, SER2 signals are unconnected
+ *     1 - SER0 signals connect to PMOD, SER2 signals connect to M.2 Key-E
+ *
  * Please set the switch position SW_GPIO_CAN_PMOD on the carrier board and the
  * corresponding macro SW_GPIO8_CAN0_STB/SW_GPIO8_CAN0_STB on the board DTS:
  *
diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index 7faa44510d98..eb0de21d6716 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -13,6 +13,10 @@
  *      0 - SD0 is connected to eMMC (default)
  *      1 - SD0 is connected to uSD0 card
  *
+ * Switch position SYS.4, Macro SW_SER2_EN:
+ *      0 - Select Module DSI connector(GPIO)
+ *      1 - Select SER2
+ *
  * Switch position SYS.5, Macro SW_LCD_EN:
  *      0 - Select Misc. Signals routing
  *      1 - Select LCD
-- 
2.43.0


