Return-Path: <linux-renesas-soc+bounces-25140-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D95C8762C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 23:46:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 68E464EB0B7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 22:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB572F12B4;
	Tue, 25 Nov 2025 22:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKmrjkfY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0492DF12A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 22:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764110753; cv=none; b=LmjbIxs864WR2NmmiJZWWLZMFNEH+WNBBImdo+02qsOFSjD16s5WmhcanLumXlOtUry8Xjen25B4tqPEfTcCuFzioZWC5oqDDBegNv6lDaXlJhrDwHkXNV2UKv+fbchREYRJrepX/grE9vhA7uU/X4NvqHaFOQrFxAFNRrxTZ+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764110753; c=relaxed/simple;
	bh=pdVEJ0g8xQzq37AE4PAo7uBFINygwXjvrj/w3iexEFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q95cSjsPcG8YbuxgYCOf9kuPJj51ftguLiJlClUX51hLYol5P/1bay5wI7gdO2RsR16iKCFtE64IndTcmzNTS0nDEDltRtXuSEUMURJG+a5r0mjzALrY+iUupQTc293BSfJkvompTRJjWsGgYzfQYEinDCKPq+5JtUDedpr2ILQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKmrjkfY; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso59160545e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 14:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764110750; x=1764715550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uquADr807RNhgg1X7wFAntDztUNP/CrqVpJwm7Cj/Yo=;
        b=QKmrjkfYKBe57Z4WpCTH/gkS8/QeZh3j/vnHnq991/xGh9V7UrDg3lCGxaa3QEXzej
         rekMUBnK5/iY0sMj41WKnMM141Ux9ibadJNU/+HLNgJIbTI4Y9WA1N8NojvoeiwZzAxU
         ZmQywYZCeUXFSg7WpBhgdsfiiNz+5iEsCJKSrzFLTpFVOvHocUBYHjaxsVhb7XhUotU/
         AL2r9+kG8vmsFM73XXbXlnO/CFEEVeHbXeh9qTnH2JhizQSOGgROvNdzg7dB62lpQsuw
         k2zKqttOAa9ERdf0yhgr5/ZYo5ksMvrzzJzdEso96njJjyuQjfP+i5N5+foCFZZtBNIl
         NiEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764110750; x=1764715550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uquADr807RNhgg1X7wFAntDztUNP/CrqVpJwm7Cj/Yo=;
        b=a6HNyGqXCMV7TnP+b9MxW6365+rvOQfnR8867kIr7ef0BzwCMnsGmPl2IzIKV1oEgJ
         y79UyyVLuDdBeewJ/smcX5kUJMCCENg0hEAuO+LqbEqO+gg0rQ0Z+WZnIFk5DZKYodvS
         JceuamA0wXECBGexqXDWoldfYMhNxeJTPJgfdvJCMM2B21XsdHH8A6BU15ROny3Gej4A
         MWrl2NtsdkhZMjWhjPU7FAioCng7YkzGfDO/27pguPVU5Yld5q7ntOWXeshY/1rmbAD7
         rjb4uCymAY9MG2dSSy8EW9aRHCUn0anycVK5N3X4A91TLlUrYtI3v340lhGKqw/dCvhz
         EWhA==
X-Gm-Message-State: AOJu0YyXUI9H6asNTFzzlfmty+9WpP1p0gaGFN6dZMQpnl8KXpf9QEN1
	nQ51KOrhKqDP/RfmbzSu1KaK80b7AaRZU7G+fIxy6IvFVGl5o5vJ5vVX
X-Gm-Gg: ASbGncsLCdyy2Nlw9i/KuBDVqK/HvwlyupPDRd638WRlnNS0KrP8y25LjEmdwqJR0aK
	zyfPsFVAW08v+JVz3E8HE5CVGfVbyCwNkUjwbA1E7d3XuJ819fizo1UnOj3rmrlxvcQth4JFet7
	5BY0wmi7wGEyrH/zU1TrIh0cl7Xeemf5PDMFSReQoEmj1t218sqrhRHVpgZQyt3HM4x67L1n+eO
	5vKCt4c9cleo3oa2HwsMHNxai/RS6Un+09QEVKNWumebOMruaof26QJbVjHYDVrg+N/SPWAI3vt
	XstkFZUzPP3rABq33wSBGnNF+MepOs4lEIYZ6EkW9JEG674galvX8yElPHi4Gsy8M/S+NvQRhdg
	NN2fNC7qgc2kPjHSMNQhgdJX24UbqAn4vz/5CG+W+/DHY6ngxXmUXpby12Unb3S5XPaI2uGp0cG
	ahllWlvol69fAeKd2OFPu+gr09r6eh5Ear0g==
