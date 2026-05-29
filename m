Return-Path: <linux-renesas-soc+bounces-33346-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PcfLkuQGWpTxggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33346-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 15:10:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2260B602AF2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 15:10:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E6323172CAE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 13:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E361830FF08;
	Fri, 29 May 2026 13:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4cfX6+4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2872264B0
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 13:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780060031; cv=none; b=X+Adt9IBrqiE7NEZuO4s0yrBA0aTnKkx2HguIjp62OFpKCC4ugk9V1eVnDZqgV8aJ0bEXlRzpjWzXNK66m4W4sXIgoRA91QrR187gPVJQPeVjXk7LaFA308WwXdy4q873luBO1UGn7CNm4ZSiRIkao/LXgAIcSLHL+ArVrDwWiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780060031; c=relaxed/simple;
	bh=o0g2OO7BdU6XXFLH/VSlItvSINdOQnE0hrKtP5cscCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QruoLBxvuCQ6XNChEIaGtpEJNVx881A1tT/ZOHaVoYjVrstz3dtcNd2KAeEEvRg1rOvI4o6mdRECOB1zq3wMdubtjTADmELKDBpXjI0q21zKDb2hoyAR4bVn06yQvRu6lSe2kQ6gbDV9vv+R8Q2Wb6YuoLKGo7MEbSLBIFcn9VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4cfX6+4; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49068493267so39588585e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 06:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780060028; x=1780664828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QfE5wzsm49PMrPR2kj5UhJL4gTXkDTQA7/9UJ5qTIU=;
        b=W4cfX6+46VbnlwNRDzYZrc7z9eF/bdiXMdmXXetTiAp3/Yz/sGR19UuR/r8kqbl2b3
         bg+Yreo1yajxmuCPsxYPoRdpjeV7cETBHVLaS4zblt4YCq5IK/nkt3+MRdvR7uattXB8
         5PP/OR3CUl7u8zTzKZLStu2SsmC9SUdVQTvfVkJktHUgwttihcIlZ5u1mWv2G6O+yTIi
         LveWfZOGwhy67MBHCxVJISE2qsFI48TIGgJQIZ7qUhNymSvARfzXFPx/My7fYiZrC+Uv
         2jshRzyTVGACOgEs8zSa16VsksXMbRu6NIRokuZCtZme2sK8gaW0Yl0SmBly4JOUGubU
         jcXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780060028; x=1780664828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+QfE5wzsm49PMrPR2kj5UhJL4gTXkDTQA7/9UJ5qTIU=;
        b=ep81s5ELIotvIQBBpZAfOti6xaRKmb6J9u+GNRtaJ8Ii+Ii52nuJmwVHX45HBQDglW
         FjkGMQFazpEQetmNwHxXEq9V9draBfLF1v1vz5J2xq+cijLVQCm4Yh26m9kiF+vjUaHF
         rp75Hn1H2ZHQngWKXgMpmJ4tN6otvKWP/swg8QpdmrTJ4Nxbdnrin29u/2EzetYEK7Zt
         p183j9f9bQUVX2JslTnrU4RGwgWepUCA2UToAD8cXTNfqjuVfSRbqmNW7cPhHGiedOy6
         rG5RdLIrZHbAnHeIG1NBU/Pzxe/EuzZuMk9R9dz51TEll8oqaSHjr5efDzlDPsONuzNV
         QM0g==
X-Forwarded-Encrypted: i=1; AFNElJ8cu8hUk7QogtWussnIveeYWC5d3QVxC/+A6w3u93vC8CTKgcheZqA2blKO2ae+FqpRz83z2VHEC7W05qs71D4Vyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWhrr8FdC9BRisFGVMLMTxmOinSdY9q89r2K/yDh9KAP33VR/C
	OoFe8OP2rLprOv+/gUEzToYSB54ZN/nXRILqHs1qfyjd2Kvs+AxqctvR
