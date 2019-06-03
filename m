Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81A8E32D39
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2019 11:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727247AbfFCJyE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Jun 2019 05:54:04 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:34217 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726762AbfFCJyE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Jun 2019 05:54:04 -0400
X-IronPort-AV: E=Sophos;i="5.60,546,1549897200"; 
   d="scan'208";a="17478242"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 03 Jun 2019 18:54:02 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id F2F3F424237D;
        Mon,  3 Jun 2019 18:53:59 +0900 (JST)
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
Subject: [PATCH v2 2/2] ARM: dts: iwg23s-sbc: Fix SDHI2 VccQ regulator
Date:   Mon,  3 Jun 2019 10:53:52 +0100
Message-Id: <1559555632-2258-3-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559555632-2258-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1559555632-2258-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SDR50 isn't working anymore because the GPIO regulator
driver is using descriptors since
commit d6cd33ad7102 ("regulator: gpio: Convert to use descriptors")
which in turn causes the system to use the polarity of the
GPIOs (as specified in the DT) for selecting the states,
but the polarity specified in the DT is wrong.
This patch fixes the regulator DT definition, and that fixes
SDR50.

Fixes: 9eb36b945b5c ("ARM: dts: iwg23s-sbc: Add uSD and eMMC support")
Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

---
v1->v2:
* Removed enable-active-high property
---
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
index af78e77..450efe9 100644
--- a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
+++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
@@ -63,7 +63,7 @@
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpios = <&gpio2 24 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio2 24 GPIO_ACTIVE_HIGH>;
 		gpios-states = <1>;
 		states = <3300000 1
 			  1800000 0>;
-- 
2.7.4

