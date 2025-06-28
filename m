Return-Path: <linux-renesas-soc+bounces-18871-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78389AEC5D0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 10:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CB52189770E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 08:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A651AA1DB;
	Sat, 28 Jun 2025 08:26:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA524D8CE
	for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Jun 2025 08:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751099190; cv=none; b=r0o9qfLaedJ2cB7D+PDKCUKSuJiLLvlAus1T8mY6hUOoyIklZNhJ1mEvc8lLV5dTe2mIGZ3ELgUmIOgCLbZJfm5DDTmwLwge5IL0R8rk8z76TzgQ3JNzVpfCzkd6ZMtK/0JcT1OcnPMHzACk5KQ1OCSyHbM6EJ0KgcfdcS2fguE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751099190; c=relaxed/simple;
	bh=D6cw5PAQB+H6W96Lr/dXHT7iydk2vVrXGPsE15RX+5M=;
	h=From:To:Cc:Date:Message-Id:Subject; b=C5pgYSR6nan0vfvaxr6Ubnpw2tWPHnUhKT5zU3/iDiJSKSzJiIspVyG3NhxDyK/zMoVrBi9kyAXhh4hl+nswACVNY6xHJHRF9sSFnQh9ufjGXoc2smR9sN6YH9IIoj2UiFeUMxaVBLFpOjYccXlQeeBmbG2LcGwRMGR9vbf5Lrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensource.se; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensource.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7d44c6774e7so20927585a.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Jun 2025 01:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751099187; x=1751703987;
        h=subject:message-id:date:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pqxlD867LJEH8ye+YnQcfmgYrVVn17xie1T6sSlP+HA=;
        b=RhpU0RCOWCRHy8hJs/5J3jGjJA8dxgrWugMPfFjzW0lNjDecEFOd252kOdw/g5yxOl
         N4xZD5ak+v4siwSHH2G52jlnA6rc4WeV0gmJn/JKlP1229jWb0dqGmw8c4uzUjctsh9V
         5XOjqoDaQTEZUt61u432euxTK5QnS4U0GUAX/3Sb8TWsJzBXBr0LFleuHTsQQp0UBruD
         h3hLQQIQfHP+twr1YrmBvU2NBOZOR+wJ+opAsoPiOOyRXxBOIhLpG+KEt2oHasRBw+CO
         x7C3SCZQizC+maFY4ag/yQ4ePy6NoCudy+PTlfYvUIxqenJorVa4VqA7Ux5r5p7f7o1I
         Ulaw==
X-Gm-Message-State: AOJu0Yw4+CeQIDwEoSbIkbN28B6QNGFbF8S2zE/LsGSiWpOPvT+/IqcG
	Tt4gWnMfKgINsnSua1n7V52KYvrejndljT/7koe2di2YeuW7p4UwkK5QqGLw1WB5pBE=
X-Gm-Gg: ASbGncuK/ic+/yTMTA+ckd1un7mNHF9lHHH0BEPMEO3xVot8ltX8/0DZyHry0cQ7GAo
	dLq42Lknuf9rra0M6cyEio2whyC003EBEtMXhSp/8L0MH9QTjb2Yr4UnW53SHWxWsFlWA9aTVoV
	I2fWee5+uMiEyqx8WyQgbiCV0wUAXe1DYtQl90bNOAcJd8gMxZtbglAo5wtD7hJPSH4ZsSDGdke
	PJem+uZqH+Gi8G9LAl3AkVsFU1S1dKwUJUfN6bUs1h6XlvWvanL6hEb9QBFyfSJj5nKexOgH38C
	U6i63psO7E5moPQeX8jtKQyIPjSwmf1iHGvBwFfQLv6sBWNhG9YItzI+bkf1W+wjPpEl1jKpWe9
	87UEqW9zXldnNc5/m8Q==
X-Google-Smtp-Source: AGHT+IGd3DaapCJ5yrGxKuNzRj7Myb2eEEoB3fkj9rfMdNHbSlPhW0bBVqKUazAkTm2+pSO0fCEgvg==
X-Received: by 2002:a05:622a:2d2:b0:4a6:e7f7:5742 with SMTP id d75a77b69052e-4a806caa7a2mr37769491cf.33.1751099187001;
        Sat, 28 Jun 2025 01:26:27 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([167.99.4.198])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc55c252sm26109981cf.43.2025.06.28.01.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 01:26:26 -0700 (PDT)
From: Magnus Damm <damm@opensource.se>
To: geert+renesas@glider.be
Cc: linux-renesas-soc@vger.kernel.org,Magnus Damm <damm@opensource.se>
Date: Sat, 28 Jun 2025 10:26:24 +0200
Message-Id: <175109918476.52629.8694334943062364426.sendpatchset@1.0.0.127.in-addr.arpa>
Subject: [PATCH] Update r7s72100 Genmai DTS to include NOR Flash pinctrl
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

From: Magnus Damm <damm@opensource.se>

Add pinctrl configuration to the Genmai board for the NOR Flash on CS0 and CS1.

Signed-off-by: Magnus Damm <damm@opensource.se>
---

 arch/arm/boot/dts/renesas/r7s72100-genmai.dts |   52 +++++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 
