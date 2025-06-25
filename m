Return-Path: <linux-renesas-soc+bounces-18745-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E4EAE882F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 17:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFD8E5A7BE4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 15:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BDA62C17B4;
	Wed, 25 Jun 2025 15:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOp+hb/I"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503AD2D23B5;
	Wed, 25 Jun 2025 15:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750865476; cv=none; b=M10hO5FabhZx/3NKQBDAgKqJ2zj4lh794mTigeju1LEayS0YaDYuMitbbXvGTiusuOvfhcSqZCCTdMai6HQzYnEupJD2o4SS3f6r9rm/YELHeDb2QVoZr85zqyA2weU2E0mQapbHLD97zP0wJBQ5KpO5hHjQzlkDUG3yjBf4sW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750865476; c=relaxed/simple;
	bh=fDssB5aaPcDKfmno0Af7/5cG9hq8jm9v8gNG8SdBf84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q7fFgIrZG4gwsIcnyu/tbWAyQr2fXmLL5bsfT5S6qGkInk6gW2Egc81BTorAijCh0H3dQLul0ut03IwXVsd8zpIRsAp26U8ANrPNn7WWWQC9HeJZqHCpTr5TB4GfdzlfUfdDLt79a/qF/QJY62/40LrCmUU/YSWsJkMdKLCb36g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOp+hb/I; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a522224582so932909f8f.3;
        Wed, 25 Jun 2025 08:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750865473; x=1751470273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmv5nrdILXBV2nHh5uXOig/VEByWY/fH9qV5WEZad3Q=;
        b=TOp+hb/IgVv77EXUxDDK4i/5TgFxRl6nHHr72AQ/Gm1FjXAcXNh63Eq/EpL7x8cTCl
         ggVkmWPUOYI6AkmiYuVB+cE1X1bhS+QhqilJ4UXc4EtCsCAPzRnMAP0JS/B9vg1ilvNJ
         LgVi0iu3MaCNsL9kcaJOMIuQLsrZxJ5+TZrDF+pwUr3wA8+J+1dgq8rLoEHlnZ3P9lDI
         /0yBRvp1AWR2q3p9eiXfzWMnvbD+XIzK0tMSNgrkh/b4lb/jbz3qWuLh7isgyjnnk+V3
         Mm3+Go9oDNiuAy5C7IBt68BexWhR0hOkR0OKVaGou/WMKeqmp7HmWAZy6LDAMZtx/jfy
         UBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750865473; x=1751470273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kmv5nrdILXBV2nHh5uXOig/VEByWY/fH9qV5WEZad3Q=;
        b=wsjJBItVXQwUxqSxvP9LpKhmBbKJ2DMTt4nKjHAuB0XbCH8j02zne9fPM2Ak+xb2mB
         BUMY9cClakeW3qs3afcvNdBHofFIZtkb3IBDRhDZ1RlN7EAsTaKT+sK5df1JQXqaHT4b
         F0uRmbWDKxD9AQQD3ttZSPAnxkEL19nChJ+PC5avBwyLbDOHR6qmzpqmQoFKoz9suGuc
         MOeS5mh3D7E17PDQBqCGuc7F+1PWDFd1TldnhtCDR2kXQ0SxK13jHBH7ak1JGNUDHQuy
         ohuYtcKx4zIaxXtKJpE5ugKQOrJqpxmYdDEO61ggJCCB9A8/feM99zjSz8ph7k+mu7jg
         CHBw==
X-Forwarded-Encrypted: i=1; AJvYcCWThQlrUrhGwx8n8NIlWwiEcax3l9dJkga+tWsSUSoL4g1pmTsy1eC4nBF4ZxIcsJVfSgTvAt+2e2jJ94Iw@vger.kernel.org, AJvYcCXDBItx9WnRsH/ICF8AikW2kdBvi0st/PHYQSO18MOvbNaJt8S8f9/wlEuVZJyyAb2scnpHqUPERvEf@vger.kernel.org
X-Gm-Message-State: AOJu0YxjbxFr3oWFK8njtDdHQDd7EbXGiR0BsOGnMQngLnvVSFSvermP
	N+3IGpiPupxhrOIADYFnNs+d5Ctqfek+dx9aEgGKPJLPvVZWON+xItCp
