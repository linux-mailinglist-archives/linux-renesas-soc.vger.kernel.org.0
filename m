Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DF4E47754D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Dec 2021 16:04:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234994AbhLPPEy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 10:04:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235111AbhLPPEy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 10:04:54 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAF3BC061574
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Dec 2021 07:04:53 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
        by laurent.telenet-ops.be with bizsmtp
        id X34s26004250X300134s3F; Thu, 16 Dec 2021 16:04:52 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mxsJP-005Qvo-Nf; Thu, 16 Dec 2021 16:04:51 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mxsJO-00A1xY-Rk; Thu, 16 Dec 2021 16:04:50 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: Fix pin controller node names
Date:   Thu, 16 Dec 2021 16:04:49 +0100
Message-Id: <09a09c8ac9cb1a11b859c1ab9d9eae84cfefb1bb.1639666967.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Align all pin controller node names with the expectations of the DT
bindings in Documentation/devicetree/bindings/pinctrl/pinctrl.yaml.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Exposed by commit c09acbc499e883a3 ("dt-bindings: pinctrl: use
pinctrl.yaml") in
To be queued in renesas-devel for v5.17.
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi  | 2 +-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 5a537f4fc9f9dde3..f07d192b409c5851 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -87,7 +87,7 @@ rwdt: watchdog@e6020000 {
 			status = "disabled";
 		};
 
-		pfc: pin-controller@e6050000 {
+		pfc: pinctrl@e6050000 {
 			compatible = "renesas,pfc-r8a779a0";
 			reg = <0 0xe6050000 0 0x16c>, <0 0xe6050800 0 0x16c>,
 			      <0 0xe6058000 0 0x16c>, <0 0xe6058800 0 0x16c>,
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index f1fdf4194b226089..ea4ae0b20fd00565 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -633,7 +633,7 @@ sysc: system-controller@11020000 {
 			status = "disabled";
 		};
 
-		pinctrl: pin-controller@11030000 {
+		pinctrl: pinctrl@11030000 {
 			compatible = "renesas,r9a07g044-pinctrl";
 			reg = <0 0x11030000 0 0x10000>;
 			gpio-controller;
-- 
2.25.1

