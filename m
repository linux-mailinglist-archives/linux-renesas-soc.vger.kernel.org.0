Return-Path: <linux-renesas-soc+bounces-21939-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA7BB59B80
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 17:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D21AC58141A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 15:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7E9350D6C;
	Tue, 16 Sep 2025 15:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhrV8AlH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E2334AB13
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 15:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034987; cv=none; b=ZjzyPSnuSNRDSZN9n/MI/iqghcwK0wwkk0ejmxcM0ZPEwq8sGQ7qOQCalU6M54WpJOPQFHpD0sXO28HOcjvo8OsYkTy+DJ+/o/zKDBW8AgiNNpHG+YtufVmF1kOvezemJqP9VzwsKuEM8xPsLbUiohUxKeOnEp2r+EqXsEE0aEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034987; c=relaxed/simple;
	bh=3hSgAns3qgzJ1ARZvo2WDmE5n0/TFxULSaBIa6ktd2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UmXnC/fipytSCT0llczlq7gJtoHb1hla/K1OOKj9csGGPabUN7BfLh5TeWf2bemJXv3hKnad6YQdRbKkPcPOP602i3GXo88newTMVdePTxvqxV6TSLr2bHMmqqIFhoJRpoRWakj12lb7Ner23z0lqlRbR0aGW8rMbjGWwmebcQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EhrV8AlH; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45f2f7ae386so16874055e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 08:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758034984; x=1758639784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mywmu8Fb9MoIdnmzPctjInVewzgCT8A+qgENO0cWeaM=;
        b=EhrV8AlHMgH2eC95A2lmYABAADNcbjOgey/o7uz7bESaLUsNAYT6JuJQ4KYOhfDUiS
         ZbsZcak57OJcGlhEMsnBAB/Jjaaqbf61BWTPRt883xRJ/M/7rXGPeHR2v4SqP71hhs3y
         EWjXokoDMVADtsrr+IcZF3TImGGTnaqM/26o3AW+0/aHFQnRTlP44wqE1DSLEOlqwen+
         +iPoYoSI848nUGzFTKMuCsrCGKnRnaUbXHGRrenVu6Q3hg7JVa46e6rSkjc/szLek/1k
         HchexnpRtH8+Foyu0qoFO7KenUGZbCsRzhdZv2neAvOYU1nSgZYrdg4mxp0O1/IiUbVb
         gOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758034984; x=1758639784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mywmu8Fb9MoIdnmzPctjInVewzgCT8A+qgENO0cWeaM=;
        b=uQ8PDYhA8q0eP5BjMRlOe1XVfSDRd/s8widwR2vR9AdAN6hXH6m30AhJ4IWUtp5A3G
         jdBPdT/DB5EmbZ+aby49U9xTFjrrs8dczgkExXY8f2kU5i3MrqrogmEr0zk46Mh6s9Xu
         0BL03s5zWZu8hX57gzrxcofNBWDD6QzWdV+poh2aBVzqGBk8GOlJizntredbfxaTMhO6
         LxLLU4H+V11plmIEydkC6AIu3pFsYFm/ZkSRh/QUyoseQl5CPYMbeTuY9Hg34Tgr6q5a
         ggeGb2a+gF9kIrFJd+4be1mWazobjPi+wAiJtqM+KeRNrLj8V48xINV9c3zeQNwntMv5
         YKeg==
X-Forwarded-Encrypted: i=1; AJvYcCX/pKQOnShp0C7Jf06h5Gsz8IN54BbHObjxpyTE4mKuqgbENJaHXy2gE9ITn0lkRbJB1T2k3RFWylvXMJdXjNeedw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSXBU6+0KgtL/RuwM6pGPlmTU61eTfHDMU2qpCh4HfVo38LEUv
	iOBHvAyO0yexmXu8gQakLx4/uctdMagQj2WpIBj93om14FqsheTluNDM
X-Gm-Gg: ASbGnctYOBxy/13J0xXniaX6R6+AqlCRg0p7sxUi+xVjeskidOHbE8eb2127N9LGIxC
	CvGRa8uLr+gByp210UbZ55qIY3CobnMyxXtNIldPuHiTF4aTt6y0Mi/KnLR2U61BvudbWtAhYMw
	IMQBsQeSnS09x17NIPdkNuy7LQX+ZmZvNgcAybuL2yzPWMbCg57yfhYXuxiFBC5kC45cIA6US9H
	izTtrW3iEHIOYOYsdESXvPxyKJ4kgeb7yu6VXMaJ0n3JK8BIb8N9NF/utUiJO+t788OYcXP6l/u
	I71k5LJFHHIT0P8txt7QlRmlZmIAeuM8vYjrIzE1PCjGsnREVhE/daGOb7l21QV5G7E6ckn6RRc
	dyZVxu/ng3r++Vh1osvEBcOrwaK20Ezx91AJWcx7mIU4sDl+55cPfyQfIGNIhOLRVIKeTHjOZMq
	c8sQ==
X-Google-Smtp-Source: AGHT+IFltiUhoiLa6KFOuiYEcyn2lMdNO+3Kz5nBbIKCppqLJwVGnnoJrjC1kbMz+kRJ7+Ne0uP0CA==
X-Received: by 2002:a7b:c34f:0:b0:45b:72a9:28ba with SMTP id 5b1f17b1804b1-45f211fe98emr105326075e9.28.1758034983631;
        Tue, 16 Sep 2025 08:03:03 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ecdc2deb20sm932154f8f.47.2025.09.16.08.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:03:03 -0700 (PDT)
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
Subject: [PATCH v3 7/9] arm64: dts: renesas: r9a09g047: Add USB3 PHY/Host nodes
Date: Tue, 16 Sep 2025 16:02:43 +0100
Message-ID: <20250916150255.4231-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916150255.4231-1-biju.das.jz@bp.renesas.com>
References: <20250916150255.4231-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add USB3 PHY/Host nodes to RZ/G3E ("R9A09G047") SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 47d843c79021..28aff394c9b0 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -836,6 +836,36 @@ gic: interrupt-controller@14900000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
 
+		xhci: usb@15850000 {
+			compatible = "renesas,r9a09g047-xhci";
+			reg = <0 0x15850000 0 0x10000>;
+			interrupts = <GIC_SPI 759 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 758 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 757 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 756 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 755 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "all", "smi", "hse", "pme", "xhc";
+			clocks = <&cpg CPG_MOD 0xaf>;
+			power-domains = <&cpg>;
+			resets = <&cpg 0xaa>;
+			phys = <&usb3_phy>, <&usb3_phy>;
+			phy-names = "usb2-phy", "usb3-phy";
+			status = "disabled";
+		};
+
+		usb3_phy: usb-phy@15870000 {
+			compatible = "renesas,r9a09g047-usb3-phy";
+			reg = <0 0x15870000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0xb0>,
+				 <&cpg CPG_CORE R9A09G047_USB3_0_CLKCORE>,
+				 <&cpg CPG_CORE R9A09G047_USB3_0_REF_ALT_CLK_P>;
+			clock-names = "pclk", "core", "ref_alt_clk_p";
+			power-domains = <&cpg>;
+			resets = <&cpg 0xaa>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		sdhi0: mmc@15c00000  {
 			compatible = "renesas,sdhi-r9a09g047", "renesas,sdhi-r9a09g057";
 			reg = <0x0 0x15c00000 0 0x10000>;
-- 
2.43.0


