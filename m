Return-Path: <linux-renesas-soc+bounces-20875-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD57B2FFE3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 18:23:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A1EF7275CF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 16:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED6332DCF47;
	Thu, 21 Aug 2025 16:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CX68Qla2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368FE27CCCD;
	Thu, 21 Aug 2025 16:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755793194; cv=none; b=Bms3votacCusPD7GUX1AA+jBzrPPxP5faKa/cSZNiDpnAIauCJQtouUBA/MAwdmUQty3yLWjzZdih8tp1vGZWZHeL9TbTm6cz+YbCxFVbpr0oIyyjkkoU0dnj9ELMAoPEg722Dsn7AbDnvKa9z5VRBNT41koECZM/TMLE8RjCoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755793194; c=relaxed/simple;
	bh=ok+thBh5NBQng28xdzhQIF0oUpUj0zPxUykEMyRCr2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LWCK0J7ZazhjSTuwqvAoxidwFNV6yYwxXLKCPb4ssc8s+Mes/J0qsqJVoIqOIw0R+rR9siQgkj5sOILWKlz9+iy13ntXanDsb6ZVyUBa/SR9YUupyZG4103adfD8/DXu33fElYX3r1HpWb8T59Qdo/1tL8Km6OApffitDGg7ERQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CX68Qla2; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b9d41c1963so732317f8f.0;
        Thu, 21 Aug 2025 09:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755793191; x=1756397991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XN3KOHQ/rYYGBhDqciEMLmA9FpXhZuU+mVhsvlAv5k4=;
        b=CX68Qla2XmvSZCSdr9QSCCXSXIY1GClXsN+Kv7gvDlHw9TbGDgehx6WPMtJn015Ri6
         u/yU+gHzmC4UjCGDpXelJtwOTZabYi6EID5fF+gorRGvxuOE2YZVwdwZ5M4W0433BKx+
         BkNk+BdMqxBZzST9xd+qllDdBh/fanXEfF2iIctorvOOjQ+OCH/cNtbkbOC8YL+DNMWq
         fwTHiv5t5Vm3m1Y8TiEeHHGiEvZYwKY1nC5zMMWYHBDIy3hH14iAg7uspFeQxvWOH5tE
         kKJp8TpjzJkRICt/T6r7pTzyvEiUKvYAe+M38KH5OJLOv9KdC34Fubb/x18KGp6ZentT
         qvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755793191; x=1756397991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XN3KOHQ/rYYGBhDqciEMLmA9FpXhZuU+mVhsvlAv5k4=;
        b=t/nV3YFASTQzvFI/xuMiVfzR3l080qVh6k3AxXaVrDgxpUJIPDVbY3vriNBV3/G8VM
         n8ckcmJIrWn4F5snch4pIcqNOClwaKyOEYJkt3SKxoltdrx813gUdsGRUdY4IjTWVNZP
         MqXtV8RcCuSlAT6R3eHwZ2qXx2wnqIucXSdPJJoFTxNL5+3K18kCU3/uSN/WxvNvPiiw
         dAMmDXJL/jrZf88S4zQBWN9Tmt1ZByo85oFQzinJgUAxJ9D5bdULFVxNTCVY+CKlLEZJ
         Cn7ISP8o5Gam5h+6kk+rrwCb9BxZKMAdxe84xbql9rimlheNeRK4ULL5OqLKDG9QHMJd
         3NIw==
X-Forwarded-Encrypted: i=1; AJvYcCVj5qZDckTCIk8S3gIJOqBXyriVZf5ObcVcWl5aGT0YODp7QZ2vWtLHX8Lvl4CTQJ9udMr+AShFXYQGvRuY@vger.kernel.org, AJvYcCXurEw5q/e2fNB+7YCek+QoSYx+3WYOJfAKhS7bpl3OLmAmp3Ubnt2mg6MEUB7TjbyBGGjwdiAU63JW@vger.kernel.org
X-Gm-Message-State: AOJu0YzzwqzlmyBmmFMCKnszvmOCX8lJusZtSG7VlLPo7ND6i7tR2dsy
	dIbYuGueOnm4h5uqb7iBEsQG15hIosbon0SXAOMZjdCkEazII1spOSU8
