Return-Path: <linux-renesas-soc+bounces-32794-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDQKIZI1DGoKaAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32794-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 12:04:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACB057BD5B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 12:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C43030A18E1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 10:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8E4639DBFB;
	Tue, 19 May 2026 10:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lv6ymv3k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDB5478E3A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 10:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184833; cv=none; b=jZDzE0hMSDt/doAX+KrnVOclbOxk09rzYH2QCixM9yXjz4uIITsyQ6kV47Cl2pJJL2m30EFRxb3lFxbTT/lqRf13NKtsQzXNim5nwCsvGNkMWnbCMyXsEmZ2uVfuWRoU1MMY+bwyLOrB0BHMQR3cFmgFAjuKXhTZPAIhMY6X184=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184833; c=relaxed/simple;
	bh=5j0u2RnxP0jHys87rxUZZRx3osWfqXXcqHUccp6KK0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T7a+JxtcIxR6Zij13RjXXWElKTRZcJtfwqNptVN/6j0xSlNQSex+IDsxk/cUFUs94z1WleRYga/TpZ1LHoVDg69KjlgJQIil4VzxBVj1Uv7XzGLT8mDuJempmwS20YRIEfzC3HgbdDeYhVejeC5cQELL8DZQBkuGA12HgW/zXF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lv6ymv3k; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490229aa522so1323415e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 03:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779184830; x=1779789630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnXM6WilpGB4pMHM/1Iw3JNt6TTKPPLJJFtEz5cx7fo=;
        b=Lv6ymv3kZIzzeIRcQo3Lj0qUKnU0YrnGGLFxOzcgNskArU27k31GSrlLO7/Q1MTrVs
         vaOCr7giUtKJCWxu+rm1x/7LzXgabzmrV3sgnEklwT3kikZo4rYDWSWVj+y38pGbjOuM
         1I+ZywOqcrruNMxpNgcvwETLAtRQ400XDhR7racbS9PMZTJrfRb378oBWC5ZL8U5aMwu
         caQrr25q2rKqKfq2Zi0mxgn21FRI39zdJq0CSz1LNSO78nURc8430JtwcYAeArPeWfcD
         TW6UxlMs8kYHNbIglltDuXzw+xHKufm4rg0piRfLzGkHk8rVqejlBy/yWYkgnuEa6Eh3
         6TUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779184830; x=1779789630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tnXM6WilpGB4pMHM/1Iw3JNt6TTKPPLJJFtEz5cx7fo=;
        b=nx1mUKixrYrwyO+k1IUoaV9su1OkRZGDxXBTdKRt0IEfVNaLfnRdcErzuc19Wu7S1U
         xgUueRqdSzgfxma108qCMjT3BganhBvO6oNN23g5BT8Qoanl3bdFH1FNPkRxn29XsW6f
         NvxeEt4tdzHE363yXFkj2eHx+cQPr3PATEmYsPPKc3QDcy5YNpsECHf2v7i9/+doo15q
         yG0Nl9jdS3TV8pjPnzhsRg0VAwriEvhfqKbOhk3W918Cn7BcL+/4KBHoydSxIJzA5b/B
         J0mP6JYadEmmteV5GBG98U0aUGNztW0kfuGUs8Xi1b3VuDjgNUBzqA3dl2khcuWSr+mp
         NLOg==
X-Forwarded-Encrypted: i=1; AFNElJ+OF5y9uMJX74iTz4tMVoRybHlydZtH4RduHt6SUK1iiULaAOf28JZfKgl5Ypv2szyJ87hsqGpMaRIpjjV14Ok1GA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSG2IrCIspjRLOFAHMoI39x3TpLz2uO4BTPJgdQKk/5kDjSXyq
	+WiQ4y4oGuKyKXSleYA4FPuUFmRk0znAF4kAdC/0WyR2Xk62u8xpv3lF
X-Gm-Gg: Acq92OEg+wI4PD1ltfJbSXUz9cwQarQR1SJTQ+l7wDaBPf6LpMMllOgVT/0Xxgt/xd1
	RHzhpBI3T6vLqVN0mkuIHgYolHXRESlCC8pxY2+tMfM7kImkj4+xtTS/g6nuzFPVuq1IlrZSkuJ
	Eigg25I8Gn+MTgXv80HJUvlCi2wECNS45NJfi0RF/+sBQwdBewOZneuHa94cIAzzGwqJBzU9Flb
	tsdWrHbIeckBAFvuOVDYEluu2yLSmbCfTetc/S9ZiPLIkfhJeJeE6n1+PADmnHc6JGOSHw9MmFo
	HY54QH80AkDMMOEevKbmpFYGWdo/ElEFDepS+ycBEaq2tKEJ4R3ZvmtC8xrY2QZubNpzX1ceIo4
	zs8jyHo/6lW3WJQ54wLpDH/PV/ZL2CbqrLuO0c5JrRhJf86dzDAb8J1t8M05ayLo8A4yIA8UuD4
	6Vq02fZE6yfR6q7l8PqCZxD71AF6Dy6bsgX8NK1p9DVl6f0LGr
