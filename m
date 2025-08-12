Return-Path: <linux-renesas-soc+bounces-20424-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3A8B2399A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 22:05:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BF0316BCE8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 20:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12303074A8;
	Tue, 12 Aug 2025 20:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H7Szq8Gu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180392FFDE5;
	Tue, 12 Aug 2025 20:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755029035; cv=none; b=VYrvfjLmf54y9q+I1qUxOJAurfiQe3K5pxQ5C4KTiFZ3yjuAf+MMu2qlTY91yHJH9vDu8rU/kkD+ENdYn75JLCT5cqMLK3ES1dnVygLKH+pw6F8TuA17pYo2eCWKbOT7lwS79JuYkCphlmpEtqAaw5GnKWY1ajJdgQK7daPsRas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755029035; c=relaxed/simple;
	bh=9NcNpjOat+iZmImYYc6U89bKV6xy7s3kiXxpPR/b0nI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QnOHANPLhvye7unR0exx4XSILmtSfVk4x/zpNffxXpe/pgNeVm6RpD2HkzzMHhX4pIk0dQ9CM9fU2YuZzTMlgdyO7SBW2MleBNL99acTU4qkwfitgd06wxovBrUckL3lSpRYbpff3B/Pc38xgwTFccQywCTFYnmTMBykgbEB97k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H7Szq8Gu; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b78294a233so4857946f8f.3;
        Tue, 12 Aug 2025 13:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755029032; x=1755633832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bx36rtz4vhcWaH454gaUvtI9OXK3b3K0B2VXo5b8SDE=;
        b=H7Szq8GujJKwlnjpFz4wZj4aeYhOb2B6lBb6h5m6vTt9i1BofycAvLcL2XpmHCBMB9
         JKH0+OMYQKOGwURKfim5UzcD/5b289Jn4JgZtisNcIsftC2y9hb6ksxzGhtDosOo6a+m
         ZhIU3RKiNB1J56iQNFBR1RkUbrpeLXL4bqYaumAt4piz2gqcz+UoBWE1f5zeJ40Dc22S
         C9yTOhCufBz4oo5Q6978bqpoaXCmJ50sU3TVbSolkEdpcxmN2KRgliEIC0SrrV7DTcb9
         0axpt1yeIg07Tmu3/3R+Ev/SyxAJoIUWJEq049As6QNQylN5p5UZHHKgjVdcfYobDkxb
         TxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755029032; x=1755633832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bx36rtz4vhcWaH454gaUvtI9OXK3b3K0B2VXo5b8SDE=;
        b=Nk6O8s0XGkt7PnG6YHSk4MNK2yJxT46EV0hR4pJUVS+aS3XUJAn6xl7WBjMLNAU2Gp
         JweDDUrgos5XZDn3gTXW1eqatu83haH+BQU9+W0orVcgy9rVZq3FKxUmQOW4LPfXJG2U
         iZVBFOIIhFj7Fttp4MTA1PvLNgCNSAj2yF0AhYLmF6LNmBLQAkKGQp5Cj2/z9TW7poHG
         QPfv3CB29pYgWhhVr738Tun49ncLT1Ws7JUR6WJmxZ87Pok9fj+/dAhyS1Eaf6U2735V
         XGACgddMjeAvRd7fghO9VApqrU6AvZEwMB7gnf/ARm2h2NG3QJy+70rpUoPxqlyEuOU0
         gaDw==
X-Forwarded-Encrypted: i=1; AJvYcCWE7/RQNzVQRCQ1bliJHxCmhxFACBOe4c6uispH71sBhAGLAkVAIq3xQySXgjOIuYCWGNvJHG8ag0mw@vger.kernel.org, AJvYcCWMJPPP2gN562Evj6lCeMP+iI9ygAhieFBP2JhPcBaDXrUOft86xcWd7+k/Pgi8UK3upU+pazxJi9Mm/qHK@vger.kernel.org
X-Gm-Message-State: AOJu0YzaE5pCW2VtTTvYXrEZHm08WCGjI8FIwEZdQ9cevpm1ddhC54p9
	DBGbtTAYsKadX02BZbjMwkVfwmcXcvd+fLdt6bY9MicxITVJZq0t8XLq