X-Google-Smtp-Source: AGHT+IEtWkDbmSSFD//WD7RTKHpdl1vQonUjvlZwEeB0eRfcHZJ8iqah/fOTtS21wI7ls86MsyooCg==
X-Received: by 2002:a05:600c:4fcb:b0:477:557b:691d with SMTP id 5b1f17b1804b1-477c01eea7fmr146088355e9.25.1764110749843;
        Tue, 25 Nov 2025 14:45:49 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:325:d7d3:d337:f08b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc5ea6sm11683045e9.3.2025.11.25.14.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 14:45:49 -0800 (PST)
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
Subject: [PATCH 2/4] arm64: dts: renesas: r9a09g056: Add DMAC nodes
Date: Tue, 25 Nov 2025 22:45:31 +0000
Message-ID: <20251125224533.294235-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251125224533.294235-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251125224533.294235-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add nodes for the DMAC IPs found on the Renesas RZ/V2N SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 165 +++++++++++++++++++++
 1 file changed, 165 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 5a2a4056b7cc..878e14f5e560 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -324,6 +324,171 @@ xspi: spi@11030000 {
 			status = "disabled";
 		};
 
+		dmac0: dma-controller@11400000 {
+			compatible = "renesas,r9a09g056-dmac", "renesas,r9a09g057-dmac";
+			reg = <0 0x11400000 0 0x10000>;
+			interrupts = <GIC_SPI 499 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 89  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 90  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 91  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 92  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 93  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 94  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 95  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 96  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 97  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 98  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 99  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 100 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 101 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 102 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 103 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 104 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch11",
+					  "ch12", "ch13", "ch14", "ch15";
+			clocks = <&cpg CPG_MOD 0x0>;
+			power-domains = <&cpg>;
+			resets = <&cpg 0x31>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
+			renesas,icu = <&icu 4>;
+		};
+
+		dmac1: dma-controller@14830000 {
+			compatible = "renesas,r9a09g056-dmac", "renesas,r9a09g057-dmac";
+			reg = <0 0x14830000 0 0x10000>;
+			interrupts = <GIC_SPI 495 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 25  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 26  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 27  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 28  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 29  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 30  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 31  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 32  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 33  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 34  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 35  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 36  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 37  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 38  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 39  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 40  IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch11",
+					  "ch12", "ch13", "ch14", "ch15";
+			clocks = <&cpg CPG_MOD 0x1>;
+			power-domains = <&cpg>;
+			resets = <&cpg 0x32>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
+			renesas,icu = <&icu 0>;
+		};
+
+		dmac2: dma-controller@14840000 {
+			compatible = "renesas,r9a09g056-dmac", "renesas,r9a09g057-dmac";
+			reg = <0 0x14840000 0 0x10000>;
+			interrupts = <GIC_SPI 496 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 41  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 42  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 43  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 44  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 45  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 46  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 47  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 48  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 49  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 50  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 51  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 52  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 53  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 54  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 55  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 56  IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch11",
+					  "ch12", "ch13", "ch14", "ch15";
+			clocks = <&cpg CPG_MOD 0x2>;
+			power-domains = <&cpg>;
+			resets = <&cpg 0x33>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
+			renesas,icu = <&icu 1>;
+		};
+
+		dmac3: dma-controller@12000000 {
+			compatible = "renesas,r9a09g056-dmac", "renesas,r9a09g057-dmac";
+			reg = <0 0x12000000 0 0x10000>;
+			interrupts = <GIC_SPI 497 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 57  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 58  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 59  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 60  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 61  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 62  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 63  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 64  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 65  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 66  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 67  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 68  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 69  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 70  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 71  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 72  IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch11",
+					  "ch12", "ch13", "ch14", "ch15";
+			clocks = <&cpg CPG_MOD 0x3>;
+			power-domains = <&cpg>;
+			resets = <&cpg 0x34>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
+			renesas,icu = <&icu 2>;
+		};
+
+		dmac4: dma-controller@12010000 {
+			compatible = "renesas,r9a09g056-dmac", "renesas,r9a09g057-dmac";
+			reg = <0 0x12010000 0 0x10000>;
+			interrupts = <GIC_SPI 498 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 73  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 74  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 75  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 76  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 77  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 78  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 79  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 80  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 81  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 82  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 83  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 84  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 85  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 86  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 87  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 88  IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch11",
+					  "ch12", "ch13", "ch14", "ch15";
+			clocks = <&cpg CPG_MOD 0x4>;
+			power-domains = <&cpg>;
+			resets = <&cpg 0x35>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
+			renesas,icu = <&icu 3>;
+		};
+
 		ostm0: timer@11800000 {
 			compatible = "renesas,r9a09g056-ostm", "renesas,ostm";
 			reg = <0x0 0x11800000 0x0 0x1000>;
-- 
2.52.0


