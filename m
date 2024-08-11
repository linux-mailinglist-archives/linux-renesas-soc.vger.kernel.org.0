Return-Path: <linux-renesas-soc+bounces-7798-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3110394E312
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Aug 2024 22:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 605411C20FA1
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Aug 2024 20:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525DD1537D3;
	Sun, 11 Aug 2024 20:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KkX7lcTz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850E7166F2D;
	Sun, 11 Aug 2024 20:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723409421; cv=none; b=C+5BCTj8X5kAT3khiCz0QX+xMq/z3ynGUObAVCLXjylz9bHuBBFY26n+CWtajkd9QEsyURaLnwBVfkKFJ8JM13NO5pwHR67j4/zdS8wl05/cuIg8IhxvdK1+R5jTvkC7wEx1xka34lsbTjzBsSH8CLu9oLUaMQDYIQB3LMAffRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723409421; c=relaxed/simple;
	bh=ZyXY2ZXqITS0TYGWgsuqhCLmO9oV8e2VQrkLL5lC5oQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rZv9nibr+txpS2NBF3rm5iOs/NObuxfqfS/jKUchApLImgaSvD+eTKPOTKiGNZ4xP7/21ZAJC978uhLBmEjUSxBPEunG/D5zVZ4B4hTyEcGeX3e/ketV2MPSyFlv/+g8MqMis8GLx8QF10n2fjKYGFKpD9D2TtbyXHuHjnPwVjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KkX7lcTz; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42803bbf842so36299975e9.1;
        Sun, 11 Aug 2024 13:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723409418; x=1724014218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXXuS1S3SM1LM08/Zzkpce1WIqPUT5A2+7zAjJ3geWU=;
        b=KkX7lcTzPyUQpDiOujwxLCnZlY15Dp1huI9Eyj7JWpMPVXo7iNdnwX7gbo/5GpW3Zf
         q7L1P5/myMG/pp1j6bzPENC96Q7zkyRGxHXzL/qNeglglqFgV4LL+RHWj53az9SirxpI
         ndXqtEhIZE7G8n0sX6/qPvt/uI07QiPw6+KfI2Iu4krJB0A/c38HVaqT8LzsJNWvsNzU
         VRAvtZIGcXaIJFKWRS0avYqw5C3UAb2HAgJ2eSQhNJ1XUdAHlredVYu//ZRFrdQI14jo
         BLFsKMXkGCc9l/iO/WHtQI3hgY2tZWv3tWSdOm1QyftRa2WSy1PfcVGa8oXV1tWxMuqd
         54Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723409418; x=1724014218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXXuS1S3SM1LM08/Zzkpce1WIqPUT5A2+7zAjJ3geWU=;
        b=sF4FR22LaVrehBSfIVqZi9ZDzcAr/OXRLsunkTi1F3l5mpARVJeGfiHj2XH1LwzveN
         qYdk8Exqh6dMQHlEzMnkEBA0EBHCpCNUH8m+wI6ybB+YLIz42p4JGtFlO7JbN+yZMgoD
         NLnXL51FNSQryKUq1ZEFNllQewJuR0cx0dyb9OEW3KuAUOU/9Y99v98q7W37GaYdc1Vb
         2ucwI7cTW/7vZxcCY4fstJyIHC0io/dAJMTlCvjIlJxZ73JkCK77n8TKHIU/z6DIRyw4
         TkOt5euX6GOBcAgZyKjH3WOzwLPnpr/1OoOYtdL9bwNlr/8mjoE2aAc5ORFJJ/KayddO
         KgsA==
X-Forwarded-Encrypted: i=1; AJvYcCWXeF5CbiRa3eyHdHh5w4/LkmthvBfXOY+9fg620gnrJFFAsnNwg1XZeKS+MrwNA1BZdVFcGWkKyxfzQL+mFD6l4Xn9eClo0qsQJ9X/Ts+hkk3nRUqTeDyQygUb6PVqYdN7dkh8eV871Q==
X-Gm-Message-State: AOJu0Ywq6Uoe/rWv1FVbOKyEE4nKHnODDAj3Edq5mjyeAOJeDfXZ3SBV
	lR6NjSgm20y2InoF+Rwybam0rTayvwR2y2H3yXNWhp5gGEfPn9hI
X-Google-Smtp-Source: AGHT+IG8Bha/FQRnGxUOLnoKnoVHqYn5K2ofxN6w2eI5hZTqEGupUlLPRsqH+s/zdlkD+wL0quX+lw==
X-Received: by 2002:a05:600c:314a:b0:426:62c5:4731 with SMTP id 5b1f17b1804b1-429c3a52e50mr68083895e9.29.1723409417766;
        Sun, 11 Aug 2024 13:50:17 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c750f0absm76421845e9.17.2024.08.11.13.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 13:50:17 -0700 (PDT)
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
Subject: [PATCH v2 6/8] arm64: dts: renesas: r9a09g057: Add WDT0-WDT3 nodes
Date: Sun, 11 Aug 2024 21:49:53 +0100
Message-Id: <20240811204955.270231-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240811204955.270231-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240811204955.270231-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add WDT0-WDT3 nodes to RZ/V2H(P) ("R9A09G057") SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- New patch
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 435b1f4e7d38..7f4e8ad9b0a5 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -184,6 +184,17 @@ scif: serial@11c01400 {
 			status = "disabled";
 		};
 
+		wdt0: watchdog@11c00400 {
+			compatible = "renesas,r9a09g057-wdt";
+			reg = <0 0x11c00400 0 0x400>;
+			clocks = <&cpg CPG_MOD 75>,
+				 <&cpg CPG_MOD 76>;
+			clock-names = "pclk", "oscclk";
+			resets = <&cpg 117>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		ostm4: timer@12c00000 {
 			compatible = "renesas,r9a09g057-ostm", "renesas,ostm";
 			reg = <0x0 0x12c00000 0x0 0x1000>;
@@ -224,6 +235,28 @@ ostm7: timer@12c03000 {
 			status = "disabled";
 		};
 
+		wdt2: watchdog@13000000 {
+			compatible = "renesas,r9a09g057-wdt";
+			reg = <0 0x13000000 0 0x400>;
+			clocks = <&cpg CPG_MOD 79>,
+				 <&cpg CPG_MOD 80>;
+			clock-names = "pclk", "oscclk";
+			resets = <&cpg 119>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		wdt3: watchdog@13000400 {
+			compatible = "renesas,r9a09g057-wdt";
+			reg = <0 0x13000400 0 0x400>;
+			clocks = <&cpg CPG_MOD 81>,
+				 <&cpg CPG_MOD 82>;
+			clock-names = "pclk", "oscclk";
+			resets = <&cpg 120>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		ostm2: timer@14000000 {
 			compatible = "renesas,r9a09g057-ostm", "renesas,ostm";
 			reg = <0x0 0x14000000 0x0 0x1000>;
@@ -244,6 +277,17 @@ ostm3: timer@14001000 {
 			status = "disabled";
 		};
 
+		wdt1: watchdog@14400000 {
+			compatible = "renesas,r9a09g057-wdt";
+			reg = <0 0x14400000 0 0x400>;
+			clocks = <&cpg CPG_MOD 77>,
+				 <&cpg CPG_MOD 78>;
+			clock-names = "pclk", "oscclk";
+			resets = <&cpg 118>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@14400400 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.34.1


