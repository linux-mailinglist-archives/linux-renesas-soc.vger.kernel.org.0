Return-Path: <linux-renesas-soc+bounces-19271-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F6DAFA14B
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Jul 2025 21:09:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 366D318888D6
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Jul 2025 19:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C371C84CB;
	Sat,  5 Jul 2025 19:09:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E14719CD1D
	for <linux-renesas-soc@vger.kernel.org>; Sat,  5 Jul 2025 19:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751742545; cv=none; b=U53itqpr6G+EJnJGaIAcdLibgXDduovo5yniJVbNObIPSCQkR1TczaVXq6A3Itk2C1DpJvmTGd8aCufmNTpXeH5/wf3hIA0g8AzlPN4Ok+eh3XlCHMo3skOX7wHCCFGWRbcdV/36gC+N8P7IPi+eksLl4GlqZgOQtxt9wNlgKpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751742545; c=relaxed/simple;
	bh=lNTFLAqqDeXiJbyBctP7YJfsU8X6V3B3gYOuqAA1MqE=;
	h=From:To:Cc:Date:Message-Id:In-Reply-To:References:Subject; b=Fb9Az4lJINqu5JvRCTM5vIP/JhllFkMT1HfO1PnA0AD3dF+k1Scy2YPXkzC1x1CiMCfHBESlpjiqon78A2vfbOCdmtCtLwV2+2PY88TL02woN8djh06xtLtago5nhq8TiU6uizKxgplhVrAG5Q+F1MvWbnVU6HF+89HVIlKOP2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensource.se; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensource.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a585dc5f4aso24890181cf.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 05 Jul 2025 12:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751742542; x=1752347342;
        h=subject:references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7GVcBcSD/4WLG6H1hpuHogQP9SAJfo6FBYR5qo9uDk=;
        b=unwr2S8qHuum6eDc00p7Z4YtUVTtKChmePircUOfeZHds/2m9YfmiAGL7LfNP/w8Ek
         //GxhgPr7l0VhJaMdZR5FIQRAq8XUjCiseQQqBYUJdqeJi/ycm2zfYga87GcFPD1bLSQ
         zMIUnzCEuHX9jrWj+Q3PjgBJh83dA9kQ66VqlVJ/8xCYGOYsEQZgxyeSMYEqJ4kfY9gy
         rAy8cVwY2LPiXQRWqMXzx4aJKpJObqZPkJc4LQxzvBDSRWv6/8XEY3CdCcgVZSS228W7
         FRC3/OumNIpSd98LNy6F/CEjHFEToF8Uo+GLAipEi62lgARrvT/fPuV2P0rfd3/MIZlB
         3gLw==
X-Gm-Message-State: AOJu0YyT6584xyhUPLBHH3kDASsqKc6mlSETINeNWqyS6mVFZViKo1EB
	4v0n0yCgHrc1iR54nKvY++o2bGm7FygC3XGlztaTu6ncY96rHtV1/QzJm5YWGdkV
X-Gm-Gg: ASbGncuz5BdcmKRhV8clRfFqFO1MH7YYBpUi9o+LDHsvfP966yvkhMuyX8nB/cS6muS
	Kgur1SyH4t1KVFp3x9S7c8txDT2hJq/UCXfqp1KpDCgXsDqnxIDHnwJ1IN7sPO5jQ2fCMAr0Y8J
	S3i67MoEa8h0G5yegq8nsnobgCwINugFLsGfG8JazIU2nPD8edLT1j3e2uVqpFqBk+KSpAlk3fP
	if7v/c0okZsQkhNZT6dyedO7AAaeXRMEaAcTvCf72H3d81J+UhYEv+38NlIPz8Gn9FyGqQZ/v3/
	rI78AR0YkYSv+e6eoUcJmSAUGbFV4h9zUN13uC6sAwY6RhjUhIdAuqvghkx2Us8zmb/hxt1ueU/
	ZQ4Eejf5htOt3tS6QZh8nU28=
X-Google-Smtp-Source: AGHT+IEEgU8notnsRkSTa4jSYZH1KLLG3i3oyfJLrKjzVb3UBsuBBmgZMtVzlBfMNXtd1iomUygkjg==
X-Received: by 2002:a05:622a:4249:b0:494:a1cd:57f7 with SMTP id d75a77b69052e-4a9a69a4d7cmr61231471cf.44.1751742541764;
        Sat, 05 Jul 2025 12:09:01 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([167.99.4.198])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9a443ac2bsm20209451cf.58.2025.07.05.12.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 12:09:01 -0700 (PDT)
From: Magnus Damm <damm@opensource.se>
To: linux-renesas-soc@vger.kernel.org
Cc: wsa+renesas@sang-engineering.com,Magnus Damm <damm@opensource.se>,geert+renesas@glider.be
Date: Sat, 05 Jul 2025 21:08:59 +0200
Message-Id: <175174253919.83411.17550680247568441451.sendpatchset@1.0.0.127.in-addr.arpa>
In-Reply-To: <175174252387.83411.17393827352291413834.sendpatchset@1.0.0.127.in-addr.arpa>
References: <175174252387.83411.17393827352291413834.sendpatchset@1.0.0.127.in-addr.arpa>
Subject: [PATCH 2/6] ARM: dts: renesas: r7s72100: add rpc-if nodes
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

From: Magnus Damm <damm@opensource.se>

Add two on-chip rpc-if devices to r7s72100 (RZ/A1H). These devices tend to
interface to one or more on-board SPI / Hyper / Octo flash devices.

Signed-off-by: Magnus Damm <damm@opensource.se>
---

 Applies to next-20250704

 arch/arm/boot/dts/renesas/r7s72100.dtsi |   22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

--- 0001/arch/arm/boot/dts/renesas/r7s72100.dtsi
+++ work/arch/arm/boot/dts/renesas/r7s72100.dtsi	2025-07-05 21:45:58.707395239 +0900
@@ -315,6 +315,28 @@
 			status = "disabled";
 		};
 
+		rpc0: spi@3fefa000 {
+			compatible = "renesas,r7s72100-rpc-if";
+			reg = <0x3fefa000 0x100>, <0x18000000 0x04000000>;
+			clocks = <&mstp9_clks R7S72100_CLK_SPIBSC0>;
+			power-domains = <&cpg_clocks>;
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		rpc1: spi@3fefb000 {
+			compatible = "renesas,r7s72100-rpc-if";
+			reg = <0x3fefb000 0x100>, <0x1c000000 0x04000000>;
+			clocks = <&mstp9_clks R7S72100_CLK_SPIBSC1>;
+			power-domains = <&cpg_clocks>;
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		usbhs0: usb@e8010000 {
 			compatible = "renesas,usbhs-r7s72100", "renesas,rza1-usbhs";
 			reg = <0xe8010000 0x1a0>;