X-Gm-Gg: ASbGncuCTMQ11BpRmNg3/Hy8WJSZNEnY/bLdv5AcJG+hdQCbWMDrXzUr17pmYPFkT2q
	N0vhW4KS0rYfuMtsNNRp2NTvNHav+Qsu1FMgTSiVAsun7uXPJ0s0W1bTNVry2bDP8jtDFxMZTg/
	ka2uc9/DtnuWABwaGxMfZxUa/4Tk9Xdlgn7Ied1MUky6s3xWwA8DSXTE6AVYsutUopM5YXfR1+s
	mHc/cMRnHyQIaFwDyg9x/8VTcgmNIiSeXw2IGO2hOWO9cCaEnGE23un7qmv0fFnsjPC4ag9/Cj7
	ddgllE0M9gP5rWeJPqvaeHgFJ4VjmHN3voV7O3YFymU/14BP4kr4WrrY/FSS3zAC1/72n1TAMUe
	FPlZrDtWpY33XVaoInAhU
X-Google-Smtp-Source: AGHT+IGx314TZ536khdHzT1xgWtlduqUW3uxyqlqjK+y2w93zKD3eactfklHOIbwkC178BSbL9+peQ==
X-Received: by 2002:a5d:5f8e:0:b0:3a4:e4ee:4ca9 with SMTP id ffacd0b85a97d-3a6f2e91275mr144096f8f.23.1750865472666;
        Wed, 25 Jun 2025 08:31:12 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c47e:d783:f875:2c7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f296bsm4899180f8f.60.2025.06.25.08.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:31:11 -0700 (PDT)
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
Subject: [PATCH 6/6] arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Add user LEDs
Date: Wed, 25 Jun 2025 16:30:42 +0100
Message-ID: <20250625153042.159690-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625153042.159690-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250625153042.159690-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add USER LED0-LED8, which are available on RZ/N2H EVK.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
index d6ba14a26f03..f6437e82a7de 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
@@ -7,10 +7,64 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
+
 #include "r9a09g087m44.dtsi"
 #include "rzt2h-n2h-evk-common.dtsi"
 
 / {
 	model = "Renesas RZ/N2H EVK Board based on r9a09g087m44";
 	compatible = "renesas,rzn2h-evk", "renesas,r9a09g087m44", "renesas,r9a09g087";
+
+	leds {
+		compatible = "gpio-leds";
+
+		led3 {
+			/* DSW18-7: ON, DSW18-8: OFF */
+			gpios = <&pinctrl RZN2H_GPIO(31, 6) GPIO_ACTIVE_LOW>;
+		};
+
+		led4 {
+			/* DSW18-9: ON, DSW18-10: OFF */
+			gpios = <&pinctrl RZN2H_GPIO(18, 1) GPIO_ACTIVE_LOW>;
+		};
+
+		led5 {
+			/* DSW18-1: ON, DSW18-2: OFF */
+			gpios = <&pinctrl RZN2H_GPIO(22, 7) GPIO_ACTIVE_LOW>;
+		};
+
+		led6 {
+			/* DSW18-3: ON, DSW18-4: OFF */
+			gpios = <&pinctrl RZN2H_GPIO(23, 0) GPIO_ACTIVE_LOW>;
+		};
+
+		led7 {
+			/*
+			 * DSW18-5: ON, DSW18-6: OFF
+			 * DSW19-3: ON, DSW19-4: OFF
+			 */
+			gpios = <&pinctrl RZN2H_GPIO(14, 3) GPIO_ACTIVE_LOW>;
+		};
+
+		led8 {
+			/* DSW15-8: OFF, DSW15-9: OFF, DSW15-10: ON */
+			gpios = <&pinctrl RZN2H_GPIO(14, 6) GPIO_ACTIVE_LOW>;
+		};
+
+		led9 {
+			/* DSW15-5: OFF, DSW16-6: ON */
+			gpios = <&pinctrl RZN2H_GPIO(14, 7) GPIO_ACTIVE_LOW>;
+		};
+
+		led10 {
+			/* DSW17-3: OFF, DSW17-4: ON */
+			gpios = <&pinctrl RZN2H_GPIO(2, 7) GPIO_ACTIVE_LOW>;
+		};
+
+		led11 {
+			/* DSW17-1: OFF, DSW17-2: ON */
+			gpios = <&pinctrl RZN2H_GPIO(3, 0) GPIO_ACTIVE_LOW>;
+		};
+	};
 };
-- 
2.49.0


