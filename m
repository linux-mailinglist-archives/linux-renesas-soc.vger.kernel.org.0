Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0A13B9067
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jul 2021 12:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235864AbhGAKSZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Jul 2021 06:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236001AbhGAKSZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Jul 2021 06:18:25 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A68B1C061756
        for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Jul 2021 03:15:54 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:445e:1c3:be41:9e10])
        by baptiste.telenet-ops.be with bizsmtp
        id PmFs25002474TTe01mFscN; Thu, 01 Jul 2021 12:15:52 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lytjb-005KIR-KB; Thu, 01 Jul 2021 12:15:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lytjb-00EVo6-59; Thu, 01 Jul 2021 12:15:51 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH] arm64: dts: renesas: r8a77995: draak: Remove bogus adv7511w properties
Date:   Thu,  1 Jul 2021 12:15:50 +0200
Message-Id: <975b6686bc423421b147d367fe7fb9a0db99c5af.1625134398.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Geert Uytterhoeven <geert@linux-m68k.org>

The "max-clock" and "min-vrefresh" properties fail to validate with
commit cfe34bb7a770c5d8 ("dt-bindings: drm: bridge: adi,adv7511.txt:
convert to yaml").  Drop them, as they are parts of an out-of-tree
workaround that is not needed upstream.

Fixes: bcf3003438ea4645 ("arm64: dts: renesas: r8a77995: draak: Enable HDMI display output")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
To be queued in renesas-devel fo v5.15.
---
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index 71203c0fa55351c6..f0f585a4046196f2 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -314,10 +314,6 @@ hdmi-encoder@39 {
 		interrupt-parent = <&gpio1>;
 		interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
 
-		/* Depends on LVDS */
-		max-clock = <135000000>;
-		min-vrefresh = <50>;
-
 		adi,input-depth = <8>;
 		adi,input-colorspace = "rgb";
 		adi,input-clock = "1x";
-- 
2.25.1

