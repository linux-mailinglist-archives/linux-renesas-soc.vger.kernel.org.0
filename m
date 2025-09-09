Return-Path: <linux-renesas-soc+bounces-21675-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01094B504FF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 20:10:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 453C77B37F5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 18:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31DFB36C07F;
	Tue,  9 Sep 2025 18:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZrN/Uk+W"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52443369326;
	Tue,  9 Sep 2025 18:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757441297; cv=none; b=PqCad9wOlhba2t9k8ye1YJDBk5aK8LnyNUBHVzOQQ79XERT7Y8CZ5WnJmkJIr0G+XKxgo9kP/r2XwN2QOiWNbNLKP5r4RSKfKM2LDAI8QRQLdPB6FJwCl00p4KzT4NKX5oYZyRqGd47/8ddpJ4I/hkaHod41ywHtTtWtMpMuYK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757441297; c=relaxed/simple;
	bh=vtrWkI+M/eJfmlWbPiRKOvUFAEXyVqoNTvKuBoAG09s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DhWv1phsU7L3dhrLHD3w3oDher/a9UUYwgxIKqX1FpP5X+lA3SYDzh0ndzNI25wHFjgWAo3MpL9qpo3Bx7Vl4g36ZO8Je18bYk/kZiW64I6V/mQkFJ6ONnKOMA1RxGBrCQBGl1az2WhCVuyZsXaNAMPW1NMy/aeEUZP4qRyqtJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZrN/Uk+W; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45cb659e858so41399785e9.2;
        Tue, 09 Sep 2025 11:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757441293; x=1758046093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdKg4szl5Te8BvPOWQxR6OjytHckbCnR5FJxWcAlRuM=;
        b=ZrN/Uk+WjdecyoAq/lUpw07efL8uEekFI/sY6pVIXFQ+O/RI5HBiC9um0b/UNRdxOp
         e/SGKRtYPbIn3tPgTTzF9GMHxq5zxbkGZ9IMg8pc54BQagC9S7UK1f0WXNKrfs6bpf1B
         TKDwtpqyL8Y2itZoofrju285XwJIihDrQV35IWa8y6em/xga67HvSkN0VXY/E2i8/XLK
         iF85THlTJvBOUwm0fCXlDv2OxTu40KER0i8/6wKq4dDfHojQ2qaU+Oj8KgCeORhhQvVq
         jxaFM6chXBpVC1/WrFjIjZxXdn2mPbx0EKrQ6+J+oeNnGJEU7qSkxPc9/+uyxjbTcede
         qHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757441293; x=1758046093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xdKg4szl5Te8BvPOWQxR6OjytHckbCnR5FJxWcAlRuM=;
        b=oZRVSSEWISFneS2HzplO6ER/syx3+KlR81sgTonukxS5IQR4ZCJfLdifW58yfhim0/
         kQM2In1OGMlnZphlmDR/r8hJ0hqwj+MZryC0Rhqls9vOvtMfRC7f/0ldF+6J1g+dT5os
         1Asu9zGliO0dQVXiL+42VQMijk1sv7SNrho7zDu25wgVKDDGa6KzbnxPtF74VYKHPUUq
         VxcQ6ccjlPeT/Bf+PbaJi96BNMRA0dk6MCszxsCDZiY5TyASqJhetEv17Gn5kHGCjjtQ
         PpcoI2UW9Dk1xQd9gWOQEEGLCsuWDrBS1anfy9c+XjugJ/BzcZPaaOAPr17GDdsI6Rdw
         8tQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5Zsyx1cQLWI+khtCniftFT2Q88QELoMqhHnXmcrh+4qOjPKjyrnGqFX+R0HqhT9pYNapglQMKJWKa6shY8BPyc0A=@vger.kernel.org, AJvYcCWiIowYVp3YRF6lzPIPXWePSyp6Q55Wu0Hw21O8U/LEOOVNEFWptAwG0Jl+M2QHTuw2SpAWeFIXFNK8t2fr@vger.kernel.org, AJvYcCXieMrZKx198fg1yVVl3jtIIRFV2+JfNBS2EcIyIlGhniC3IcY5dIfe+BdtsXt4rqcCmq/NCC/rux0c@vger.kernel.org
