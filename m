Return-Path: <linux-renesas-soc+bounces-23848-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 96558C1B21F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 15:17:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3E3B35A0BE6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 13:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BAFF34C147;
	Wed, 29 Oct 2025 13:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="cK6TkHzN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD3034AB09
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 13:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761745054; cv=none; b=gcywAs8YxlbQtfwOaTj+pDaSDgS7L6REbIRY0x8WE/pUfXGW5FqXj3Y2crxixrINeorw0+jBUppLEwMVDLBC1V2aP4j6mu2lSFP8wLF5NmvxO4YTAcxbVl9chacYDaruEEtv9Gyl+ErtJuAqNMAHlZi+D/Sjxe8BDePiRLklq0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761745054; c=relaxed/simple;
	bh=4qpWxnL0DqNz+EstVskb0cPtElHFijuDgl2X0otea40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ib0nlAl9ZJ9ISACTjGdUYQRKHQ6HGEl2JemP69kfB2sKmWkla7k0y9OPSX1iHyG2LLIhpkxbQ1ow4m5ItG7PpRzamjjRJhqDsfLzZN8pYrjCSEee2zTvN4GfHXp7clYMEIzeC+uYIywPnCAyoJhPWoXTbdyAZku1vL1D3khLwyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=cK6TkHzN; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47112a73785so46408355e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 06:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1761745050; x=1762349850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZucVisGfZT3YO6Pp1pOYJeX0AZmBkMe3rP14GIY7Fmo=;
        b=cK6TkHzNCfgg6ofabXiMiY5bCJ/o4t4m3QV7NCO7CSSIYXA7u6P/EuX/ugjH9HDbK8
         lY3kGP59GNKoEE06XGvl3dCSMOcDZSYR7elZZelcq5Fd99OsiBy17jlZv8CneCaRs6cF
         S+VsFq8ok86uM8JdpUiotW53H5fbsTQowKwn1XDfsar3jl0aI1zqO4jkofPK3+daH9W6
         j6IA1C1ihgA7oEq7p2r7vmVa35K8Fvqic3zrqiP6jAoxXFv3sIWtbW6J4sXFM13LewI8
         YTLUZWmze7B4fhfdIiT270WQH42VgBHZWjifK/XullPMMxmbRWzuT0FMRQ0k+6MjwiVI
         vehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761745050; x=1762349850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZucVisGfZT3YO6Pp1pOYJeX0AZmBkMe3rP14GIY7Fmo=;
        b=tiX1OG7Nq0PPoIemHb6toPU7roMYuTYB8EjTgGADm2X1canauSMTqQswLB7m590QsB
         tXyxA5uLKscdu16GZgRfWmkqMeYI5mnvx4PId7Am2uFXsoXLSz4JPD0JpykLh/VuNK+I
         DGGB4Ua5hGhWtBVtEu+W21FCWQIG3F4PWa1Sud9qK83cOEHBqboAufSfC2V29ZLtvCWN
         Zjc6tMayzN3Su21smPXonp++B6w5IDZTi52rIWKzRWOH7z/4Gu3OvZYTv6UCvRmMn7Od
         r7y28Hrggzc3PGbOy8LsIhaC983oC0Eq+vYsGSjHJxT/EExrBZn1kuACj+wkGcPIcJGI
         y9uA==
X-Forwarded-Encrypted: i=1; AJvYcCVkCH5mUpHPiqT/m5p//2aQfA4WXiqqqQPv66t2ptrwvh7V9D71Ko4bBK7hpZaecMMCkdcDqRavnfX8OTImCsISow==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJwVYWCrfh8bchozYvjnmyhsKp5XVn9Ks0cZ04Hm8/teAAer9L
	kt1PjV8m8yaWXyAQAqW5zpn9GFDq9F2Vbh0cHYEgfZ2I/RrVls427DreewhBHEQvraQ=
X-Gm-Gg: ASbGncvbORKRfBjOEUsKK8HsX1h7rjc5Gco5otbocBl5+ma8kh1P7SOMzm4mEro81q1
	nLCT1p9HJddfwCK46QMW4PtzWc1Y3DMzUXzArQDbva9bATBup78uK6rdeW5Qx5ZfTboZ8BX2TSX
	McH0YVlLMCij5Vg8UYaCrCdOYuJs3SV2tXV8HQtcc6gMFGg0otJvZ3s8i57dS5td6KBboQWDZkp
	yebjVjok9NupR6EkxeDlNBGJXKzWIUQsbCcW3Vk2aJCFFxm6/08Jg6XS/wErp6//6jsJ3uius8I
	SrgOo17XyKcL9uWGb2ajyM0ulIo4L4Fu5mtIIJsgGAgId2vV8Um4BtgfBKuXQxysdM86H9nF23u
	1rzLW2kTxNVjW83HmqTfuzYaX2hDsywmN3t3giRvTn0eVT2aJLa0Zzi/8lPVPWSn7ONWJ4K1pbW
	XfBjS3DJAc/P3NLjaZ7UoP5ziO6eshzYhT9MgoOFoV6Xe2ICPsXOpvFj8XYTql
X-Google-Smtp-Source: AGHT+IH82LP23eHV2Q/dmls/on8JCS7YDUNQByFGpr5xcqcKOc3wDkP1J/vGZ2LxnzV3ZCk9iEZMCw==
X-Received: by 2002:a05:600c:45c5:b0:46e:376c:b1f0 with SMTP id 5b1f17b1804b1-4771e316cf4mr27747135e9.7.1761745050061;
        Wed, 29 Oct 2025 06:37:30 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6302:7900:aafe:5712:6974:4a42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e22280fsm49774795e9.14.2025.10.29.06.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:37:29 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
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
Subject: [PATCH v6 5/6] arm64: dts: renesas: rzg3s-smarc: Enable PCIe
Date: Wed, 29 Oct 2025 15:36:52 +0200
Message-ID: <20251029133653.2437024-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029133653.2437024-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251029133653.2437024-1-claudiu.beznea.uj@bp.renesas.com>
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


