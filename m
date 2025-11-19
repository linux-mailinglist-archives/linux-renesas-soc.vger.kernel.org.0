Return-Path: <linux-renesas-soc+bounces-24782-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 571BCC6E295
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 12:13:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E82DA4E121C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 11:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABD6134F47A;
	Wed, 19 Nov 2025 11:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKEMcxe3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEF8354715
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 11:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763550324; cv=none; b=XJax15BBhnnMkWqB77TbqQ3OILolRJqRSuHvUj1ntEGfhDVXuB3+oC0Uj4blqYvcAxRwytmASyo6IcA+kz6tnf+2k4DvQTmi173F9615HBRoQpfEXwYQbFwjyffncgAOBjOETv3vz+AJ0fnv8Veu6OAWrFQSuA8W8PaBgBXLCiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763550324; c=relaxed/simple;
	bh=40Mb/4irtQljGF9gYZfr/Rpdwacajfl7uxiy72U3bs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QWkH4fCdk5mhvSEBJwH12Ujernfbmz0j023HGE7UI5iL7WbojNcyblo20FvkPCrqyQkgCFkxDUaX+nIEolFGyhkKmyZJEKAnjx5E+DBl5fMy0UzPpz47d47krc0tG44cEMMt8YHXWWUU+4wyTSVGS9otnlt/oNhI/s7PKv1jFKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKEMcxe3; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso16391345e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 03:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763550316; x=1764155116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7HGU80H0HC+PV00Zhq9VfTL5cxvVJfcWWieERbAVklg=;
        b=QKEMcxe3xbn2mCs7J5bQPtuF25sxy4zvQ8a5vvOzU09ShoA7/p1fzrWkmWeXcF+NSK
         yBeqteGMBDdM4DOMovVwDX/J/8K2a78mK7e+PLl3cSTQAI98rpP0zYiFlB9VqgsqYCjp
         wUzBBWoGATJB5myGvc0OkWDvh52F1XIP0d9+W6lIar74Fam7ZQXk9NqHvBbRq3V4Lm+1
         RY9Gc7X3dCSUPwU2qiKlS46BDqX/ZROHsZ6kGZNooNdOyd8viRvAbxLgWKRD0JkkszJv
         p6nMP4mTZnTAjeMqOAWeNKc+d2LnCKZwGwjBTFWoiMgLv4WIyj0ZZJGPwPmvFoEGpLE6
         av5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763550316; x=1764155116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7HGU80H0HC+PV00Zhq9VfTL5cxvVJfcWWieERbAVklg=;
        b=kCV26YQ4G/gtLiwA9MZ9wNsRyzwrlinFJSwolxFnY/za7avHUXTnq2NHlD7vrDda22
         hzbvZ3qoZnas2KBM9QHPUBK2K9+CHvRM4P58gMZLNLPDqNd1m72eDzGrdaIi2YWQ0Kqk
         j4jFFPU2uxWMvvvRx2HZjzrF/BrmX8iMIDHbikmrxlF4NWztJTlYJpD/x1dqU7bLHqbo
         uM02NlS4dy3oiLWDtgIFSmdis7O92DuKd3k2sW3ZrF0VUlzPXmPAkWl4okKEENAuuUhh
         7jshBA43vDmE7dYQf5x/fQxTKLdKDL9rdo+MtPi668YCB/sHOCqKBAlnJBhmc6DQVHJy
         +x/A==
X-Gm-Message-State: AOJu0YyB7zQYavDEzs2IsCyw5gaTdIkoJsSaimCD5KSx+AGcpOjxj2nm
	9ro10uDEc5I+UTEVw2EGUXEJvGcZ2N8mWYojmRNJsHhRzLz7EOP1sBI/
X-Gm-Gg: ASbGncsnWI0LqxjIATK1EmOzetvojiWVjsG5KSBa7CIPKXRMQeUg4x8pJsOk9Qa5PyB
	L1c49G71ROgc43RuZHju8Y56qWgUUTbeIxgvK5LIUA31xjtTXJBERmv6Em4xj4OEmQeo5RCZqmZ
	BDLemnPsCjOBWlvqsEiMhAAeBLQFXWmf7hvyQ4NIuGzqG0LnII2nkbLHMr2URO0AoRkCLpulqPM
	U+ewnwbcx7SkA/ov+rzuF2we0xBZqR3a17RvHLR4iNz7+pI7Qyib5WdOoo4LQ9eEm17rmt/n8vk
	qBVUsOajPw0Q4cwdbl0Q3+WshIKIO3s8njjt5Fvccvq5kYvyL9J53jeTaLJG8BUFeT2ZjM7XtyQ
	RSMwprXDMji+xDEIY03ALNchcOPTd7pS2Tiqxy23CGhetn6b4ljrcRc7DMiQINd9HHN5a0ooJZ3
	/egVjyeql9jstusk47fG2yffZz7bRPw3nP81E58vkVgNODEnYNsKyMA3DN
X-Google-Smtp-Source: AGHT+IE67484p71NEh2FIcbLA9OJMEthml3cSpH2dhprDbDEcfdU9ZC9o/d3dSYWlN1avNYXA06q+w==
X-Received: by 2002:a05:600c:468f:b0:477:b0b8:4dd0 with SMTP id 5b1f17b1804b1-477b0b8505cmr29146875e9.17.1763550315268;
        Wed, 19 Nov 2025 03:05:15 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:4b7e:3ed7:e0b3:cf30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9d198a0sm39884505e9.1.2025.11.19.03.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 03:05:14 -0800 (PST)
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
Subject: [PATCH 3/4] arm64: dts: renesas: r9a09g056: Add USB3 PHY/Host nodes
Date: Wed, 19 Nov 2025 11:05:04 +0000
Message-ID: <20251119110505.100253-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251119110505.100253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251119110505.100253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add USB3 PHY/Host nodes to RZ/V2N ("R9A09G056") SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 68f7a8b68d91..5832aea664b1 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -696,6 +696,36 @@ usb20phyrst: usb20phy-reset@15830000 {
 			status = "disabled";
 		};
 
+		xhci: usb@15850000 {
+			compatible = "renesas,r9a09g056-xhci", "renesas,r9a09g047-xhci";
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
+			compatible = "renesas,r9a09g056-usb3-phy", "renesas,r9a09g047-usb3-phy";
+			reg = <0 0x15870000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0xb0>,
+				 <&cpg CPG_CORE R9A09G056_USB3_0_CLKCORE>,
+				 <&cpg CPG_CORE R9A09G056_USB3_0_REF_ALT_CLK_P>;
+			clock-names = "pclk", "core", "ref_alt_clk_p";
+			power-domains = <&cpg>;
+			resets = <&cpg 0xaa>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		sdhi0: mmc@15c00000  {
 			compatible = "renesas,sdhi-r9a09g056", "renesas,sdhi-r9a09g057";
 			reg = <0x0 0x15c00000 0 0x10000>;
-- 
2.51.2