X-Gm-Gg: ASbGncur1B38vpJJSVPK1jcCMHq9sLVGUsk0qWAM2Rd+3iLlE/dSkndGkQ+k3JzZH7R
	taFqvZs5Sc6RJnjr3zj9QUqW5q/4NeM9hZeP4nVBl1Kw8gyr/u3/VTya1MLJewZi1EpvC1iYs5Q
	sucepmgYRgcRIShT4b1IZe0UcgA51aDcv2gOhGAJt3VeTS2cTSTtPW6DVaWMu4cVWYjDkbAP/jZ
	mqqAPzmNzlRB1Knkz17SKkBVomViaZLt/zVMOd50HtrzAW8eM7H7ZoM13JSU0GQesOVmwJ3fbJw
	WTl8ilNiZIMHVAFfJ2bWieFKANbmA5gYmDq8eye5CfEMK/+YNYcAklOeRulVpdLgfS3tFYif5Tw
	q2DJEU3mdSOoPrUW2jGX07iyr2J59IHFc7PGcT2DWs8OK4t7MdShaVLfc
X-Google-Smtp-Source: AGHT+IG203j2WyaPrmiA1deUB+eKhR1XmpILzpOnMnt2hGZl/893s+88xP4XGyLzKpKDpID04tVQ4A==
X-Received: by 2002:a05:6000:22c5:b0:3b7:8d2a:b33c with SMTP id ffacd0b85a97d-3c49452a44emr2459466f8f.18.1755793191155;
        Thu, 21 Aug 2025 09:19:51 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:9ed2:95cd:69a:8d10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c4f77e969asm2316464f8f.20.2025.08.21.09.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 09:19:50 -0700 (PDT)
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
Subject: [PATCH 1/6] arm64: dts: renesas: r9a09g077: Add WDT nodes
Date: Thu, 21 Aug 2025 17:19:41 +0100
Message-ID: <20250821161946.1096033-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add WDT0-5 nodes to RZ/T2H (R9A09G077) SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 0929ce2db05c..5291ea9fc326 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -160,6 +160,66 @@ sci5: serial@81005000 {
 			status = "disabled";
 		};
 
+		wdt0: watchdog@80082000 {
+			compatible = "renesas,r9a09g077-wdt";
+			reg = <0 0x80082000 0 0x400>,
+			      <0 0x81295100 0 0x04>;
+			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
+			clock-names = "pclk";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		wdt1: watchdog@80082400 {
+			compatible = "renesas,r9a09g077-wdt";
+			reg = <0 0x80082400 0 0x400>,
+			      <0 0x81295104 0 0x04>;
+			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
+			clock-names = "pclk";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		wdt2: watchdog@80082800 {
+			compatible = "renesas,r9a09g077-wdt";
+			reg = <0 0x80082800 0 0x400>,
+			      <0 0x81295108 0 0x04>;
+			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
+			clock-names = "pclk";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		wdt3: watchdog@80082c00 {
+			compatible = "renesas,r9a09g077-wdt";
+			reg = <0 0x80082c00 0 0x400>,
+			      <0 0x8129510c 0 0x04>;
+			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
+			clock-names = "pclk";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		wdt4: watchdog@80083000 {
+			compatible = "renesas,r9a09g077-wdt";
+			reg = <0 0x80083000 0 0x400>,
+			      <0 0x81295110 0 0x04>;
+			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
+			clock-names = "pclk";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		wdt5: watchdog@80083400 {
+			compatible = "renesas,r9a09g077-wdt";
+			reg = <0 0x80083400 0 0x400>,
+			      <0 0x81295114 0 0x04>;
+			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
+			clock-names = "pclk";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@80088000 {
 			compatible = "renesas,riic-r9a09g077";
 			reg = <0 0x80088000 0 0x400>;
-- 
2.51.0


