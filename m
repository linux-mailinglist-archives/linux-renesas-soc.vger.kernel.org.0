Return-Path: <linux-renesas-soc+bounces-23983-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AB7C27909
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 01 Nov 2025 08:30:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C063D3BF147
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Nov 2025 07:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0D4A221FB2;
	Sat,  1 Nov 2025 07:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b="Nnko5s8s"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99B1299923
	for <linux-renesas-soc@vger.kernel.org>; Sat,  1 Nov 2025 07:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761982203; cv=none; b=RoyFhs333I34Z3DrI00mbQXayq1tro3kFEbaGxHYCGd8acC3FytWx5PpS+u5xQAh3IBiu4xtARJ8G2BoFYXgVhP9kCq35QP0zJXIa2xSve8+HGDhiA2N+kMiLoiiMfcyZ/D7Z88mS94Hr3M040Zj2pYf7vv69ZBAsMXDznmGkXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761982203; c=relaxed/simple;
	bh=B5SWonhqNpEs3bZ1pzeJUP+eSL2yusqAaC0Q6rL45gA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fV9/OLdRf1j+utVbYd6HrITwMT1ikywGfvSyfq9tQ45t0+4C87Xm2mGmnEElPpyt1Id/gxMe6FHHCFPkg59tfZUK8Zv+A/PKKICJ5hPw4KNlyZpKG7sC+5d1Tiu9fzdOIYEH/JkNmJ3n71GELYGlBoMcyLa9fPGjFTapc/luG3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org; spf=none smtp.mailfrom=nigauri.org; dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b=Nnko5s8s; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nigauri.org
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b55517e74e3so2840465a12.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 01 Nov 2025 00:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1761982201; x=1762587001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lKkyHQItIZ9YZXNeYIjftxth5SwFfksAxfyA3kqQauo=;
        b=Nnko5s8snQL/n9vrNs7sZrOQuMX4S2/r4KEri7Maq9x4DP9QZVOgI4FZxbuTAk9pWr
         TvSzI53n3DUq1zKXeEdJ/fSZIACfUOifcBU8VMx6LlSSvKMFx/5R2ndnSJiH5AfempX9
         5PZz7rp0/hjkVQUzbslI93SBrzUV+JYmQowoL5y3A1ce8Uh45pgK+3jjOt6XWVZ4BztI
         XJeqlR2h6mgW5DqbEP3j+vqOtjIm6urxqDOO90lLCEybm6x+ZYLpfg/5t4AzO4UKkUQn
         HIC/zULKW/nk5LZJo14w/WKWXtat0AjgfVpmapJXsE23pFPtyF8odclgphYTj1nPFDaw
         r5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761982201; x=1762587001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lKkyHQItIZ9YZXNeYIjftxth5SwFfksAxfyA3kqQauo=;
        b=IBYQ/qSf7vp7ore/Y/Lt9gmYsmFwMkNeXjf+zlp0QgTnCaYOhOMIF22SdOmAt5iOqO
         aIZMpksTB8+jXvl4DnW0Wk0Zu1rzScOMPg8SaiVejvzCOyMAiot7dZGylq4Tfmd6adob
         RpCt3Vnc9m7C44rB86LLF7jOu+ZG4qFWR4DZZfXye3Ly3IpFDf1SRdvULTqcnvrx3B20
         thW6PqzGZzVjJmADPDaJSWuP7eVdc6NGS4pRrdyajyXr6HC6uByyXEIaiLXgF06zuBEt
         iOTN5XwTV3BrkRWYkZ9SQwqjrV143V2d6dTHcuiBVHsZbITHw2Olq2yMxktRHPW3HeZf
         VFuQ==
X-Gm-Message-State: AOJu0Yx/b0JM0cTk4Ef5MQV+UHUgn8YYhCV8hE6HbxqRLBTYYN4GrtO1
	C3lcZJxi7b1IsqcVy6fHIC4s0yry0MwaY9ks5Lf21DRPkbOzBJx66GHE+4BZl4JUr2r024HPDXh
	PeQ==
