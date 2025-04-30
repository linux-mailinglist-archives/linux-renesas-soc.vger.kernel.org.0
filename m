Return-Path: <linux-renesas-soc+bounces-16509-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C57AAA48CB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 12:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBB9F3A44EB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 10:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2BA25D8E7;
	Wed, 30 Apr 2025 10:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ggiA4Hxo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8F925C711
	for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Apr 2025 10:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009199; cv=none; b=XxPea6rr1rYrqz35Uyl+CnSK2COweHizP7EFG1jL+aBCV1ho9zNU1S7vcvIXpAAcROsO7ZNfYVjur42pSPRVrs6aiFqf3/KfDfGUBd6FflKW4nOmwm6BDxUryvgE7ejPhR3fkxwZZzpKX7kkDMxUbahaIoB9uLvi8bqMoHxPfGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009199; c=relaxed/simple;
	bh=EGBMN18CVdfmHkc+brVcq+MVtXLfo7+2eoARAWS5P4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZEj4J3P4Ak8GT3XgB8HHtr7wAZW/bus4Qv3cxHBvr/+2bnF3TGZKc8NzdhwLx5VUYr2dj4JM45CyyVsm3Yh1qyuVe1WRXazQMV75GEY4P4J81CJZ6VJWKkll1uHv36G2rbxXdac2LdJ3qEXQtutRrdeQrdFkBhojZrRzDRHHDwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ggiA4Hxo; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so11240094a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Apr 2025 03:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746009196; x=1746613996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLzaKZV14Vn6EMb9E2bHvEtZk0V2ql8+6m7239vNBfc=;
        b=ggiA4Hxo6OuwqDkz3I+mb/Y6975pyRApoNvAqYV1u1V7Bx+45217nLDBqPT/YQMzJ8
         IyAuOo7S/DQoiXfmzHTWe70XSYkgpOaOQa275zJytBz15KA6UJiY3l2expo3O6lc3NWr
         zqpM0YT3aaFc+soUoBnmj1/Ins92ihEPwFo99iXeiFIepqw+O+T8ZFOle4uoOtIf3ddH
         AE371+2rHn+8BZ8krOa4w28GE7Ve3Sj4Wb4wAOfMRifRzgdM+p5qBx0XFMyQq3PsEUi+
         AZqEOKkZsXYeSWTe3qkLuXj2nAcKUoODH2NIbWKC2RGk/QP3GEmqpxPzTvb6btT6rriL
         Vu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009196; x=1746613996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XLzaKZV14Vn6EMb9E2bHvEtZk0V2ql8+6m7239vNBfc=;
        b=bjZqcxo+2MFSFXTzCbipJZWXY/s5PojAhDZ0Fvur0PVDOvW5yxH0uTHD2iG7FpAyNP
         68luv/4v5vpiqya83p+Q3m7cGpVvK6fOfmAM0zhAuj88ycoJnJMoBmQUuVggX5VkjetK
         G5HH7qP9a2POCDYf92DAcslkzPHm3aC+SS++NAEh4eBf6aYF/EPs3E14ROSBlTTzHj7u
         mqfhket2rIQj43VRa2lWSTXPg/vv2qyUcHqRN+al4VTQJ1MLOZ15yPiYhpT0b8ZpeBFW
         igLpeOL2sk8bQ9vLH3wCtrl3Jv1FjKsU8XHtg2t6qJJk2G4CD30M9LoLhKWTwGSGABzG
         i2sA==
X-Forwarded-Encrypted: i=1; AJvYcCV6wTjPjqo9Pmx3y6IYBsOgCtKVufpgj26muZXX0Uvk/0oqujLD15FNtJ/JC85MQqwN0LryxbeRStiemKZJGql7wQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYwlCJtdsQ5j9b+0HKwCg/niqMw9fyu9D+8FoueHHeGPRvXFT/
	lxSJ3bNETetIwXYSevGGbaDyYA0ZMOh4JJc7gpPZetuiKPY3LnUuAmutMdrTq18=
X-Gm-Gg: ASbGncvbE2N0i3Rw8N6wGYX79aMnR10azmLHSrjdU88QemIrV+/dbETcSVhIFmbdoea
	G/bk1tM/pHgXuE9D9Lqbm/CGzqcmIi9QsfnSm31PHhRSGEpTPsNwIx6/Cz64PQSw0x+Mb4ReSLL
	klebYqxecAVuFIBLERdHv06cFvF8RC+vdZkKJIytJA5bnsgSfcs4K1x5Xi39dIYe4eiroguoKQ7
	A5PgJVq75kIR/0JIrZOtK3RT6u3h4cAtyGtEOFexpnePKuqchN2ylW9qmEMYSjs3BZfjm8O97ju
	PYb5sELGLaDfVicMTHiRKTLE49pPBKlEOcXUepvzyA5QV9eOYHvfMx71sk6ULcFk20wOY7M=
X-Google-Smtp-Source: AGHT+IEKSM0IXh8jKv5O+IVSv4mJ6z4oh82fv68+fLwY5atxsSRsGcvPXRiQe2VBDa9mA8yPM7H+KQ==
X-Received: by 2002:a17:907:3f0f:b0:abf:6aa4:924c with SMTP id a640c23a62f3a-acee21ae83amr165748366b.17.1746009195599;
        Wed, 30 Apr 2025 03:33:15 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed6af86sm909390366b.133.2025.04.30.03.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:33:14 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	saravanak@google.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 7/8] arm64: dts: renesas: rzg3s-smarc: Enable PCIe
Date: Wed, 30 Apr 2025 13:32:35 +0300
Message-ID: <20250430103236.3511989-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
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

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
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


