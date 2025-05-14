Return-Path: <linux-renesas-soc+bounces-17085-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 910C1AB688D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 12:16:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA2A84A5799
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 10:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB87272E5E;
	Wed, 14 May 2025 10:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFCvXc4y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC0A270EA4;
	Wed, 14 May 2025 10:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747217741; cv=none; b=gVM8v63c3ui0yGn1MD7wFhTeHiEhdOJrBWVUTDXg0pr51uz3nHsg/iHPm/g9Co0hMMSxr8bdtVuCqYQwbItSuh1j77FKkmKZlfvMJkQsItjXNbS4CDzVIztEgGIX8nOMbbZ4lDWWoDx4baGTxKlk8a8NgqIFhm+YSYnPEJafxzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747217741; c=relaxed/simple;
	bh=PLT4dNyvYsINoQcbHDO2Qynm/uPMxlmInI6J1OGRhXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZtjIs38/je8fGwFYQq51tfYExdxcqVzSfllcmw4ICbguq5lvrcKYmJVuh6pz0n0mFKNNR9jgwmoP+Y3MWLxyV0WfQphVlNurVfzUzBjbvg4AP2YlVmmv856dp2ElwSporRRYizhg0S/EyDXMOhu24Bl9YSB7Hg+ydM58bCLTUxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFCvXc4y; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a0b9c371d8so5589673f8f.0;
        Wed, 14 May 2025 03:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747217738; x=1747822538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=asF/w1jOu1Ju7DS2Oz2YVAhcCyMTullkE72mRZYJwCI=;
        b=EFCvXc4yqre0dtu9VJ1ks+oEVgFbXXg18jTBTKVDhZMebD9es6LCaATgxrpq6xHuNu
         zVjY5spANbLWabcHbLL26I87DTtnvi0ek7GAeoM31YijA2jnt1NsFJexHvBXaPXD2uRV
         seBjcS7LapS446dDBSmN8UHrBjRxIlAvEjVPwoVKmlMLGJKldEAEubEfmLsOBgND4Zw2
         4yxMLbTWVDGIlZM12KqihSrGt80lIfK10uVUipXknwfgow1BdiYm/g7GoJmlpVCUT1FU
         pudj2PGinagE4MfpA/K3UYQcP0tiNTEn0xSFXbFbR3DWqCumDJvpzkxx24w8REz+c7WL
         48Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747217738; x=1747822538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=asF/w1jOu1Ju7DS2Oz2YVAhcCyMTullkE72mRZYJwCI=;
        b=a620H0qF+HxtbM4+FyAAKUAPExSVxR56U45XDax7Fim2tcAt2CXN+E3Cu2DwRLexlo
         xD887uxwUZmU16bSlW84pBCcRrhMIKImAjJQ1QWk8X+413GqNSVYLLwmy7zSemMI90g/
         98+QO0AW6fQn5xexV0PrgfgcpcF+IIEREPpNBoD0m3CVv8R0F3dKaiASI6cwPZsRW33G
         V2xCVIqGZwK55YDUBoqnLwrHNe3PZssR8SJD+Beman1DD3oc4GYDRdf/hjObq92HXGTK
         /4Rhu3wD6cFWWDMbNaomkDyrvS1dOMG6vpmdP3bsFfvzZ07Z/1xbcZPEixDvbUviPax2
         BIUA==
X-Forwarded-Encrypted: i=1; AJvYcCUaDOOsuOlgdt1PWTqbW6PzBLkisLN6l/Zy1s103F8xkYq0EYcDHotGy6qFBaw4gZRAxNLBZ2N4E+EG5boutkkC9EU=@vger.kernel.org, AJvYcCXXh9JUiJUwo1XmRDN7YTmHT9+WJO0xevlRvk/wuRgqZbhwBVyScH/fq8Z+K5Nu1d/1nHXpZqwosM6RzVc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXvKloK8Jzb30Nflo0TvrtTPGE3NssnJgLEHfS252oxKV0FQnw
	DJhjDmhTAauZg5kQxuN+V647iJKu0p/NcMCMkr2K+p2Y4Cnud/a8
