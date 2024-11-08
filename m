Return-Path: <linux-renesas-soc+bounces-10399-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8D89C19F0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Nov 2024 11:07:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D254C284DB0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Nov 2024 10:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B488F1E47DA;
	Fri,  8 Nov 2024 10:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="SGKaUYWX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87271E47B0
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Nov 2024 10:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731060343; cv=none; b=AFbLK+/EbA+0YJ6vHnQfVvqq8G4WhUjkcVYBqnm65nznjaYu+gy4hBo3Y0JLsPDXb1rQwQMZ4PYYyt4cIE0ldFHi1BY5Zs0MW7NcLmkl80ydLdzkzoVoi0eeictipVoB2b0QAuhXl9iZPqWgJZleSDZbV4zy7efBM84eoR1TIUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731060343; c=relaxed/simple;
	bh=2I3QYGgD+fQ78laCU7YBzXYtfRiP/TAEmsHKexsSybI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y7n3oytQdTo3tfZKaqVfp6Fsruy4E9viLfIoELXkpRAMmpAkZmGWEmVJd2zObQUiar4BoPOjGjMQ1FdGoVBhxlwf/axY517u8vr4ofwpP7t3oZdH1kCdroAjrpHt+ac7HjQ4yBS4juz6yL21s6Lj5e7guoDrCGoniG+ZQUGkZIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=SGKaUYWX; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c937b5169cso1408722a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Nov 2024 02:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731060340; x=1731665140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zYxgBdR3L0zZjTE6Q2Xo+f56VcHJlv6CSX9bi7CoE5s=;
        b=SGKaUYWX3E5Z5NKJx6rNFdmtyCME62h8Tri5XYBQh5CiXJqc0Dvy1fNz5K0aDqYpER
         6dVPwKLfrGZ1/nhQ3kwZBF5nzaF3ncTVUlcZ1JIuODR8im6cYOn6EdZtnSYu1tm/KhQt
         ho8VSEeMfhkQojum+k1XUNY8L7adg0Zd5pATXt2Yc1fg1vk+TXpDL0SB1D5Ruew1XmHE
         8R4r0oQiKTzRwnxFx3Z+7DyYbZe845f3mH9AUFSnsqYVNlQGxFZdoVC0gfCRcdZvYM9k
         YKn22grrMOnidCJ/je23Nx34z+WerDTpyg1WHNRc6oq+/XWnLlyPgZpx/8HSFPH+86U7
         TCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731060340; x=1731665140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zYxgBdR3L0zZjTE6Q2Xo+f56VcHJlv6CSX9bi7CoE5s=;
        b=unyjfkRChBZjsa8uR0MNa8PI7R6lLgWS5ozTWBz8bFb5JjUo1qSuVew3poFOwuppIE
         eWnMbkHTE9nqqkjfNipSKEFz6tGFrpElIif2a8LmBxAnkYeFVONOiGmbRwcW6f55vhBN
         ilHFBBXwIJhFYR30NZ3FroS4AM8+zirxJWhdxf9U8FiW30Tsjco1aryvbEWqPaY0Yj4+
         qL4+nOWco3HVN6YF0noqyLPxBkhkdifQcu4JH3Bvm8m5BfFnWblDer13lul+M+NUoLDX
         mIe8IYDntaklCBPID7eLaULilgfKaeAdzz9e+BCRtjllg4dAIU/Hf8qyjHAjLE1PEUin
         RNNA==
X-Gm-Message-State: AOJu0YzmeZPSGbzB4BJsJrqMgztzTT8txKq1fzfqkCjmmvKnVbH7Njw1
	Wnl5dUl1pFsEeB1DH8rPSlXDEV0Sihea9V9rWH5W9AEqFR96syBoK7fHBFzUt8A=
X-Google-Smtp-Source: AGHT+IE7N7pylKiTXaEOCIxixMFZUU7WhiCw4v1X0VOaK6v6PAdm72v+9Seyb/j9PC7MrQVlSHFH2A==
X-Received: by 2002:a05:6402:4021:b0:5cf:1214:8146 with SMTP id 4fb4d7f45d1cf-5cf12148226mr1044954a12.4.1731060340387;
        Fri, 08 Nov 2024 02:05:40 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03c4f0bdsm1775959a12.56.2024.11.08.02.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:05:39 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	p.zabel@pengutronix.de,
	g.liakhovetski@gmx.de,
	lethal@linux-sh.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 7/8] arm64: dts: renesas: rzg3s-smarc: Enable SCIF3
Date: Fri,  8 Nov 2024 12:05:12 +0200
Message-Id: <20241108100513.2814957-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241108100513.2814957-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241108100513.2814957-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 33b9873b225a..1be21ece131e 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -9,9 +9,14 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
 
+#include "rzg3s-smarc-switches.h"
+
 / {
 	aliases {
 		i2c0 = &i2c0;
+#if SW_CONFIG3 == SW_ON
+		serial1 = &scif3;
+#endif
 		serial3 = &scif0;
 		mmc1 = &sdhi1;
 	};
@@ -102,6 +107,11 @@ scif0_pins: scif0 {
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
@@ -141,6 +151,14 @@ &scif0 {
 	status = "okay";
 };
 
+#if SW_CONFIG3 == SW_ON
+&scif3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&scif3_pins>;
+	status = "okay";
+};
+#endif
+
 &sdhi1 {
 	pinctrl-0 = <&sdhi1_pins>;
 	pinctrl-1 = <&sdhi1_pins_uhs>;
-- 
2.39.2


