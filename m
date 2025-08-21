Return-Path: <linux-renesas-soc+bounces-20876-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FE5B2FFE8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 18:23:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C3BEA22FC6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 16:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E40EB2DE6ED;
	Thu, 21 Aug 2025 16:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lldqx96x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FE42DC34A;
	Thu, 21 Aug 2025 16:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755793195; cv=none; b=hxSh4zB0Vj/1XgCj6jN19wfpOvDDEp4LrPxvf+HIPcwmD1IdcBbRI5d2zB5Ovd4vWc8fvoCSYRzpKZmaxcKjjsaf4G+mfzFZtYKXmjkGBo8+hP61b8YeCPCh7Gfy6UELMKjZ/VXPppT0wSiGjsuDneTz46LyzhHw1sJtdToTqHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755793195; c=relaxed/simple;
	bh=/UOlHjBQ2LLA0HAKY/a8UWmhzEoIrKQx1XirlEr3WkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u3Eugg+aJerckwMjI7GJ5iXUYIyWsJz7tJC9ncYvwEPm7zcTwQZztCDpjCp2RkWBbpHPPnOZ5tXvnOqD/VSHfPBSxjk+ZDe9OqeLAiXFLFNPtX9m6hQ5tKPCg3ExCSzxxtDHVw7E+iB8Y9glG6DS2ot34GaQ9D7fp/3jQkxuOXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lldqx96x; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3c46686d1e6so749712f8f.3;
        Thu, 21 Aug 2025 09:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755793192; x=1756397992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNuGpseXG0V6TgG6gSaxvb1jSBnDLGHF8h6jKPIvxG4=;
        b=lldqx96xusdJ/yf+L16JbjtHhTnQCTQT40KXI0VKLawGEOhHp+CX2KOWs/2guCM0wY
         AgCe/WoLN/bVDmtzCSPobblYJBdeh2hSi2Z/qHH/eqSpQ3Q2KuEpC80GOg9IhXG1vn5Y
         /NTfREyoSyCb4dKEa4jEbfbSC2YrTDZ8BKh9hQfWwJ4GEZXtKb6op9VCEnoqlggzwLt8
         4dNU/yjew10H/BBFwr3rckOAHidXa3iZTYJPjCgPICaSCNfDEf/xSkGfzkX0gKM6QAsb
         hObiV9cG2wbMajSD5aotkFiPQzhrXz2HCoYFwm/gaEOf546BfDG02n+Lc02bcMieKUFr
         vlfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755793192; x=1756397992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BNuGpseXG0V6TgG6gSaxvb1jSBnDLGHF8h6jKPIvxG4=;
        b=wo27wew678eaq+n8vq3QMi1R9Viksl6CoYDhZaQsCI0moF55rD1/I/AKooVZI4lUOg
         PG5FoUlWev7hjn1zqlVjdlYGzTo3OpuWABcKYUXuOJ3PgMfTxLlZRNiJlPhkJVkvqmwr
         Zqvkcxq87ctV5UiHzHW8UTzfJri1oVRnadX6xAzcpeQ2biC/YDLyVw98ODinTLb4d8GV
         nmX0JEdcQrWSVfXYCKd7yhkL9KIviNrHKVE/1aD7x83R/nrFAxNlc4sf/KedQMtGf+5F
         OzFHCL6jlX9wDNrcMZ+qJjrN19Qq7E0rFqvaauBlq/3VYSPev1Af1HUWxFdfNBaUqEi8
         bqwA==
X-Forwarded-Encrypted: i=1; AJvYcCWIwFNuSrRnup9tlxbQSpcOp1Vp5nu12e3Ji2tEkjZUc/gLZ4+UFdplOcqrKFKzP8JK8AIboh55fLFndlZ5@vger.kernel.org, AJvYcCWfdCsG0OjYU3fTm8gwacjp8Lap312mpz45O8rQRQTBL5nizvRck+SegJpkJh9ho+K2egoXlf2T484q@vger.kernel.org
X-Gm-Message-State: AOJu0YwWtifAk+1rfofi+doQBdiM+cTewR4WagHGTmZX026561Y/pxVM
	L/vku/zRjFrWARRbuSIy0ZmHwqi3iGiLjj5/SKJ+kEubML6bMGZMjvQ1
