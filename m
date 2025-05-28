Return-Path: <linux-renesas-soc+bounces-17633-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F82AC6B40
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 16:05:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7174D1BC4611
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 14:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC6C288C0E;
	Wed, 28 May 2025 14:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7pXTYCE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467052874EF;
	Wed, 28 May 2025 14:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748441108; cv=none; b=kyQ8Is6wX0NdWWbZ+fWXhdobLdnct+QmLJtoxn5TaJ2uFIhu6kRy/irMhRXn9KmvX8f1x3XgA9gD4Gzk0XXXxR8MYBeHvD2xHeyypUBMyTfJHDjJtMvqmJ2cwpZqNlELNbLgXeXzXozrTP5kSztn7B9Qx8ICfGFyRjVkFq7il68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748441108; c=relaxed/simple;
	bh=eK8J4rKSp8TMiHRSS+hbmaeMQ60qgYoItb86jAoi6TA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KCxS7TaOS/3zFi6NdJD2ihKT+jHQGY1Oy1eLNjzOE7H/d/QBKAbGz8KUV9iTV3lMFmmZB6WVkSydrTCgmIp5a0hoScimwlrIiiN7IL63dJ815pkmwSzbKtDR1q00txWw1bN91K3Lgd8HxMAnn1Yag16A3TuJ9dpEDfyMKOW4j9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I7pXTYCE; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450cd6b511cso1150115e9.2;
        Wed, 28 May 2025 07:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748441105; x=1749045905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wywLmOGfapMCxW2dgEXjBZVhH7MDXoBTN5ewWnefwOE=;
        b=I7pXTYCEpdZh8VvDFbCds7XHA8srnqW8SqyRDCJFSLxB3Dk3b1ybunQi9hPcqwEFuk
         I7Nt45l7xldXFo1B5Q2vc0TWMbIk4ZEb2ioHVwTUQsmAt8OMJq0kN6akg2Dagw8uh9JZ
         Z1llo0PC8tGwyxyJo+sFszDGqok1HTU7XPmTqd7vRkAtUCMi0UOBKx53IlUIwWyXKv65
         V2BgLHtFVgtjXr7hpmdMc45iTa2agFMbq79AIBcsgAGik0OTCyXQ9VpHcGQUCHAJvuGp
         gUWXMt2YjhYowJWyUyiVay20hmEiUZki4sSmVK2EKYgs4kItootKIs7YwOXnSLC4EnMx
         /x6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748441105; x=1749045905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wywLmOGfapMCxW2dgEXjBZVhH7MDXoBTN5ewWnefwOE=;
        b=CJXoKCbRKglSQpnQIllCSE5RWAASXPtsgucxRfsXUVjlFPsEurJYVN8vr+qzPPD/AW
         qNLlJkeyBX7lRX3M/H8p6Lqz1QGTJaLV304LjjkPRUpKvKMHN6+IzIY5oJwTLBihuS/2
         RigoWvS7GzwZUdLX9XsoRKh5FOqiAYRfGrYazZlWoEF4UUcmwmG5QD/5h2cH6szReX+n
         HdVrN8LqquijWLOcp3ea3Nic8HpdrAIbsvCpxogl3TmFqLaQhmTr5yjAR2G+aW1swxd8
         KZZTZj68YT1KLP/9KVzupLYP7bPYZ4dZugmhM86B//pujQra8o0wvMPNXRwTnhoZOOOE
         EIXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKp3AsmMB+w4ipK4XSVJmc3GLoH7wfote3wne72xVxZFmVX66kk8lN9GzM/TeZidXbWn+l/DCUf8bl@vger.kernel.org, AJvYcCWP9jWPrUqtmVC3FO0NN1MznvoL11mADTwMciCFmhyiCJv/gF7BnmRgQpl/ansi8usbeagnIqh1mRfhh9LL@vger.kernel.org
X-Gm-Message-State: AOJu0YyPDQY29J4K4uD+AEVV+R6hoWkcMGjquzW84+Afjyzjo3c+rLkN
	uJNCID9yY2KsgUJBa0jaRC8CKTeegUnGx4t6LQouFnWF/tPc2jv/3CJbV+lvCqLE
X-Gm-Gg: ASbGncviTNh+8whtGlJ98Ex3CHbKQYrrGSI3DGgJ3XCwejf1xOnPi8ocOyvxGIRQ8ls
	D+ckcUR3upoirGiXRG43ZmbmfRgTpKjCQPZ4NnJTw+Mw1LRsYRZiG/+vBtSD34s68tqy2QEY0dV
	3qvSiXEH2h0eChC4AuQTs2yOqAgVNAqusa+oUVcwefNZjh+huP4zCfL9StfD+2iTxxVkkIFefRN
	k5eTgK0GeHdRI+VMaYn+asqzEh7+BOTIESE81ypdksC9gifkdvjFpjD0tob2SZuj5VouBwJLezn
	6qq6HhAu6MOEmmvyvahR1Xr1Kcqkt6qf/q8N04uv+DlMeXpFUVsYQZwoC20HchPf8ZQOiG4ih2n
	r
X-Google-Smtp-Source: AGHT+IG3wbpyLM9y8mxjXehCmiOh/DrSRXXFvOxHsVMVuB/IqbCLyu39wh+w7m2yy/yJNfsrBTqa1Q==
X-Received: by 2002:a05:600c:5118:b0:442:e0f9:394d with SMTP id 5b1f17b1804b1-45077d424fbmr21309815e9.24.1748441104969;
        Wed, 28 May 2025 07:05:04 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:7078:193c:ccdc:e2f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450787ccbd1sm18846795e9.25.2025.05.28.07.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 07:05:04 -0700 (PDT)
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
Subject: [PATCH 2/2] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable USB2.0 support
Date: Wed, 28 May 2025 15:04:53 +0100
Message-ID: <20250528140453.181851-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528140453.181851-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250528140453.181851-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable USB2.0 support on the RZ/V2N EVK board, CN2 connector on the EVK
supports host/function operation.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index 55aa2bdce132..795d9f6b9651 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -82,6 +82,11 @@ &audio_extal_clk {
 	clock-frequency = <22579200>;
 };
 
+&ehci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
 &eth0 {
 	pinctrl-0 = <&eth0_pins>;
 	pinctrl-names = "default";
@@ -103,6 +108,11 @@ &gpu {
 	mali-supply = <&reg_0p8v>;
 };
 
+&hsusb {
+	dr_mode = "otg";
+	status = "okay";
+};
+
 &i2c0 {
 	pinctrl-0 = <&i2c0_pins>;
 	pinctrl-names = "default";
@@ -190,6 +200,11 @@ phy1: ethernet-phy@1 {
 	};
 };
 
+&ohci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
 &ostm0 {
 	status = "okay";
 };
@@ -302,6 +317,16 @@ sd1-dat-cmd {
 			slew-rate = <0>;
 		};
 	};
+
+	usb20_pins: usb20 {
+		ovc {
+			pinmux =  <RZV2N_PORT_PINMUX(9, 6, 14)>; /* OVC */
+		};
+
+		vbus {
+			pinmux = <RZV2N_PORT_PINMUX(9, 5, 14)>; /* VBUS */
+		};
+	};
 };
 
 &qextal_clk {
@@ -330,6 +355,17 @@ &sdhi1 {
 	status = "okay";
 };
 
+&usb20phyrst {
+	status = "okay";
+};
+
+&usb2_phy0 {
+	pinctrl-0 = <&usb20_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &wdt1 {
 	status = "okay";
 };
-- 
2.49.0