X-Gm-Gg: Acq92OHqaxL5AeAd0JijfEl8rG3ehPmUtibnPxW/DAX4C2IHBRH6KhU6uqAm34pc63p
	5xmnbOcugNYToLf2X3N7jan5GrzsPMf7AUMS13a3eWgQ+2ngYm5GoolMYmBLYViyCaNUCsrWhfr
	zzYLpB3prpw50MLz/GcIwjExCeOpfF1jB0S0XHCkCtmQri7kpw4Gg3IX8qw8WdhIeKOZmzoHd+Q
	l2dmbIBK531az44XaowGSiwzJT2STrJ0skLS8HL8MqVpeDtQ7GwYjYstuAyOwJmIHWvFOlD5AT3
	Q1g+P+Euil/kg/B0JK2ObP5qPsJHR0qMIdIJwI7w1zrDZH7nZXeLDeO7fv00gm8S2CvDIs8Gp/m
	tUDFbXijKAN48zAfe2iklpzt6IAlqamOIGM3dcWllj3kUDryQtGg0GKoy5348v0ivmnghwS8Qvo
	jZueUY4ipw7x0/mJh0WDqn4XceKe6SX9xmeyGgk14ygqFE1v4ui39UNsmjUMwgHoVsGshiPA==
X-Received: by 2002:a05:600c:58c8:b0:48f:da34:ec4e with SMTP id 5b1f17b1804b1-4909c0af24cmr30005935e9.19.1780060027738;
        Fri, 29 May 2026 06:07:07 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:df4f:8f31:69aa:c094])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909dff2a80sm45247225e9.3.2026.05.29.06.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 06:07:07 -0700 (PDT)
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
Subject: [PATCH v2 1/2] arm64: dts: renesas: r9a08g046: Add RSPI{0..2} nodes
Date: Fri, 29 May 2026 14:07:00 +0100
Message-ID: <20260529130704.327505-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529130704.327505-1-biju.das.jz@bp.renesas.com>
References: <20260529130704.327505-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33346-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,100ea000:email,100b0000:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,100c0000:email]
X-Rspamd-Queue-Id: 2260B602AF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add device tree nodes for the three RSPI channels on the RZ/G3L
(R9A08G046) SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated reg size from 0x400->0x1000.
 * Dropped num-cs as the hardware has 4 CS lines and the driver is
   hard-coded to 4.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 03bdee870528..f948ae32f6f5 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -442,6 +442,75 @@ rsci3: serial@100f3000 {
 			status = "disabled";
 		};
 
+		rspi0: spi@100b0000 {
+			compatible = "renesas,r9a08g046-rspi";
+			reg = <0 0x100b0000 0 0x1000>;
+			interrupts = <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 441 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 442 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 443 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 444 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "idle", "error", "end", "rx", "tx";
+			clocks = <&cpg CPG_MOD R9A08G046_RSPI0_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_RSPI0_TCLK>;
+			clock-names = "pclk", "tclk";
+			resets = <&cpg R9A08G046_RSPI0_PRESETN>,
+				 <&cpg R9A08G046_RSPI0_TRESETN>;
+			reset-names = "presetn", "tresetn";
+			dmas = <&dmac 0x26f2>, <&dmac 0x26f1>;
+			dma-names = "rx", "tx";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		rspi1: spi@100e9000 {
+			compatible = "renesas,r9a08g046-rspi";
+			reg = <0 0x100e9000 0 0x1000>;
+			interrupts = <GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 447 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 449 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "idle", "error", "end", "rx", "tx";
+			clocks = <&cpg CPG_MOD R9A08G046_RSPI1_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_RSPI1_TCLK>;
+			clock-names = "pclk", "tclk";
+			resets = <&cpg R9A08G046_RSPI1_PRESETN>,
+				 <&cpg R9A08G046_RSPI1_TRESETN>;
+			reset-names = "presetn", "tresetn";
+			dmas = <&dmac 0x26f6>, <&dmac 0x26f5>;
+			dma-names = "rx", "tx";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		rspi2: spi@100ea000 {
+			compatible = "renesas,r9a08g046-rspi";
+			reg = <0 0x100ea000 0 0x1000>;
+			interrupts = <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 452 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 453 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 454 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "idle", "error", "end", "rx", "tx";
+			clocks = <&cpg CPG_MOD R9A08G046_RSPI2_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_RSPI2_TCLK>;
+			clock-names = "pclk", "tclk";
+			resets = <&cpg R9A08G046_RSPI2_PRESETN>,
+				 <&cpg R9A08G046_RSPI2_TRESETN>;
+			reset-names = "presetn", "tresetn";
+			dmas = <&dmac 0x26fa>, <&dmac 0x26f9>;
+			dma-names = "rx", "tx";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		canfd: can@100c0000 {
 			reg = <0 0x100c0000 0 0x20000>;
 			/* placeholder */
-- 
2.43.0