X-Gm-Gg: ASbGncv40Z6U8cNf0CCz8YNDHqIfomTQ9ZGJPSWtC+0m+x67GhAYLeOQJ1x4/Z4qSmU
	ItuzDZZSZz/MtV9IjFM5GJPVzPm5n3jb5I+Qvu57IqlzPc61rW0shHuPCs6Jfy0MUvqmFzKp4Rp
	Bd8jCo1yY8sG+GPFxSSQrL6sqWomjxdLt/0pbml2Vco3IxlntVrB5RpN/i0ThE87Pr6YaG5MIFe
	Wsx4/P3guW2e0W0MDi08MvyMosLMhbXVxAsUuYfCsaFIxzsjkGTB7g9qVRr39K0qQM80C3vxhKL
	Z/0N7Abp/KAGcgH6Yh1IebIexoN+KONuYfLvpeOVpO6LJWJWwq41T8ckMuuujOLnrc8WjWunhyx
	+WxYQuk1fU0EP5aBrmj1WFJsYKxoQa+1Seigjf+ROaDxqg5d4McXuN/c0HAIctwrJdAFnVbQFHZ
	nCFOkxd9XjD0/Ecl/hl27C2Pxpp3rUpynSS2l8xOJZtyQ0UaUzQzNDcuM=
X-Google-Smtp-Source: AGHT+IHm0rv+V8qH4mlrg7JK5mnX3c06DGfXnz734pOXC3OVejEb36UvdOBwYi8lV2QMww2XBRY5iA==
X-Received: by 2002:a17:902:f693:b0:28d:190a:1913 with SMTP id d9443c01a7336-2951a4dfd23mr88571875ad.38.1761982200802;
        Sat, 01 Nov 2025 00:30:00 -0700 (PDT)
Received: from localhost (ae043235.dynamic.ppp.asahi-net.or.jp. [14.3.43.235])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-29558f51f73sm10512815ad.32.2025.11.01.00.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 00:29:59 -0700 (PDT)
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH] arm64: dts: renesas: r9a09g057h48-kakip: Enable SPI NOR Flash
Date: Sat,  1 Nov 2025 16:29:51 +0900
Message-ID: <20251101072951.2681630-1-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This enables W25Q256JWPIM NOR Flash connected to XSPI.
Additionally, this adds fixed 1.8V regulator node (`reg_1p8v`) required for
NOR Flash.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 .../boot/dts/renesas/r9a09g057h48-kakip.dts   | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts b/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
index 37062adb1e04ab..1ad7bec7bbb72e 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
@@ -31,6 +31,15 @@ memory@48000000 {
 		reg = <0x0 0x48000000 0x1 0xF8000000>;
 	};
 
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	reg_3p3v: regulator-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-3.3V";
@@ -153,6 +162,18 @@ sd0-mux {
 			pinmux = <RZV2H_PORT_PINMUX(A, 5, 15)>; /* SD0_CD */
 		};
 	};
+
+	xspi_pins: xspi0 {
+		ctrl {
+			pins = "XSPI0_RESET0N", "XSPI0_CS0N", "XSPI0_CKP";
+			output-enable;
+		};
+
+		io {
+			pins = "XSPI0_IO0", "XSPI0_IO1", "XSPI0_IO2", "XSPI0_IO3";
+			renesas,output-impedance = <3>;
+		};
+	};
 };
 
 &qextal_clk {
@@ -175,3 +196,21 @@ &sdhi0 {
 
 	status = "okay";
 };
+
+&xspi {
+	pinctrl-0 = <&xspi_pins>;
+	pinctrl-names = "default";
+	assigned-clocks = <&cpg CPG_CORE R9A09G057_SPI_CLK_SPI>;
+	assigned-clock-rates = <133333334>;
+	status = "okay";
+
+	flash@0 {
+		/* W25Q256JWPIM */
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		vcc-supply = <&reg_1p8v>;
+		m25p,fast-read;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
-- 
2.51.0