--- 0001/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
+++ work/arch/arm/boot/dts/renesas/r7s72100-genmai.dts	2025-06-28 17:10:55.537223414 +0900
@@ -99,6 +99,9 @@
 };
 
 &bsc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&bsc_pins>;
+
 	flash@0 {
 		compatible = "cfi-flash";
 		reg = <0x00000000 0x04000000>;
@@ -211,6 +214,55 @@
 };
 
 &pinctrl {
+	bsc_pins: bsc {
+		/* Dual 16-bit Parallel NOR Flash in Serial on CS0 and CS1 */
+		pinmux = <RZA1_PINMUX(6, 0, 1)>, /* P6_0 = D0 */
+			 <RZA1_PINMUX(6, 1, 1)>, /* P6_1 = D1 */
+			 <RZA1_PINMUX(6, 2, 1)>, /* P6_2 = D2 */
+			 <RZA1_PINMUX(6, 3, 1)>, /* P6_3 = D3 */
+			 <RZA1_PINMUX(6, 4, 1)>, /* P6_4 = D4 */
+			 <RZA1_PINMUX(6, 5, 1)>, /* P6_5 = D5 */
+			 <RZA1_PINMUX(6, 6, 1)>, /* P6_6 = D6 */
+			 <RZA1_PINMUX(6, 7, 1)>, /* P6_7 = D7 */
+			 <RZA1_PINMUX(6, 8, 1)>, /* P6_8 = D8 */
+			 <RZA1_PINMUX(6, 9, 1)>, /* P6_9 = D9 */
+			 <RZA1_PINMUX(6, 10, 1)>, /* P6_10 = D10 */
+			 <RZA1_PINMUX(6, 11, 1)>, /* P6_11 = D11 */
+			 <RZA1_PINMUX(6, 12, 1)>, /* P6_12 = D12 */
+			 <RZA1_PINMUX(6, 13, 1)>, /* P6_13 = D13 */
+			 <RZA1_PINMUX(6, 14, 1)>, /* P6_14 = D14 */
+			 <RZA1_PINMUX(6, 15, 1)>, /* P6_15 = D15 */
+			 <RZA1_PINMUX(7, 9, 1)>, /* P7_9 = A1 */
+			 <RZA1_PINMUX(7, 10, 1)>, /* P7_10 = A2 */
+			 <RZA1_PINMUX(7, 11, 1)>, /* P7_11 = A3 */
+			 <RZA1_PINMUX(7, 12, 1)>, /* P7_12 = A4 */
+			 <RZA1_PINMUX(7, 13, 1)>, /* P7_13 = A5 */
+			 <RZA1_PINMUX(7, 14, 1)>, /* P7_14 = A6 */
+			 <RZA1_PINMUX(7, 15, 1)>, /* P7_15 = A7 */
+			 <RZA1_PINMUX(8, 0, 1)>, /* P8_0 = A8 */
+			 <RZA1_PINMUX(8, 1, 1)>, /* P8_1 = A9 */
+			 <RZA1_PINMUX(8, 2, 1)>, /* P8_2 = A10 */
+			 <RZA1_PINMUX(8, 3, 1)>, /* P8_3 = A11 */
+			 <RZA1_PINMUX(8, 4, 1)>, /* P8_4 = A12 */
+			 <RZA1_PINMUX(8, 5, 1)>, /* P8_5 = A13 */
+			 <RZA1_PINMUX(8, 6, 1)>, /* P8_6 = A14 */
+			 <RZA1_PINMUX(8, 7, 1)>, /* P8_7 = A15 */
+			 <RZA1_PINMUX(8, 8, 1)>, /* P8_8 = A16 */
+			 <RZA1_PINMUX(8, 9, 1)>, /* P8_9 = A17 */
+			 <RZA1_PINMUX(8, 10, 1)>, /* P8_10 = A18 */
+			 <RZA1_PINMUX(8, 11, 1)>, /* P8_11 = A19 */
+			 <RZA1_PINMUX(8, 12, 1)>, /* P8_12 = A20 */
+			 <RZA1_PINMUX(8, 13, 1)>, /* P8_13 = A21 */
+			 <RZA1_PINMUX(8, 14, 1)>, /* P8_14 = A22 */
+			 <RZA1_PINMUX(8, 15, 1)>, /* P8_15 = A23 */
+			 <RZA1_PINMUX(9, 0, 1)>, /* P9_0 = A24 */
+			 <RZA1_PINMUX(9, 1, 1)>, /* P9_1 = A25 */
+			 <RZA1_PINMUX(7, 6, 1)>, /* P7_6 = WE0/DQMLL */
+			 <RZA1_PINMUX(7, 8, 1)>, /* P7_8 = RD */
+			 <RZA1_PINMUX(7, 0, 1)>, /* P7_0 = CS0 */
+			 <RZA1_PINMUX(3, 7, 7)>; /* P7_8 = CS1 */
+	};
+
 	ether_pins: ether {
 		/* Ethernet on Ports 1,2,3,5 */
 		pinmux = <RZA1_PINMUX(1, 14, 4)>,/* P1_14 = ET_COL  */

