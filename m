Return-Path: <linux-renesas-soc+bounces-19239-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A75AAF97D7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 18:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2890D7B87C1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 16:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52EA82E0929;
	Fri,  4 Jul 2025 16:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kNsxm4aQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B3B2DC35D
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Jul 2025 16:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751645695; cv=none; b=ImrSYXZRnixmLRrjDgvf30uCh0f2Szr52AzhaVAvtS7vzX+VspjV9R+jCwDWbVMvrqB2sS7xh9/nJOqW3CUcs8etfaNkkEcAPfh/zRZaXNvXVjvzPqHsmkPu6vvlDanQtyS9m0K+wB3KkXgtjb9O2xdtcL9IDv8P2mvoALq+wwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751645695; c=relaxed/simple;
	bh=WguPuQh3/mnSf62tuhpCluxDoAVKFv7lhwgnIqAg2mA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XCCjgO1lyJYOQEhkfuYanXICWom0Plt8WSRi7+UYmIy6nmmCSwlew3uziuHNPv0iCrz+7GDUZ88QKV9RVP/hgRZjt3dKNvRuWOIIoAQ1BCbJlp8Z3cvAAfftybzLlAYMK5GcSXri1P04Rih7abAxSvZsAw1ugr6309QEAT60C88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kNsxm4aQ; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60707b740a6so1529594a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Jul 2025 09:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751645691; x=1752250491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDg1DpjdtfK3/pj3Ed0aWvzIW/qZbuuI4Dyv55kxUjI=;
        b=kNsxm4aQzR7UeO/Sg2pPhSVSa/aBvxxcStZmcjSqc6NnX6y3RNzAaB4a45xbKHnCl6
         OjURboHgmHjDqY0UcT2awnFZGMJTtMLgk4gziU9qQ1TbNb1ouWGsB0xtNEBHanWq6CCF
         q/Y79U/XX6PK15ZK8mFb2I8UBmyDe5kH9xPMaYfoTl4Efw+y1mwOm8Q7wIfxYRT3fq/E
         E7AGP/eBjdDMmFSw8+yuMCJWyTbqmGIoBpk47m6t+rDEJKGFXtngaFACVEuEICuXj/rC
         bEI4NbTz+Aq672q6ZUiVP3nJCUIDvcghA1Ta/+BjifYq48r7l2WRJq0HWJWH+SJ4QjYo
         4GzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751645691; x=1752250491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDg1DpjdtfK3/pj3Ed0aWvzIW/qZbuuI4Dyv55kxUjI=;
        b=aYp1W609hgWAxW5CuCxvtD55SuqJRE0EHxZ2yvQghhl/AX6pChbUR1DcMDoDdtZnXi
         D2xLCoYj1QdmInnrepU/RyHll91GZvwGExbR5+WxQCgB8knw6J0q4C//h5Bbg8cNzUpU
         KblShMp/9zE/URHoCWP2mDVXohcFvHcBGHmx12c7k57ZqspChKHAzMqCAjBofaE6RQou
         5Wi3Q/OJgmV5oiZ5vTB2KjjQPc+db8WAmF9AvbtwZ56+EIssea4Y8x6K+bVJGqvy4148
         MhF5MntypyF2n9uRnyDra2wWBLBqtNTh6oQj5L2NTmFXFVb9sLVgwi+pkNZTrPv1uA62
         kW5w==
X-Forwarded-Encrypted: i=1; AJvYcCWZ7ud2q/t71gmDPnO6yRmc+kmTlrkBHTPrM/SwF5savzsjVMjGy9ViJtOEyg8QaqOJLa76Pys1snVekWIg0NARew==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrTmFUpw07sjvXFO3c/TcashmAb6t+ky+FOm6+tuic7oNBuQCJ
	bdTbx4rfL7TQxqNvqwCcoMmTLd32U5U7Un0g72p8kpvuzs61U6Z1PJkjxO3fAEWSyu4=
X-Gm-Gg: ASbGnctxnAs1N8L98HhtvcH64cpXz+iGqqHvvmDYjX49JkYcxB/xNhT+48ATiHakQtB
	SNWAnPwP98aZskBaiFcVMVbdBY0RyCRou5HM8ywrqAfGtR8lt29jHQOixQGFXCyNB86DbC0dOas
	4gNCWfMgGFzHMCbJQvIjz71iaUJr2Yb1yayIobW6JqgqEGDf5OOEMwqY/83gwjfxu6LJJ2Hhl9e
	7JGDaB9Yri55R0SP1YI0atcQzzTRnbasK/Fi7e9C3QBhXt41mOdsB/hT9a0hBMIP3PCfOUAKJFx
	IUKBLaBmUjUbNGyBcW9mOl2qrW5KVp1NW3xe2oe9WJgx855BS0CoOxyVDEavxhpFCKJnlv6RPnT
	QOzn8GEUxG2xjbuo=
X-Google-Smtp-Source: AGHT+IEZfr0ji4LDK9KAfq64DmhYMTWRTB1pQDXq1rT0Tuj0QwG5y9ROAnPBq8wcVt6C4csWmuVLvQ==
X-Received: by 2002:a17:907:9621:b0:ae3:a717:e90c with SMTP id a640c23a62f3a-ae3fe695451mr259268966b.23.1751645691353;
        Fri, 04 Jul 2025 09:14:51 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d9215sm194703766b.2.2025.07.04.09.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:14:50 -0700 (PDT)
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
	catalin.marinas@arm.com,
	will@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	lizhi.hou@amd.com
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 8/9] arm64: dts: renesas: rzg3s-smarc: Enable PCIe
Date: Fri,  4 Jul 2025 19:14:08 +0300
Message-ID: <20250704161410.3931884-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
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
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

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


