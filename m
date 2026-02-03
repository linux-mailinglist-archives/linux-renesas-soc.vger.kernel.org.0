Return-Path: <linux-renesas-soc+bounces-27816-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFCVI4jrgWkFMAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27816-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 13:35:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B943D912B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 13:35:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6B2133032B66
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 12:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 553C3345CCD;
	Tue,  3 Feb 2026 12:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IkLr2bzt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D73344042
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Feb 2026 12:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770122113; cv=none; b=B3PyIbNXf7AhcKyTwZMZ2SfYTmKjpMKgYOzoZbopxy5af1lkFvxuA37EkG183Cqu0sKQvYw44EZd1iQiZ32T4KaPIwX1deZbwLEswFWvpWCNZz+vumCTenMSnAGIylVlgocyRxK07pptqsfirGFROe3aO1EupaBqv9PFdoRznuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770122113; c=relaxed/simple;
	bh=+mqS43xBaN5wxdUuKouMKy/AajWhBo4Y/w6+isRGTRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=spXvEOr/vYO8BjALS2ia+UEARN43QkEuj0ZMN4Wgzncu9YkOiAxP4p2hZHd7AUuKKovMXHZrZlgCuDJ4Ze1UPWWvo6EVwY7VgbO3YibN5tXNp6IJdDtkARdmH6f6C4lV+yWaWB95Slq6l3rnIkKjNo5NVr4UrOr7zabcPQLIAcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IkLr2bzt; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4806bf39419so4467405e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Feb 2026 04:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770122108; x=1770726908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6TaFftavmMJUbOftKV3aQuNWFyNm0uXmHxj+FYrsdA=;
        b=IkLr2bztlftZDokhOv9gqerEpdqECFl4EnPndpq5SHyx2YR6L4+ssZCiCdTR30riES
         mFJKBk2t0Twcc3tp0i/Im4wJKM79INQsezpcXEEquOiPFCj0ovkGEOtzBVCJXdyHYJP8
         ntQQCfUoFof5nNpV5+N8x12PQY0NC0s17rgAXMpmu4BeByXEaI3diIF+cTCHbNy5wTE4
         +Hio4u4HAyjlN7e+VaITrWF+pOSjQqcJuUBBZZAONHOhLHp0+CorK3kcJDLUHfRBU9Xz
         /cG/xTECIBTyyd5dIkJm7PWVhbgmv3Hp8Otkpou7DkISGNVfeMl+StQVXyfShn6HbVqZ
         uPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770122108; x=1770726908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P6TaFftavmMJUbOftKV3aQuNWFyNm0uXmHxj+FYrsdA=;
        b=f7hzGwmTBKAXmfdRsnmrATpULMMlK0ymGSDKo/jVbMoxxfox9w9SD77AsGrHUSdyiD
         c4U2qmcjNOLsEIEKD9rA7cOaJogYyqt2FkNQq+0J72Lkz3zoK0dnZd+zR7N2zAXE7Khg
         SEtKq+Q2mkgsPNiZZkIU7kwQQ8ErOTM/FiMwrRDotB8ofZy/nxXcuhQ1PpSyRBwQ2BMd
         7QEXnDn+YoUswJ1CNDrehqk82Lv6014J8hjQHrM98bqkk5zevATzkFGfKrt5mPQd8isW
         Px6lBnokkyNc72wuQhiVfl+SoxcFl8CCLIow1z8Sku9AjMNG9KJYjMtAHPBcfKjKPMEb
         9Ckg==
X-Forwarded-Encrypted: i=1; AJvYcCVTtZFC5Ax91QpFWAfmksE7itzufv8ItKjGRXwq7ZAhkBRllog1FJ4SoOalmUXpVeOq9rKepxkzOaeTzj5e3FQUYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YypjGuUJSsb0GzhUayt5jV+WkIYIRmtge4aU7oMPPfCuyyQiun/
	o92eVTJhQ50tK/uovquXEq3WmeAbTMjV9jA/MxDCmjjx8hQl3dP1upfu
