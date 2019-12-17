Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94B8B12350E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2019 19:38:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728066AbfLQSip (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 13:38:45 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:34172 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727005AbfLQSip (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 13:38:45 -0500
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id f6ei2100H5USYZQ016eiFW; Tue, 17 Dec 2019 19:38:44 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ihHk2-0003aQ-MN; Tue, 17 Dec 2019 19:38:42 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ihHk2-000086-Ku; Tue, 17 Dec 2019 19:38:42 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/5] arm64: dts: renesas: Prepare for split of ARCH_R8A7795 into ARCH_R8A7795[01]
Date:   Tue, 17 Dec 2019 19:38:40 +0100
Message-Id: <20191217183841.432-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217183841.432-1-geert+renesas@glider.be>
References: <20191217183841.432-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As R-Car H3 ES1.x (R8A77950) and R-Car H3 ES2.0+ (R8A77951) are really
different SoCs, CONFIG_ARCH_R8A7795 will be split in
CONFIG_ARCH_R8A77950 and CONFIG_ARCH_R8A77951.

Relax dependencies by handling both the old and the new symbols.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 7ac6f18c996a0961..b663176d153493f9 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -8,6 +8,10 @@ dtb-$(CONFIG_ARCH_R8A7795) += r8a77950-salvator-x.dtb
 dtb-$(CONFIG_ARCH_R8A7795) += r8a77950-ulcb.dtb r8a77950-ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A7795) += r8a77951-salvator-x.dtb r8a77951-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A7795) += r8a77951-ulcb.dtb r8a77951-ulcb-kf.dtb
+dtb-$(CONFIG_ARCH_R8A77950) += r8a77950-salvator-x.dtb
+dtb-$(CONFIG_ARCH_R8A77950) += r8a77950-ulcb.dtb r8a77950-ulcb-kf.dtb
+dtb-$(CONFIG_ARCH_R8A77951) += r8a77951-salvator-x.dtb r8a77951-salvator-xs.dtb
+dtb-$(CONFIG_ARCH_R8A77951) += r8a77951-ulcb.dtb r8a77951-ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A77960) += r8a77960-salvator-x.dtb r8a77960-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A77960) += r8a77960-ulcb.dtb r8a77960-ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A77961) += r8a77961-salvator-xs.dtb
-- 
2.17.1

