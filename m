Return-Path: <linux-renesas-soc+bounces-24780-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CE802C6E26F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 12:10:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E43C24F2C35
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 11:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D95D3502B1;
	Wed, 19 Nov 2025 11:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hPa/0tZJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBA934B1BB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 11:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763550320; cv=none; b=KEDqBrPjUEkLORgaczm3p33boaJRwp/sT2Og7Dovcvsz5wK/ctTShdJIIxS0hqtAUqAGrI+ccYmqMjjcBibF7D7BOT3OfTnf9yIBroB8mOvHwnncHMlJom0QMaXcC5at3YIVjadCKY1oapkJonGQLtpgeSsuZJLnwblP8g2CzKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763550320; c=relaxed/simple;
	bh=3Feu+k9QWyqkb9zOfv/7oPEl3Wjlo/ZRx5aXS0JKYP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V9BPHG26CrCdLvX2zEu4gMN8dYUfbv1ZIL+FgFnFUtIfdcuj+YeIoqs5nv23BTnKIssZxxa3yYyj6+fFKgPvm6tefFg8UuFdmRTmRsOh/0e5NEdbtxUHKsQT3DoZcHDi4Y6BR+x2xE7GcHQA7GiDuKBQClXdv/q5Ckn+IbKwYyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hPa/0tZJ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso16391275e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 03:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763550314; x=1764155114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJeVKZBCcvhGYLNqGVN+0rfECzO2YMUZRedlclphY+4=;
        b=hPa/0tZJdhktxPOnxdqdfGHKn3gXsC1Ds3K/ZNk5K1Jf+Uox+OaDjM/KtGy611pLlK
         qoekT8QFtrpz5abCGMbMFAwqsElML6hQUOhDc98AdRkWWRdOer3mA9Bw4HlujmeIEqig
         PfYVwnjWbxOXAeD0Z+Pzo4AuOJtlvBqrliMVI8Y54E1NLPcBg31P0bAVFl8z9oNgF9Pg
         JQUh2SitZ+ZyHgOUQ90PByUP5qberTW9vZtSMZneeJNmFP8l8sERq5UMA6H/o2Er5wD6
         C5tQj3WLhzFqk6/YdZtxxns/T1BKcihOz/cNzCqeePuAkr3Yvu8sCNEacomP+qNcaLqQ
         i6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763550314; x=1764155114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yJeVKZBCcvhGYLNqGVN+0rfECzO2YMUZRedlclphY+4=;
        b=Jk7V45/vxZCGzynNrKu8CeBEGoA16mC2Ca1p2p+SCNV2jOiBeszsSrnha9UJPE6F9a
         bMvPIPUGphQS2FxbA0/2xm3nlsPrliiyr6nS7Q/my/V658x6CNSC28USh9S8lolVmfeq
         TabRGZhc2jU2euvrGjC5p+z3mSe4qCPnLbQfYL9PpIIxLlyyoRi9xOu1IbaeDXytLIl2
         ZWIsBjG8EQMKToPysxfDJIQJ8HVtKIMM1/CiCsVsTt9SNUcnPQY6qH8IMbxvQXvXPbhp
         107kTNBE4hI+HIXc6EVvag5w6YjR+XWXPhbbAqZCJul7CCvj3pN6ztwmXZKLglQiaEmS
         Zz9Q==
X-Gm-Message-State: AOJu0YwD6lVWYtnVEdBbgfnyj3t7ii09nQ3PD2/b1o5IVHLcWb9N8qrr
	nAAejlQcuLZGTmYEJ5vxeuaiKFi8ukM0w080ykNE2YcKE9rHn9dsZoqR
X-Gm-Gg: ASbGnctEHdwP1lLcDHLk5EchPEvXsp5BDQL6uFkvxdDvVhErtU0qM8JcZSfmVqf9Mv/
	NyeFuJOFrS+Be6ucAVEr+3b+hL0wrvPmwcS6hMXqglkbIfLkENiTH9uzToP2WG/n3x9IveRqMCW
	+I8OmNWaMmh26xLK9NZIWXqAflZh3K8T1dGvfdsOubbnSzsi9jEgUIN6sHtf39FJgnbu2a8T7Xo
	bLWKlw/ufDVP+EadqSQyWXiOl7goqGjrFZP7E39CpP/992LDNsFh7Bj0MeazhLhIfEIa+45WZSV
	ldk0vgtcsQ7BFcIi48KV1KNKSZyfQgs2Xf4HCFO4PKjndLmVp9I/wSgp3eBZqFeXMVJejSKAbpk
	Uy84hMnix/PScf90YZ7rwQMSQPJbtxQ95tWUGgRUhY0d09ex6DtDEN28aY/B4N728XWIvsWaAxp
	xxaaoKCTpDJG1lsuj7MVf6k1nH5afUON3swhY0Ebv87G/Ikw==
X-Google-Smtp-Source: AGHT+IGsWH5lDpaWJ5T4pbKdnN1loDHhx22TKJiTrU+d0dt7GrHtqi5/gebxQMfUGgTnk4LUUV+5xQ==
X-Received: by 2002:a05:600c:35c1:b0:477:54f9:6ac2 with SMTP id 5b1f17b1804b1-4778fe1170fmr232458705e9.0.1763550314052;
        Wed, 19 Nov 2025 03:05:14 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:4b7e:3ed7:e0b3:cf30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9d198a0sm39884505e9.1.2025.11.19.03.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 03:05:12 -0800 (PST)
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
Subject: [PATCH 2/4] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable USB3.0 PHYs and xHCI controllers
Date: Wed, 19 Nov 2025 11:05:03 +0000
Message-ID: <20251119110505.100253-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251119110505.100253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251119110505.100253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable the USB3.0 (CH0) and USB3.1 (CH1) host controllers on the RZ/V2H
Evaluation Kit. The CN4 stacked connector on the EVK provides access to
both channels, with CH0 corresponding to USB3.0 and CH1 to USB3.1.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index d2d8ff3cb844..dd6f19d99a3e 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -687,6 +687,16 @@ vbus {
 		};
 	};
 
+	usb30_pins: usb30 {
+		pinmux = <RZV2H_PORT_PINMUX(B, 0, 14)>, /* USB30_VBUSEN */
+			 <RZV2H_PORT_PINMUX(B, 1, 14)>; /* USB30_OVRCURN */
+	};
+
+	usb31_pins: usb31 {
+		pinmux = <RZV2H_PORT_PINMUX(6, 2, 14)>, /* USB31_VBUSEN */
+			 <RZV2H_PORT_PINMUX(6, 3, 14)>; /* USB31_OVRCURN */
+	};
+
 	xspi_pins: xspi0 {
 		ctrl {
 			pins = "XSPI0_RESET0N", "XSPI0_CS0N", "XSPI0_CKP";
@@ -753,10 +763,30 @@ &usb2_phy1 {
 	status = "okay";
 };
 
+&usb3_phy0 {
+	status = "okay";
+};
+
+&usb3_phy1 {
+	status = "okay";
+};
+
 &wdt1 {
 	status = "okay";
 };
 
+&xhci0 {
+	pinctrl-0 = <&usb30_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&xhci1 {
+	pinctrl-0 = <&usb31_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &xspi {
 	pinctrl-0 = <&xspi_pins>;
 	pinctrl-names = "default";
-- 
2.51.2


