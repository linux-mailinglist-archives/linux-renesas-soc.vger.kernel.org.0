Return-Path: <linux-renesas-soc+bounces-24828-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E42C6F5FC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 15:43:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sto.lore.kernel.org (Postfix) with ESMTPS id B206B299CC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 14:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E92366568;
	Wed, 19 Nov 2025 14:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Pk6IkX/N"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F62B365A10
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 14:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562956; cv=none; b=rn2kK3uZLtk5vdwxXFDCiqT3ZqMUuuMKo7HJLrdOALFp5raz9+3amljsL24YPnSzKdmq8f6m3s/HVebrwvePnH3dxUOkbhin6P1WAep+e6k1qtAQUjAAT5e4z9mZmlNBa7e8UZpAWcoXgV+gmMWyNCl1G8jvho7W8DFdXlT4kPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562956; c=relaxed/simple;
	bh=chd+bQesJb2L3x0eNh9hGNo1sfJ6ukKT0DUAGIoBLX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NLBeBzKWPrrJkSH+MGJ3JWgG+4kLL/yd7a956lLTh5bcz7nNyK75gj7Vh0DVFU9+GGzY4GYlG346uESf4F7irHIgdkGCg9x+TGJLmFnChgjc6AylLUkLBmeinks86VUoGUqUGxcYVq5jKWkcN7tDsYbB3+pwCQ/qU2kXkgrX0Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Pk6IkX/N; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b3669ca3dso3423527f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 06:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763562952; x=1764167752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1SxqpFp7EveK0lxmcv0OJIyPAs1tqhEaS0Hczva7EE=;
        b=Pk6IkX/NNOHD+z3yRwHcEzI6d02PeTV7t8k79ZT2HPE/enOPDDSqU4L/AtSSHTV/e/
         bweDHo9SgNjEqUR5tH0IHOSw/JbpVUsep4+iKHz8hF0MyW1Sxc0YP3eQD8A223NwdARx
         xykiP0ET8n4x3HmhIKlpi2vwmztqH9rVY9DxXMYp1+u7cDFx8zQWFrWOEIUDEo0BcikC
         xb+i/aFgwwUYyObWxJ1BLwIu0I+VSDpMm1/9Cre08eti/YvtA9DWqtlDMpL87uBke0x2
         ++5uTzxOwf4jZx4LMYIX3qZ7zbfaDFXQLyhrHCFzfY0VTPzhWVPSawE8n+5neu3wDkDs
         pyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763562952; x=1764167752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+1SxqpFp7EveK0lxmcv0OJIyPAs1tqhEaS0Hczva7EE=;
        b=pXWOGNe+6wLD+l0mIekWxA2cwNfzel+dotyJXrEiG/QYaDT5ibbRPhqnt6d97F2gab
         zfe6DtVQknpUqQVmmG+KtseCvm8gug1xPIr00pPNepPfkRBZYUG1F4layTnqDzhXMXP3
         ghVnrw897ayvjwLRHueVynbmrs+Ge2cORSencWJwkP3TEBUN3VhIQ/MATFaHBNiYlLgN
         us1TuafL1LZiKTxH6Vcu9vmxs8KAuaVPGaWSKynx4+J7596ISpivlfx6H5cd+sRSDza9
         e78Cf7bpmGW26bL7BowAcuV3dH5UbXGPVV7vdQs0/lYkhnS6vzYGlajo4GpnVyzqVx96
         DJmw==
X-Forwarded-Encrypted: i=1; AJvYcCUYDhcgNCItv4q2WHeNQLUpdP85IuZ5Txpv1bO5NX0D3TwwMD9nKOcZO0nfndlbccedYrkVfqa44SF/csuWjcr2Kg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1U7hdWzG/SlmEW8i3S8vMW71zneWL+qZXu21rMllgXuCBW0Mz
	qFCZYowCgqLAH9LYjcPH0kAI7z5GW2OwPazg4oixYXAR/jaauOCgpSCFKl0mFJUot6U=
X-Gm-Gg: ASbGnctWtO6Wk3XAY3g0klKxzAPyPUblQpVMP46Ecloy8pF+DMR8FaG5j0H3uS1QZf+
	pLb2ZRTzMAnoq3Ib7K0r8ZfsqnhQydTLxTBgarlL3jcrv3js04zIOSu3+7l2zEr1WRbnXApP0c8
	Zqng9i5hh/uInYbIIz0nsHQw5dPvgpIc++1/QY07psSvr4wVT503Q/994EviUhj/xn0SuqLz1pS
	+DlksgOD9Ek06LI8zA03GSiT2F86o0S0cRYyYquX1v1n3byLEy0oL5N+iZJaeinuYG/lVkBIrGR
	sEL7IBp2L0OehXK3Wg/tBjxafzoIPj1Q2p2XXixUZayPNrDFBuvGAe/fS4fvrKABcPLIOoy65Bs
	ge3hbcU38ovMP4dfa/L6rdMxQsHrBSK5LpGttqwoI3mQEVZFSTzdl+M9WpFSCV0nBTYqnzIDfmG
	fwa275JHzNdVSxDnS6tYln/yuPGOSlPoyKk8PG32dx
X-Google-Smtp-Source: AGHT+IF0e9B3ky1biES/Rv32imPBPNDCYeycJDEm/fa0WjGwv1dIJ3oB+znuXn9yZSJoHfPlbXgr6Q==
X-Received: by 2002:a05:6000:22c2:b0:42b:2eb3:c90f with SMTP id ffacd0b85a97d-42b5935df10mr17441813f8f.10.1763562952459;
        Wed, 19 Nov 2025 06:35:52 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b894sm39973399f8f.26.2025.11.19.06.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 06:35:51 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v8 5/6] arm64: dts: renesas: rzg3s-smarc: Enable PCIe
Date: Wed, 19 Nov 2025 16:35:22 +0200
Message-ID: <20251119143523.977085-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119143523.977085-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251119143523.977085-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The RZ Smarc Carrier-II board has PCIe headers mounted on it. Enable PCIe
support.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v8:
- none

Changes in v7:
- none

Changes in v6:
- none

Changes in v5:
- collected tags

Changes in v4:
- none

Changes in v3:
- collected tags

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 5e044a4d0234..6e9e78aca0b0 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -132,6 +132,12 @@ power-monitor@44 {
 	};
 };
 
+&pcie {
+	pinctrl-0 = <&pcie_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &pinctrl {
 	audio_clock_pins: audio-clock {
 		pins = "AUDIO_CLK1", "AUDIO_CLK2";
@@ -159,6 +165,11 @@ key-3-gpio-hog {
 		line-name = "key-3-gpio-irq";
 	};
 
+	pcie_pins: pcie {
+		pinmux = <RZG2L_PORT_PINMUX(13, 2, 2)>, /* PCIE_RST_OUT_B */
+			 <RZG2L_PORT_PINMUX(13, 3, 2)>; /* PCIE_CLKREQ_B */
+	};
+
 	scif0_pins: scif0 {
 		pinmux = <RZG2L_PORT_PINMUX(6, 3, 1)>, /* RXD */
 			 <RZG2L_PORT_PINMUX(6, 4, 1)>; /* TXD */
-- 
2.43.0


