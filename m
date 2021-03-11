Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 593CF3370D1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Mar 2021 12:06:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232568AbhCKLGL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Mar 2021 06:06:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232537AbhCKLGC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Mar 2021 06:06:02 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ECB1C061574
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Mar 2021 03:06:02 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:7de2:4aac:7672:1000])
        by xavier.telenet-ops.be with bizsmtp
        id ez5x2400W0xVtAs01z5xyw; Thu, 11 Mar 2021 12:05:58 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lKJ8f-006rEY-Gw; Thu, 11 Mar 2021 12:05:57 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lKJ8f-00D6ko-4N; Thu, 11 Mar 2021 12:05:57 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a77950: Drop operating points above 1.5 GHz
Date:   Thu, 11 Mar 2021 12:05:52 +0100
Message-Id: <20210311110552.3124180-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The higher operating frequencies for the Cortex-A57 CPU cores, which
were first documented in the R-Car Gen3 Hardware User's Manual revision
0.54, apply to R-Car H3 ES2.0 (r8a77951).

Play it safe and restrict R-Car H3 ES1.x to 1.5 GHz, by removing the
"turbo-mode" entries from the operating points table inherited from
r8a77951.dtsi.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a77950.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77950.dtsi b/arch/arm64/boot/dts/renesas/r8a77950.dtsi
index d716c4386ae9f437..25b87da32eebb6dc 100644
--- a/arch/arm64/boot/dts/renesas/r8a77950.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77950.dtsi
@@ -29,6 +29,11 @@ &audma1 {
 	       <&ipmmu_mp1 30>, <&ipmmu_mp1 31>;
 };
 
+&cluster0_opp {
+	/delete-node/ opp-1600000000;
+	/delete-node/ opp-1700000000;
+};
+
 &du {
 	renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd3 0>;
 };
-- 
2.25.1