X-Gm-Gg: ASbGnctXVOXTai2cyyT0H/GKHWnJFCcGPFtBRxrtKWmn9Hy/tB8xZWPDV/Zreqxdggn
	xA3VevKD99/ilELgVQr2TFhLfH3MZIFAwnVil5gJYbp3j4cetfC0IJ1fRCkbgpcMIbEshv4dck/
	7E/G3RjkUhRFTRq+o+5LMTyD6ovko5LB2I6fIxMyyyxxp641u+6LM/uBPMHZVo7Z1UEkyRBVCSR
	vH8wEFcrt4t0a7a+4xBRaCzSJopiWZBsu5BnQxjznmrc1DCoXiq/b/iN55Oa2BI81KMXBnfgOUN
	0zrwO7g/szqDZFHnduej9UG7nTKyQILfhYLcIye8kdf7FSMC5ymiU/Re9R6uj/Si+dimbIYeFQK
	E
X-Google-Smtp-Source: AGHT+IE4V76F/CL1FdOY9fX1MacnG9cHYx/GNxPHKncehidPDSZ/kSs6l57uSvBtdgUIEZofjnvl+g==
X-Received: by 2002:a05:6000:22c5:b0:3a2:3c51:7c1c with SMTP id ffacd0b85a97d-3a349946af3mr1927629f8f.50.1747217737706;
        Wed, 14 May 2025 03:15:37 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:6140:13af:687a:7a66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f3afdsm19530249f8f.60.2025.05.14.03.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 03:15:36 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 03/10] arm64: dts: renesas: r9a09g056: Add OSTM0-OSTM7 nodes
Date: Wed, 14 May 2025 11:15:21 +0100
Message-ID: <20250514101528.41663-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514101528.41663-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250514101528.41663-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add OSTM0-OSTM7 nodes to RZ/V2N ("R9A09G056") SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 0528c6a6ec12..564c3d5c6d33 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -177,6 +177,86 @@ sys: system-controller@10430000 {
 			resets = <&cpg 0x30>;
 		};
 
+		ostm0: timer@11800000 {
+			compatible = "renesas,r9a09g056-ostm", "renesas,ostm";
+			reg = <0x0 0x11800000 0x0 0x1000>;
+			interrupts = <GIC_SPI 17 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 0x43>;
+			resets = <&cpg 0x6d>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ostm1: timer@11801000 {
+			compatible = "renesas,r9a09g056-ostm", "renesas,ostm";
+			reg = <0x0 0x11801000 0x0 0x1000>;
+			interrupts = <GIC_SPI 18 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 0x44>;
+			resets = <&cpg 0x6e>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ostm2: timer@14000000 {
+			compatible = "renesas,r9a09g056-ostm", "renesas,ostm";
+			reg = <0x0 0x14000000 0x0 0x1000>;
+			interrupts = <GIC_SPI 19 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 0x45>;
+			resets = <&cpg 0x6f>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ostm3: timer@14001000 {
+			compatible = "renesas,r9a09g056-ostm", "renesas,ostm";
+			reg = <0x0 0x14001000 0x0 0x1000>;
+			interrupts = <GIC_SPI 20 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 0x46>;
+			resets = <&cpg 0x70>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ostm4: timer@12c00000 {
+			compatible = "renesas,r9a09g056-ostm", "renesas,ostm";
+			reg = <0x0 0x12c00000 0x0 0x1000>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 0x47>;
+			resets = <&cpg 0x71>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ostm5: timer@12c01000 {
+			compatible = "renesas,r9a09g056-ostm", "renesas,ostm";
+			reg = <0x0 0x12c01000 0x0 0x1000>;
+			interrupts = <GIC_SPI 22 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 0x48>;
+			resets = <&cpg 0x72>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ostm6: timer@12c02000 {
+			compatible = "renesas,r9a09g056-ostm", "renesas,ostm";
+			reg = <0x0 0x12c02000 0x0 0x1000>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 0x49>;
+			resets = <&cpg 0x73>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ostm7: timer@12c03000 {
+			compatible = "renesas,r9a09g056-ostm", "renesas,ostm";
+			reg = <0x0 0x12c03000 0x0 0x1000>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 0x4a>;
+			resets = <&cpg 0x74>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		scif: serial@11c01400 {
 			compatible = "renesas,scif-r9a09g056",
 				     "renesas,scif-r9a09g057";
-- 
2.49.0