X-Gm-Gg: AZuq6aKP9VBJsRTll/EahdBDr3e5EYCjBQmGwRkzGqfiNrjWClwpgBmgYOy7irCEt6I
	ZtfIkNLVkVexyUrby6QQasSLsKuAui/W7153kCB0VGf34CA+s2VYEdEf314g2nkkm+KP29rdZVC
	jnAdjik9QttyNskLDJn3XIVzuk7Qmt7EjeZBuOXUPHPKfUrpCsGgrFJ2Q55FFq4TnwLbuJhfupk
	/OAdlBpWP4sSUP7Aj0x90+jkL5ub+0c+QltSWOWz6ccI98mCjdv7BUIPj9YJehGg4n6XE6dDxT8
	ULmj27jHNh6GkcNvch7SWNNQuZ3JylGsYHm60+1uRUiZfR6/I9CcUXvZF0KCp9QpF/p2PF1NY2H
	v/i1z5Khc1okxkn+757fOBcA0oGun1apZp/H+2DWmqTSiyUpeEELItEJeQcg5+nSB/+oO8WZvEa
	Bg+fLgcGLV/KuDeYaptQ==
X-Received: by 2002:a05:600c:8718:b0:477:9e0c:f59 with SMTP id 5b1f17b1804b1-48305133282mr38224425e9.2.1770122108431;
        Tue, 03 Feb 2026 04:35:08 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:9cd9:f748:166d:55fc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483051379c4sm60618205e9.15.2026.02.03.04.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 04:35:07 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 1/2] arm64: dts: renesas: r9a08g046: Add GBETH nodes
Date: Tue,  3 Feb 2026 12:34:59 +0000
Message-ID: <20260203123503.314755-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203123503.314755-1-biju.das.jz@bp.renesas.com>
References: <20260203123503.314755-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27816-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,11c10000:email,0.189.53.128:email]
X-Rspamd-Queue-Id: 3B943D912B
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Renesas RZ/G3L SoC is equipped with 2x Synopsys DesignWare Ethernet
(10/100/1000 BASE) with TSN, IP block version 5.30. Add GBETH nodes
to R9A08G046 RZ/G3L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch depend upon [1]
[1] https://lore.kernel.org/all/20260203104541.264759-1-biju.das.jz@bp.renesas.com/

v1->v2:
 * Added rmii_{tx,rx) clocks.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 241 +++++++++++++++++++++
 1 file changed, 241 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 0922ad642c67..df61a3b77368 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -228,6 +228,240 @@ sdhi1: mmc@11c10000 {
 			/* placeholder */
 		};
 
