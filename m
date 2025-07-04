Return-Path: <linux-renesas-soc+bounces-19225-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 64219AF9505
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 16:09:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C461D7BD2DD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 14:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9242E1ADFFB;
	Fri,  4 Jul 2025 14:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RI50VDsq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA34A190676;
	Fri,  4 Jul 2025 14:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751638116; cv=none; b=GiE9toZT+R1m3Jo7ywhmYMj7P8+4fEACXvtqusCD0/Qduz+xHkWDxHnMpsTdAHMSen+ZZzqzp2yoGzSXgEVObyxPmn2XXMbhh/74bfWcdCvFDGWcBNvKbQkMikWGjm/RhTOBIVHEEV1f001H619HKjDHgtaqNkcSHCI+BYqZKu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751638116; c=relaxed/simple;
	bh=E9V2Ma73sGUM576b84kgLyF4OIugTbMr1Zuf7UiaNhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pJUa6gYtH7Qbe14mR7U0IptIBQue3Yw6CKjy4rnB4che6G1HHBzrYvhswz3l/fHmeCkR0ETJS3N8CYwID6kvqTwJxcandU4NFyt1SzYrSSKooYPryT+N1Ji1aOzc8f1SNPMhZ3RBjms/nYXOSkgNoJ4vciWLq6Vr1elU54BK2ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RI50VDsq; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so1387017f8f.0;
        Fri, 04 Jul 2025 07:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751638113; x=1752242913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUTJet6RQvRBcO9z//8YHPWqWCQe7/flkvja4q72OQ4=;
        b=RI50VDsqbPW+vSLEObCArrmwvcmIUug7wAgYwyZkGrSMMww39orsE2JLkDgTKD19HI
         N+rPfZOU8eSQ71K3jxRYgxP/Yt1nwaqsgAMOo1HlSgnVbsilwcn6Ls9VriP/aBpp23qW
         lL/CqIUTgIB0XxuLntcBbJMTiYwpw+hHmeVZnvktv6EML2gZnIJhSsCZLl1rVIkR5FFi
         tT6xK9pqGt0AL9uZTlSwo38cOSSJ4qGKRGbr7eC+H45W3e1MUwLjhFzmUSxH6mEljsKg
         vobCGtIzrTI1ue/gg2SXIvTnsGzsTnyjhGX8Lylxzb/vT1E424fALCYi38kwQswcMd8C
         qBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751638113; x=1752242913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VUTJet6RQvRBcO9z//8YHPWqWCQe7/flkvja4q72OQ4=;
        b=kXz1IYKsBjAELB/dThMgkN+xTuy1T5K9QTjcmR1Hw1D6i9ZoPHgKrX3DHquN/tKiA3
         Wp7akEJ5USsx8g9UzyG4y+FDtjNMgBiJ76P/uLzB1/TH9Sfn8CGs8Fi/hlR8P1Dois2J
         d+Y5ny2EL2cXZREsSjT7na36qqysQgHAwh8CI1Rc/v8STGYEv0xkx4rvKL7tnnpfyvyT
         pYqmfwTZ6EiXN9bAhByGCU5QQ78mOcA1vLTFOyJMbbwjTvE5MjsDHLBFSSVxolJCS4jy
         9GXug4KsZSb4xSjAGKk92MUyTP+OopRbTS6ehQ/PPza6Chp6Jyt3Pi2TfskaZCZVS+4q
         0mSg==
X-Forwarded-Encrypted: i=1; AJvYcCU9p7vFrtluzzDLkSU+els5EcY5sDmqUyU0YC54Xve462PaLyDi3cuXMJ7k4DKkuvzijlLNpZTbgDSk@vger.kernel.org, AJvYcCUaQbwFTa2nT6WISc7BIUbO9FGgZr+UkYruHwze1fnJXuuT8cQvuaMNp/L6xGmMZqmrEPK+w8p+wZ+ybS0i@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkls8tLocTP9cYVv0OioaTepqQeb61KDqy8ai4xAi7NlBhgynW
	0tBltnpISstu4LJwP/tYlV8N3t/Hao0SVJ3tP7MLqYAkJSL1Wpc/IzMP
X-Gm-Gg: ASbGncsd3c7JiYa+n0DDInKWDtVQDQUj/OWrK4Jgeg2+ObXenm1FXVOn0uGLwYvS8gp
	sU9X6xwl4yChtGBPq+EHQg5Kw3D9hKJwJVDqFQIHx5gB5D4BxAI+f8W+sToBmi5z1P/Qi3XLAfH
	hq54rV0xSDyTWmqsiCAaf1u1/JjhwbT/GSD3DbJu/irlOCFEU4DN2b7QL4qjxeLFMwXzUYntka2
	HQOKMgzF0BHmZFJA/Kfv4hUIZsS248BiOIp8ZBeej2aHRqwH5ApVBiJvGv6z8A8VmZ66wv05S6G
	9uV07tkB9UVan7fcRek1CJZnKYk16PLOtQm/qOPYUfiOfdvAGcJV/TNjrU8pSt2xaGilzaO5i2Z
	fveidPpPrPendVNaQz+rk
X-Google-Smtp-Source: AGHT+IHQ8T5YS+U20mReb39jzfX8BUEQDwbNHiayRJ5e5l7cGA3Do+1WUAmT/ouZbX74YYdht2aIEw==
X-Received: by 2002:a05:6000:4304:b0:3a5:281b:9fac with SMTP id ffacd0b85a97d-3b495cb02cfmr2831534f8f.17.1751638112403;
        Fri, 04 Jul 2025 07:08:32 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:e31c:ff37:8f66:5091])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47225afd4sm2535946f8f.83.2025.07.04.07.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 07:08:31 -0700 (PDT)
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
Subject: [PATCH v2 3/4] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable serial NOR FLASH
Date: Fri,  4 Jul 2025 15:08:22 +0100
Message-ID: <20250704140823.163572-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704140823.163572-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250704140823.163572-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable MT25QU512ABB8E12 FLASH connected to XSPI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index 5829b9afaa95..4dc4014f25d8 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -341,6 +341,18 @@ vbus {
 			pinmux = <RZV2N_PORT_PINMUX(9, 5, 14)>; /* VBUS */
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
@@ -383,3 +395,46 @@ &usb2_phy0 {
 &wdt1 {
 	status = "okay";
 };
+
+&xspi {
+	pinctrl-0 = <&xspi_pins>;
+	pinctrl-names = "default";
+	/*
+	 * MT25QU512ABB8E12 flash chip is capable of running at 166MHz
+	 * clock frequency. Set the maximum clock frequency to 133MHz
+	 * supported by the RZ/V2N SoC.
+	 */
+	assigned-clocks = <&cpg CPG_CORE R9A09G056_SPI_CLK_SPI>;
+	assigned-clock-rates = <133333334>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		vcc-supply = <&reg_1p8v>;
+		m25p,fast-read;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "bl2";
+				reg = <0x00000000 0x00060000>;
+			};
+
+			partition@60000 {
+				label = "fip";
+				reg = <0x00060000 0x1fa0000>;
+			};
+
+			partition@2000000 {
+				label = "user";
+				reg = <0x2000000 0x2000000>;
+			};
+		};
+	};
+};
-- 
2.49.0


