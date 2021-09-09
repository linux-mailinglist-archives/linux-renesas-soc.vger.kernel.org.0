Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B591A40477D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Sep 2021 11:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232355AbhIIJEg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Sep 2021 05:04:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232348AbhIIJEb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Sep 2021 05:04:31 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB9D3C06175F
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Sep 2021 02:03:21 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:7d44:646d:3ffb:9bbf])
        by michel.telenet-ops.be with bizsmtp
        id rl3K2500p3eH4vN06l3KGo; Thu, 09 Sep 2021 11:03:20 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mOFxn-003D1c-D7; Thu, 09 Sep 2021 11:03:19 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mOFxm-00BOuu-Tv; Thu, 09 Sep 2021 11:03:18 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Chris Paterson <Chris.Paterson2@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] ARM: dts: r-mobile: Add missing Ethernet PHY resets
Date:   Thu,  9 Sep 2021 11:03:10 +0200
Message-Id: <b41bf0098ff193fbff9fad04d00075ce1bea1986.1631177442.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631177442.git.geert+renesas@glider.be>
References: <cover.1631177442.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Describe all Ethernet PHY reset GPIOs on R-Mobile boards, to avoid
relying solely on boot loaders to bring PHYs out of reset.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a73a4-ape6evm.dts         | 1 +
 arch/arm/boot/dts/r8a7740-armadillo800eva.dts | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/r8a73a4-ape6evm.dts b/arch/arm/boot/dts/r8a73a4-ape6evm.dts
index dc2fdc17312d39c7..e6b0b4151655e0e2 100644
--- a/arch/arm/boot/dts/r8a73a4-ape6evm.dts
+++ b/arch/arm/boot/dts/r8a73a4-ape6evm.dts
@@ -206,6 +206,7 @@ ethernet@8000000 {
 		reg-io-width = <4>;
 		smsc,irq-active-high;
 		smsc,irq-push-pull;
+		reset-gpios = <&pfc 270 GPIO_ACTIVE_LOW>;
 		vdd33a-supply = <&ape6evm_fixed_3v3>;
 		vddvario-supply = <&ape6evm_fixed_1v8>;
 	};
diff --git a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
index f052f8bade5d9c78..c3ca693b91daebed 100644
--- a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
+++ b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
@@ -183,6 +183,7 @@ phy0: ethernet-phy@0 {
 		compatible = "ethernet-phy-id0007.c0f1",
 			     "ethernet-phy-ieee802.3-c22";
 		reg = <0>;
+		reset-gpios = <&pfc 18 GPIO_ACTIVE_LOW>;
 	};
 };
 
-- 
2.25.1

