Return-Path: <linux-renesas-soc+bounces-19339-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D679EAFB784
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 17:36:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 815671AA3900
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 15:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46CC21FF60A;
	Mon,  7 Jul 2025 15:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUI7F6jx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7248D1E5705;
	Mon,  7 Jul 2025 15:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751902546; cv=none; b=iMGnQ5fxJsFop/9ddht7jgvUd3R6Cs8K5BNwDXj2WnWA90tZhzS05XV+srDB7F56cqjCYQbKTNiEC14eycHKx7HvoxOWuMlVB4S09xjk8ew0ZohA7fAtrTG9OtsXwqjqnEIi2w/9sOHtW9gXsK3jKt7pknMJuoy02TxIf8xnEzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751902546; c=relaxed/simple;
	bh=kaCccV3gyWdZQNIg0EegIU19JSsdPywLpAhjJPaOXzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B165zubzUQaBjwi6ohrIac7+kzVyUeX3LtMgKic9f51vIukvRNrt31rtX4Ddk0H6F6I7X+hmap2+nxLBObwzGZpSqi8aShbmFA/ATzwt+oUUb5ck/F254V9ohF50zIAGtF62zSDc49m6sBSM+LhiPHt4MtVVxe5VMZV62on4Srs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUI7F6jx; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4535fbe0299so19494735e9.3;
        Mon, 07 Jul 2025 08:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751902543; x=1752507343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2d3DfwtuwQG5IPOkrnTbq0I1X+cUEN2XipkpcVGdTc=;
        b=UUI7F6jxwkL3ZvrgBAlu6d5QoP34p3QtTFPLMoPfo6H23MIJWJkCH8/h9PFRTx4mDf
         XwjlHOdb65W3ffbRdZhhGbuFjyXsIk84UGYqtp4mR6DwLxRjklw8dy5tIOPjEj4nFMyT
         gCI3W/JCXAldSjcSe65157uyuXMbnHM4uSYD9AJn/wz+ZpHpFqqUFN/pZGWDaSq+d3SD
         gEfJz9XL4/buHj3rhLcYEaij6jYeyVCKNTQyT7E7BJaLsUg3CNSRJY56Fnkq0aFdYNT4
         h7vN95OTvZMKjGXMGwdW+vpvrflAnsRkMemW1qEguz0ZMCDz7s2lolZsN8ChzGjaQcLo
         9ZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751902543; x=1752507343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y2d3DfwtuwQG5IPOkrnTbq0I1X+cUEN2XipkpcVGdTc=;
        b=Z4/HWywH8mhmPkzfKGVU/nBsKxue0F75vFeOyw02ArdQHoGt37OxpsIHv2COnMk7L+
         4yfu2vZwBorWynddSayBdd7/9FmU39fEWIahWP/30mT4faq7uCIXfhC6iq9lXA9RSO5o
         bHzx0bo3+lZrD1dpwdKWTJJoJXdcSwY68EAucgQ+Ued36WOtFTp1hTHr+LMSYd6ABFqN
         3+AaIwMvc7HXyY2J/0olmE9Py3zcfcUlKrl6AG756XcqSlexen/3Dr3sMny3JnasywhI
         1PjRG/7YRJVMBEUYrXIrUWrpUHHuAtkqY/8EUs0qi3mtsczIuOivgpCJ867O6+tWJFDT
         T3Yg==
X-Forwarded-Encrypted: i=1; AJvYcCVc+1KTPMf9aVt4jedr1HAB8Weipoj8DP38hDxrbYYmvvpEyOpF0s5E6slslYiOMsC3z9patd7HOt0X@vger.kernel.org, AJvYcCXnVnJ30WFHjtULSGg+46Kkw1UXIGC0Q0kO8D3+uinDxBXHRM528vUVMMXbOq4YTDEHuymHfalAujXVKHfK@vger.kernel.org
X-Gm-Message-State: AOJu0YyQKrcl2TkHgcz6SA3bn62G9AHq+PbmDW/mEJtxJUn2v9nsTr8G
	IcH2rxbXqw3KQlv1q1HscSTVw8Wx5OtO0eIl5cgySzeA2QEdzicYHLNF
X-Gm-Gg: ASbGncuy8c/pcxmnowaUTmZBsl/H8Zvu6A88W/577a9zze6Ve889VNemLLLex6gVDQz
	LBA2U5CRj/xXcIJqynUf+FZ5pabe/KJHIYgZ1Vjcq3M8toMSgoQa6HA/aBaJc4WUqql+V7M/uqL
	iffULYc7XaIbP/XXLV3jtnq97Nm6LUqDFh8d4Npj65lC0SUaolKJqtv+T2Rn+uy2P0bJDNC7XXi
	D93PvbdHOivwVm/YuhjByuQkadbn0LqxRErOYF1qAQvvR7K5W3/8EbvtV0gLZsXIbBdRm1pmozM
	Fmmb65wJwDEOHQdWHV8dIjGR4ntMoO+38aK675CqwWVgK9tE9WvKv7SZJWVykamidj0D4n6UMlR
	hNY/eb+eDZoWuZjhbZNs=
X-Google-Smtp-Source: AGHT+IEkZB/i6ozSmcKTeInFMMRz3inB+povxc0FI/YnboEUM97RSSpF03A15aeL+wNA4jGTwVbzxA==
X-Received: by 2002:a05:600c:4f44:b0:453:a95:f086 with SMTP id 5b1f17b1804b1-454cca14af3mr2908795e9.12.1751902542583;
        Mon, 07 Jul 2025 08:35:42 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:d418:e5eb:1bc:30dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b161e8fcsm119491735e9.7.2025.07.07.08.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 08:35:42 -0700 (PDT)
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
Subject: [PATCH v2 4/4] arm64: dts: renesas: r9a09g087: Add SDHI nodes
Date: Mon,  7 Jul 2025 16:35:33 +0100
Message-ID: <20250707153533.287832-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707153533.287832-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250707153533.287832-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
- Added "Reviewed-by" tag for patch 2/4 and 3/4.
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index 7452aca6b05b..4da21199d22e 100644
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


