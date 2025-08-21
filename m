Return-Path: <linux-renesas-soc+bounces-20878-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1780B2FFEF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 18:24:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FD5EAA10C2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 16:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75C62DFA37;
	Thu, 21 Aug 2025 16:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GgViuM+Q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9532DECB2;
	Thu, 21 Aug 2025 16:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755793198; cv=none; b=V0DSRs278NFqCNQD530zMZjZ05sMH+7S1myeCy/DJfs/zXAram7FL2Vg+arAJVgrf6hyyNO8tznQTnX6f1q1FpjMt4btIMlnNsH6bkujfEjGto/hZ0TO2VU41M6pD+3vOkcFJO0X/jCCMfpjw860cjQD+uEjtiSTkvJgZwanjMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755793198; c=relaxed/simple;
	bh=jumPEF6fXffPh+MBuHEteYTULbqhYljQSGS2zbzMZMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ObHq29Rj+PzbsLwupBzOLbViCX42/79DlzCAtTySSP9o41hSLGu9QbOUyjUbZroAu0egco8oW/ABHHGmgUhcDKJTYOF/6Jb6Drs+qWyC8OTVppscsA9euTp8MgPjHmVrUYgVvIAJRzgGeG7XQy1UuflpBrBswB5GlUnEtTFU2t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GgViuM+Q; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45a1b065d58so9759165e9.1;
        Thu, 21 Aug 2025 09:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755793195; x=1756397995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EyzalG9TkS1EKHf2S/uU6bgD1cEQy2nj0NvPeETcTtw=;
        b=GgViuM+QG3LCL3ptyycbnSnxBycz5gsZUn5mPaNejSlKtN9oQ/8B0nxaLoSLY4SsIs
         eQBFVAeMq3/ZC4MHRSUr9bZNmCYktf1tpruhwVpnc46vE7ixJX93c2lDKQdd5T8I7t62
         iETXoSj7CdXzXliHol8FS5QhVTAi3gPIgqRjFZYE2Ck0T3lG3dGGzrKR6MaiW6OwtiA+
         yo/GYccIrGSnn5jxpeKZob8yWBWSGzHjHqxba5FTUBjHS08H1M8Bf3tmTqRUv6Wt/fnT
         oXvjTuMLRs12qlwSwsFMqxnOtm9koGW4tXObbh9kHIzp3zg9kwD2lS3SbiQOTT8bcl2+
         zE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755793195; x=1756397995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EyzalG9TkS1EKHf2S/uU6bgD1cEQy2nj0NvPeETcTtw=;
        b=k6ydB4DJJoNJmTW/zXfOa0AbF5mfJ7g8h5mQ0Rx7mLy4u4EN32qR3y3ZKQTZUv5EyT
         4vNsMRfouAYx1I9lcapu8d7ZmuqlihYyGTinha4xDY/AD18/ME8fmVKTCMq5dxv0ek8Q
         /Hviq/bJ21CXuxHqCJUh9p7009EECFk7acDwqPxiqpkgezsNFwK7ZbiR7iRCcjjbUKUz
         Ic496h1N6sSfyNMXxo5952CrOIuTK+eud0hp8z+IqZHzv+wyRwXhz7CXQTtcPHBkyyT5
         zzMeL988pZSKQQshneIwMet6dQB/BjdpzHO9QKVxKoWxUZebfnN96mlMZys1tVcwpqFb
         sPAg==
X-Forwarded-Encrypted: i=1; AJvYcCUWF7erTHJaIUxdn+ayFGrKVhaDyi1oiLoIUEE51VGRQUadJYkcHM5HM49ToctuBTLK7SGwL+9FT2ag@vger.kernel.org, AJvYcCV4bu2ihm3RT6oIjQwSrSYzuATtZ9FWceIaiV/skMWOhKU4a/MKPg9LgzjT6qlbmI++ATWb3/m1um5rdwbO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9VHn5uvL5OV5UM2z+nNZQdUcunpsghWpdVL8XwU5yxHzCXdpC
	7E8MYXREBx66S2x3gHyunrP5GfFnl3lDHd36dTkDS5WYe7shXRW5NbD2
X-Gm-Gg: ASbGncuqck65SKqfEgCQfzds1DpEJAYN6XSEGKfmE3CBx4sTdiQgfu6SG/91f1eEU2I
	vrCUbPKCIhg10ciLL5CGDF9z8wZeMvVGOrHYAhIOgwnKk2+4zfsWGV/pWasDciR8uqdXb58V5B+
	QzWFmp7r2z7hl66l+6WzMKz1M9QqIniOEn+1RUO9UMP4dKrb4e1cjbuVC/+t8DBMQOCDTxBCfQB
	9g72YJ9gClMpx32AnBsm7ICTZ6uy+ne5ODL+8wmqKO8/aSCoJLn+PnDSqfdEBqrf9Lch7dSfs0Z
	/AR5Bz5lBVbl/NpJD9A1EzlfiiLYYNkk+s0wKcfom7+YknVAg/VHVLGjEE/jHqThDNeZ44GaRT2
	je/Zpd7Q+br03la+45A2TDcQuBrb25eVqkA5FxKMq9ZwsP38T+s6I17mk
X-Google-Smtp-Source: AGHT+IFhhJ/d45N7bR0q5jfhU/8/WNB5Nma3XS+z5DeU9/QNLNgi5ZHbAM/h5W1x+ZUt6a6BNaDoiA==
X-Received: by 2002:a05:600c:19cc:b0:45b:47e1:f5fe with SMTP id 5b1f17b1804b1-45b4d85dbd8mr26724605e9.34.1755793194922;
        Thu, 21 Aug 2025 09:19:54 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:9ed2:95cd:69a:8d10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c4f77e969asm2316464f8f.20.2025.08.21.09.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 09:19:53 -0700 (PDT)
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
Subject: [PATCH 4/6] arm64: dts: renesas: r9a09g077: Add USB2.0 support
Date: Thu, 21 Aug 2025 17:19:44 +0100
Message-ID: <20250821161946.1096033-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250821161946.1096033-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250821161946.1096033-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add EHCI, OHCI, PHY and HSUSB nodes to RZ/T2H (R9A09G077) SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 5291ea9fc326..433e3317a324 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -299,6 +299,53 @@ gic: interrupt-controller@83000000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
 
+		ohci: usb@92040000 {
+			compatible = "generic-ohci";
+			reg = <0 0x92040000 0 0x100>;
+			interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 408>;
+			phys = <&usb2_phy 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci: usb@92040100 {
+			compatible = "generic-ehci";
+			reg = <0 0x92040100 0 0x100>;
+			interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 408>;
+			phys = <&usb2_phy 2>;
+			phy-names = "usb";
+			companion = <&ohci>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy: usb-phy@92040200 {
+			compatible = "renesas,usb2-phy-r9a09g077";
+			reg = <0 0x92040200 0 0x700>;
+			interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 408>,
+				 <&cpg CPG_CORE R9A09G077_USB_CLK>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		hsusb: usb@92041000 {
+			compatible = "renesas,usbhs-r9a09g077";
+			reg = <0 0x92041000 0 0x10000>;
+			interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 408>;
+			phys = <&usb2_phy 3>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		sdhi0: mmc@92080000  {
 			compatible = "renesas,sdhi-r9a09g077",
 				     "renesas,sdhi-r9a09g057";
-- 
2.51.0


