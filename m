Return-Path: <linux-renesas-soc+bounces-17045-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE87DAB55BA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 15:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CAC919E1CA8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 13:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89E9528F92B;
	Tue, 13 May 2025 13:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYBJHn3a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8ED28E582;
	Tue, 13 May 2025 13:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747142059; cv=none; b=rjGJoCRMXwof5TGJC0K7nrKrDrTbKW2RZGX9A0+VUbRH+3jW9UpkrSl2IzaWFSSm+rTVCZ0xgLFIHZWQRU/nmyLxMus/Qwsjbfs3HowWrLtDz69WLmkQkyMeeG+qvIrJCYF004fkKgcoBNYaOKIWePR+AzsEogCs+eVsIlrE02s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747142059; c=relaxed/simple;
	bh=v5S4maaoyBtxxMaaqGoIdTkhU54pd8/40QxQsa0V9CY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=paomHi/Z29YgwF7966BFkYfkCZeX+SgEn+GA9r/1UybGkZoDceS0XO+9ZQceFgU+xJwb7k8+ETrOBuezemP+Fz9PjDk4hy71jKCS4tMhgPAKqDkTeH7eVz+BAbjHwlyb2MoCwALV4CtUTmM/mc/ACSW88K3CN+vqag/attXU5as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYBJHn3a; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a1fb17bb8cso3403729f8f.0;
        Tue, 13 May 2025 06:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747142056; x=1747746856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSgMeEPJZwfTowiMMOsvLgVDH0pf/G4XujOfK/95V18=;
        b=hYBJHn3a7t0pNVsE33vAGkdoQVnmjWXQuqCugDMRYVnmCOST/lB3arjMn99FaZEXhl
         U2dZODWxMUGqrx3fxN710jCV9xIzuQjBO0l/Nd+PJxlr2OwychNQ0qFFFGyLNmOiKNxL
         T3RS8BNFcMiAJ7iouECX4L91awlvU1sRZL1uFz3MPFJTKAqoLPcLb2k9r6cjJ06jKwaN
         xiraACVacDt77ZWgCqvlkFiJc5LxYtQ3XuvGMkfLuHKNnPcUdTrfMWmlb3BOgVPMQKjp
         BZsjOf5KnAKrrLxlkO4Z+r4ndzlqBxiKfImu7VVscGLAXstQtKZ7LQ9rKvkfBoCQClOO
         STDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142056; x=1747746856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eSgMeEPJZwfTowiMMOsvLgVDH0pf/G4XujOfK/95V18=;
        b=GbAXqqFbiFaMd1TNh06NZJiYK9u5zv46pXqMpKDnNttfBRcQP6sIBfnU+RAg/XYR7M
         vte3dwlkwf8x4wUIfawfRXUALlHbAhPNfhdLSN8pkQ+5wea3nvPFdL6IuDWH45zWYkoU
         fEv/VaXkpUUcIynQezFX5uTLXlxRPV+RDtKoJjF3agmN782eU88SGKjL1zZNHyEEILID
         UQEACjV0t8tS1SYOdkZ/wNP1HkE7FWdOs+9xhziZdvly1M1AIQRmV9/iz/m3SrdSIykN
         L0PCOtNRNlZ6XiPSApKieC8aGCH1nmNH2Wme2ohn2t9XCatbqpjvRBv/8PnpOlekM7Za
         bVdg==
X-Forwarded-Encrypted: i=1; AJvYcCUWmspPowi/pejUag1ajrlbPdbez4lZh9gUDL0fzdlgip2u68pD9GXvFPqYO5tfvw79VLNPIGjbRgAcV6df@vger.kernel.org, AJvYcCXaBIZYjMzfz034hSmHhQpaRna69aT8DXN1HbViYLID8WCx116e4VhUhxgaVFLKhO1Zb/YX0nx/yF66@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/RzZZtbK+zFQzl7q0iuJZEB9j2m4V3E0o+dObtr0oPxtFTDq/
	AFgLyue+6S8DYI/tXpRPCDnTvniQ5/fFfG4yhYH7661z+uLlDF7o
