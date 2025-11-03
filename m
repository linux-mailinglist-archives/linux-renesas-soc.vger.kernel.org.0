Return-Path: <linux-renesas-soc+bounces-24048-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E3CC2DFA1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 03 Nov 2025 21:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B5DAF4E7F92
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Nov 2025 20:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C512BE7DD;
	Mon,  3 Nov 2025 20:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ws1YN+3Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371F029AB05
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Nov 2025 20:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762200269; cv=none; b=uuJab7kx/IXzaC38bs/JcS4VDHeTyMQk5wwHfpYD0tEK9MB66CNk1R7vHPEyMapZAfpWxoT4dURbUei6FKR8xO12PdZRvAAvBdbSzEHy7A9i1zjc/oY4SvQFIqzZrrZka9u+owR2OQqQ5wExTZyuToQCTu/N+e7B92QsEi6TZGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762200269; c=relaxed/simple;
	bh=AJboJwtByjLt4BQm/5w//T60aiZanFwt55vZ/PQSnPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZVLzuhETT9i5T5c6jYt9OLzDAPC4rCn7eSESfsD9LP9O96aUNjVFlBLkNcWQWZx1wUbBQkfOkcfW5OUQF/ZWBw6/iz840U71OSjAzHzzwWPYLOgp3N+fisH+4os3Z0LXxF4U5Or0DDtxlC3E8DPzI1EWSk+5RlcrRBqecELDVZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ws1YN+3Z; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b6329b6e3b0so4559673a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Nov 2025 12:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762200267; x=1762805067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yr180Wdqi+8Vuyntg0DHNHyNUxvxzmGgyEYsO9i4RzY=;
        b=Ws1YN+3ZjSXDoLTQ2es8Vk5xGxJWdWt4XfhMThBpYGKcoMyeEebUA6uISB/xhWZHpa
         v2224THxFTO3GQqo76GCj3IG/dneyXX91WFER1DDekHxEhQsj2RWCaeMPPbCDiTbxhsD
         PZuk1FAiVhETqNNnDUsq4sT/+5kM6QiuEV30okHX/4pe+O/QOErEs9D+J9B7GD1idccl
         7VORFGCQex9ylxfb5Pz9G0pQ3/s2kKxUWRZHg6rfGGWGa7+K79m2H8igTtpCQWYAr9sz
         SgOqGT2i8VFu5uDuTg1DX9gv/mjCwnf3we1s5nOlck6BAtEdoLrpMil8PxgaOCZQxYMW
         wpcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762200267; x=1762805067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yr180Wdqi+8Vuyntg0DHNHyNUxvxzmGgyEYsO9i4RzY=;
        b=ZoZQBLicibyIgV17JQHZqdUki+gW5AT+dz1JfbHR0CCf5rhJX96QJ7u21Y1+yOageS
         oVDHa8yVT2r6jtw5exzXsYxvj7OnJ8u06HMVd/Y0K7PvC5gRnHr364S2/zDZ1Gbfp3ti
         FhZCD/OSGsnJh2HJlL1vni4iYVs+mebkjRphS3GCQefYrOXsMvcTHsl5ZLbyY9yLVsNc
         HWktM+Bbe1tR+NAxd6sM3Vrnc8gm7QygiO3gJNDJ+H+0wkbn2VvO9xrvAxw73lu0KrjX
         yHEUktQvG467c5bbk+gzJTqNxIbUwGkUg6rIGJHa0T1pO0YydU11FKVyc5PeQwncj+a/
         gmgw==
X-Gm-Message-State: AOJu0YxxlxDxY+A4SudAkpEm7jma0569vqw03uwA5uIcblh/o+Ge2j0h
	KJdbehmU1i94eMXLKx64wigeuKFvhpUfmkqso8Ae4eGN8X4r3D0jTcLe
X-Gm-Gg: ASbGncsDmDaH4Yo8WQHzSQC0YJDkZzPwDOkRaewufFY1GiSiWmpnMde2VmeDntNrh0G
	xCyiqBt1ifi6k7BcPO+KKHJjJgO8Tjy7xtcZkLr59s29A6jvdoplp0qXnI4f4b9BtOlXb/wKri6
	c3T2dQAEL2eVNU3QdkOhI6Cu7w0IpfCxFKiC9KtkMtXH5cp0Dk0epvO7yKvXVaJzNicLYX0PaRX
	mRuypQHV/D+zppsNDUarb3q9oluXMrTjXCSVOyXVh+b0PTfbydqCPF9shfy3/P6oyS5hSplZiE7
	WA1CoxaCY4042iliE5D5P54VD58shBIRHRl4eEgFrQKNZO9+lGf/DSCvdop86U+4tcejBat4ERH
	7CImTYUc/m3RVhfZ/QPGkraBas8ztO0fMqapMTdLQNbg05CDy9D0krMDgAv4C+fj/VK5Hudltbf
	RRvtx2HQWs+Ef8dW2MB36kSYy+5m+xb4g=
X-Google-Smtp-Source: AGHT+IEAb6DgkGpt7HMZI371Wrh493Iq+w/oAaPYUjvnbziHhj4A5xJ/gibEnwkSsAir4iS9cUOY8A==
X-Received: by 2002:a17:903:2b0f:b0:295:82d0:9baa with SMTP id d9443c01a7336-295f947fdd7mr6589485ad.17.1762200267134;
        Mon, 03 Nov 2025 12:04:27 -0800 (PST)
Received: from iku.. ([2401:4900:1c06:600d:df45:8e1:7a61:1482])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952774570bsm127494895ad.99.2025.11.03.12.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 12:04:26 -0800 (PST)
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
Subject: [PATCH 1/3] arm64: dts: renesas: r9a09g056: Add FCPV and VSPD nodes
Date: Mon,  3 Nov 2025 20:03:47 +0000
Message-ID: <20251103200349.62087-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251103200349.62087-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251103200349.62087-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add FCPV and VSPD nodes to RZ/V2N SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 33389592818d..32a8005058f8 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -957,6 +957,30 @@ queue3 {
 				};
 			};
 		};
+
+		fcpvd: fcp@16470000 {
+			compatible = "renesas,r9a09g056-fcpvd", "renesas,fcpv";
+			reg = <0 0x16470000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0xed>,
+				 <&cpg CPG_MOD 0xee>,
+				 <&cpg CPG_MOD 0xef>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+			resets = <&cpg 0xdc>;
+		};
+
+		vspd: vsp@16480000 {
+			compatible = "renesas,r9a09g056-vsp2", "renesas,r9a07g044-vsp2";
+			reg = <0 0x16480000 0 0x10000>;
+			interrupts = <GIC_SPI 881 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xed>,
+				 <&cpg CPG_MOD 0xee>,
+				 <&cpg CPG_MOD 0xef>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+			resets = <&cpg 0xdc>;
+			renesas,fcp = <&fcpvd>;
+		};
 	};
 
 	stmmac_axi_setup: stmmac-axi-config {
-- 
2.43.0


