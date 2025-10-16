Return-Path: <linux-renesas-soc+bounces-23189-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CA771BE563C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 22:26:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4E647359DF3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 20:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773992E06D2;
	Thu, 16 Oct 2025 20:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUoZyY6B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2952DFA48
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 20:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760646372; cv=none; b=o+8/YDFBhucSdto2dzkBKEqN4E11Dp/RV2vMM7J7R/34EsKA/cqpmsaehjTB9G16UfKKiTjSf2aPhoTiCqA7wz5cJpiuPDTqxLrGbxQkPw+oepVGEyb2mBF5kHgl3hfOsMGm4ngpvzQIkPuXCxD4P/32JtMIJCe56QROT1F75og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760646372; c=relaxed/simple;
	bh=Fo+bdU1dVeyqb2BUl+K8o8neBckzezLHGCzSd2tXk1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a11bjao6go0skBHwxUgeVOg6gmS8aaqIUDgEET4LFAKcbxHeo/SnuAP3zo8I0ohsEf+yJZa9uO75ZSQ/+bqLMg5Zr1rivN7L/pQqAIBDE4WRW+qKM+DX3cqUT3ZlCjOX1oIWDZhGTxtqAeUYvJA82v9SfhycT5YsVlb7z6R7YzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TUoZyY6B; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b6093f8f71dso785015a12.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 13:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760646369; x=1761251169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKuSjVWx5lKmXiVPYHPTCVqm1DH3rmwfiQ4vGnxbaqI=;
        b=TUoZyY6B+lNYxi0fdSGIdRFnT+uEiem6Z1l8+xaQNVgz4N+4BTV5jOt8EiK2BBNTDF
         t1Ga8KNrVejWo9kw2m98Hel711CKzuqxCrV2WUdD59ovVth0oU85nZ8Ru+VICBuRXQ00
         WEiTXalmS0gzntsqt/n3nerBLnPerHybjRiznk2uHO9hv33MmTBv6vKTOnpochf9KPbG
         KIP9gf3UvY6of3lUfziRhkQyLt14OLOr8IWEWIlVYJlh1l5WM9IjXMZOXNoPXfnBRvKV
         xfs7pF4O6OApKw/K7G7525zAcPxfPEjsOIZHo4PbUi8Il/gs8o9Jw7eLdw9BIhYiZO7Q
         O3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760646369; x=1761251169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EKuSjVWx5lKmXiVPYHPTCVqm1DH3rmwfiQ4vGnxbaqI=;
        b=kctB+7umu+u+PIkpZbmaBXp9b6Cdo4J+ujZtTZrYXKI75od6UDgHYWxODJ5UQ8cUaw
         HE32mJH6bAo26vlITwj1eB7JQcfUg2UeV2KaliG5a/y+B2geD+HQXg+rNt15Eombr8TH
         srlgoIag6UDKQddaPpOtZDAnNcuCv3peJq5urYU1jFXoCwZ2GqEbYCE+An8E7iwsPEUo
         TFzw07ycn08FvvkvHi5hRQLvUU4jN7xuj66gHaGbVHNMO7RxRnL4qahL5SAURP4gnbKh
         BoKDud76z4c0vwzheFVT5UVFjkc/VczIBvUq3KK4cwtvOJ10YW+MmreITH5aqtIUDRz7
         4SUA==
X-Gm-Message-State: AOJu0Yx1mbgGnaZ16xP6owx+ZBrd/x0sOzOAXGN1pzZrfj6uaBzAERjR
	9UQUlDD+4qMhC1D7o2f1qx0/b1GtzTI8mdeAMyLQCziOKubkX25mmKEN
X-Gm-Gg: ASbGncvRjYJ6W9N+jyLXmyRCX3z/oG8ip+jqBBaMyHRXLzwdC9Q32Yj4PfMbyi43pQB
	ooG2jgrU861dX4guIa3wp6s0PyTBfVnLSOE0BlWTVUCkIqjHXSsLA7SNfaqq4Z2ER3i/xEuDdOR
	x6H1Nrb0v+IEEHhpshLWilrepej4mgrDT44NG3QRhKX9Qmcmnj1RaDO15mtpjt8RyGe/VjOBoao
	WxsdALFtF16/Ap5XuySXLTAkOmTfeeDw6fOSkfOLHTMMM0BmJaqchEIKSAbr5ESfY374AN8eUxm
	VfGbXFbpOy2YjZhlBwdU5w9mMKB5bwsieaqvp7qY/ioT3cxultYtfJBLmAXwgZwSCS5zy/pylwW
	kHng6btIGfh8oZKnDmLx8H7NBOGkfpqz7p2ODjIJIHoMQ3wViN9y+F3W3LltnJ93klTOnoORP0v
	KAclj6Op80sZBqasVUNKU4pkuUMgmcZQEh