X-Received: by 2002:a05:600c:c10b:b0:48f:d1b8:9aa4 with SMTP id 5b1f17b1804b1-48fe5fcdef4mr223994295e9.7.1779184828001;
        Tue, 19 May 2026 03:00:28 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:4abf:a82a:41d5:6663])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febc56f89sm131791455e9.3.2026.05.19.03.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:00:27 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 2/2] arm64: dts: renesas: r9a08g046l48-smarc: Enable rsci{1,2,3} nodes
Date: Tue, 19 May 2026 11:00:18 +0100
Message-ID: <20260519100022.116318-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519100022.116318-1-biju.das.jz@bp.renesas.com>
References: <20260519100022.116318-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32794-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 0ACB057BD5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable rsci{1,2,3} device nodes for the RZ/G3L SMARC EVK.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 80fb4e53c24b..ccc0decd89ab 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -13,6 +13,7 @@
 #define SW_DPI_EN		0
 #define SW_GPIO4		0
 #define SW_I3C_EN		0
+#define SW_SER0_PMOD		1
 
 #define PMOD_GPIO4		0
 #define PMOD_GPIO6		0
@@ -37,6 +38,9 @@ / {
 	aliases {
 		i2c2 = &i2c2;
 		i2c3 = &i2c3;
+		serial0 = &rsci2;
+		serial1 = &rsci3;
+		serial2 = &rsci1;
 		serial3 = &scif0;
 	};
 
@@ -134,6 +138,30 @@ i2c3_pins: i2c3 {
 			 <RZG3L_PORT_PINMUX(2, 1, 4)>; /* RIIC3_SDA */
 	};
 
+	rsci1_pins: rsci1 {
+		pinmux = <RZG3L_PORT_PINMUX(D, 4, 5)>, /* RSCI1_RXD_MISO_SCL */
+			 <RZG3L_PORT_PINMUX(D, 5, 5)>, /* RSCI1_TXD_MOSI_SDA */
+			 <RZG3L_PORT_PINMUX(D, 6, 6)>, /* RSCI1_CTS */
+			 <RZG3L_PORT_PINMUX(D, 7, 5)>; /* RSCI1_SS_CTS#_RTS# */
+		bias-pull-up;
+	};
+
+	rsci2_pins: rsci2 {
+		pinmux = <RZG3L_PORT_PINMUX(7, 6, 5)>, /* RSCI2_RXD_MISO_SCL */
+			 <RZG3L_PORT_PINMUX(7, 7, 5)>, /* RSCI2_TXD_MOSI_SDA */
+			 <RZG3L_PORT_PINMUX(8, 0, 6)>, /* RSCI2_CTS */
+			 <RZG3L_PORT_PINMUX(8, 1, 5)>; /* RSCI2_SS_CTS#_RTS# */
+		bias-pull-up;
+		power-source = <1800>;
+	};
+
+	rsci3_pins: rsci3 {
+		pinmux = <RZG3L_PORT_PINMUX(8, 2, 5)>, /* RSCI3_RXD_MISO_SCL */
+			 <RZG3L_PORT_PINMUX(8, 3, 5)>; /* RSCI3_TXD_MOSI_SDA */
+		bias-pull-up;
+		power-source = <1800>;
+	};
+
 	scif0_pins: scif0 {
 		pins = "SCIF0_TXD", "SCIF0_RXD";
 		power-source = <1800>;
@@ -147,6 +175,37 @@ ssi0_pins: ssi0 {
 	};
 };
 
+#if SW_SER0_PMOD
+&rsci1 {
+	pinctrl-0 = <&rsci1_pins>;
+	pinctrl-names = "default";
+
+	uart-has-rtscts;
+
+	status = "okay";
+};
+#endif
+
+#if (!SW_DPI_EN) && (SW_SER0_PMOD)
+&rsci2 {
+	pinctrl-0 = <&rsci2_pins>;
+	pinctrl-names = "default";
+
+	uart-has-rtscts;
+
+	status = "okay";
+};
+#endif
+
+#if (!SW_DPI_EN)
+&rsci3 {
+	pinctrl-0 = <&rsci3_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+#endif
+
 &scif0 {
 	pinctrl-0 = <&scif0_pins>;
 	pinctrl-names = "default";
-- 
2.43.0


