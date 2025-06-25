Return-Path: <linux-renesas-soc+bounces-18743-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F6DAE8846
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 17:35:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32EE5188ECBD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 15:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B02C2BF018;
	Wed, 25 Jun 2025 15:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0RTgFe5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EDD2BEC2B;
	Wed, 25 Jun 2025 15:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750865469; cv=none; b=GyTfso3IBXqX6GFxDba0tYa1WK31zY1ktpC8E99XOcQiJbm39H+BIv5cABrUVvxh9793CcJnnnaweCkXveViO4NcFJbCxq4GNd7SWWvwbmt/8Bx33RBB+38htfaHqUDLHxqYjlv28lcU404mFNj0P7K9j4NO+uRQtpWu3c9nHkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750865469; c=relaxed/simple;
	bh=hKKluSw6GdrpItsOVfsFpCiUk4xrDJYcr7hB3v2X+yk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uv4dY0XaEq5U4u3t6evW5dy6CCYIYi7rdhTqz5AfOJ3XaS+O5iGEOA1DNowgK1tdGDdMlkgu8ll2vqu01MoZY+rLye9bNacPFgm30JjFYuEmuxD57Frw2Ej/3saML/T31beiXaLP/3hd7A0bgAkbkm0hL8TorFbBaBSnkHQgwYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R0RTgFe5; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a53359dea5so3351990f8f.0;
        Wed, 25 Jun 2025 08:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750865466; x=1751470266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLRdgQGq5K9UrniEU1DIKatrrizlXJa+ko8TieoWAic=;
        b=R0RTgFe5TP4pGLq6BLOP5XzPDGAmkx5Ispb+vy89HqokDUgEWOpuU6c4B2k3c8SPTH
         nMWhAFqiXLWQwovgUbrQrVUywoBNWjjNlvtq/pEDV5r0GQvMrO9Ayrdhpcmf5qGYWBo8
         B98NwoG5UiCrvNbRD7CsHIqNZeyHfYa6dl3bjHYQlYMEfIGaZ8uA01B+PVjbNP0fSDxx
         B93M69yfS2BPY2EjC2bPQ3ev1Sgiv3Ae3QAJQPFqA8a9XuKczFfZz9opRuq8Tmnl85MP
         l98c+JUHS3Safojlwb025GrQNMQvNuRmUmvoY1ZnKmv3PdgLZdhUfF2/r7cd8naHkaeK
         vf/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750865466; x=1751470266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gLRdgQGq5K9UrniEU1DIKatrrizlXJa+ko8TieoWAic=;
        b=UqbmIl+9iOj8TJLunlTcZwHsOUp46Zn4S+KQeWUv6RhOfjoTSfTH2YSQuI3S8qQkyy
         fgynVi+PZcc0yEZPYa7onGgs434BulT+yVjeCx9ZmoCIdsBTpd1Ai75BW+ET0jVbYdTj
         4yuFxSwc+h9Wh1YqUJ3FeTRCXKEEmYxsj2+G9C62i7CbwBWMo3WzQWvn+JPgZgCq8prP
         S8FAX3/aJgheApZrN0X51ncgqiZpl4TivkoZGxGY1ZvNL4qNM/3FBPeMH2Ed/Rmp1iLF
         XK417vwufbvkQNws6L9qR8F62I4LuRoq80wTgl6sXMwmq96zrVdm4tqZss8IphY3TNjJ
         AMIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxjckL06TCH6Z+0syK5guTkdrc+mHqcLaGlyhbexcy9TYHHIanG78iAaWOTvfiurIjsyvaGYryDwMd@vger.kernel.org, AJvYcCWby1ZGqF5p23wYdGzi5fQ8f2etpAujL5c1h0KF2ce6oSAGQCLfb2GjtFsjrZPSmyAHMwfYs2pFi/3UDmZJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxtGMb4G8ZeGXsMspCUpnjCmjEQUIOeoI/XaL/nxSAhqmJSRk2Y
	sQhcZ/YnqzOhfcL8k4iOKKmOmBu2+yT5OBEAVh5t1Oq+anycgITwtlqjOIp1Np0YRv8=
X-Gm-Gg: ASbGncu3bl1nG3KSCq9vYBJb9yVFMgQMlD+/Bwi+r44/SuEQkGyUsKeo24C1kACqoSE
	eR9PUw53z8TSfisO4jfiusPITOhSSX3Ff2LynBtAcAgWytY41gN+znjvXZJWijTiiURUuB6AvmW
	4lActbPCP7/6wpv9MFywy6FP3rIYRhjEHXRYT5fMROePKQEyk4v1egiBr3y5HeDWawmhnvRA/iT
	UB2VnsHVjaaLoIXil39Ha2Vjn/ZSiiHi9Vedhblf4xvy8mJt7dMkDwpeRPhCLa9RIHLuvm8pTx8
	62Q+Bq3V8y+B91KJsPa80xlkKijLxUs+Za2/Q6A9JJ+ttyGslk+j7v+rixyiEKk1F1p84kzdRPZ
	oTZk3slY3AXqDNlDNIJVY
X-Google-Smtp-Source: AGHT+IHQqZTwO04fESC9eXjzpJkaTowOTLVusGqpUzldi0+4YC3l42HY+puZpvCx913GkXt75O/yXA==
X-Received: by 2002:a05:6000:2888:b0:3a3:7387:3078 with SMTP id ffacd0b85a97d-3a6ed61a604mr2664522f8f.4.1750865466057;
        Wed, 25 Jun 2025 08:31:06 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c47e:d783:f875:2c7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f296bsm4899180f8f.60.2025.06.25.08.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:31:04 -0700 (PDT)
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
Subject: [PATCH 4/6] arm64: dts: renesas: r9a09g087: Add SDHI nodes
Date: Wed, 25 Jun 2025 16:30:40 +0100
Message-ID: <20250625153042.159690-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add SDHI0-SDHI1 nodes to RZ/N2H ("R9A09G087") SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index 63c9681116bf..532dcc0d8dd6 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -155,6 +155,46 @@ gic: interrupt-controller@83000000 {
 			interrupt-controller;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
+
+		sdhi0: mmc@92080000  {
+			compatible = "renesas,sdhi-r9a09g087",
+				     "renesas,sdhi-r9a09g057";
+			reg = <0x0 0x92080000 0 0x10000>;
+			interrupts = <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 783 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 1212>,
+				 <&cpg CPG_CORE R9A09G087_SDHI_CLKHS>;
+			clock-names = "aclk", "clkh";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			sdhi0_vqmmc: vqmmc-regulator {
+				regulator-name = "SDHI0-VQMMC";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				status = "disabled";
+			};
+		};
+
+		sdhi1: mmc@92090000 {
+			compatible = "renesas,sdhi-r9a09g087",
+				     "renesas,sdhi-r9a09g057";
+			reg = <0x0 0x92090000 0 0x10000>;
+			interrupts = <GIC_SPI 784 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 785 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 1213>,
+				 <&cpg CPG_CORE R9A09G087_SDHI_CLKHS>;
+			clock-names = "aclk", "clkh";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			sdhi1_vqmmc: vqmmc-regulator {
+				regulator-name = "SDHI1-VQMMC";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				status = "disabled";
+			};
+		};
 	};
 
 	timer {
-- 
2.49.0


