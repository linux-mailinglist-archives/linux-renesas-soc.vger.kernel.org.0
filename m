Return-Path: <linux-renesas-soc+bounces-7970-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A8B95982F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2024 12:47:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADA98284486
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2024 10:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 641391B1D51;
	Wed, 21 Aug 2024 08:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4Gfb6Qz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F19119ABCA;
	Wed, 21 Aug 2024 08:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724230617; cv=none; b=RtqJcL5s6jIgusUBU1wmnaikGA4WhpOxMLhX0Gwizr687IotoUogjwyW2vTULIIDF6V8FMw5Fiok1F24v/Pevp3+88bNZnq7wk0RHUp6FlxfZ62WaVDeedUZYRM722bhlEceLx3KpcbZvyHY24Y+g5Pn0aAHKIRpUQ3q+pHr+e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724230617; c=relaxed/simple;
	bh=V9cbl7fwosTTrPVef/dWaCHoBIqEwwNOtb7obO3LER0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H5EC2x82DEEeJXo3mPL710RevLEpdUPHNm05IvlR+Zm1UUZD2hHn90d7vKXPyq4DkxMz1FgBgBXsAiVx2hnaJpzvcQdGi1v+mtbqt1jgxIxcwVfhOg1f+KQGY/PzBBkAMGryZZp6e3tOUZuxaTdxKXixiDInntEncPHwtAuREus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4Gfb6Qz; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52efe4c7c16so8249874e87.0;
        Wed, 21 Aug 2024 01:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724230614; x=1724835414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gdNsIKo1oAfxJ/3C/NQPE6o/qhji3q5uv3jXjROkjMo=;
        b=e4Gfb6QzDAtKw+vFQUvunWIUglnUtZzwtAiWzEoMtzUQIRtNCzfI3FlVlLifOHQV3J
         BoluJBH+FdV4pOj8l25T2FmEp40OMZO4oewWZtm3zAEsKw0XRQFqty/wum1g+4zb1p6v
         1A6Ic7jt+TsCFGDDdEjWUuA01yjgOenbpDUF6/lSOB61REhlUmKE6Nv3J5yQtsyalkcl
         iv3GyWaUNKRvHIR50uNPvtvKlBUX0GnB5jxRBeKAGCX0ksX1IwHJ+ODf6u0SixxFGmL7
         fYocJTj24FvtIoA07g+yp5t1a16Hnje/AHCJz2v9xBgg06dBo/bH4AavX5GxPPFXOfjh
         rK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724230614; x=1724835414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gdNsIKo1oAfxJ/3C/NQPE6o/qhji3q5uv3jXjROkjMo=;
        b=rE2PSt6YA1EANN50LUWlzxVSv+Db0LyENBrarmFGyKC+ror0fo93Bdh3Zn+aXkgxB/
         c/CtBGsbVpfMi/YnYlsMK7s38Dt5gf/A/DgBSsVqv65emSk9jEIgWdOKPmcd9o7QDs97
         AAUg7hSXWs7Jm7qatvunq0NxOgGq7qmK71QIF3NTQO0BkQP3QbFP+kmqmSxo/nXCHGVG
         1dFUfA1VTdWOYVHfNCAfuZq9eCmOfyqGL0/Iy+Cx+BDtM9YSW8fQdYXPXSAkSVSjJ6q7
         LA9E8ZuHBfZGm40Ix2AROQpQxCChENkCqV6EOw9XsxkNrCwkAI+n5so3P90KyLZ7tpb9
         gqVA==
X-Forwarded-Encrypted: i=1; AJvYcCVUpuu1DC3jUhwqNVoCHnEXRAmqavH8SnV2BO4lDJEnAfO0HCd1YX3sBFwwlYuvzvRENkmw0BPt6Nqa@vger.kernel.org, AJvYcCXJcpueLnG0/OT3Tba7xALil/HOTbb/f7EChHAEpFL7vlu76KIZVhapYPwNrpVFjxYL+XFDo156b419/+/w@vger.kernel.org
X-Gm-Message-State: AOJu0YxSmj7j/Bw01FQwtQMmrdtnSe9N8TsSq2mwSMcjpjFcuMPypYhK
	LMBERURx0Uwgwo5ztfjIJdHPCZjDL+iE5MRUo3l/M4AsXi4bsst1yjVjo3D9
