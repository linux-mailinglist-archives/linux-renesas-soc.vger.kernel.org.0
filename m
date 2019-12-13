Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F06F511E846
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2019 17:27:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728147AbfLMQ1P (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Dec 2019 11:27:15 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:60148 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728113AbfLMQ1P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Dec 2019 11:27:15 -0500
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id dUTD2100d5USYZQ01UTDH5; Fri, 13 Dec 2019 17:27:13 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ifnmb-0006mm-Fm; Fri, 13 Dec 2019 17:27:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ifnmb-0000Xt-Da; Fri, 13 Dec 2019 17:27:13 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: r8a7778: Add missing clock-frequency for fixed clocks
Date:   Fri, 13 Dec 2019 17:27:12 +0100
Message-Id: <20191213162712.2056-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

"clock-frequency" is a required property for devices nodes compatible
with "fixed-clock", leading to warnings when running

    $ make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/clock/fixed-clock.yaml
    arch/arm/boot/dts/r8a7778-bockw.dt.yaml: audio_clk_a: 'clock-frequency' is a required property
    arch/arm/boot/dts/r8a7778-bockw.dt.yaml: audio_clk_b: 'clock-frequency' is a required property
    arch/arm/boot/dts/r8a7778-bockw.dt.yaml: audio_clk_c: 'clock-frequency' is a required property

Fix this by adding the missing "clock-frequency" properties to the audio
clocks, to be overridden by board DTS files when populated.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7778.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7778.dtsi b/arch/arm/boot/dts/r8a7778.dtsi
index 10d996d2941fe6ea..5628b8a3598f43c1 100644
--- a/arch/arm/boot/dts/r8a7778.dtsi
+++ b/arch/arm/boot/dts/r8a7778.dtsi
@@ -498,14 +498,17 @@
 		audio_clk_a: audio_clk_a {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
+			clock-frequency = <0>;
 		};
 		audio_clk_b: audio_clk_b {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
+			clock-frequency = <0>;
 		};
 		audio_clk_c: audio_clk_c {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
+			clock-frequency = <0>;
 		};
 
 		/* Fixed ratio clocks */
-- 
2.17.1

