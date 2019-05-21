Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3716B255EA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 May 2019 18:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728581AbfEUQog (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 May 2019 12:44:36 -0400
Received: from foss.arm.com ([217.140.101.70]:38628 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728103AbfEUQof (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 May 2019 12:44:35 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B95C374;
        Tue, 21 May 2019 09:44:35 -0700 (PDT)
Received: from e110467-lin.cambridge.arm.com (e110467-lin.cambridge.arm.com [10.1.196.75])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2BC663F718;
        Tue, 21 May 2019 09:44:34 -0700 (PDT)
From:   Robin Murphy <robin.murphy@arm.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: renesas: r8a774c0: Clean up CPU compatibles
Date:   Tue, 21 May 2019 17:44:26 +0100
Message-Id: <50fbe259ee5951e32221af457737b7d970be9f32.1558456785.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.21.0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Apparently this DTS crossed over with commit 31af04cd60d3 ("arm64: dts:
Remove inconsistent use of 'arm,armv8' compatible string") and missed
out on the cleanup, so put it right.

CC: Simon Horman <horms@verge.net.au>
CC: Magnus Damm <magnus.damm@gmail.com>
CC: linux-renesas-soc@vger.kernel.org
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index 3f86db199dbf..500b7bd58022 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -70,7 +70,7 @@
 		#size-cells = <0>;
 
 		a53_0: cpu@0 {
-			compatible = "arm,cortex-a53", "arm,armv8";
+			compatible = "arm,cortex-a53";
 			reg = <0>;
 			device_type = "cpu";
 			power-domains = <&sysc R8A774C0_PD_CA53_CPU0>;
@@ -81,7 +81,7 @@
 		};
 
 		a53_1: cpu@1 {
-			compatible = "arm,cortex-a53", "arm,armv8";
+			compatible = "arm,cortex-a53";
 			reg = <1>;
 			device_type = "cpu";
 			power-domains = <&sysc R8A774C0_PD_CA53_CPU1>;
-- 
2.21.0.dirty

