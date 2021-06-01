Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91478397642
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jun 2021 17:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234142AbhFAPOh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Jun 2021 11:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234071AbhFAPOg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Jun 2021 11:14:36 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72D0CC061574
        for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Jun 2021 08:12:54 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:555:bf00:6951:b6ab])
        by michel.telenet-ops.be with bizsmtp
        id BrCs2500L35oben06rCsMs; Tue, 01 Jun 2021 17:12:52 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lo64Z-00Bubn-RG; Tue, 01 Jun 2021 17:12:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lo64Z-000J4d-Fc; Tue, 01 Jun 2021 17:12:51 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a779a0: Drop power-domains property from GIC node
Date:   Tue,  1 Jun 2021 17:12:50 +0200
Message-Id: <a9ae5cbc7c586bf2c6b18ddc665ad7051bd1d206.1622560236.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

"make dtbs_check":

    arm64/boot/dts/renesas/r8a779a0-falcon.dt.yaml: interrupt-controller@f1000000: 'power-domains' does not match any of the regexes: '^(msi-controller|gic-its|interrupt-controller)@[0-9a-f]+$', '^gic-its@', '^interrupt-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
	    From schema: Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml

Remove the "power-domains" property, as the GIC on R-Car V3U is
always-on, and not part of a clock domain.

Fixes: 834c310f541839b6 ("arm64: dts: renesas: Add Renesas R8A779A0 SoC support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.14.

 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index a023e094e7670eb4..78ca75f619f6fe9e 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -1102,7 +1102,6 @@ gic: interrupt-controller@f1000000 {
 			      <0x0 0xf1060000 0 0x110000>;
 			interrupts = <GIC_PPI 9
 				      (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>;
-			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
 		};
 
 		fcpvd0: fcp@fea10000 {
-- 
2.25.1

