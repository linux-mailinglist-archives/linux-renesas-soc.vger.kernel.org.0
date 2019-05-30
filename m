Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB9D32F84B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 May 2019 10:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727969AbfE3IIO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 May 2019 04:08:14 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:32014 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727931AbfE3IIO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 May 2019 04:08:14 -0400
X-IronPort-AV: E=Sophos;i="5.60,530,1549897200"; 
   d="scan'208";a="17365792"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 30 May 2019 17:08:12 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B6B164003EBF;
        Thu, 30 May 2019 17:08:09 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 2/2] ARM: dts: iwg23s-sbc: Fix SDHI2 VccQ regulator
Date:   Thu, 30 May 2019 09:07:55 +0100
Message-Id: <1559203675-19675-3-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559203675-19675-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1559203675-19675-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The GPIO regulator is using descriptors since
commit d6cd33ad7102 ("regulator: gpio: Convert to use descriptors")
leading to calls into gpiolib now, which in turn consider
gpio2 24 as active low due to the fact that the corresponding
DT node is missing property enable-active-high, breaking
the SDR50 functionality.
This patch fixes the regulator DT definition, and that fixes
SDR50.

Fixes: 9eb36b945b5c ("ARM: dts: iwg23s-sbc: Add uSD and eMMC support")
Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
index af78e77..a199ded 100644
--- a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
+++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
@@ -63,7 +63,9 @@
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpios = <&gpio2 24 GPIO_ACTIVE_LOW>;
+		enable-active-high;
+
+		gpios = <&gpio2 24 GPIO_ACTIVE_HIGH>;
 		gpios-states = <1>;
 		states = <3300000 1
 			  1800000 0>;
-- 
2.7.4

