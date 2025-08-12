Return-Path: <linux-renesas-soc+bounces-20431-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BC6B239AC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 22:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CD3217ED20
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 20:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F67B2F0665;
	Tue, 12 Aug 2025 20:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QW2AcbtR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C64B2D73A1;
	Tue, 12 Aug 2025 20:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755029044; cv=none; b=feOjAzLJ1IRt4AnpxJwvjRsjgf+huAgs/6NMZlbkZqUk5/BjhPwjdl7vbyLPi+ek9DyAeywGOKrluvyAVsWN/f+IbruTb373FOftVVU5ZpR1VGwbd5s+v8/9nnTH6/jn1mpSUPGMu+KKetVEbmezRyjbepkY1KceBDcI177XpVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755029044; c=relaxed/simple;
	bh=H9Cep7v6k/lF9Gcf/AnVFZK5andXjTERDV0hJLOAshg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nnpCbVEmj07lWVAcEwafuv8epy8KUoN4s+dreMqu1TrZP3hMOU7yCj7Dngo35T3YsfeZ4I6B4dVyif7QtdW5o2AfbczhHgMZE2UhdPXkVxfUK1Tiocj//7rmSjoKtUs3uQHYCmeYTUiFbSTFKFbcsNDMl96gZ7rYEQlsA1xEDhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QW2AcbtR; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b9163ac059so275595f8f.0;
        Tue, 12 Aug 2025 13:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755029041; x=1755633841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WL4xy9wLusWuLmfzwxjClEyZcxHg8w8yM2hjqGI2wdw=;
        b=QW2AcbtR+eADcB/rMANzfOYXBwdzUhqXzXEz3VVbpDvPPrhPbrkDx2hFg8xh3axP3F
         sCpbfL7hQhVx3GjcFo6wp2RUz0vxInYJDmc7YuSRPzcJJ3J+eNUTbdDggES3bdRovRPq
         QcctBFlv5huIQTCCoC7Ak53SeHhB2QOaMr3reVy2VrExf8ZAyElUB0rzpfbEYO70B7PO
         uVvlzaM446zoT/wsxwBPXp5WhVNplS4kcna+3bK7sfYGoGhKY8WrEz6Bnxi8clLZo1Fd
         ldeqTILnQzZZ7wczqNzIbeSinLl6dKIuifu794ZuyEkZUMKgIMPWhs3tg6h+D7hdUArs
         Qhng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755029041; x=1755633841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WL4xy9wLusWuLmfzwxjClEyZcxHg8w8yM2hjqGI2wdw=;
        b=tg26LOdw+Rv1qcIEs9mnDpXGqAzKBWCW6Jul4xAyNgYxUL5HcBS7UwVapYM4hmyFgL
         CbdsyR1WbeKd1my75h+H14ZzRfExnGF82i+BR7octrNuujp3Yx/WbRid9HxGCsnLhwM3
         BmP2erQ9/ZcwiK4yjNU7kBrs4ofBoryD4AX2VobLlvkb7GgcX5o1nDadrgwhf9YxJRsA
         LAOtHvjsibUUhVqAXJ/6qVsC3DlPuJi8t/mm1NqrC+Ctc99WXCe6MitNvtg/6/ucN1xq
         Wi/xt+Oep5/Fi4O4pevK9PM1QsHbKrOjK3KCkG1BWLBy6wlp2QK94+Tl3y8cU9EaCL9f
         P3tQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/1osWwKyKO4fZ6k+J5B8EnBjs+YdElXiCIfeCEiN1yP+TVclG/3N4hizYgKb1OFGhm5lA3wDWDAYFDDIY@vger.kernel.org, AJvYcCWq4yUHMbchMb9LJ+3/otfXRvNO50nhGSKLf/dHbUmQTBwRmv75xjM9kOzPB56Fq7RPtPdZfcJq+h5T@vger.kernel.org
X-Gm-Message-State: AOJu0YysrS0jbXTDMKk+OlK+ue5xajaexZpSMfPsesJjG6UbF9v+fl73
	5eVjdwDLU7iXbRMzil3t0jo6lZCuwbLTtxXE3og7zOwjOzwIjfxgbZw9
X-Gm-Gg: ASbGncsKnDqF2t7Y2xy6vWsOpZoBFtSUu219qvbGO/Yv1C33vLWXAUoAFOEZtf93zsE
	SgK95bR/QAfSSXOyXKcp4/VREKRJzMk36xWP7/LE1JT7RZZ3M+hWdDM1Yg6eIMWznXXVcIlGHdX
	4DFR3eOqD/iWZYZhhjtuG3Jg0g4ZepNlJQccdRMVW01TaYaYrM4V+nNspC0m/peS6Hg7yX+XfnH
	y/HrCq3AUblmPbiLrXMDl1tDYOuF/VJPt0QbqjIU7wn2P4DUyfnVU2aQeXGcsYP6OUfOWKTHPXA
	Wp+pWCoNcpYiVWzU5HM9yxoMzo6StgohzvmVA5Z/16WkMaSMaORI4pPUJ5mWQk9UatTAYTvsZYV
	NyAUs3DqKJBZW1j4ymGZBD8EH6xkOcgjju6zmNvczkrC8ZuM3PedTIWANxDhVPimYDMK5NSjkHn
	TCGhw2IjNP2AHYGb24xv4=
