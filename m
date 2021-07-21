Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2CE63D0DE0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jul 2021 13:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233494AbhGUK4O (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Jul 2021 06:56:14 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:16430 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S239527AbhGUKc0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Jul 2021 06:32:26 -0400
X-IronPort-AV: E=Sophos;i="5.84,257,1620658800"; 
   d="scan'208";a="88371048"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 21 Jul 2021 20:13:02 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B1BB0424E9CC;
        Wed, 21 Jul 2021 20:13:02 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2] arm64: dts: renesas: r8a77961: Add iommus to ipmmu_ds[01] related nodes
Date:   Wed, 21 Jul 2021 20:12:47 +0900
Message-Id: <20210721111247.849825-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds iommus properties to ipmmu_ds[01] related nodes
(avb, dmac and sdhi) of r8a77961.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Changes from v1:
 - Add other iommus to ipmmu_ds[01] related nodes.
 https://lore.kernel.org/linux-renesas-soc/20210714090843.438076-1-yoshihiro.shimoda.uh@renesas.com/

 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 91b501e0121e..041473aa5cd0 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -958,6 +958,14 @@ dmac0: dma-controller@e6700000 {
 			resets = <&cpg 219>;
 			#dma-cells = <1>;
 			dma-channels = <16>;
+			iommus = <&ipmmu_ds0 0>, <&ipmmu_ds0 1>,
+			       <&ipmmu_ds0 2>, <&ipmmu_ds0 3>,
+			       <&ipmmu_ds0 4>, <&ipmmu_ds0 5>,
+			       <&ipmmu_ds0 6>, <&ipmmu_ds0 7>,
+			       <&ipmmu_ds0 8>, <&ipmmu_ds0 9>,
+			       <&ipmmu_ds0 10>, <&ipmmu_ds0 11>,
+			       <&ipmmu_ds0 12>, <&ipmmu_ds0 13>,
+			       <&ipmmu_ds0 14>, <&ipmmu_ds0 15>;
 		};
 
 		dmac1: dma-controller@e7300000 {
@@ -992,6 +1000,14 @@ dmac1: dma-controller@e7300000 {
 			resets = <&cpg 218>;
 			#dma-cells = <1>;
 			dma-channels = <16>;
+			iommus = <&ipmmu_ds1 0>, <&ipmmu_ds1 1>,
+			       <&ipmmu_ds1 2>, <&ipmmu_ds1 3>,
+			       <&ipmmu_ds1 4>, <&ipmmu_ds1 5>,
+			       <&ipmmu_ds1 6>, <&ipmmu_ds1 7>,
+			       <&ipmmu_ds1 8>, <&ipmmu_ds1 9>,
+			       <&ipmmu_ds1 10>, <&ipmmu_ds1 11>,
+			       <&ipmmu_ds1 12>, <&ipmmu_ds1 13>,
+			       <&ipmmu_ds1 14>, <&ipmmu_ds1 15>;
 		};
 
 		dmac2: dma-controller@e7310000 {
@@ -1026,6 +1042,14 @@ dmac2: dma-controller@e7310000 {
 			resets = <&cpg 217>;
 			#dma-cells = <1>;
 			dma-channels = <16>;
+			iommus = <&ipmmu_ds1 16>, <&ipmmu_ds1 17>,
+			       <&ipmmu_ds1 18>, <&ipmmu_ds1 19>,
+			       <&ipmmu_ds1 20>, <&ipmmu_ds1 21>,
+			       <&ipmmu_ds1 22>, <&ipmmu_ds1 23>,
+			       <&ipmmu_ds1 24>, <&ipmmu_ds1 25>,
+			       <&ipmmu_ds1 26>, <&ipmmu_ds1 27>,
+			       <&ipmmu_ds1 28>, <&ipmmu_ds1 29>,
+			       <&ipmmu_ds1 30>, <&ipmmu_ds1 31>;
 		};
 
 		ipmmu_ds0: iommu@e6740000 {
@@ -1160,6 +1184,7 @@ avb: ethernet@e6800000 {
 			phy-mode = "rgmii";
 			rx-internal-delay-ps = <0>;
 			tx-internal-delay-ps = <0>;
+			iommus = <&ipmmu_ds0 16>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -2280,6 +2305,7 @@ sdhi0: mmc@ee100000 {
 			max-frequency = <200000000>;
 			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
 			resets = <&cpg 314>;
+			iommus = <&ipmmu_ds1 32>;
 			status = "disabled";
 		};
 
@@ -2292,6 +2318,7 @@ sdhi1: mmc@ee120000 {
 			max-frequency = <200000000>;
 			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
 			resets = <&cpg 313>;
+			iommus = <&ipmmu_ds1 33>;
 			status = "disabled";
 		};
 
@@ -2304,6 +2331,7 @@ sdhi2: mmc@ee140000 {
 			max-frequency = <200000000>;
 			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
 			resets = <&cpg 312>;
+			iommus = <&ipmmu_ds1 34>;
 			status = "disabled";
 		};
 
@@ -2316,6 +2344,7 @@ sdhi3: mmc@ee160000 {
 			max-frequency = <200000000>;
 			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
 			resets = <&cpg 311>;
+			iommus = <&ipmmu_ds1 35>;
 			status = "disabled";
 		};
 
-- 
2.25.1

