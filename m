Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66779215A71
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2020 17:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729254AbgGFPOE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Jul 2020 11:14:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729242AbgGFPOE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jul 2020 11:14:04 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F69FC061755
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jul 2020 08:14:04 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:e012:1552:6e81:c371])
        by albert.telenet-ops.be with bizsmtp
        id zrE2220040tDR5Q06rE2kV; Mon, 06 Jul 2020 17:14:02 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jsSok-0005cw-50; Mon, 06 Jul 2020 17:14:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jsSok-00061Q-2E; Mon, 06 Jul 2020 17:14:02 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Chris Paterson <Chris.Paterson2@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: cat875: Drop superfluous phy-mode
Date:   Mon,  6 Jul 2020 17:14:00 +0200
Message-Id: <20200706151400.23105-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The PHY mode already defaults to RGMII in the RZ/G2E base SoC DTS file,
so there is no need to specify the same value in board files.

Fixes: 6b170cd3ed02949f ("arm64: dts: renesas: cat875: Add ethernet support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/cat875.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/cat875.dtsi b/arch/arm64/boot/dts/renesas/cat875.dtsi
index aaefc3ae56d50960..33daa95706840037 100644
--- a/arch/arm64/boot/dts/renesas/cat875.dtsi
+++ b/arch/arm64/boot/dts/renesas/cat875.dtsi
@@ -18,7 +18,6 @@
 	pinctrl-names = "default";
 	renesas,no-ether-link;
 	phy-handle = <&phy0>;
-	phy-mode = "rgmii";
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-- 
2.17.1

