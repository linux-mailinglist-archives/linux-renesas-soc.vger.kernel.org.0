Return-Path: <linux-renesas-soc+bounces-4736-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 190478AAE22
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Apr 2024 14:11:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 791F1B20C05
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Apr 2024 12:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5896783A06;
	Fri, 19 Apr 2024 12:11:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B65582D99
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Apr 2024 12:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713528670; cv=none; b=JLjvxZqY3OGVVn8c7XZiJHUGcYYpTyjIMJ2Ca5D83ZMMW+xcMnWw8lt1aD98zNGTZB5cS01R6d+XAfaRWx7GHL3gLCciJFuBX++IHRdOiuJCqnTDFJne7kOaNga3YcyV0ZiZ87nIRhu+diLE8AHQEl9DaxZNBxDLPfCcvuNMYkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713528670; c=relaxed/simple;
	bh=JToH9NULfUko0XqYlifG/5ok/9HfOCWw5OwOWxPDx+s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eKeQr5l3htlsOwf0UlP27PlGTm5NsvIjQGCtGc2GlFbMtrF17Tvh6YcyLvIS9wfh4nSYcyO7vJikl8VfVnEfDBxNjgJyUJlqXw8PMKK0T8DFWv+ZYf0xtgx6RrIPvAPvhEOTzmyLOP2+pbgOUv2ATV3ikmFK4DHgW6Ib4YzBDp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4VLYQD5NnDz4wwcp
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Apr 2024 14:11:00 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by xavier.telenet-ops.be with bizsmtp
	id D0At2C0080SSLxL010Atki; Fri, 19 Apr 2024 14:10:53 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rxn4J-00DJLy-NU;
	Fri, 19 Apr 2024 14:10:53 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rxn4v-00GI82-9O;
	Fri, 19 Apr 2024 14:10:53 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] arm64: dts: renesas: r8a779h0: Link IOMMU consumers
Date: Fri, 19 Apr 2024 14:10:52 +0200
Message-Id: <d22ff0526263937ddfa214cdc3ec116a359cbb27.1713526951.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713526951.git.geert+renesas@glider.be>
References: <cover.1713526951.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Link all IOMMU consumers to the corresponding IPMMU instances.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index f4a97e72fcde8fb3..6d791024cabe1b94 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -673,6 +673,7 @@ avb0: ethernet@e6800000 {
 			phy-mode = "rgmii";
 			rx-internal-delay-ps = <0>;
 			tx-internal-delay-ps = <0>;
+			iommus = <&ipmmu_hc 0>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -971,6 +972,14 @@ dmac1: dma-controller@e7350000 {
 			resets = <&cpg 709>;
 			#dma-cells = <1>;
 			dma-channels = <16>;
+			iommus = <&ipmmu_ds0 0>, <&ipmmu_ds0 1>,
+				 <&ipmmu_ds0 2>, <&ipmmu_ds0 3>,
+				 <&ipmmu_ds0 4>, <&ipmmu_ds0 5>,
+				 <&ipmmu_ds0 6>, <&ipmmu_ds0 7>,
+				 <&ipmmu_ds0 8>, <&ipmmu_ds0 9>,
+				 <&ipmmu_ds0 10>, <&ipmmu_ds0 11>,
+				 <&ipmmu_ds0 12>, <&ipmmu_ds0 13>,
+				 <&ipmmu_ds0 14>, <&ipmmu_ds0 15>;
 		};
 
 		dmac2: dma-controller@e7351000 {
@@ -996,6 +1005,10 @@ dmac2: dma-controller@e7351000 {
 			resets = <&cpg 710>;
 			#dma-cells = <1>;
 			dma-channels = <8>;
+			iommus = <&ipmmu_ds0 16>, <&ipmmu_ds0 17>,
+				 <&ipmmu_ds0 18>, <&ipmmu_ds0 19>,
+				 <&ipmmu_ds0 20>, <&ipmmu_ds0 21>,
+				 <&ipmmu_ds0 22>, <&ipmmu_ds0 23>;
 		};
 
 		mmc0: mmc@ee140000 {
@@ -1009,6 +1022,7 @@ mmc0: mmc@ee140000 {
 			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
 			resets = <&cpg 706>;
 			max-frequency = <200000000>;
+			iommus = <&ipmmu_ds0 32>;
 			status = "disabled";
 		};
 
-- 
2.34.1


