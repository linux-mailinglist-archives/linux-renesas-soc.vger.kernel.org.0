Return-Path: <linux-renesas-soc+bounces-21363-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E48B443C7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 18:59:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FB271C870A7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 16:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D574C3002CA;
	Thu,  4 Sep 2025 16:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYvQ6oPU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C382F549A;
	Thu,  4 Sep 2025 16:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757005157; cv=none; b=N8sRK5EIq6jtdS3gNgb6Ti+lJqS+sFgABIjTdz8czQU6huJnIoYVinD9sdJD8xzpyVZV3jpxEmvfWO1wrIJFatJOp0BtsxD6iNlj+4Iwyr4L+haMdQ1Vl4OEQ7of6kCH0/xGTEhlY33x/zZzQcSu75HLa+dweha75IOgXYU2TNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757005157; c=relaxed/simple;
	bh=V8KimZQ81hArIVZ6C9yKXFRBe2uNmxunNpoowpcVjbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iOm/rdBHoM1gOaMK0oDkOAxS5DMv2qHeVCb0MI0fuVjr3WZFDVu8HI5Amw7RWA6usE9/eEislJBnC6PR7I8PKaqVOoz0VXc4SVcHjR+y/hodDLVDxM1pX74xY784zno84R4vU+w8pR9ahUKUIfks+vTiwCMyq2zABIVMpqv6JL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYvQ6oPU; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3dae49b117bso1130459f8f.1;
        Thu, 04 Sep 2025 09:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757005154; x=1757609954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wiMnO8SJb2U+ZRBvm3E5r/yRz6+i7UGeG4zkCo/238=;
        b=ZYvQ6oPU7izAfxAhOFoTJ/ZyY8yaN4gAdouei7t4GmsUHKLFMScqwAoNwB1jPNivAU
         +L3iFsSnErVs60JCBHoZp2+Q+AemnO3rAc9VeXZmlg9WAfaNuIq5ylW/9d5o70nnDVMo
         HUCpzDxxuAe9B3AXIyERRjVzAJz1oLzgS5ftbh4fyV8eJUrjJR0Rk5CK3bnM+Bv01MBN
         8uqWUt+wr3cmQIRTv6qRvliv0ANdiA/bTuFK+76Hu+BOeQpCG+C2z07p9OjJNb6tuH6X
         lsOw5qkGC6acIJbdKpO1lULZiCSmZLtVmL4lhZycBBHamibDd+wYIUGOTs1aklmQAKLE
         wJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757005154; x=1757609954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4wiMnO8SJb2U+ZRBvm3E5r/yRz6+i7UGeG4zkCo/238=;
        b=r1I+ZIu1hjt7yxBlDHwqThCj77vSATTCYXVsIYMUy6wJePs9PvW0c3cAOH3P4TW9Mx
         JBq6OauWvjpU9LIhyJQeiiVMjDF9rtTP6tFtbNQWueRSqvHvbFq1DoXU7V0sNMCat9Im
         8u5qu5EyLQVmqFKEhxKLNDpaQaxZrOh+prn+mmjYkleNLJN1NZy+mTJakZlklVa2D6Vc
         U8Mu+cEJ8wOC2Nf/ByfiSTRzscERdNjvMC76jDzFZXgcAWlKFZDpBP93/EcRpucNNGgT
         TDPmtT+JJ+wn+hE6ZKtJ68zf6TifaEvsVI2ALDWP6Avcqw/MRS+1KOQEfqrsw0mHKf8p
         V+JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqCefuDG8G21dPdai1ZPQxBmFOli1rQ+cY5l+BtPMftBskb6ba+rkrhXOsts0Ig0a9g4AKm1a+0r2UxZhT@vger.kernel.org, AJvYcCXTPq2ZDfygc8PkjAJnGO/xHtx+5d7p2FuIg/+yhg9cj2mQCx7ChCERypTcgyai93ACRIl968iDWrHJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyyEd32xaC/Q0dhF+H3jWvtbkxAFBD61hHqmQbmCiekeEeC4LMU
	DLfxPBYjL7d5uvyaSm9rFHkKR69wdCjjoZLGYWinCWUV7hHIz1ncYqlZ
X-Gm-Gg: ASbGncuPhOWY//yLVBRRci3l1CrKCeBeZEa3fZDeHNQ7g4oO3b5hPl1ITussPVMmVPL
	p4enehUCc9vjK5FIomvoSro3uGRUcoopEXOtOcXc2Un4A6LDQ9RpStb21gPWlXnbmPRM6jTVHMK
	RqjuyalyJ6TyYO88pySHTQIh3SvREzBD4dAD4WWOOvRAAsKPlO7QKIbcTFCd7Q4h0WxALtyYSDq
	V3Vup5OMcgkjWdvO/gchS9XvKcXxVvKIY2G+qTngTep521OoxM9xGQxzoNTY30xZgXLZOCW2EyL
	fJZ+14qepBSXX3mzQpNReqJWZ7cqydqjtCV203JNksktIz0nS11yX+SxRI6yXXshF5gyxXp9ZVh
	/k5UJk8r/dBDhyp36tWisgo5CzCxmqbEpm9k/AEG4FkndoRWCYs0zYLl/3Q==
X-Google-Smtp-Source: AGHT+IFMg/jl9QNiL+2gEITLcm308B1VPsZ0mxe+e158ckf+9ehNC37Po8BdzE5bH1ykhRQmwekUUg==
X-Received: by 2002:a05:6000:2501:b0:3dd:8b62:5fd7 with SMTP id ffacd0b85a97d-3dd8b6260c7mr6576829f8f.25.1757005154259;
        Thu, 04 Sep 2025 09:59:14 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:904e:70c8:edf3:59a4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf34493b8csm27633141f8f.59.2025.09.04.09.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 09:59:13 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
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
Subject: [PATCH 2/2] arm64: dts: renesas: r9a09g056: Add I3C node
Date: Thu,  4 Sep 2025 17:59:09 +0100
Message-ID: <20250904165909.281131-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904165909.281131-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250904165909.281131-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add I3C node to RZ/V2N ("R9A09G056") SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index c1672eb490ca..2dd8f7fe5fff 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -371,6 +371,39 @@ scif: serial@11c01400 {
 			status = "disabled";
 		};
 
+		i3c: i3c@12400000 {
+			compatible = "renesas,r9a09g056-i3c", "renesas,r9a09g047-i3c";
+			reg = <0 0x12400000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0x91>, <&cpg CPG_MOD 0x92>, <&cpg CPG_MOD 0x90>;
+			clock-names = "pclk", "tclk", "pclkrw";
+			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 675 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 677 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 678 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 679 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 680 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 681 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 682 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 689 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 690 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 692 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 693 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 695 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ierr", "terr", "abort", "resp",
+					  "cmd", "ibi", "rx", "tx", "rcv",
+					  "st", "sp", "tend", "nack",
+					  "al", "tmo", "wu";
+			resets = <&cpg 0x96>, <&cpg 0x97>;
+			reset-names = "presetn", "tresetn";
+			power-domains = <&cpg>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@14400400 {
 			compatible = "renesas,riic-r9a09g056", "renesas,riic-r9a09g057";
 			reg = <0 0x14400400 0 0x400>;
-- 
2.51.0