X-Google-Smtp-Source: AGHT+IEW+62t32NMMwqWGoeiRSKyoX4yqFRWi7IvnEMbe7AbSYqLbgdhIhZbZSdAolJjJhVcLpgxbw==
X-Received: by 2002:a17:903:8c7:b0:26b:3aab:f6bf with SMTP id d9443c01a7336-290cc2f83fcmr13856465ad.42.1760646368712;
        Thu, 16 Oct 2025 13:26:08 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:c7d3:a396:54ac:a48f:c314])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099af9131sm39577735ad.103.2025.10.16.13.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 13:26:08 -0700 (PDT)
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
Subject: [PATCH 5/5] arm64: dts: renesas: rzt2h-n2h-evk: Enable Ethernet support
Date: Thu, 16 Oct 2025 21:21:29 +0100
Message-ID: <20251016202129.157614-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251016202129.157614-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251016202129.157614-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable Ethernet support on the RZ/T2H and RZ/N2H EVKs.

Configure the MIIC converter in mode 0x6:
  Port 0 <-> ETHSW Port 0
  Port 1 <-> ETHSW Port 1
  Port 2 <-> GMAC2
  Port 3 <-> GMAC1

Enable the ETHSS, GMAC1 and GMAC2 nodes. ETHSW support will be added
once the switch driver is available.

Configure the MIIC converters to map ports according to the selected
switching mode, with converters 0 and 1 mapped to switch ports and
converters 2 and 3 mapped to GMAC ports.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 70 ++++++++++++++
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 79 ++++++++++++++++
 .../dts/renesas/rzt2h-n2h-evk-common.dtsi     | 94 +++++++++++++++++++
 3 files changed, 243 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
index 2bf867273ad0..7a9b5beeafa1 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -149,7 +149,77 @@ &i2c1 {
 	status = "okay";
 };
 
