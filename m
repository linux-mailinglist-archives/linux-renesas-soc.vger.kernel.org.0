Return-Path: <linux-renesas-soc+bounces-19223-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5894EAF94FE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 16:08:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48B4D18946C8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 14:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAB401917E3;
	Fri,  4 Jul 2025 14:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0DIGo4Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C151552E0;
	Fri,  4 Jul 2025 14:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751638114; cv=none; b=a29GNIm0bYK0DoHQjQgKm3SqvSQZSRnqVLNs5orWF1B/qlJmB7uvEWbdegnaq73ILy++BgeiNz6Tm3IrDRNtEz280kiWt/yIWF0Ufzn1kNgp5fF6L48Ddcpi3CKXlzqv7lIIUCN0kSUC++401/TwaM82TVWQ2G6mRzbvrwozh94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751638114; c=relaxed/simple;
	bh=Igx/lKHLV2QDliTLutRN3L8sKt2ELRnyG5tN1O60qH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lC833vCKiU+ApLQO+0KP0bHHYpbEicRIYs3BZIPOud/dPh3Dswpp6y8Bz717VXYVMUWV6nXpmpgE1uTblOBhVetbzNSJlWJKfzwKbSGESujBAP8HvtLhtSGMHwCRjvgBGp73WpZoBF9VLSbi9geJU+r+3hoN7x0DRRWn2Uj5MS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0DIGo4Z; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-453643020bdso7360885e9.1;
        Fri, 04 Jul 2025 07:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751638110; x=1752242910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ao7PytVuBDSpArCV73b0YXXYVhqgv39eodObXYm3abI=;
        b=L0DIGo4Z2NwDpyb0Et/L2FmVPqmxW+VM/WuQbJcrN+R5gg8dQefqrNmUtLveb9bamo
         Ypiw4RQCQ24WB0oSNxyguiug22c0AzjiTvo0nQWwndn9Orjim7JiXOkMiCpPPkLAtA4d
         GQx4RumBlB59LuxGDfzQrVnTlE/ORSiiJrDuZvwHPpxPjOhyhNy4PbbP66PfGrw96sOA
         phlpP2XfYe41S7XQClElFhCmvWO19mVQeOF8k7xR6hIVB+TVVV5r/ZtkBjip29pT04uJ
         tiVUs0nLSLxSQxba9cnsqJRJRbKZZmTwqk2Sm9a14A6+FCXff+PnYiUrxYfZRr9nWRrR
         z1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751638110; x=1752242910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ao7PytVuBDSpArCV73b0YXXYVhqgv39eodObXYm3abI=;
        b=UNNTwXi9JGXerEq7qVh79apTFG1VzG0ByhQsoXfe8FsPFV8f/Z1ttaxmDNINO9FC7v
         wvc/rFAg7U+3Cezu23Ozg8VbvhIYESxXy6zrCGuFFO1D1if7mp71NrLUgs2A8pgydUjH
         vPw7PtCpAn70EUNYA6ZepnQJ8lED5ub7KrvmOJN6ONVePVDR1oNA1hJgVkuh2jOaFOHQ
         ciCqIyBCHwvnH84uwG+7wIQxP2CzfzEAUEsmQRmFlfdhkeceY5KlL08AoXDn/5akT7Cz
         ZAMZO/Td37FpbHzwayn6v76zDp10ed9Dr5pPK467fRLgDAj3gbK/xbX5YmSuTXIrAhGC
         c+pw==
X-Forwarded-Encrypted: i=1; AJvYcCUbkcBwHdBVKzTvGQm0af4NRP6P4Chb08lBayPLLy1BUnNl5Rz6N8qTpxXlHC9ef+UGfSGg4L/boy6J@vger.kernel.org, AJvYcCWezVUFQ4x1Cs9iDaQb9Lzw1spFwS4G2NmrTmdgzU61+aZVe8pKZNP1fIbqqXDvL40BZJZEi8zLkSRTzsIV@vger.kernel.org
X-Gm-Message-State: AOJu0Yz93Bbl2myaHK1Q2R+zZv7e3whC4kd026W8EV/G5+A6qqLkIZtz
	E7TulkcH4mwheT1SdKJLRHAjPKnbxop+hx/kxF1Tt9vhXL+nUBlumxQ/
X-Gm-Gg: ASbGncvL2tHRYG5+DErG0zMZugONQvWb6wOy/Tq8appo+xxQOgia/EZykEphII53UCe
	APIqUjzlFeZz3IJ9JX0F+VdUquCdTUEk49Yxrsz105VL8o+aOdnRbJuO5LeGfZEAXTipeiZnNxX
	f6vsdhKGPznafETpfAIKSq+FII/Me827hEeWdnkXz69s+5JoLG4YL9ep1/O9BnRed4jOfqnH6lz
	ZnGf8AlVxLQSMCzXcrHtmUx/GyivagLEGRgaWZz91BJ85P0yscinKPeFP1n3Xh+A5rXZTrQHoyb
	asolYajKybi1GgXB/rSUmynRFzslU6hLjDYqxe+4Qowgpt/n3xSLSKdBHAhq2q3duxFbOAhO68E
	W0U6mmviOMwNDzmE0BrVs
X-Google-Smtp-Source: AGHT+IFwTAFTjhgEXFBW9DFlJMn5aeL4lpp5xvk82NfqweWTjIgPBbyqFqR+tIZ21OlcTOMVY4iWiw==
X-Received: by 2002:a05:6000:3111:b0:3a4:fc37:70e4 with SMTP id ffacd0b85a97d-3b4964fc7e9mr2507552f8f.58.1751638110177;
        Fri, 04 Jul 2025 07:08:30 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:e31c:ff37:8f66:5091])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47225afd4sm2535946f8f.83.2025.07.04.07.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 07:08:29 -0700 (PDT)
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
Subject: [PATCH v2 1/4] arm64: dts: renesas: r9a09g056: Add XSPI node
Date: Fri,  4 Jul 2025 15:08:20 +0100
Message-ID: <20250704140823.163572-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704140823.163572-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250704140823.163572-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add XSPI node to RZ/V2N ("R9A09G056") SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 617b9ec9eef1..44f0bad451f3 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -208,6 +208,27 @@ sys: system-controller@10430000 {
 			resets = <&cpg 0x30>;
 		};
 
+		xspi: spi@11030000 {
+			compatible = "renesas,r9a09g056-xspi", "renesas,r9a09g047-xspi";
+			reg = <0 0x11030000 0 0x10000>,
+			      <0 0x20000000 0 0x10000000>;
+			reg-names = "regs", "dirmap";
+			interrupts = <GIC_SPI 228 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 229 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "pulse", "err_pulse";
+			clocks = <&cpg CPG_MOD 0x9f>,
+				 <&cpg CPG_MOD 0xa0>,
+				 <&cpg CPG_CORE R9A09G056_SPI_CLK_SPI>,
+				 <&cpg CPG_MOD 0xa1>;
+			clock-names = "ahb", "axi", "spi", "spix2";
+			resets = <&cpg 0xa3>, <&cpg 0xa4>;
+			reset-names = "hresetn", "aresetn";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		ostm0: timer@11800000 {
 			compatible = "renesas,r9a09g056-ostm", "renesas,ostm";
 			reg = <0x0 0x11800000 0x0 0x1000>;
-- 
2.49.0