X-Google-Smtp-Source: AGHT+IEYhbqAbEh0L9xGeXoSnd9UGUYFrdtcFSXNPBWibo5XkGQcDAvOBKfPZw3zBf4Zhjd8WLltdA==
X-Received: by 2002:a05:6512:2251:b0:52c:a016:5405 with SMTP id 2adb3069b0e04-5334854a56emr756490e87.8.1724230613313;
        Wed, 21 Aug 2024 01:56:53 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:b9a9:40a4:353f:6481])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838cf183sm873416266b.56.2024.08.21.01.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 01:56:52 -0700 (PDT)
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
Subject: [PATCH v3 3/8] arm64: dts: renesas: r9a09g057: Add OSTM0-OSTM7 nodes
Date: Wed, 21 Aug 2024 09:56:39 +0100
Message-Id: <20240821085644.240009-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240821085644.240009-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240821085644.240009-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add OSTM0-OSTM7 nodes to RZ/V2H(P) ("R9A09G057") SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3
- Grouped the OSTM nodes

v1->v2
- New patch
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 4f89894417f6..5e3a4017fc13 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -121,6 +121,86 @@ sys: system-controller@10430000 {
 			status = "disabled";
 		};
 
+		ostm0: timer@11800000 {
+			compatible = "renesas,r9a09g057-ostm", "renesas,ostm";
+			reg = <0x0 0x11800000 0x0 0x1000>;
+			interrupts = <GIC_SPI 17 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 67>;
+			resets = <&cpg 109>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ostm1: timer@11801000 {
+			compatible = "renesas,r9a09g057-ostm", "renesas,ostm";
+			reg = <0x0 0x11801000 0x0 0x1000>;
+			interrupts = <GIC_SPI 18 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 68>;
+			resets = <&cpg 110>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ostm4: timer@12c00000 {
+			compatible = "renesas,r9a09g057-ostm", "renesas,ostm";
+			reg = <0x0 0x12c00000 0x0 0x1000>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 71>;
+			resets = <&cpg 113>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ostm5: timer@12c01000 {
+			compatible = "renesas,r9a09g057-ostm", "renesas,ostm";
+			reg = <0x0 0x12c01000 0x0 0x1000>;
+			interrupts = <GIC_SPI 22 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 72>;
+			resets = <&cpg 114>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ostm6: timer@12c02000 {
+			compatible = "renesas,r9a09g057-ostm", "renesas,ostm";
+			reg = <0x0 0x12c02000 0x0 0x1000>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 73>;
+			resets = <&cpg 115>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ostm7: timer@12c03000 {
+			compatible = "renesas,r9a09g057-ostm", "renesas,ostm";
+			reg = <0x0 0x12c03000 0x0 0x1000>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 74>;
+			resets = <&cpg 116>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ostm2: timer@14000000 {
+			compatible = "renesas,r9a09g057-ostm", "renesas,ostm";
+			reg = <0x0 0x14000000 0x0 0x1000>;
+			interrupts = <GIC_SPI 19 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 69>;
+			resets = <&cpg 111>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ostm3: timer@14001000 {
+			compatible = "renesas,r9a09g057-ostm", "renesas,ostm";
+			reg = <0x0 0x14001000 0x0 0x1000>;
+			interrupts = <GIC_SPI 20 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD 70>;
+			resets = <&cpg 112>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		scif: serial@11c01400 {
 			compatible = "renesas,scif-r9a09g057";
 			reg = <0 0x11c01400 0 0x400>;
-- 
2.34.1