X-Gm-Gg: ASbGncuHUcQPArySoVb0sXljATALB5LoFGNPJ9419iQl6tvpbPnYJdTkE0zxoo1ME1/
	VFAki98Vksc4//iZviZxpMw6ynAuano8O6Cc8iHzDD0qyLyQipzNK4OLdow5Lm98H2jfbRIp8j5
	vWIxRF+CkGMNKBDM5nBEZdEUo51AGMFGS2friWa3TIam73w5gNxUpsZwE+u1NhdehXhT53lL9Z1
	tsoyVGBzG3Aq9ZtOiF4Em6pMYw3zgVm21toIwP1cJliPve9F4Nfl3GwPwwPIzEoR1+GqJ95uTiQ
	sI5yTThU0J7m+OG2gMALERihfDMOqGWPEuCiJCgZyLezcdcAdyoVrSYQHtUA2OhpwOjHnkzLSws
	ozG8AlI73zQ==
X-Google-Smtp-Source: AGHT+IGLirPuM2ESKO9RNv/lwTmXbJqFl1w/JRNf0VJzgkGe/UInLy4SxcAMlJX6fZelQ5H+mCjjMw==
X-Received: by 2002:a05:6000:a90:b0:3a1:f8d1:6340 with SMTP id ffacd0b85a97d-3a1f8d163efmr11827186f8f.34.1747142055783;
        Tue, 13 May 2025 06:14:15 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c996:6219:e8d3:1274])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddfd6sm15910102f8f.4.2025.05.13.06.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 06:14:15 -0700 (PDT)
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
Subject: [PATCH v3 2/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable GBETH
Date: Tue, 13 May 2025 14:14:12 +0100
Message-ID: <20250513131412.253091-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250513131412.253091-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250513131412.253091-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable the GBETH nodes on the RZ/V2H Evaluation Kit.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3:
- Split adding the PHY nodes into the mdio0/1 nodes.
- Added Reviewed-by tag from Geert.

v1->v2:
- No change.
---
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 063eca0ba3e2..d6d2f689b875 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -16,6 +16,8 @@ / {
 	compatible = "renesas,rzv2h-evk", "renesas,r9a09g057h44", "renesas,r9a09g057";
 
 	aliases {
+		ethernet0 = &eth0;
+		ethernet1 = &eth1;
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
 		i2c2 = &i2c2;
@@ -78,6 +80,22 @@ &audio_extal_clk {
 	clock-frequency = <22579200>;
 };
 
+&eth0 {
+	pinctrl-0 = <&eth0_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&phy0>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+};
+
+&eth1 {
+	pinctrl-0 = <&eth1_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&phy1>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+};
+
 &gpu {
 	status = "okay";
 	mali-supply = <&reg_0p8v>;
@@ -139,6 +157,44 @@ &i2c8 {
 	status = "okay";
 };
 
+&mdio0 {
+	phy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-id0022.1640", "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+		rxc-skew-psec = <0>;
+		txc-skew-psec = <0>;
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
+&mdio1 {
+	phy1: ethernet-phy@1 {
+		compatible = "ethernet-phy-id0022.1640", "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+		rxc-skew-psec = <0>;
+		txc-skew-psec = <0>;
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
 &ostm0 {
 	status = "okay";
 };
@@ -172,6 +228,16 @@ &ostm7 {
 };
 
 &pinctrl {
+	eth0_pins: eth0 {
+		pins = "ET0_TXC_TXCLK";
+		output-enable;
+	};
+
+	eth1_pins: eth0 {
+		pins = "ET1_TXC_TXCLK";
+		output-enable;
+	};
+
 	i2c0_pins: i2c0 {
 		pinmux = <RZV2H_PORT_PINMUX(3, 0, 1)>, /* I2C0_SDA */
 			 <RZV2H_PORT_PINMUX(3, 1, 1)>; /* I2C0_SCL */
-- 
2.49.0


