Return-Path: <linux-renesas-soc+bounces-9789-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 638DC99FBAD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2024 00:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF6B6B227E8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 22:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C631E105A;
	Tue, 15 Oct 2024 22:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FxFIdQMn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF391B0F3D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Oct 2024 22:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729032505; cv=none; b=NnrQQmySlpUo1ybBYcvo4DHLVVJJW07SuyD2CmUa4SAT0eK9zZ3H6hp3DPtqMrbVCcx7fgFWw8jxuJknjAkzfnGyp1qpBUU8O9mZTptYE+LSkII+xZWKswos8t4BoY3uiir3udQkAlH9xiCP5Zdxro5LvReJ5jPdbAYkynLywPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729032505; c=relaxed/simple;
	bh=Xt+SPNayYTcZheYAYk+x7/F8omRMqTU2xOFjEGKLLc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W17jwTZc90zoNULnP/0PspnzgNd+Gb7msQh2feEJ3OvZi00xnjZuNM7xuqkVk2CI/DXVKgGfF/DvZYrSA6H8jIzOcxhNajTRoxFPaXm8RXhJXF+uoOBvPFoqKfJ3RlY3j2/XzW5DOn/cZN/SZD53im/RvCa4+/64Q9XvNWAIUSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FxFIdQMn; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=gjOh1ls3pFaVMxLi/cHxiztogB8TpcWJCVVgu3aOJEk=; b=FxFIdQ
	Mnp1PvDxTfPXYHxvYv0PwBwHxMXEqewpZqFSrDGBBidjwwDfdCAcV5U4Q837X7xj
	t7DkbB2KmFzKNmj+AzJJmKlVsdi3CqzVzkUI9qCCv1w+AVT+pbuC0E/mWLTYfrsY
	DHYBNBExNOTeQjCFVghm9txZCUGoAvVFZWWJgDH7h35/MwDWeGUM5nSZId5y7DRs
	tS4FuOH+utb02DDqxcJGxEqbIFar/5Aw17gXJLsteeyff4GNJiC/FrOMsIxRZDtn
	K+l0lpb8tzu7SH2jYJ6zoarQILP6VL56PU25gi6vSC3wt4EVFsGtvu1T9xgbm5ne
	YoeBV0yoUyhY1f9w==
Received: (qmail 2861154 invoked from network); 16 Oct 2024 00:48:18 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Oct 2024 00:48:18 +0200
X-UD-Smtp-Session: l3s3148p1@xTrWv4skuLIujnvF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] ARM: dts: renesas: r7s72100: add DMAC node
Date: Wed, 16 Oct 2024 00:48:02 +0200
Message-ID: <20241015224801.2535-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241015224801.2535-4-wsa+renesas@sang-engineering.com>
References: <20241015224801.2535-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/renesas/r7s72100.dtsi | 31 +++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r7s72100.dtsi b/arch/arm/boot/dts/renesas/r7s72100.dtsi
index 39999468c28b..02ca28b521df 100644
--- a/arch/arm/boot/dts/renesas/r7s72100.dtsi
+++ b/arch/arm/boot/dts/renesas/r7s72100.dtsi
@@ -368,6 +368,37 @@ sdhi1: mmc@e804e800 {
 			status = "disabled";
 		};
 
+		dmac: dma-controller@e8200000 {
+			compatible = "renesas,r7s72100-dmac",
+				     "renesas,rz-dmac";
+			reg = <0xe8200000 0x1000>,
+			      <0xfcfe1000 0x20>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 9 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 10 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 11 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 12 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 13 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 14 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 15 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 16 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 17 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 18 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 19 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 20 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 21 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 22 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 23 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 24 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch11",
+					  "ch12", "ch13", "ch14", "ch15";
+			#dma-cells = <1>;
+			dma-channels = <16>;
+		};
+
 		gic: interrupt-controller@e8201000 {
 			compatible = "arm,pl390";
 			#interrupt-cells = <3>;
-- 
2.45.2


