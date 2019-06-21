Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 344FF4E2E9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbfFUJOU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:14:20 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:33940 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbfFUJOT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:14:19 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 3531925AD85;
        Fri, 21 Jun 2019 19:13:56 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id F28BF942ED9; Fri, 21 Jun 2019 11:13:51 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 21/22] ARM: dts: iwg23s-sbc: Fix SDHI2 VccQ regulator
Date:   Fri, 21 Jun 2019 11:13:48 +0200
Message-Id: <7eef616f1cec623bc9e79123b51d0c2ca134d87c.1561104194.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1561104194.git.horms+renesas@verge.net.au>
References: <cover.1561104194.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

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
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
index af78e77a4778..450efe923008 100644
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
2.11.0

