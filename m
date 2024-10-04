Return-Path: <linux-renesas-soc+bounces-9421-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1547999045D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1818B1C21B6E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 13:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4700120FA9D;
	Fri,  4 Oct 2024 13:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lb9E1CKk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D271D5ACD;
	Fri,  4 Oct 2024 13:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728048681; cv=none; b=eKtogSNVOeUgdzIcs6zp2eUT1q9oXNoiA0RJW7L0KGd3cXaDICVu/cfZkHgy+mU96jL+xHu7X4CyIFEwtBepfYInFT614Xu+EDhAzF6YQnreMLR4HeuqZ6XTZZLLChzw0n12G3yVAiKmADFaEZ/vIL4YIXNR/WjpBbyg5OTbJ8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728048681; c=relaxed/simple;
	bh=Iu1gv/k8F2h1dC66UWRL5I/bhTJBJoJ3l4bcLLGXRwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZskJy5gHusHyVoCKAiEp7EWtGfyYEyFyqCk9+DQYtrzq6TW+/qLsFn3wc08uo9RHY7Mvt6NROIyV5Lljcx+GIv5/jgzzRHJzhwPlLCH/g7wmSqx3MOab9cZ64YSop7ZCTtXDeiHeLZkTZJCYLY3+V0EGOlZK5vfwjU9WctKqr38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lb9E1CKk; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a8d446adf6eso335974566b.2;
        Fri, 04 Oct 2024 06:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728048676; x=1728653476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6yETtxhYfKgePwSm8il+6GbuYmopjTBTmbDRGz8idKI=;
        b=lb9E1CKkzAX2E8rLFBrQaEHam6DTYK3h0khqsRLXepdp9Y6rEGbp9FZH1/WZ57qWlP
         eiEgYEM6JYq6oCxSDMgZhPMDbRNN0v8qQsWjCgGSns27B3ZMiRZLCHcUZ9eM6nGLkr5C
         +RItxrXVYkfY38410tAKuraK9gBl0aJYGAMvzm6NLdBsGzze26os85KQTf9rvAU8oUjB
         3CssObcQtyBOPjXESRiVPU699IY3B0f+Eo/m58iB7crclLLSeKJBwhhGQBfguOHo/AZt
         v4ndsxO7uXmRv5672jhZDHffeAmlxHGspw5fruQ2J9uq99VMu8reH/q5bn0Tu68oeGoa
         7Qyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728048676; x=1728653476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6yETtxhYfKgePwSm8il+6GbuYmopjTBTmbDRGz8idKI=;
        b=vMDfjJBR2C8e9sCfiss4cbhyBa1y+f7WAbkrDtg98j62L8K48zJOTKUERJ+/SHVewO
         nLXvRVY5nH7AXXPn9vhCD2CtAcRtGno89eRs1nBv2Ahub4mAD/AQccPFsgtVjR0+Bo6Y
         OFk09BttTE12uljBfMiOOG4JThlJyrTlbyus5S3YiqbTO7Ijiw537JwYvV1iv+Ypul4A
         LxNcl6ILP4bc/YF06MrGjJ+A6ki21eoa+zoGHLpfb9XJEdkE57Xl5goFZWvYg0ouL88Z
         PqNekgYGAaLn5uPzerNTdHfCN5J9qWppG2FlXU2vp3K/Fc+XrgyZ5LcJA02vMuXOXdZB
         gexA==
X-Forwarded-Encrypted: i=1; AJvYcCVBEVfp1sCks0Ej+6RwvvE9W93AAS3baF0CnAI/xrEKGSyKYMRTxWps8SlaxhWm8504E74StDcOZjd7hX4=@vger.kernel.org, AJvYcCWXFmiPeJyNRfJru0j3CCFs02e/WzuoxZbyl6BOkZJv4GfARDi8DwZsfwc4A/T7QerzlPT5LYE044VkyysRHKoVBFk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3VVo3UYmcdWJYq3iOs50nBMN1tVvq+EJWc46MabmPXloI8NAh
	sSz80ymozVxE4BmuN9gPKljdusfWjUfHFcAFAPqGcJ3SMU0BIKXE
X-Google-Smtp-Source: AGHT+IFTWB2e+/9sAS1muQWqQEY27QPrKJQFlfd715jG48tdjQfeL/fF/bJhskBq6A6/Ea/Sm1lxkQ==
X-Received: by 2002:a17:907:70d:b0:a77:c30c:341 with SMTP id a640c23a62f3a-a991bac3142mr274226266b.0.1728048675574;
        Fri, 04 Oct 2024 06:31:15 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99103b36d0sm228486366b.137.2024.10.04.06.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 06:31:15 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: r9a09g057: Add OPP table
Date: Fri,  4 Oct 2024 14:31:08 +0100
Message-ID: <20241004133108.779934-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add OPP table for RZ/V2H(P) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Note, this patch depends on [0] for frequency scaling to work.

[0] https://lore.kernel.org/all/20240918135957.290101-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 1ad5a1b6917f..396c95bc1b4e 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -20,6 +20,39 @@ audio_extal_clk: audio-clk {
 		clock-frequency = <0>;
 	};
 
+	/*
+	 * The default cluster table is based on the assumption that the PLLCA55 clock
+	 * frequency is set to 1.7GHz. The PLLCA55 clock frequency can be set to
+	 * 1.7/1.6/1.5/1.1 GHz based on the BOOTPLLCA_0/1 pins (and additionally can be
+	 * clocked to 1.8GHz as well). The table below should be overridden in the board
+	 * DTS based on the PLLCA55 clock frequency.
+	 */
+	cluster0_opp: opp-table-0 {
+		compatible = "operating-points-v2";
+
+		opp-1700000000 {
+			opp-hz = /bits/ 64 <1700000000>;
+			opp-microvolt = <900000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-850000000 {
+			opp-hz = /bits/ 64 <850000000>;
+			opp-microvolt = <900000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-425000000 {
+			opp-hz = /bits/ 64 <425000000>;
+			opp-microvolt = <900000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-212500000 {
+			opp-hz = /bits/ 64 <212500000>;
+			opp-microvolt = <900000>;
+			clock-latency-ns = <300000>;
+			opp-suspend;
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -30,6 +63,8 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R9A09G057_CA55_0_CORE_CLK0>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu1: cpu@100 {
@@ -38,6 +73,8 @@ cpu1: cpu@100 {
 			device_type = "cpu";
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R9A09G057_CA55_0_CORE_CLK1>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu2: cpu@200 {
@@ -46,6 +83,8 @@ cpu2: cpu@200 {
 			device_type = "cpu";
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R9A09G057_CA55_0_CORE_CLK2>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu3: cpu@300 {
@@ -54,6 +93,8 @@ cpu3: cpu@300 {
 			device_type = "cpu";
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R9A09G057_CA55_0_CORE_CLK3>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		L3_CA55: cache-controller-0 {
-- 
2.43.0


