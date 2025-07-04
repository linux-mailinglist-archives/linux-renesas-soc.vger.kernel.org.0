Return-Path: <linux-renesas-soc+bounces-19226-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65589AF9509
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 16:10:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 264051C200F9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 14:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B7A0289E16;
	Fri,  4 Jul 2025 14:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lMWDAR9p"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4681E1D416E;
	Fri,  4 Jul 2025 14:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751638120; cv=none; b=ISyFoeNcoOy/Wr/N/L+/8TbgtUXFSR8GhBw6qaAuLg1SsRcO20nREBopmnnWXCdzXt0Wm6n+AHYzdj6Nc04CnVYT2OgI+2aGgXOuSG6QcNZ+DBZlsGh+8y/SljkvAniaqL8Ntkca/uUGli3TOBuxgbfNGcsGQQ4JYqAlITOHeRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751638120; c=relaxed/simple;
	bh=P0U/0g0fst2J8rAQPUv5acG0Nz2tbp2E+UfQjvcNtQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KBhvUPsU6opzBbcR7u5giwnlMdqX5R7510GVjxAK283zC4PQPYDBGgzP6Mu9pTNsx1v/7wbcbOftmN/B3EVj2eCNWh6xAx6ra8Y1IkHFUTGAC7eA66BNGZbxJreUFPfQo4MwKFR6AnlylR5nBha9EtkmdOdgVSGUNS2U34yzYec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lMWDAR9p; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a588da60dfso635447f8f.1;
        Fri, 04 Jul 2025 07:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751638114; x=1752242914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FibHmzo3lDELBTUxTJLF/DxzNb1Fvoooy+C4rDNJH90=;
        b=lMWDAR9pcv5R3QGUIPjUAKFkEPMtKHNDogwLl3//z2HN+3xWw8X4u3HO9DCzlPj5f1
         8pJ3qQ9Ag505v3sgh6yC0nUX+GMBUnTcaAGFA2S0GbOLc6yKabmEl+IM6OqpKUyt790T
         k6CNfJrvgSIhmdhIK04HrBKVhFOenHpKRd4szZqr0vl8qrdX2nSQEpbOK9OMwk5LXMOY
         xwjiJHsEpz8Ifb+RDSRjMW+q8utIWriy+Ac+fo0wzM8p755xA6Nwbm3pZlbOOboqtuse
         bz7vIbwc6NmgAY2SNJPCb1LiqfSCXXgOv/qr34CBZ7aeKGDtU432THoUwImDGfJp4dbD
         LIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751638114; x=1752242914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FibHmzo3lDELBTUxTJLF/DxzNb1Fvoooy+C4rDNJH90=;
        b=coJ77OEhQe/5aNZ0tLJn7nW5ROe/aTQjyxEJvzfRL9mPiSCZzoZYRGYsy1r5wvLHKf
         /AQlhwdBqQ5xdyn4/kRdqcOq/oqrDgXtlDbW4AtDiZaZGpmao+wgJfsQ/yThWgBesS6T
         sP8N7ISDFrkZzPczgS/jhRsjwTcYK9IWV7D4hrlAgUBpzCAg6/FYDprq4qGx6Pqsq3U1
         IwPEqPj2DmRU8MZHNGQNhlBL4MFTnpOnTTOpayUgC7QBYd5+P6VrqFFqnlqDM+lH2dpE
         NhgbIVMDT3OH5tlIvlsg4clqNNRoXMlLljh07HLSCf2mh4egkbikK6u41EkkjS7Cco88
         m1qw==
X-Forwarded-Encrypted: i=1; AJvYcCUPWIQmuoGFmWDeRkfJV1cLVC8qTnTC31n0UXDowZSq+tYa/Av1V2lK4vL0Q48HwZkEDDnIYMfpjmTu@vger.kernel.org, AJvYcCVfsbGMPP7LOmu+4rbbOcsWDkj4Ee8tMGAWLVIf1SlW+pjE3Qr/Ekw98G5rhpbFQSiajUrI0tbylDZqLHk+@vger.kernel.org
X-Gm-Message-State: AOJu0YzPJI5UTwQTL2CTvjWQnlSnW8lpArcARNNoDSqidoZaQDGsLEGI
	0mQ0VRdB4bKoiKRXKDcxNdyGkJi4BZJ5fPYjIA11kHxKHJjOFuWY/us78RwVJvF2
X-Gm-Gg: ASbGncu3v/v6ZEUAzKXwiKJmsZDKjTVelUIGPK3qA50EzZsO66eCqvQDf2VEXryFHrA
	HgAw7U0ldJtZQkCGj+s1oqJPmqhZQ0o9Dui87SsEedw2rMD/q/mdCiwXWLemkhlZhnyHhShT9y2
	F5naqeHnBfbOVSuYyR/NbXrGn044+c5xwxnEPTxKRR4liKUDOC+tZGpbzRk3jpZD/Z9gZpm75yG
	6w3nsj1tKpMigUv3u8x8/9gyyKpCKPgNLn1L7MKaaqZD8bDM7Ib5ujJYTUAI/1dfqTbH0b/+z+P
	QQOLhtGi2I2nGfSTAZbKOE5lXwW+OZjbKIknOekZ8eZnNttwazo5NfXgDDOnTWAe7/L7ryPjixc
	NuJW0K6qEinTuDY3oVk3j
X-Google-Smtp-Source: AGHT+IE1YbibEdICgN45YeI30RH+KsqQ38fTFtQkMiSjhmmHX2r9JKKhkj6nTYHcf5cTiaJF9fzusg==
X-Received: by 2002:a05:6000:41d5:b0:3a4:c9d4:2fb2 with SMTP id ffacd0b85a97d-3b4964e9ac4mr2213298f8f.46.1751638114188;
        Fri, 04 Jul 2025 07:08:34 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:e31c:ff37:8f66:5091])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47225afd4sm2535946f8f.83.2025.07.04.07.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 07:08:32 -0700 (PDT)
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
Subject: [PATCH v2 4/4] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable serial NOR FLASH
Date: Fri,  4 Jul 2025 15:08:23 +0100
Message-ID: <20250704140823.163572-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 886ce31c1674..ae90d59d6015 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -370,6 +370,18 @@ vbus {
 			pinmux = <RZV2H_PORT_PINMUX(6, 6, 14)>; /* VBUS */
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
@@ -424,3 +436,46 @@ &usb2_phy1 {
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
+	 * supported by the RZ/V2H SoC.
+	 */
+	assigned-clocks = <&cpg CPG_CORE R9A09G057_SPI_CLK_SPI>;
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


