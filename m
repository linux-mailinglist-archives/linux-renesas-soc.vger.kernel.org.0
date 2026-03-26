Return-Path: <linux-renesas-soc+bounces-30336-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Ph9Bu8XxWnr6QQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30336-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 12:26:39 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DC533473A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 12:26:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0D35A307A38E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 11:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA5938F930;
	Thu, 26 Mar 2026 11:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SGrfwt9h"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E6836D4F3
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 11:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774524000; cv=none; b=vDwheWtxZT+nfMU2fX0xWFZlF8O4MT9yWeTiWb6vEeHVSnkd4gypK6cDN5ZFKyx+73TVAlff1f7EZhzZ9P3Ikh7iW0Ssjt1+jFQGQZStF8XWiznvDXYa7GsPn1MgeYO5fG9XwnJChKr29Ol+/AjAvYn6l+q6em5RRmj5l/ujTyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774524000; c=relaxed/simple;
	bh=Qy2fXtmRxd7VA9k7EKSdssF4PxyY6yYYzS3EMmeGPHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mfjodCzptB6q4b/Xu0H49G+wVTaB44cyLdVHRlx4nG6vezDxT6rKOrD2JHPdn96gLcf2sz64JQ0G3gRj8fzdWvDsC+XiSYm4tuoskgahxIRbyP2iyrrd0XpeD8FW1CsegueV4k0qPDrGCxO9p+cRVkEBgdCLdmmtfKH7eZJrZP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SGrfwt9h; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso6536095e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 04:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774523997; x=1775128797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8E08ul8zmISMenfMLCtg7m1Lcl+41Nsx8Zd8llNhro=;
        b=SGrfwt9h+UzYoqoz+ddIgVoL15mVkzrUIWmXymW6r61B0gOy0IvECqjCEJU4xCKTmU
         DEw1K3YrpRsSULD1Fa/lBn/7xAGqnRx4Ad3sFfklDtraZkv8NN6X8ucWdocjZSfBS8Hb
         3Nv8YTRMYf+cQ+OYKvnY9nExD5U3IqeymzXnSy8iqWFbkD4KA5N4p3xFxXMvGZSJ0VML
         LSlWeVhzCYQ9a+22MdQgcuwpkJ0oOgOnSEOLSOkfY6S0cQTcNXNpmZQb6OeCxONvyTes
         HI4frd4LjLvi2q1EuCjMpGIgkhEbhIDDrVtsP5Su9hK8N9a/yRMyetI/vFiJdIUGma+r
         Bl6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774523997; x=1775128797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I8E08ul8zmISMenfMLCtg7m1Lcl+41Nsx8Zd8llNhro=;
        b=E6+X37+8kpxys7SS6U4L9zcSKKLEADm0x70v05uRQlNFoxEW7eQBQ1Qus0H/GKsQjB
         Tf/IZxSfVQZ8SUaOPnFTXat0wzJVcjBwkqfS+4ovugmEB+9staldHWn2/6zM6A5hf1Ts
         xSpJEzhdE7pLsinaqdvpDsDgFrlPeYWeqCWvQfbS3FH1DfBItaMR/v0otoUEoFsoOcLD
         jtl7LVtQxd1R8dKUlvzI1br9SgVMQkEPxLw2H21vkRWKdqRl9jVAuJVFI1IdjMP35Suy
         vRXIgieMTu7aY2XSqZIS1F4KCA1aGPePm9cHvAy+zzTgb6xIp/5k3N/H+glWuxeYOc2R
         7pGw==
X-Forwarded-Encrypted: i=1; AJvYcCWuHH10H65+x2BhnXhrfSeZ1QmHraZkCcNjksyo9wgcalOjb3bABTLlAxxhFB4z9AqoWtHgD+1RCb8OBa+aoh73eQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSlw0JrmfkinK8sYTx9lg3qA1fBti3fBCknlsY4HuCN1I1i/Gi
	SY93/P1Viv4gW3+GD06c9ROlhBRRp1lk+UNMqd1oQ548rkBuv4QVcvUE
X-Gm-Gg: ATEYQzx02Md0dQWxud32vkeMnQ4c8wJHpZ+N0TUbfP8TyrbPkr3m2CIRQuRnX3AMQdm
	DY8UZSt49lfFBXNyLrfSPEF8j0sEuIfiNzaZNd0Cq1j5Cw36YAbOVjJCdWsHut+TXVRx0a/RSP5
	sBCKoEy+YPZwtfdhQ7p0ru5hxZJ2nbBNRlVlW2wVm4NkmI7n7v166wIkdQPnQaj15i2muEtW5US
	5wB3tGh5BsiQ54mh4XULvJBAvogGTrMW3u6cIRH6hexwlZ1zsIWlxWSDIhmR4y160Aq0jW/sYtB
	AZVgtiuX0CsrtaPCzQh66sFvx/MUZaBe2d2TRpXX2JxMOj8yIXI0BCdb5xdqzdKxIkUIVzBxlyJ
	Pz7yqvyOjiAZUnEWiGU7E9lvqPyxHwOT7ldJFuC2+p9bEPIB72KH964YWxylGwSHLjcjRkV3yMe
	WuWcVh8Nehj/lD6kc52Wiw8wrxLQnrJfdtpQF7o4+qseUFNpZH
X-Received: by 2002:a05:600c:4692:b0:485:4eaf:eb54 with SMTP id 5b1f17b1804b1-48716039b83mr104672885e9.20.1774523996795;
        Thu, 26 Mar 2026 04:19:56 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:377f:9a3e:6c94:560d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872092e105sm13428045e9.29.2026.03.26.04.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 04:19:56 -0700 (PDT)
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
Subject: [PATCH v3 1/2] arm64: dts: renesas: r9a08g046: Add GBETH nodes
Date: Thu, 26 Mar 2026 11:19:49 +0000
Message-ID: <20260326111953.31024-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326111953.31024-1-biju.das.jz@bp.renesas.com>
References: <20260326111953.31024-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-30336-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.189.53.128:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,11c30000:email,11c10000:email]
X-Rspamd-Queue-Id: A7DC533473A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Renesas RZ/G3L SoC is equipped with 2x Synopsys DesignWare Ethernet
(10/100/1000 BASE) with TSN, IP block version 5.30. Add GBETH nodes
to R9A08G046 RZ/G3L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Rebased to boot series.
v1->v2:
 * Added rmii_{tx,rx) clocks.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 241 +++++++++++++++++++++
 1 file changed, 241 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index e030e785ea2a..0987c531ecf4 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -171,6 +171,240 @@ sdhi1: mmc@11c10000 {
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
 		pcie: pcie@11e40000 {
 			reg = <0 0x11e40000 0 0x10000>;
 			ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>;
@@ -200,6 +434,13 @@ gic: interrupt-controller@12400000 {
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


