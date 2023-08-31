Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C175878EC90
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Aug 2023 13:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346140AbjHaLxO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Aug 2023 07:53:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234387AbjHaLxE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2023 07:53:04 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 224D810DF
        for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Aug 2023 04:52:41 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6c13:6b1b:7366:87c0])
        by laurent.telenet-ops.be with bizsmtp
        id gBse2A00J3874jb01Bsevr; Thu, 31 Aug 2023 13:52:39 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qbgDq-00274L-4k;
        Thu, 31 Aug 2023 13:52:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qbgE2-00CIUY-Ja;
        Thu, 31 Aug 2023 13:52:38 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 01/13] ARM: dts: renesas: ape6evm: Drop bogus "mtd-rom" compatible value
Date:   Thu, 31 Aug 2023 13:52:23 +0200
Message-Id: <1c773aed6bd794cf36a9a787f77469eaa1359bef.1693481518.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693481518.git.geert+renesas@glider.be>
References: <cover.1693481518.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

make dtbs_check:

    arch/arm/boot/dts/r8a73a4-ape6evm.dtb: flash@0: compatible: 'oneOf' conditional failed, one must be fixed:
	    ['cfi-flash', 'mtd-rom'] is too long
	    'cfi-flash' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
	    'cfi-flash' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
	    'mtd-rom' is not one of ['cfi-flash', 'jedec-flash']
	    'mtd-ram' was expected
	    From schema: Documentation/devicetree/bindings/mtd/mtd-physmap.yaml

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dts b/arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dts
index 91b27258be36ff45..de87f2682e323866 100644
--- a/arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dts
+++ b/arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dts
@@ -178,7 +178,7 @@ &cpu0 {
 
 &bsc {
 	flash@0 {
-		compatible = "cfi-flash", "mtd-rom";
+		compatible = "cfi-flash";
 		reg = <0x0 0x08000000>;
 		bank-width = <2>;
 
-- 
2.34.1

