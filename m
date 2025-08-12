Return-Path: <linux-renesas-soc+bounces-20421-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECC2B2399C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 22:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 522427B66BB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 20:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4535A2FFDC3;
	Tue, 12 Aug 2025 20:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSiIZEuZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF2328C02D;
	Tue, 12 Aug 2025 20:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755029033; cv=none; b=nvGnRgXUem1yyscSOfJJUI9ic+fjX7C0eeb7/fM0OnGZuGVBAasSkaNr+UKo0WTq8Kal3TnOrqEmHUVU3btUV/v/Mx1miTpjjARwOkIoatDO5JWfJZ9mUuktoxlPwDynS4cCFKetOOCbGkgykHkB00+dcDt0ESnVrNzQaGZq128=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755029033; c=relaxed/simple;
	bh=s7SMgsQoWXlOG4IcW9uHPjjfUAIvUexjGe8cxbcGXWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H7LS67RqnhWXukxbciSHJV9DdcMBqLQBSiRyxyHAG8p1dYpXNoS0x5RKSiOVekIv7GvSE8SGxmO1l22DIem0UzHGFPLWCh8sD1pbH1yIQCY1Iw4dwnK1vfeSQ/k5m7K+vjfkwEjb6gq8emxB6PMVsY+7CWGsxaH53aImx3YWywk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSiIZEuZ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-459ddf83023so36073825e9.0;
        Tue, 12 Aug 2025 13:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755029029; x=1755633829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lhz8v7QalNQVY+RlXCVLd6psJeNpsNFbVZM4c/l5vZI=;
        b=CSiIZEuZjOGi6mmFeeWAyLljxoqS//8gyY2yGOD3AKCQGFQiapAIwpdICqRIeF/Gbd
         oknKBgHl6KLUXCHwM0+PBfOAHzkSE6qE8wjfDP07JX7oJ3dGdGwCl3SnAuNDgx5vTUvD
         lAYjdYCOawNTG16YAR85Ok/YOAeWPA4u2VPy2Rr0d36yqM6uSniv6S/AYUakqPh4og0W
         yS+iHxVrjPDQiFap0DMLpnsrKCgNO3F5WUAACrP8Uypd02jdRWljV7GbHsaqzV2Zhl0t
         OicSODJawL8oXdU86Mnb3aD2FwwBExiHsi9gntL18iJ9tn6VI6ECF0VbK/VkvNFg4vXP
         fHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755029029; x=1755633829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lhz8v7QalNQVY+RlXCVLd6psJeNpsNFbVZM4c/l5vZI=;
        b=TQLuK9PjNHlUOIR5cQ32OiaILGoIV3c6eZ2UnvabsKq4RrpCA0jYRBgehfBlL/ql8R
         GVR1YoR4q42CFOsp5heqy7A4JAcyJ5d+M3i+SdgTYBIh84hvrqw73wwc5ies9veEVvbm
         ENhYfFo8RVaiR2SSuiWgKgw6zGXm+Qmw0XGwxJUaYCFMU2dv1vd8SXJR7osoKOlKz35o
         JXRp1dKcga7UWwo1juwXiLoN4zNWdM8pleyKOTauUTY4B+F6ah2D+aLmJHBXTKsfQ0wh
         nOIU12Xqems3auHzUmBS/98FOLHO8LoA/w59SOyE8yAVjqQzCPW/lplIWN63eS5ZVoI8
         2Svg==
X-Forwarded-Encrypted: i=1; AJvYcCUpqsyHmmlVAu5/KTKnlo+cmRrl1L02atcjWgpJGrSGE8zDMOj+f3cS+tYrQW+cnLrBWBFFqVN2iEkVWUiD@vger.kernel.org, AJvYcCX5nC+T0bk09vyJrlhL6tdfKjXSJpXSoyopWvOUstMBeD+RpFWVv26QxUF9QnSL5cVJM6Bpb1SFb/8x@vger.kernel.org
X-Gm-Message-State: AOJu0YyUCqpZaendUtUiWCC6+jNyc29fOEcBgqC447j/6VSAJTpZCAVy
	cQSCGvW55VXYGloDFcXSJfiQo674hV9rJk6Uk3eLtF+KEVHEov7Dw3Sz
X-Gm-Gg: ASbGncsZPgh7ARjjuyctZo5xlqAEgZZQfFrJHhQ6IZfSpJUnxWA8VlPL75Xxg2uNvEa
	+gmd6UTJQ2ILmo+lSiSFbvWgsOEEwHhs5qe1mgVfMiDsU6ciiP20xJ0davxLMxUz4NSE+Qflm7K
	RhtQFNQL6N9cI0byopJ8qqqUKhaPhXkhh3oek4iz38Ns4cyVr0oD0+RK1nU97LXT9l/Xe85bOjn
	NtQXSX5ZDGGLJSvjaQir40ZDl7THUx3F9pkwe1MLKxamoYelfpcrsG+H5gwHKgmcytri1WlEpjm
	boPaJJ+fgYMQ9g85gf0/vzgZBCckHgPSYiSo8GkqgzlIcABrB+eB98ETbTlKCM0KRxBI8kqtbih
	kTfIKcii4XXUHjcmzSsUOslDCk+0UG7b9UHWNxwmNoSExiletc8JM1IbZEvabV6knFMUkVsKn7A
	==
X-Google-Smtp-Source: AGHT+IH6wx9hkIDJXx2ezyw5hN/QwXnjOP7vPGTB6xBwPyYng16FCcIC3XhHJVPmRMHXZLfhvj2DCg==
X-Received: by 2002:a05:600c:19c6:b0:450:d30e:ff96 with SMTP id 5b1f17b1804b1-45a165cc5a8mr3565945e9.0.1755029028678;
        Tue, 12 Aug 2025 13:03:48 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a16dde163sm297645e9.12.2025.08.12.13.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:03:47 -0700 (PDT)
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
Subject: [PATCH 03/13] arm64: dts: renesas: r9a09g077: Add pinctrl node
Date: Tue, 12 Aug 2025 21:03:34 +0100
Message-ID: <20250812200344.3253781-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Add pinctrl node to RZ/T2H ("R9A09G077") SoC DTSI.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 8ee88b8e8f33..0929ce2db05c 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -216,6 +216,19 @@ cpg: clock-controller@80280000 {
 			#power-domain-cells = <0>;
 		};
 
+		pinctrl: pinctrl@802c0000 {
+			compatible = "renesas,r9a09g077-pinctrl";
+			reg = <0 0x802c0000 0 0x10000>,
+			      <0 0x812c0000 0 0x10000>,
+			      <0 0x802b0000 0 0x10000>;
+			reg-names = "nsr", "srs", "srn";
+			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKM>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 288>;
+			power-domains = <&cpg>;
+		};
+
 		gic: interrupt-controller@83000000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x83000000 0 0x40000>,
-- 
2.50.1