X-Gm-Gg: ASbGncsWEbSaclKk+AYACedTlHTXwDkG6rXaT+YcUBQvL6oAdj1tJ688OmMtnHILeAC
	RYBDeA4a/yrbmDgGwAlq2p9hUetRkwJqIeFcEcBYa4jhxHQAcvlpFVz2PnQ0xtEDwKTl4mdxSdy
	e0Uw0PFYgONfkiL6bZXbh2WqPjNpi8a6iyJcxcS0YQBxbQgWqSFBO4YKiI71YwPptJt/jtPTxs6
	KltVvrziIJAb90Iucf3AjgZpteS17mJrRdoHaUUeuMz2eBF6jNqT6Vvq8y/Z5zkVQ17pC256o0c
	3H7r0T+IDYz8kw1z3vFcr5fvibyBBBvdlVv3nZ/7bMq7wlck/P34dQrTjE0PL8YTZ06j7qyuoDc
	R57kTJgRAZuFY4uCIhHpSmZGBb5g66SP7pCyhCWe2EEC73W/aD3CMsXGbe3NXjUqCd9pf5dkoGQ
	==
X-Google-Smtp-Source: AGHT+IFQSZ829ATgZ+DJhoqv4hLAwukRKdK+DHbZF/jlRnZflueSx7QSE2qI3iuKvUSS5jKybmriqg==
X-Received: by 2002:a05:6000:4029:b0:3b9:55b:5bbe with SMTP id ffacd0b85a97d-3b917e2f1c8mr224342f8f.10.1755029032391;
        Tue, 12 Aug 2025 13:03:52 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a16dde163sm297645e9.12.2025.08.12.13.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:03:51 -0700 (PDT)
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
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 06/13] arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Add user LEDs
Date: Tue, 12 Aug 2025 21:03:37 +0100
Message-ID: <20250812200344.3253781-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add USER LED0-LED8, which are available on RZ/N2H EVK.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
index d6ba14a26f03..f6437e82a7de 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
@@ -7,10 +7,64 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
+
 #include "r9a09g087m44.dtsi"
 #include "rzt2h-n2h-evk-common.dtsi"
 
 / {
 	model = "Renesas RZ/N2H EVK Board based on r9a09g087m44";
 	compatible = "renesas,rzn2h-evk", "renesas,r9a09g087m44", "renesas,r9a09g087";
+
+	leds {
+		compatible = "gpio-leds";
+
+		led3 {
+			/* DSW18-7: ON, DSW18-8: OFF */
+			gpios = <&pinctrl RZN2H_GPIO(31, 6) GPIO_ACTIVE_LOW>;
+		};
+
+		led4 {
+			/* DSW18-9: ON, DSW18-10: OFF */
+			gpios = <&pinctrl RZN2H_GPIO(18, 1) GPIO_ACTIVE_LOW>;
+		};
+
+		led5 {
+			/* DSW18-1: ON, DSW18-2: OFF */
+			gpios = <&pinctrl RZN2H_GPIO(22, 7) GPIO_ACTIVE_LOW>;
+		};
+
+		led6 {
+			/* DSW18-3: ON, DSW18-4: OFF */
+			gpios = <&pinctrl RZN2H_GPIO(23, 0) GPIO_ACTIVE_LOW>;
+		};
+
+		led7 {
+			/*
+			 * DSW18-5: ON, DSW18-6: OFF
+			 * DSW19-3: ON, DSW19-4: OFF
+			 */
+			gpios = <&pinctrl RZN2H_GPIO(14, 3) GPIO_ACTIVE_LOW>;
+		};
+
+		led8 {
+			/* DSW15-8: OFF, DSW15-9: OFF, DSW15-10: ON */
+			gpios = <&pinctrl RZN2H_GPIO(14, 6) GPIO_ACTIVE_LOW>;
+		};
+
+		led9 {
+			/* DSW15-5: OFF, DSW16-6: ON */
+			gpios = <&pinctrl RZN2H_GPIO(14, 7) GPIO_ACTIVE_LOW>;
+		};
+
+		led10 {
+			/* DSW17-3: OFF, DSW17-4: ON */
+			gpios = <&pinctrl RZN2H_GPIO(2, 7) GPIO_ACTIVE_LOW>;
+		};
+
+		led11 {
+			/* DSW17-1: OFF, DSW17-2: ON */
+			gpios = <&pinctrl RZN2H_GPIO(3, 0) GPIO_ACTIVE_LOW>;
+		};
+	};
 };
-- 
2.50.1