X-Gm-Message-State: AOJu0YyxoljI2zj6eOdgRqHaoNW2LXxap1rhXsvjn7ZC4ZhUCS9/Tp5V
	jEAHPykUS9omtP6Uyt8AVHoapG8dT+injO8QViq7vBG/3Q6mmYHrbgipUoxOT6NE5O4=
X-Gm-Gg: ASbGncuLGEiGziHP6bdT7yT9wO1pn2HwWxTjUbQDTz1JgJ8iSqVXmKy8n3qAVP195/1
	8KGto7beNU/x9CsIi46heERccvKrDuBdnKvt0rUveT8+vXEkp4VOroVvd73BpC3IjfMTAUcNQcy
	nma4ad/n65C5iL4fUXRzjSRUFXFVnh0SeCrwiTxXlLAZ0T/eCqWk8G2JYJzLtiaTN1YkIZwcpG4
	oR35FYDBnNjTkIg6veeCJSWAtmFpwBTm4n7HQpimZdGX62JZDLtsXgOnIF+ZpF9C3e6lRu/7vG1
	wG8Stbc/1Lh9J9I28ocKXmDdGHeWSHJJH7Y0PgQg996t9So89GEqbhIYwXr469ScA6MnaztlaQL
	JyOT7REX5BTwNWUqu56mKJAUaRk71MeI0o9Q0sDp45TyUu8hPkORX7R5mO73Zdj/cngmuNWd6vo
	trFaUeJVW5cEDj
X-Google-Smtp-Source: AGHT+IFJBGB/kgj0IdxOsPde1cmLlLagJGRaYCT/r7sd2TTjzyHG4K1Bk9pr53n1TK3LinysTRV3rw==
X-Received: by 2002:a05:600c:1e8c:b0:455:f187:6203 with SMTP id 5b1f17b1804b1-45dddef01e4mr95011025e9.27.1757441293333;
        Tue, 09 Sep 2025 11:08:13 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df679a4c9sm4174015e9.3.2025.09.09.11.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 11:08:12 -0700 (PDT)
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
Subject: [PATCH v2 10/11] arm64: dts: renesas: r9a09g047e57-smarc: Enable USB3HOST
Date: Tue,  9 Sep 2025 19:07:55 +0100
Message-ID: <20250909180803.140939-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250909180803.140939-1-biju.das.jz@bp.renesas.com>
References: <20250909180803.140939-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable USB3.2 Gen2 Host controller(a.k.a USB3HOST) on the RZ/G3E SMARC EVK
platform.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 10 ++++++++++
 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi    |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 08e814c03fa8..0fd90d79b020 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -164,6 +164,11 @@ sd1-data {
 				 <RZG3E_PORT_PINMUX(G, 5, 1)>; /* SD1DAT3 */
 		};
 	};
+
+	usb3_pins: usb3 {
+		pinmux = <RZG3E_PORT_PINMUX(4, 1, 12)>, /* USB30_VBUSEN */
+			 <RZG3E_PORT_PINMUX(4, 0, 12)>; /* USB30_OVRCURN */
+	};
 };
 
 &scif0 {
@@ -179,3 +184,8 @@ &sdhi1 {
 	vmmc-supply = <&reg_3p3v>;
 	vqmmc-supply = <&vqmmc_sd1_pvdd>;
 };
+
+&xhci {
+	pinctrl-0 = <&usb3_pins>;
+	pinctrl-names = "default";
+};
diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
index 58561da3007a..8b3765b8267d 100644
--- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
+++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
@@ -106,3 +106,11 @@ &sdhi1 {
 
 	status = "okay";
 };
+
+&usb3_phy {
+	status = "okay";
+};
+
+&xhci {
+	status = "okay";
+};
-- 
2.43.0


