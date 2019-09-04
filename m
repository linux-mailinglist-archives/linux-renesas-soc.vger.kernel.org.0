Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3330FA81CC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2019 14:07:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729356AbfIDMBT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Sep 2019 08:01:19 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:35008 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbfIDMBT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Sep 2019 08:01:19 -0400
Received: from ramsan ([84.194.98.4])
        by laurent.telenet-ops.be with bizsmtp
        id xQ1H2000M05gfCL01Q1HKE; Wed, 04 Sep 2019 14:01:17 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i5TyP-0001Yv-AT; Wed, 04 Sep 2019 14:01:17 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i5TyP-0000VP-9d; Wed, 04 Sep 2019 14:01:17 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] ARM: dts: lager: Replace spaces by TABs
Date:   Wed,  4 Sep 2019 14:01:14 +0200
Message-Id: <20190904120114.1894-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904120114.1894-1-geert+renesas@glider.be>
References: <20190904120114.1894-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Make it easier to compare the file with other similar files.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7790-lager.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index 83cc619861b2bb20..6ec2cf7eb35455d3 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -325,10 +325,10 @@
 		#size-cells = <0>;
 	};
 
-        /*
-         * IIC2 and I2C2 may be switched using pinmux.
-         * A fallback to GPIO is also provided.
-         */
+	/*
+	 * IIC2 and I2C2 may be switched using pinmux.
+	 * A fallback to GPIO is also provided.
+	 */
 	i2chdmi: i2c-12 {
 		compatible = "i2c-demux-pinctrl";
 		i2c-parent = <&iic2>, <&i2c2>, <&gpioi2c2>;
-- 
2.17.1

