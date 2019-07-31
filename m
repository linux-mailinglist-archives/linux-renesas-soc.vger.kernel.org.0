Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A84FF7C3C5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2019 15:39:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388061AbfGaNjk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Jul 2019 09:39:40 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:57532 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387880AbfGaNjj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jul 2019 09:39:39 -0400
Received: from ramsan ([84.194.98.4])
        by baptiste.telenet-ops.be with bizsmtp
        id jRfd2000P05gfCL01Rfdqe; Wed, 31 Jul 2019 15:39:38 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hsopN-0001F5-DZ; Wed, 31 Jul 2019 15:39:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hsopN-0004kj-C4; Wed, 31 Jul 2019 15:39:37 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] ARM: dts: rza2mevb: Fix numbering of Ethernet aliases
Date:   Wed, 31 Jul 2019 15:39:36 +0200
Message-Id: <20190731133936.18228-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The two Ethernet ports on the RZA2MEVB development board are labeled
"Ether1" and "Ether2".  Reflect this numbering in the ethernet aliases.

Fixes: eb8be0276d903a23 ("ARM: dts: rza2mevb: add ethernet aliases")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Is this the right thing to do?
Can U-Boot live with the absence of ethernet0?

 arch/arm/boot/dts/r7s9210-rza2mevb.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r7s9210-rza2mevb.dts b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
index d062d02865e7dfbb..0686bac4bfd8e191 100644
--- a/arch/arm/boot/dts/r7s9210-rza2mevb.dts
+++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
@@ -18,8 +18,8 @@
 
 	aliases {
 		serial0 = &scif4;
-		ethernet0 = &ether0;
-		ethernet1 = &ether1;
+		ethernet1 = &ether0;
+		ethernet2 = &ether1;
 	};
 
 	chosen {
-- 
2.17.1

