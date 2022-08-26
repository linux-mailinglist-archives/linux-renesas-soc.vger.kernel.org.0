Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB165A2A27
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Aug 2022 16:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237173AbiHZO5Z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Aug 2022 10:57:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbiHZO5X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Aug 2022 10:57:23 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C9AFA5726
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Aug 2022 07:57:21 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id CExG280024C55Sk01ExG9Y; Fri, 26 Aug 2022 16:57:18 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oRaln-002kip-Ov; Fri, 26 Aug 2022 16:57:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oRaeb-00615s-DB; Fri, 26 Aug 2022 16:49:49 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a774e1: Rename i2c_dvfs to iic_pmic
Date:   Fri, 26 Aug 2022 16:49:48 +0200
Message-Id: <7d60653d4d63904dc025a133297a53eb885fa064.1661525361.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As RZ/G2 SoCs do not support DVFS, the "iic-dvfs" module was renamed to
"iic-pmic" in the RZ/G Series, 2nd Generation User’s Manual: Hardware
Rev. 1.00.

See also commit a636d8037ef6028a ("arm64: dts: renesas: rzg2: Rename
i2c_dvfs to iic_pmic"), which apparently forgot to update RZ/G2H.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This is a prerequisite for "[PATCH v2 6/6] arm64: dts: renesas:
r8a774a1: put I2C aliases to board files"
https://lore.kernel.org/r/20220825071022.7864-7-wsa+renesas@sang-engineering.com
---
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
index 8ec59094882b543d..3cb3b2e052c18c1d 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -769,7 +769,7 @@ i2c6: i2c@e66e8000 {
 			status = "disabled";
 		};
 
-		i2c_dvfs: i2c@e60b0000 {
+		iic_pmic: i2c@e60b0000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "renesas,iic-r8a774e1",
-- 
2.25.1