+&phy2 {
+	/*
+	 * PHY2 Reset Configuration:
+	 *
+	 * SW6[1] = OFF; SW6[2] = ON; SW6[3] = OFF;
+	 * P17_5 is used as GMAC_RESETOUT2#
+	 */
+	reset-gpios = <&pinctrl RZT2H_GPIO(17, 5) GPIO_ACTIVE_LOW>;
+};
+
+&phy3 {
+	reset-gpios = <&pinctrl RZT2H_GPIO(32, 3) GPIO_ACTIVE_LOW>;
+};
+
 &pinctrl {
+	/*
+	 * ETH2 Pin Configuration:
+	 *
+	 * SW2[6] = OFF: MDC and MDIO of Ethernet port 2 are connected to GMAC2
+	 * SW2[7] = ON:  Pins P29_1-P29_7, P30_0-P30_4, and P31_2-P31_5 are used for Ethernet port 2
+	 */
+	eth2_pins: eth2-pins {
+		pinmux = <RZT2H_PORT_PINMUX(29, 1, 0xf)>, /* ETH2_TXCLK */
+			 <RZT2H_PORT_PINMUX(29, 2, 0xf)>, /* ETH2_TXD[0] */
+			 <RZT2H_PORT_PINMUX(29, 3, 0xf)>, /* ETH2_TXD[1] */
+			 <RZT2H_PORT_PINMUX(29, 4, 0xf)>, /* ETH2_TXD[2] */
+			 <RZT2H_PORT_PINMUX(29, 5, 0xf)>, /* ETH2_TXD[3] */
+			 <RZT2H_PORT_PINMUX(29, 6, 0xf)>, /* ETH2_TXEN */
+			 <RZT2H_PORT_PINMUX(29, 7, 0xf)>, /* ETH2_RXCLK */
+			 <RZT2H_PORT_PINMUX(30, 0, 0xf)>, /* ETH2_RXD[0] */
+			 <RZT2H_PORT_PINMUX(30, 1, 0xf)>, /* ETH2_RXD[1] */
+			 <RZT2H_PORT_PINMUX(30, 2, 0xf)>, /* ETH2_RXD[2] */
+			 <RZT2H_PORT_PINMUX(30, 3, 0xf)>, /* ETH2_RXD[3] */
+			 <RZT2H_PORT_PINMUX(30, 4, 0xf)>, /* ETH2_RXDV */
+			 <RZT2H_PORT_PINMUX(31, 2, 0xf)>, /* ETH2_TXER */
+			 <RZT2H_PORT_PINMUX(31, 3, 0xf)>, /* ETH2_RXER */
+			 <RZT2H_PORT_PINMUX(31, 4, 0xf)>, /* ETH2_CRS */
+			 <RZT2H_PORT_PINMUX(31, 5, 0xf)>, /* ETH2_COL */
+			 <RZT2H_PORT_PINMUX(30, 5, 0x10)>, /* ETH2_MDC */
+			 <RZT2H_PORT_PINMUX(30, 6, 0x10)>, /* ETH2_MDIO */
+			 <RZT2H_PORT_PINMUX(31, 0, 0x02)>; /* ETH2_REFCLK */
+	};
+
+	/*
+	 * ETH3 Pin Configuration:
+	 *
+	 * SW2[8] = ON, P27_2, P33_2-P33_7, P34_0-P34_5, P34_7 and P35_0-P35_5
+	 * are used for Ethernet port 3
+	 */
+	eth3_pins: eth3-pins {
+		pinmux = <RZT2H_PORT_PINMUX(33, 2, 0xf)>, /* ETH3_TXCLK */
+			 <RZT2H_PORT_PINMUX(33, 3, 0xf)>, /* ETH3_TXD[0] */
+			 <RZT2H_PORT_PINMUX(33, 4, 0xf)>, /* ETH3_TXD[1] */
+			 <RZT2H_PORT_PINMUX(33, 5, 0xf)>, /* ETH3_TXD[2] */
+			 <RZT2H_PORT_PINMUX(33, 6, 0xf)>, /* ETH3_TXD[3] */
+			 <RZT2H_PORT_PINMUX(33, 7, 0xf)>, /* ETH3_TXEN */
+			 <RZT2H_PORT_PINMUX(34, 0, 0xf)>, /* ETH3_RXCLK */
+			 <RZT2H_PORT_PINMUX(34, 1, 0xf)>, /* ETH3_RXD[0] */
+			 <RZT2H_PORT_PINMUX(34, 2, 0xf)>, /* ETH3_RXD[1] */
+			 <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD[2] */
+			 <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD[3] */
+			 <RZT2H_PORT_PINMUX(34, 5, 0xf)>, /* ETH3_RXDV */
+			 <RZT2H_PORT_PINMUX(34, 7, 0xf)>, /* ETH3_TXER */
+			 <RZT2H_PORT_PINMUX(35, 0, 0xf)>, /* ETH3_RXER */
+			 <RZT2H_PORT_PINMUX(35, 1, 0xf)>, /* ETH3_CRS */
+			 <RZT2H_PORT_PINMUX(35, 2, 0xf)>, /* ETH3_COL */
+			 <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* ETH3_MDC */
+			 <RZT2H_PORT_PINMUX(26, 2, 0x10)>, /* ETH3_MDIO */
+			 <RZT2H_PORT_PINMUX(34, 6, 0x02)>; /* ETH3_REFCLK */
+	};
+
 	/*
 	 * I2C0 Pin Configuration:
 	 * ------------------------
diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
index 084b3a0c8052..cd88f494756e 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
@@ -186,7 +186,86 @@ &i2c1 {
 	status = "okay";
 };
 
+&phy2 {
+	/*
+	 * PHY2 Reset Configuration:
+	 *
+	 * DSW8[1] = ON; DSW8[2] = OFF
+	 * DSW12[7] = OFF; DSW12[8] = ON
+	 * P03_1 is used as GMAC_RESETOUT2#
+	 */
+	reset-gpios = <&pinctrl RZT2H_GPIO(3, 1) GPIO_ACTIVE_LOW>;
+};
+
+&phy3 {
+	/*
+	 * PHY3 Reset Configuration:
+	 *
+	 * DSW12[5] = OFF; DSW12[6] = ON
+	 * P03_2 is used as GMAC_RESETOUT3#
+	 */
+	reset-gpios = <&pinctrl RZT2H_GPIO(3, 2) GPIO_ACTIVE_LOW>;
+};
+
 &pinctrl {
+	/*
+	 * ETH2 Pin Configuration:
+	 *
+	 * DSW5[6] = OFF, P21_4-P21_5 are used for Ethernet port 2
+	 * DSW5[7] = ON, P29_1-P29_7, P30_0-P30_4, P30_7, P31_2, P31_4
+	 * and P31_5 are used for Ethernet port 2
+	 */
+	eth2_pins: eth2-pins {
+		pinmux = <RZT2H_PORT_PINMUX(29, 1, 0xf)>, /* ETH2_TXCLK */
+			 <RZT2H_PORT_PINMUX(29, 2, 0xf)>, /* ETH2_TXD[0] */
+			 <RZT2H_PORT_PINMUX(29, 3, 0xf)>, /* ETH2_TXD[1] */
+			 <RZT2H_PORT_PINMUX(29, 4, 0xf)>, /* ETH2_TXD[2] */
+			 <RZT2H_PORT_PINMUX(29, 5, 0xf)>, /* ETH2_TXD[3] */
+			 <RZT2H_PORT_PINMUX(29, 6, 0xf)>, /* ETH2_TXEN */
+			 <RZT2H_PORT_PINMUX(29, 7, 0xf)>, /* ETH2_RXCLK */
+			 <RZT2H_PORT_PINMUX(30, 0, 0xf)>, /* ETH2_RXD[0] */
+			 <RZT2H_PORT_PINMUX(30, 1, 0xf)>, /* ETH2_RXD[1] */
+			 <RZT2H_PORT_PINMUX(30, 2, 0xf)>, /* ETH2_RXD[2] */
+			 <RZT2H_PORT_PINMUX(30, 3, 0xf)>, /* ETH2_RXD[3] */
+			 <RZT2H_PORT_PINMUX(30, 4, 0xf)>, /* ETH2_RXDV */
+			 <RZT2H_PORT_PINMUX(31, 2, 0xf)>, /* ETH2_TXER */
+			 <RZT2H_PORT_PINMUX(31, 3, 0xf)>, /* ETH2_RXER */
+			 <RZT2H_PORT_PINMUX(31, 4, 0xf)>, /* ETH2_CRS */
+			 <RZT2H_PORT_PINMUX(31, 5, 0xf)>, /* ETH2_COL */
+			 <RZT2H_PORT_PINMUX(30, 5, 0x10)>, /* ETH2_MDC */
+			 <RZT2H_PORT_PINMUX(30, 6, 0x10)>, /* ETH2_MDIO */
+			 <RZT2H_PORT_PINMUX(31, 0, 0x02)>; /* ETH2_REFCLK */
+
+	};
+
+	/*
+	 * ETH3 Pin Configuration:
+	 *
+	 * DSW5[8] = ON, P00_0-P00_2, P33_2-P33_7, P34_0-P34_6, are used for Ethernet port 3
+	 * DSW12[1] = OFF;DSW12[2] = ON, P00_3 is used for Ethernet port 3
+	 */
+	eth3_pins: eth3-pins {
+		pinmux = <RZT2H_PORT_PINMUX(33, 2, 0xf)>, /* ETH3_TXCLK */
+			 <RZT2H_PORT_PINMUX(33, 3, 0xf)>, /* ETH3_TXD[0] */
+			 <RZT2H_PORT_PINMUX(33, 4, 0xf)>, /* ETH3_TXD[1] */
+			 <RZT2H_PORT_PINMUX(33, 5, 0xf)>, /* ETH3_TXD[2] */
+			 <RZT2H_PORT_PINMUX(33, 6, 0xf)>, /* ETH3_TXD[3] */
+			 <RZT2H_PORT_PINMUX(33, 7, 0xf)>, /* ETH3_TXEN */
+			 <RZT2H_PORT_PINMUX(34, 0, 0xf)>, /* ETH3_RXCLK */
+			 <RZT2H_PORT_PINMUX(34, 1, 0xf)>, /* ETH3_RXD[0] */
+			 <RZT2H_PORT_PINMUX(34, 2, 0xf)>, /* ETH3_RXD[1] */
+			 <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD[2] */
+			 <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD[3] */
+			 <RZT2H_PORT_PINMUX(34, 5, 0xf)>, /* ETH3_RXDV */
+			 <RZT2H_PORT_PINMUX(0, 0, 0xf)>, /* ETH3_TXER */
+			 <RZT2H_PORT_PINMUX(0, 1, 0xf)>, /* ETH3_RXER */
+			 <RZT2H_PORT_PINMUX(0, 2, 0xf)>, /* ETH3_CRS */
+			 <RZT2H_PORT_PINMUX(0, 3, 0xf)>, /* ETH3_COL */
+			 <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* ETH3_MDC */
+			 <RZT2H_PORT_PINMUX(26, 2, 0x10)>, /* ETH3_MDIO */
+			 <RZT2H_PORT_PINMUX(34, 6, 0x02)>; /* ETH3_REFCLK */
+	};
+
 	/*
 	 * I2C0 Pin Configuration:
 	 * ------------------------
diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
index 5c91002c99c4..9ca26725a3e9 100644
--- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
@@ -7,10 +7,14 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/net/mscc-phy-vsc8531.h>
+#include <dt-bindings/net/renesas,r9a09g077-pcs-miic.h>
 #include <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>
 
 / {
 	aliases {
+		ethernet0 = &gmac1;
+		ethernet1 = &gmac2;
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
 		mmc0 = &sdhi0;
@@ -70,10 +74,34 @@ &ehci {
 	status = "okay";
 };
 
+&ethss {
+	status = "okay";
+
+	renesas,miic-switch-portin = <ETHSS_GMAC0_PORT>;
+};
+
 &extal_clk {
 	clock-frequency = <25000000>;
 };
 
+&gmac1 {
+	pinctrl-0 = <&eth3_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&phy3>;
+	phy-mode = "rgmii-id";
+	pcs-handle = <&mii_conv3>;
+	status = "okay";
+};
+
+&gmac2 {
+	pinctrl-0 = <&eth2_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&phy2>;
+	phy-mode = "rgmii-id";
+	pcs-handle = <&mii_conv2>;
+	status = "okay";
+};
+
 &hsusb {
 	dr_mode = "otg";
 	status = "okay";
@@ -87,6 +115,72 @@ eeprom: eeprom@50 {
 	};
 };
 
+&mdio1 {
+	phy3: ethernet-phy@3 {
+		compatible = "ethernet-phy-id0007.0772", "ethernet-phy-ieee802.3-c22";
+		reg = <3>;
+		vsc8531,led-0-mode = <VSC8531_LINK_ACTIVITY>;
+		vsc8531,led-1-mode = <VSC8531_LINK_ACTIVITY>;
+		reset-assert-us = <2000>;
+		reset-deassert-us = <15000>;
+		txc-skew-psec = <2000>;
+		rxc-skew-psec = <0>;
+		rxdv-skew-psec = <0>;
+		txdv-skew-psec = <0>;
+		rxd0-skew-psec = <0>;
+		rxd1-skew-psec = <0>;
+		rxd2-skew-psec = <0>;
+		rxd3-skew-psec = <0>;
+		txd0-skew-psec = <0>;
+		txd1-skew-psec = <0>;
+		txd2-skew-psec = <0>;
+		txd3-skew-psec = <0>;
+	};
+};
+
+&mdio2 {
+	phy2: ethernet-phy@2 {
+		compatible = "ethernet-phy-id0007.0772", "ethernet-phy-ieee802.3-c22";
+		reg = <2>;
+		vsc8531,led-0-mode = <VSC8531_LINK_ACTIVITY>;
+		vsc8531,led-1-mode = <VSC8531_LINK_ACTIVITY>;
+		reset-assert-us = <2000>;
+		reset-deassert-us = <15000>;
+		txc-skew-psec = <2000>;
+		rxc-skew-psec = <0>;
+		rxdv-skew-psec = <0>;
+		txdv-skew-psec = <0>;
+		rxd0-skew-psec = <0>;
+		rxd1-skew-psec = <0>;
+		rxd2-skew-psec = <0>;
+		rxd3-skew-psec = <0>;
+		txd0-skew-psec = <0>;
+		txd1-skew-psec = <0>;
+		txd2-skew-psec = <0>;
+		txd3-skew-psec = <0>;
+	};
+};
+
+&mii_conv0 {
+	renesas,miic-input = <ETHSS_ETHSW_PORT0>;
+	status = "okay";
+};
+
+&mii_conv1 {
+	renesas,miic-input = <ETHSS_ETHSW_PORT1>;
+	status = "okay";
+};
+
+&mii_conv2 {
+	renesas,miic-input = <ETHSS_GMAC2_PORT>;
+	status = "okay";
+};
+
+&mii_conv3 {
+	renesas,miic-input = <ETHSS_GMAC1_PORT>;
+	status = "okay";
+};
+
 &ohci {
 	dr_mode = "otg";
 	status = "okay";
-- 
2.43.0


