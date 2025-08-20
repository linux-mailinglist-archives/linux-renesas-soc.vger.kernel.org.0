Return-Path: <linux-renesas-soc+bounces-20774-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A00DCB2E3A4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 19:25:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF2313B8801
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 17:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64E8350846;
	Wed, 20 Aug 2025 17:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kq5mkorZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9349034F467;
	Wed, 20 Aug 2025 17:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755710304; cv=none; b=etpVegYnoC5X4Pehbg8UrmjUp2zZ23ksKSroCeAgwRwwThH7M05mD82jaW82SKo/Hjsq4Aih+dvgo04IPuHhKzCQ+OMaJJ7PYpMi2+P7jyyT4Fgq6hNbKRODzg26tCtZbhDBoNt1DJ2Ky7sL4P42mUt9AiUHMvuV0g/GfVX+cr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755710304; c=relaxed/simple;
	bh=cjeQthzQ3KPQOephU6kKZdEFHWsvuvDxl0qxMNdCsfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lz61/aQoqvMwvLH5muWK8S/5uZW2pBI+HQyoaPyr2wOmYhw1fpg8OT4qvplEyHsiKoMe5LW2MKEEB5JuAaihzXCIbn0T54fIhd+H6W2LAHvn0zQcPSOBpQJlRjTHK/BG+0L/dZ/TqwzFHOgg3HYYkPB5PxtsL4uA+9fmjw5HhQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kq5mkorZ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45b4a25ccceso606965e9.3;
        Wed, 20 Aug 2025 10:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755710301; x=1756315101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+rN/dMvS/1mNrnlovftACLbk30nVqsOJibDu0O14vQ=;
        b=kq5mkorZhj3norkMWPu4V7QN/BoOa4iNqxNc/bcqsT/KQRxn9pRjzT95BHLHClXWkh
         8yV7kh7y06Zfrz4vYQ2YdfTKWDroueN2oeiz0heBOzjC7YElqEvltm9/WeYXODEzusiU
         AGZpwz8zXKOPnHf8jxs5AbojHkjQGBi8soWUL2bICATsjuquRhIDJXQBV57CIxSlYy6V
         45FYBYfe4b5dkWyqTCEuGTS2o85cTORDFxgg9IzEdehkzetsIOhTfvg5xAXZ+Xp275+4
         4l7OzU+IGbS063haitLcYfKniLfGpmFVHZX6vxpPetCqBeM9CUj7vp47VwhYEHft/1FZ
         taqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755710301; x=1756315101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+rN/dMvS/1mNrnlovftACLbk30nVqsOJibDu0O14vQ=;
        b=NGn4IUQDyRIeFqk76/wxmAz7sxonY+wV0+URSSrugZayE6dlqYg+sjDLIEZM6H5tBS
         zVaO1CHU9KyHPnGxPp+fXJ2uK0Q+oZcFSr0Iy0Y+qY2pIMEGSlwVCWaLdLvgnwz3GSAM
         J9dNLjt3Q0c3erPBz1ZTqcP7su+rIEXrfR4hP8eMb9D1gna0FYbOeg0HNSO03dCl6Eoi
         i7OfatExMwrRP5naUUemNO0UWdSk3Rc9VDxcP+go5EVgpqrw/X0lZpb+TEjY6mLdka5M
         aBNSZRQomB83pzfh2WSzahdlbwp5ZjBYxKrlx1QGVmfnTjQWMe0UW1ggXbC/OoGJefCH
         vHTg==
X-Forwarded-Encrypted: i=1; AJvYcCUfe4ISB0TOw9GaBTFRJMh1pcBDHpUc+IvCxxH3jrtgp/muQl/t1e8yjxFZgomj3BBvuv6eAIRD7udm1Jzm@vger.kernel.org, AJvYcCUrSSID5HECR6yF4cnxAuy+8fvv6T6YfiUSckiYE0tLKRAJ3rKlw3k+hk36lsaC7mOlJlY12WqqBvNg@vger.kernel.org, AJvYcCWBFO50xTbqnir5tQt/bw+5W9C1W/LQaMJWHKBr4VEO1lYzlq8gxG8LLH2m8WwchnO/VwpYYHJPj69G9kNjQRSLrkk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc3umYDxOBH0SKf3iAF/FJy0dRjTuKEyGtHMsQ6Vv0aCBi1qaR
	NTIs4JOF24737A4e5yY+XSIVCJ+FPiOQOvBV3uLBEoqFAsaUIozsWc0o
X-Gm-Gg: ASbGnctaQI6XMQaNX6llUy0E8zitDVqKcD1Spwr8zhyER6BEvaPlAm1nqEPupDroJ7r
	5uF7Lfhr2V6IMTjzuJxxUsy+7P94WXd7gbOeDOgWFdvx44NUdwTOSusykbzkF884Z/zlahbT3Ra
	SsUXAWIKEF9ZUfE7RDnnkwsfeBOrBonEwvZss/GsGnPvCwvWDnS1stEOTBeOVsVjznKZE9aVry7
	A5dJH8OPkS03qvoKqJC6Wp8H7AOtm1OD1Wqu7toQGZVpWeiYi1MnwIUCDhYiWuHw3samQXBMnTS
	y7ozvUBBmTL6AI9HReP0wGSV1Q7hH9yTLuj/cnhI4yt/2KOmlTQ4k7iAW5v9Z5E39W2sqwUMil3
	m38b3EYNHLpRc2RJ+TBSGDsYUaXIQpUCsPiDUab5BdRkvL45sCzbWwFu7Ci7XGhoso4YsFkvBzo
	It0veuqiKW
X-Google-Smtp-Source: AGHT+IEi3dbF29jS2l1sLnFTk3pyd8TbG0gdzO+TLMxwSl1bUHX+0J55NsfeJbK8ZdGRZ9zM/WTcFg==
X-Received: by 2002:a05:600c:1548:b0:459:443e:b180 with SMTP id 5b1f17b1804b1-45b47cd8a52mr26569905e9.8.1755710300776;
        Wed, 20 Aug 2025 10:18:20 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47c2865dsm40319815e9.2.2025.08.20.10.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 10:18:20 -0700 (PDT)
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
Subject: [PATCH 10/11] arm64: dts: renesas: r9a09g047e57-smarc: Enable USB3HOST
Date: Wed, 20 Aug 2025 18:17:57 +0100
Message-ID: <20250820171812.402519-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820171812.402519-1-biju.das.jz@bp.renesas.com>
References: <20250820171812.402519-1-biju.das.jz@bp.renesas.com>
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