X-Google-Smtp-Source: AGHT+IEt21Ju/ShOYG0vz4/3IcT4tPEJ/R7z6lPUV5CEkmaqqWr+KGahtskThrnfHgMOlR/KMBu/yw==
X-Received: by 2002:a05:6000:1445:b0:3b8:fb9d:2482 with SMTP id ffacd0b85a97d-3b917eb3f31mr180230f8f.42.1755029040578;
        Tue, 12 Aug 2025 13:04:00 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a16dde163sm297645e9.12.2025.08.12.13.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:03:59 -0700 (PDT)
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
Subject: [PATCH 13/13] arm64: dts: renesas: rzt2h/rzn2h: Enable SD card slot
Date: Tue, 12 Aug 2025 21:03:44 +0100
Message-ID: <20250812200344.3253781-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Enable SD card slot which is connected to SDHI0 on the RZ/T2H and
RZ/N2H EVKs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  5 ++
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    |  9 +++
 .../dts/renesas/rzt2h-n2h-evk-common.dtsi     | 55 +++++++++++++++++++
 3 files changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
index 1841700b264f..309080767ff2 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -17,8 +17,13 @@
  * Lets by default enable the eMMC, note we need the below SW settings
  * for eMMC.
  * SW2[1] = ON; SW2[2] = ON
+ *
+ * To enable SD card and disable eMMC on SDHI0 disable the below macro
+ * and set the below switch setting:
+ * SW2[1] = OFF; SW2[2] = ON
  */
 #define SD0_EMMC	1
+#define SD0_SD		(!SD0_EMMC)
 
 /*
  * P17_4 = SD1_CD; SW2[3] = ON
diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
index 1b13995e5020..33d9b783ff11 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
@@ -16,8 +16,17 @@
  * Lets by default enable the eMMC, note we need the below SW settings
  * for eMMC.
  * DSW5[1] = ON; DSW5[2] = ON
+ *
+ * To enable SD card and disable eMMC on SDHI0 disable the below macro
+ * and set the below switch setting:
+ * DSW5[1] = OFF; DSW5[2] = ON
+ * DSW15[3] = OFF; DSW15[4] = ON
+ * DSW15[1] = OFF; DSW15[2] = ON
+ * DSW17[7] = OFF; DSW17[8] = ON
+ * DSW17[5] = OFF; DSW17[6] = ON
  */
 #define SD0_EMMC       1
+#define SD0_SD		(!SD0_EMMC)
 
 /*
  * P17_4 = SD1_CD; DSW5[3] = ON; DSW19[1] = OFF; DSW19[2] = ON
diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
index 304a0c8764ca..f87dde8716d8 100644
--- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
@@ -37,6 +37,18 @@ reg_3p3v: regulator-3p3v {
 		regulator-always-on;
 	};
 
+#if SD0_SD
+	vqmmc_sdhi0: regulator-vqmmc-sdhi0 {
+		compatible = "regulator-gpio";
+		regulator-name = "SDHI0 VqmmC";
+		gpios = <&pinctrl RZT2H_GPIO(2, 6) GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios-states = <0>;
+		states = <3300000 0>, <1800000 1>;
+	};
+#endif
+
 #if SD1_MICRO_SD
 	vccq_sdhi1: regulator-vccq-sdhi1 {
 		compatible = "regulator-gpio";
@@ -104,6 +116,35 @@ sd0-emmc-ctrl-pins {
 		};
 	};
 
+#if SD0_SD
+	sdhi0-pwen-hog {
+		gpio-hog;
+		gpios = <RZT2H_GPIO(2, 5) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "SD0_PWEN";
+	};
+#endif
+
+	sdhi0_sd_pins: sd0-sd-group {
+		sd0-sd-data-pins {
+			pinmux = <RZT2H_PORT_PINMUX(12, 2, 0x29)>, /* SD0_DATA0 */
+				 <RZT2H_PORT_PINMUX(12, 3, 0x29)>, /* SD0_DATA1 */
+				 <RZT2H_PORT_PINMUX(12, 4, 0x29)>, /* SD0_DATA2 */
+				 <RZT2H_PORT_PINMUX(12, 5, 0x29)>, /* SD0_DATA3 */
+				 <RZT2H_PORT_PINMUX(12, 6, 0x29)>, /* SD0_DATA4 */
+				 <RZT2H_PORT_PINMUX(12, 7, 0x29)>, /* SD0_DATA5 */
+				 <RZT2H_PORT_PINMUX(13, 0, 0x29)>, /* SD0_DATA6 */
+				 <RZT2H_PORT_PINMUX(13, 1, 0x29)>; /* SD0_DATA7 */
+		};
+
+		sd0-sd-ctrl-pins {
+			pinmux = <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* SD0_CLK */
+				 <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* SD0_CMD */
+				 <RZT2H_PORT_PINMUX(22, 5, 0x29)>, /* SD0_CD */
+				 <RZT2H_PORT_PINMUX(22, 6, 0x29)>; /* SD0_WP */
+		};
+	};
+
 #if SD1_MICRO_SD
 	sdhi1-pwen-hog {
 		gpio-hog;
@@ -150,6 +191,20 @@ &sdhi0 {
 };
 #endif
 
+#if SD0_SD
+&sdhi0 {
+	pinctrl-0 = <&sdhi0_sd_pins>;
+	pinctrl-1 = <&sdhi0_sd_pins>;
+	pinctrl-names = "default", "state_uhs";
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&vqmmc_sdhi0>;
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+#endif
+
 #if SD1_MICRO_SD
 &sdhi1 {
 	pinctrl-0 = <&sdhi1_pins>;
-- 
2.50.1


