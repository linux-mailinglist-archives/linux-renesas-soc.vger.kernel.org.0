Return-Path: <linux-renesas-soc+bounces-12270-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AE964A16CFF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 14:10:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B79DD7A3921
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 13:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2641E25E3;
	Mon, 20 Jan 2025 13:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="onaj1ljd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEAA1E1A3E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jan 2025 13:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737378588; cv=none; b=ZdT5WMPT2heOLrOruxnhtOeTeby1uGoDVJi+doLFTmcNYMjK9B/Rjq2k75hZxUWl0L7gUo9HgrQWkrbPiR7Cmrk+Ygl9K/ShwHGWmx5DPCJdElUJDW1CmFuZQOvEGu/FYZ7ympNnu+ciPOKnA4MiwFKL1SYdcSfej/8Vr5E3HLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737378588; c=relaxed/simple;
	bh=7o3Y+E7nnBZwgQGYjXgcYEZjLUWyl3PQWnVN9lSAnOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tqGppyOTOrFsY0CY2vd63GTEO9LM6g2NaF/q4pa6jLFLJPHnoyvvPk+zpdohhDlQxEnfXOBUn63i5Gcod1I6gC1rZdK1LH9z1k4PHarvQuqrf/ltwwZXguyuIhWIC/Oh2AARcNIx0KAEZZ0lGhctbxRRAeKPvDfNmYyWkMOrvlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=onaj1ljd; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso31448705e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jan 2025 05:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1737378585; x=1737983385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2lPi/twN6zUkfiC5mOpKuXZ209zqYTSm0G6i4T4io+0=;
        b=onaj1ljdkRsIYtjBEwJW48yzPCGLBwRuE7i6+GWZc1UNZkmgyma9zKOgFdjoMiofao
         pSqjSqfAdTrjhqEHiMatSquI4JVNAPCrKTuQ71WpLQt+zJ+WRlE9kNlWPK+zupvUvaFj
         h3VAo4ge5R/qSxHGdKrBITU9cwq23sUI2uSi6bcZde4Pm9lPtZV6vVJ6qTr2SmN0B6l3
         Y2X8VTYKWY2H1/NxK7njQGJsF0beLHcRBwmCF3CHrRwZ6jnphn709nxehJlqT1VsjEO6
         sM6ZFyfO32MFhDsQnCdvhGCRUThFIVpnoYP02kUP+dSzAzK2YK+YOhBlY8jz3IMCsToN
         DKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737378585; x=1737983385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2lPi/twN6zUkfiC5mOpKuXZ209zqYTSm0G6i4T4io+0=;
        b=DK0v97Z5NvlrsrYoR3xF0chYG2oTBA9aHCtHEDPLhDXcqK7Gid7nGNRi8/4kr/ZMki
         Izteny32K86CPGubDuQIbPUVShheWoJmqxGVgSPbBjYek5enDcOMGMkh5kZXYVnDTrtD
         b7AS1OoQTtYfyeXwBYlPXVqy6X2XW2ZxlpTJ3FIx8MtI2sAkDAScUC0Fh0OJ+IS20FhD
         ZnGD/1kLTvq7X9ETQP8KDN5LnnIGklz7lvFflXXVkZFJs94MdiwQPOEwCVK57vo2DUHu
         ONusbw6zolgkO9pUXBna5eAxY6yl6MH8xq04BlsirTDQGlBPcQfGPM8bhMqKRDnV0zGb
         vKhA==
X-Forwarded-Encrypted: i=1; AJvYcCVq3yD0RSRDxf/4rm8ceLUit3REywK1OaaBmqpCdCTi1JRtgJSfTAN5bP9iZww/8mxdpuNczXxTkeOKMF56rqSWqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxO8HPOuK5xYxueFIYXJ6mT113C/icPdIFulDETgOtRx4tW2Riz
	oYqCxHpYdvc6sqsWUzrIh0Ym2j1nZAhNmSTAKJO35fPHSStS+iLArRhb8gCT+LM=
X-Gm-Gg: ASbGncsGMJoSe82RMdpmo+bebMT4hOP8oASOJ0PRlxDLmnIIgD7u368Dji1IMloKuGz
	5/T2Dlw8v6b++fe16wyHywpb6OOved1hkPte/kuFAAPnyNRRfs3vBJQSwr0bRsTki45/RvTVqmW
	qQxki8Vb3BkMeTtFPu2uOqdH1QEiYiaMmVftPqn/tqaaqkXugUDC9sRmkxmn6VIazB3hCfQyX5n
	OzAYx/Wm5jIFCSBoloT/riWaRK26lMqLNHwBmrgXP9Yo2bzko1uLFGiIk9hh9aMKMN14zd3OU2k
	iT8/jee0lZ9AneJgfdr/JoA=
X-Google-Smtp-Source: AGHT+IEcU/85w7UbVunXHIxQ5T1EeguZXj0W8RnMAbTNHN0/tPf0amR8m308HxvIlVOOV/v1s38tVA==
X-Received: by 2002:a05:600c:c0e:b0:431:5044:e388 with SMTP id 5b1f17b1804b1-4389142968emr119630415e9.22.1737378584913;
        Mon, 20 Jan 2025 05:09:44 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4389041f61bsm138001955e9.17.2025.01.20.05.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 05:09:44 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	p.zabel@pengutronix.de,
	claudiu.beznea.uj@bp.renesas.com,
	wsa+renesas@sang-engineering.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v4 3/4] arm64: dts: renesas: rzg3s-smarc: Enable SCIF3
Date: Mon, 20 Jan 2025 15:09:35 +0200
Message-ID: <20250120130936.1080069-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250120130936.1080069-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250120130936.1080069-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable SCIF3. It is routed on the RZ SMARC Carrier II board on SER1_UART
interface.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- dropped checking the SW_CONFIG3
- dropped the include of rzg3s-smarc-switches.h

Changes in v3:
- none

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 81b4ffd1417d..0851e0b7ed40 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -12,6 +12,7 @@
 / {
 	aliases {
 		i2c0 = &i2c0;
+		serial1 = &scif3;
 		serial3 = &scif0;
 		mmc1 = &sdhi1;
 	};
@@ -162,6 +163,11 @@ scif0_pins: scif0 {
 			 <RZG2L_PORT_PINMUX(6, 4, 1)>; /* TXD */
 	};
 
+	scif3_pins: scif3 {
+		pinmux = <RZG2L_PORT_PINMUX(17, 2, 7)>, /* RXD */
+			 <RZG2L_PORT_PINMUX(17, 3, 7)>; /* TXD */
+	};
+
 	sdhi1_pins: sd1 {
 		data {
 			pins = "SD1_DATA0", "SD1_DATA1", "SD1_DATA2", "SD1_DATA3";
@@ -208,6 +214,12 @@ &scif0 {
 	status = "okay";
 };
 
+&scif3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&scif3_pins>;
+	status = "okay";
+};
+
 &sdhi1 {
 	pinctrl-0 = <&sdhi1_pins>;
 	pinctrl-1 = <&sdhi1_pins_uhs>;
-- 
2.43.0


