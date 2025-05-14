Return-Path: <linux-renesas-soc+bounces-17091-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F347AB68A5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 12:18:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D114866E17
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 10:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F792278172;
	Wed, 14 May 2025 10:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8Xv1nbT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C81276056;
	Wed, 14 May 2025 10:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747217750; cv=none; b=BFvZcmfWemNnms6zGAt147BnWsCfiknOmpgpMAH6fmCBmNw31Cds+5iDC/XAb+cvhro1Ms39rYrcEJgTNYTbEg4AvwHFk4Zrv3EKIG+TJrUTMkIa13cP2PJdAycRBEBQomP2hGB1Bo25HT76h8O6k7YJDJyqYNg8Af8YKpepfI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747217750; c=relaxed/simple;
	bh=3eD0yi+D2PeviCoqiH1RCNIHioFJCJKmeCEIcpKOVow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AdV1pD4tBmTuyxSLRI+Uc9S6kvN9xjPbEFR9JxJxSb6WTLFd0pcCpl7yq5oBY9ZVL4jZhMZ+KW1wLhRU+5oUEIwDLR+AZOqoMHo9cZk3s3yUfEAOHw/HW65oIybbhZ8GICAksIKHe/9WUXzD3CwlMMiqq/i0K6b3ZkHS93Dcaf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A8Xv1nbT; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a0adcc3e54so4067345f8f.1;
        Wed, 14 May 2025 03:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747217746; x=1747822546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvV8YSXuOxwyADNNCE/KZ11v4TsASXM0gC6Xe+9SlOk=;
        b=A8Xv1nbTjjME43iaKaZnQf//3jm8nZP46YSaU496IkXqAtXI/kC78Qif77aaWJUwpA
         HCC5x89O00+oe/XeGmGTJWoZZA37p/lxHdFr5med2OUVgDC6r5cN8KW8UxOgw5HS3fid
         Pqh0YUlLgfsVjYASlMUvJIvcQPXJIlXazvLk9CWLdvPv97HN7EIL4im83Lu6sUPYquW6
         kIOBZ2ObUCnsqDeYLIjZ2XdnFFXorTo0LOZC2cvziJVZqhDG2oz9hAt+nr01sgS/h+gC
         RTqR95Xj7uYwno4fEe05ZdhVUG1Imqj2a0ZGAxDFE+W8WJA0SRvJ1SrgY4IHb1AshxwU
         Mebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747217746; x=1747822546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvV8YSXuOxwyADNNCE/KZ11v4TsASXM0gC6Xe+9SlOk=;
        b=PbGk1Y9j+y0XpAhYWKSgNfGHooshk2uPuylL7OicvZWM0uSn9Q6JEArsjS+sAKQ+bB
         KGzr9Zfxp5nNjbhtprWOFlXkassAHUsWLq6UZKW5CWW8Hj8g1qzcUytM50ySe5NQtlcM
         azJ4lnquwpc8uCB6yt1GLi12TQ4khjfP01oitVoA3AsLkQnsAjLkAKo8BucNSj8wmA/B
         BGj4q0tlTfZt60YTYcTBwa+yQ9RCqd6BEbJDMj8XU9GsB9eTSMcL5k45+K48lOSbuTYh
         VOUfAJ93FuUq1ptsJN0SNK6NVyGcLNm07Gr+s1Ow0mPwhgzAm5V//sWbbKOcJ1YFGaIh
         h7bw==
X-Forwarded-Encrypted: i=1; AJvYcCUb6eXXiR5Xc+FLgMAZT51m6Ht0TR6hpcEssvEF+8yhxe4IvNY/bPOGQEjKlIW4B6Y2g7SN7mLSSAfmG9fR+I4nr9A=@vger.kernel.org, AJvYcCW6yZRmXdc1eVmaq7JwKvUciLtC8q741pSq11sLkuF+OBwQjdv24UYS4CGxRWkHgUsGQnY0lQv0uGYw2rk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHiPV/6moGzKDh7p3LPSDq5iUcmgVkO/CojJ43BRBGdH/GDjBb
	7wUTaqdyKle3T27BrtypPKzGJMuu8LMeaHB3US30OfIWBfpDs4ca