X-Gm-Gg: ASbGncsv4EmvjRARn/mHmqyWAWfW34N8ZIbLkWZJzqrYKLJ5pjNyzdlXE+AfCd+YUwB
	nCscRZTt1+hfDnwRB+MQ9bP7wNt2sbPgjTVxPvUVlL49Wk7j0kpuZVJWbwNGZ+w7GQdvbVLenDV
	GJ74Lu1YBfeA4noBpElCnNwDGZrH0apzsdf7CRUwZfzX/zv7/SaHoCwabxhBmDcLuhD3tLP0Lpr
	zB4J+yzxKfN74+Qt6XpSZyx4Y2kYpZzZU2uAQfqrjvxKAhJtiB4vfF91Yjg4eHJdfoYVMtjWXps
	Cn0zBXr7Pqe6jY1ciyVlqYeGwSQvE8Hng7ApKK8k8iJKpz5Rs9TyiwzzSqm9MycP0wxLcEvo919
	itfQszpVJB0Wz7d/gQTMybtLj/I4SX5wSGfwiqJPkfunpfw==
X-Google-Smtp-Source: AGHT+IGnZCfVOsIXO3ZtF4iTn2VTqfWUg2Ravmz53K5yG0EZjXCSZ4vnIQRBld1tbmBM5HxMX0YBug==
X-Received: by 2002:a05:6000:1449:b0:3b7:820b:a830 with SMTP id ffacd0b85a97d-3c49549e77emr2580438f8f.25.1755793192349;
        Thu, 21 Aug 2025 09:19:52 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:9ed2:95cd:69a:8d10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c4f77e969asm2316464f8f.20.2025.08.21.09.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 09:19:51 -0700 (PDT)
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
Subject: [PATCH 2/6] arm64: dts: renesas: r9a09g087: Add WDT nodes
Date: Thu, 21 Aug 2025 17:19:42 +0100
Message-ID: <20250821161946.1096033-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add WDT0-5 nodes to RZ/N2H (R9A09G087) SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index ecbb7b93aed2..b669c1a506d3 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -160,6 +160,66 @@ sci5: serial@81005000 {
 			status = "disabled";
 		};
 
+		wdt0: watchdog@80082000 {
+			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
+			reg = <0 0x80082000 0 0x400>,
+			      <0 0x81295100 0 0x04>;
+			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
+			clock-names = "pclk";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		wdt1: watchdog@80082400 {
+			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
+			reg = <0 0x80082400 0 0x400>,
+			      <0 0x81295104 0 0x04>;
+			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
+			clock-names = "pclk";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		wdt2: watchdog@80082800 {
+			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
+			reg = <0 0x80082800 0 0x400>,
+			      <0 0x81295108 0 0x04>;
+			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
+			clock-names = "pclk";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		wdt3: watchdog@80082c00 {
+			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
+			reg = <0 0x80082c00 0 0x400>,
+			      <0 0x8129510c 0 0x04>;
+			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
+			clock-names = "pclk";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		wdt4: watchdog@80083000 {
+			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
+			reg = <0 0x80083000 0 0x400>,
+			      <0 0x81295110 0 0x04>;
+			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
+			clock-names = "pclk";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		wdt5: watchdog@80083400 {
+			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
+			reg = <0 0x80083400 0 0x400>,
+			      <0 0x81295114 0 0x04>;
+			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
+			clock-names = "pclk";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@80088000 {
 			compatible = "renesas,riic-r9a09g087", "renesas,riic-r9a09g077";
 			reg = <0 0x80088000 0 0x400>;
-- 
2.51.0