+		eth0: ethernet@11c30000 {
+			compatible = "renesas,r9a08g046-gbeth", "snps,dwmac-5.30a";
+			reg = <0 0x11c30000 0 0x10000>;
+			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 85 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 86 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 87 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 88 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 81 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 82 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 83 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 84 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 90 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 91 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 92 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "macirq", "eth_wake_irq", "eth_lpi",
+					  "rx-queue-0", "rx-queue-1", "rx-queue-2",
+					  "rx-queue-3", "tx-queue-0", "tx-queue-1",
+					  "tx-queue-2", "tx-queue-3", "ptp-pps-0",
+					  "ptp-pps-1", "ptp-pps-2", "ptp-pps-3";
+			clocks =  <&cpg CPG_MOD R9A08G046_ETH0_CLK_AXI>,
+				  <&cpg CPG_MOD R9A08G046_ETH0_CLK_CHI>,
+				  <&cpg CPG_MOD R9A08G046_ETH0_CLK_PTP_REF_I>,
+				  <&cpg CPG_MOD R9A08G046_ETH0_CLK_TX_I>,
+				  <&cpg CPG_MOD R9A08G046_ETH0_CLK_RX_I>,
+				  <&cpg CPG_MOD R9A08G046_ETH0_CLK_TX_180_I>,
+				  <&cpg CPG_MOD R9A08G046_ETH0_CLK_RX_180_I>,
+				  <&cpg CPG_MOD R9A08G046_ETH0_CLK_RMII_I>,
+				  <&cpg CPG_MOD R9A08G046_ETH0_CLK_TX_I_RMII>,
+				  <&cpg CPG_MOD R9A08G046_ETH0_CLK_RX_I_RMII>;
+			clock-names = "stmmaceth", "pclk", "ptp_ref",
+				      "tx", "rx", "tx-180", "rx-180",
+				      "rmii", "rmii_tx", "rmii_rx";
+			resets = <&cpg R9A08G046_ETH0_ARESET_N>;
+			power-domains = <&cpg>;
+			snps,multicast-filter-bins = <256>;
+			snps,perfect-filter-entries = <128>;
+			rx-fifo-depth = <8192>;
+			tx-fifo-depth = <8192>;
+			snps,fixed-burst;
+			snps,no-pbl-x8;
+			snps,force_thresh_dma_mode;
+			snps,axi-config = <&stmmac_axi_setup>;
+			snps,mtl-rx-config = <&mtl_rx_setup0>;
+			snps,mtl-tx-config = <&mtl_tx_setup0>;
+			snps,txpbl = <32>;
+			snps,rxpbl = <32>;
+			status = "disabled";
+
+			mdio0: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			mtl_rx_setup0: rx-queues-config {
+				snps,rx-queues-to-use = <4>;
+				snps,rx-sched-sp;
+
+				queue0 {
+					snps,dcb-algorithm;
+					snps,priority = <0x1>;
+					snps,map-to-dma-channel = <0>;
+				};
+
+				queue1 {
+					snps,dcb-algorithm;
+					snps,priority = <0x2>;
+					snps,map-to-dma-channel = <1>;
+				};
+
+				queue2 {
+					snps,dcb-algorithm;
+					snps,priority = <0x4>;
+					snps,map-to-dma-channel = <2>;
+				};
+
+				queue3 {
+					snps,dcb-algorithm;
+					snps,priority = <0x8>;
+					snps,map-to-dma-channel = <3>;
+				};
+			};
+
+			mtl_tx_setup0: tx-queues-config {
+				snps,tx-queues-to-use = <4>;
+				snps,tx-sched-wrr;
+
+				queue0 {
+					snps,weight = <0x10>;
+					snps,dcb-algorithm;
+					snps,priority = <0x1>;
+				};
+
+				queue1 {
+					snps,weight = <0x12>;
+					snps,dcb-algorithm;
+					snps,priority = <0x2>;
+				};
+
+				queue2 {
+					snps,weight = <0x14>;
+					snps,dcb-algorithm;
+					snps,priority = <0x4>;
+				};
+
+				queue3 {
+					snps,weight = <0x18>;
+					snps,dcb-algorithm;
+					snps,priority = <0x8>;
+				};
+			};
+		};
+
+		eth1: ethernet@11c40000 {
+			compatible = "renesas,r9a08g046-gbeth", "snps,dwmac-5.30a";
+			reg = <0 0x11c40000 0 0x10000>;
+			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 100 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 101 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 102 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 103 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 96 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 97 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 98 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 99 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 104 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 105 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 106 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 107 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "macirq", "eth_wake_irq", "eth_lpi",
+					  "rx-queue-0", "rx-queue-1", "rx-queue-2",
+					  "rx-queue-3", "tx-queue-0", "tx-queue-1",
+					  "tx-queue-2", "tx-queue-3", "ptp-pps-0",
+					  "ptp-pps-1", "ptp-pps-2", "ptp-pps-3";
+			clocks = <&cpg CPG_MOD R9A08G046_ETH1_CLK_AXI>,
+				 <&cpg CPG_MOD R9A08G046_ETH1_CLK_CHI>,
+				 <&cpg CPG_MOD R9A08G046_ETH1_CLK_PTP_REF_I>,
+				 <&cpg CPG_MOD R9A08G046_ETH1_CLK_TX_I>,
+				 <&cpg CPG_MOD R9A08G046_ETH1_CLK_RX_I>,
+				 <&cpg CPG_MOD R9A08G046_ETH1_CLK_TX_180_I>,
+				 <&cpg CPG_MOD R9A08G046_ETH1_CLK_RX_180_I>,
+				 <&cpg CPG_MOD R9A08G046_ETH1_CLK_RMII_I>,
+				 <&cpg CPG_MOD R9A08G046_ETH1_CLK_TX_I_RMII>,
+				 <&cpg CPG_MOD R9A08G046_ETH1_CLK_RX_I_RMII>;
+			clock-names = "stmmaceth", "pclk", "ptp_ref",
+				      "tx", "rx", "tx-180", "rx-180",
+				      "rmii", "rmii_tx", "rmii_rx";
+			resets = <&cpg R9A08G046_ETH1_ARESET_N>;
+			power-domains = <&cpg>;
+			snps,multicast-filter-bins = <256>;
+			snps,perfect-filter-entries = <128>;
+			rx-fifo-depth = <8192>;
+			tx-fifo-depth = <8192>;
+			snps,fixed-burst;
+			snps,no-pbl-x8;
+			snps,force_thresh_dma_mode;
+			snps,axi-config = <&stmmac_axi_setup>;
+			snps,mtl-rx-config = <&mtl_rx_setup1>;
+			snps,mtl-tx-config = <&mtl_tx_setup1>;
+			snps,txpbl = <32>;
+			snps,rxpbl = <32>;
+			status = "disabled";
+
+			mdio1: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			mtl_rx_setup1: rx-queues-config {
+				snps,rx-queues-to-use = <4>;
+				snps,rx-sched-sp;
+
+				queue0 {
+					snps,dcb-algorithm;
+					snps,priority = <0x1>;
+					snps,map-to-dma-channel = <0>;
+				};
+
+				queue1 {
+					snps,dcb-algorithm;
+					snps,priority = <0x2>;
+					snps,map-to-dma-channel = <1>;
+				};
+
+				queue2 {
+					snps,dcb-algorithm;
+					snps,priority = <0x4>;
+					snps,map-to-dma-channel = <2>;
+				};
+
+				queue3 {
+					snps,dcb-algorithm;
+					snps,priority = <0x8>;
+					snps,map-to-dma-channel = <3>;
+				};
+			};
+
+			mtl_tx_setup1: tx-queues-config {
+				snps,tx-queues-to-use = <4>;
+				snps,tx-sched-wrr;
+
+				queue0 {
+					snps,weight = <0x10>;
+					snps,dcb-algorithm;
+					snps,priority = <0x1>;
+				};
+
+				queue1 {
+					snps,weight = <0x12>;
+					snps,dcb-algorithm;
+					snps,priority = <0x2>;
+				};
+
+				queue2 {
+					snps,weight = <0x14>;
+					snps,dcb-algorithm;
+					snps,priority = <0x4>;
+				};
+
+				queue3 {
+					snps,weight = <0x18>;
+					snps,dcb-algorithm;
+					snps,priority = <0x8>;
+				};
+			};
+		};
+
 		gic: interrupt-controller@12400000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x12400000 0 0x20000>,
@@ -239,6 +473,13 @@ gic: interrupt-controller@12400000 {
 		};
 	};
 
+	stmmac_axi_setup: stmmac-axi-config {
+		snps,lpi_en;
+		snps,wr_osr_lmt = <0xf>;
+		snps,rd_osr_lmt = <0xf>;
+		snps,blen = <16 8 4 0 0 0 0>;
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
-- 
2.43.0