X-Gm-Gg: ASbGncsAnpubr1Gzr+9QhVI5yksKdJHVNty2hU0gdtrXtlTBSiAyWTbVStzxdSBqhPA
	Sf3PvJ+86iks3vxJxV+xcG/dVffBbje76xUN2RkSpAX95H0lKhkZcerHletyAy/nggVpE1bpyhT
	uh14nkogxKkbHUCdPIIHUvi0Xj6ID3bq3r7RWNX8a+DRuZU+qvRRT2HEPri/7WhymND0zAWtIOH
	fJsdU+HzxoC+oRRsTxIcKYM0PYXQuDyAygNCw4PJfQILrqijvjOW8zmTscWPXsvims3pzQgorD7
	+1s8qvGO0RIo60k/j+9btJMhspg6U1PJL41U4jKtSFUH658vES0IG/GKGKAyhontxmP6dt3R/Ak
	h
X-Google-Smtp-Source: AGHT+IHzc3VuYFaM8/OdcVGuC3S7sL+L7ONXkaxy4vDvigAky2l9UIyxdluucgSucZdD366yXL+/rg==
X-Received: by 2002:a05:6000:250d:b0:3a2:30b:b2 with SMTP id ffacd0b85a97d-3a3499536d6mr2208527f8f.57.1747217746488;
        Wed, 14 May 2025 03:15:46 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:6140:13af:687a:7a66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f3afdsm19530249f8f.60.2025.05.14.03.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 03:15:45 -0700 (PDT)
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
Subject: [PATCH 09/10] arm64: dts: renesas: r9a09g056: Add Mali-G31 GPU node
Date: Wed, 14 May 2025 11:15:27 +0100
Message-ID: <20250514101528.41663-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add the device tree node for the ARM Mali-G31 GPU found on selected
variants of the Renesas RZ/V2N (R9A09G056) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 93bcd5f203ef..78313ec4935f 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -123,6 +123,35 @@ L3_CA55: cache-controller-0 {
 		};
 	};
 
+	gpu_opp_table: opp-table-1 {
+		compatible = "operating-points-v2";
+
+		opp-630000000 {
+			opp-hz = /bits/ 64 <630000000>;
+			opp-microvolt = <800000>;
+		};
+
+		opp-315000000 {
+			opp-hz = /bits/ 64 <315000000>;
+			opp-microvolt = <800000>;
+		};
+
+		opp-157500000 {
+			opp-hz = /bits/ 64 <157500000>;
+			opp-microvolt = <800000>;
+		};
+
+		opp-78750000 {
+			opp-hz = /bits/ 64 <78750000>;
+			opp-microvolt = <800000>;
+		};
+
+		opp-19687500 {
+			opp-hz = /bits/ 64 <19687500>;
+			opp-microvolt = <800000>;
+		};
+	};
+
 	psci {
 		compatible = "arm,psci-1.0", "arm,psci-0.2";
 		method = "smc";
@@ -508,6 +537,28 @@ i2c8: i2c@11c01000 {
 			status = "disabled";
 		};
 
+		gpu: gpu@14850000 {
+			compatible = "renesas,r9a09g056-mali",
+				     "arm,mali-bifrost";
+			reg = <0x0 0x14850000 0x0 0x10000>;
+			interrupts = <GIC_SPI 884 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 885 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 883 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 886 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "job", "mmu", "gpu", "event";
+			clocks = <&cpg CPG_MOD 0xf0>,
+				 <&cpg CPG_MOD 0xf1>,
+				 <&cpg CPG_MOD 0xf2>;
+			clock-names = "gpu", "bus", "bus_ace";
+			resets = <&cpg 0xdd>,
+				 <&cpg 0xde>,
+				 <&cpg 0xdf>;
+			reset-names = "rst", "axi_rst", "ace_rst";
+			power-domains = <&cpg>;
+			operating-points-v2 = <&gpu_opp_table>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@14900000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x14900000 0 0x20000>,
-- 
2.49.0


